#include <getopt.h> 
#include <fcntl.h> 
#include <unistd.h>
#include <errno.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <dlfcn.h>
#include <poll.h>
#include "v4l2cam.hpp"
#ifdef TZTEK_V4L2_DMA
#include "nvbuf_utils.h"
#endif

//buf个数
#define  V4L2_BUFFER_LENGHT      4
//图像格式
#define  V4L2_VIDEO_FORMAT       V4L2_PIX_FMT_YUYV


#ifdef TZTEK_V4L2_DMA
static nv_color_fmt nvcolor_fmt[] =
{
    /* TODO: add more pixel format mapping */
    {V4L2_PIX_FMT_UYVY, NvBufferColorFormat_UYVY},
    {V4L2_PIX_FMT_VYUY, NvBufferColorFormat_VYUY},
    {V4L2_PIX_FMT_YUYV, NvBufferColorFormat_YUYV},
    {V4L2_PIX_FMT_YVYU, NvBufferColorFormat_YVYU},
    {V4L2_PIX_FMT_GREY, NvBufferColorFormat_GRAY8},
    {V4L2_PIX_FMT_YUV420M, NvBufferColorFormat_YUV420},
};

static NvBufferColorFormat get_nvbuff_color_fmt(unsigned int v4l2_pixfmt)
{
    unsigned i;

    for (i = 0; i < sizeof(nvcolor_fmt) / sizeof(nvcolor_fmt[0]); i++)
    {
        if (v4l2_pixfmt == nvcolor_fmt[i].v4l2_pixfmt)
        return nvcolor_fmt[i].nvbuff_color;
    }

    return NvBufferColorFormat_Invalid;
}
#endif

CV4l2Cam::CV4l2Cam(string strDevName,int nWidth,int nHeight) 
{	
	m_strDevName = strDevName;
        m_videoFd = -1;
        m_dwWidth = nWidth;
        m_dwHeight = nHeight;
        m_pBuffers = NULL;
        #ifdef TZTEK_V4L2_DMA
        m_dwIoType = IO_METHOD_DMA;
        m_pNvbuff = NULL;
        #else
        m_dwIoType = IO_METHOD_MMAP;
        #endif
}

CV4l2Cam::~CV4l2Cam()
{
}

int CV4l2Cam::Init()
{
        do
        {
                m_pData = new unsigned char [2*m_dwWidth*m_dwHeight];
                //阻塞形式打开设备
                m_videoFd = open(m_strDevName.c_str(), O_RDWR /* required */ /*| O_NONBLOCK*/, 0);
                if (-1 == m_videoFd)
                {
                        printf("cannot open %s:,errno:%d, %s\n", m_strDevName.c_str(), errno, strerror(errno));
                        break;
                }
                //校验能力级
                if(checkCapabilities() == false)
                {
                        printf("checkCapabilities failed,devname=%s\n", m_strDevName.c_str());
                         break;
                }
                //设备输出格式
                if(setVideoFmt() == false)
                {
                         printf("setVideoFmt failed,devname=%s\n", m_strDevName.c_str());
                         break;
                }
                usleep(10000);

                //初始化内存
                if(initDevice() == false)
                {
                        printf("initDevice failed,devname=%s\n", m_strDevName.c_str());
                        break;
                }
              return 0;

        } while (0);
        
        if(m_videoFd != -1)
        {
                close(m_videoFd);
                m_videoFd = -1;
        }

        if(m_pData)
        {
                delete []m_pData;
                m_pData = NULL;
        }
       m_dwFault = 1; //掉线
        return -1;
}

int CV4l2Cam::Release()
{
        releaseDevice();
        if(m_pData)
        {
                delete []m_pData;
                m_pData = NULL;
        }
	return 0;
}

int CV4l2Cam::startAcquire()
{
        if(m_videoFd < 0)
        {
                printf("video fd is invlaid,devname=%s\n", m_strDevName.c_str());	
                return -1;
        }

        enum v4l2_buf_type type;

        switch(m_dwIoType)
        {
                case IO_METHOD_MMAP:
                  for (int i = 0; i < V4L2_BUFFER_LENGHT; ++i) {
                        struct v4l2_buffer buf;
                        memset(&buf,0,sizeof(struct v4l2_buffer));

                        buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                        buf.memory = V4L2_MEMORY_MMAP;
                        buf.index = i;

                        if (-1 == xioctl(m_videoFd, VIDIOC_QBUF, &buf))
                        {
                                printf("xioctl VIDIOC_QBUF,devname=%s\n", m_strDevName.c_str());	
                                return -1;
                        }             
                }
                break;
                case IO_METHOD_USERPTR:
                  for (int i = 0; i < V4L2_BUFFER_LENGHT; ++i) {
                        struct v4l2_buffer buf;
                        memset(&buf,0,sizeof(struct v4l2_buffer));

                        buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                        buf.memory = V4L2_MEMORY_USERPTR;
                        buf.index = i;
                        buf.m.userptr = m_pBuffers[i].length;

                        if (-1 == xioctl(m_videoFd, VIDIOC_QBUF, &buf))
                        {
                                printf("xioctl VIDIOC_QBUF,devname=%s\n", m_strDevName.c_str());	
                                return -1;
                        }             
                }
                break;
                #ifdef TZTEK_V4L2_DMA
                case IO_METHOD_DMA:
                for (unsigned int index = 0; index < V4L2_BUFFER_LENGHT; index++)
                {
                        struct v4l2_buffer buf;

                        memset(&buf, 0, sizeof buf);
                        buf.index = index;
                        buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                        buf.memory = V4L2_MEMORY_DMABUF;
                        buf.m.fd = (unsigned long)m_pNvbuff[index].dmabuff_fd;
                        if (ioctl(m_videoFd, VIDIOC_QBUF, &buf) < 0)
                        {
                                //TZTEK_CLASSLOG(TZTEK_WARNING_LEV,"xioctl  VIDIOC_REQBUFS failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                                 return -1;
                        }
                }
                break;
                #endif
                default:
                break;
        }
      
        //set streaming on
        type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        if (-1 == xioctl(m_videoFd, VIDIOC_STREAMON, &type))
        {
                 printf("xioctl VIDIOC_STREAMON,devname=%s\n", m_strDevName.c_str());	
                return -1;
        }
        #ifndef TZTEK_TRIG_CONTROL
        //实际测试，底层有数据缓存
        clearBuffer();
        #endif
        
        return 0;
}


int CV4l2Cam::stopAcquire()
{
        enum v4l2_buf_type type;
        type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        if (-1 == xioctl(m_videoFd, VIDIOC_STREAMOFF, &type))
        {
                printf("xioctl VIDIOC_STREAMOFF,devname=%s\n", m_strDevName.c_str());	
        }
        return 0;
}

int CV4l2Cam::GrabImg(unsigned char *&pData,int &nDatalen)
{
        pData = NULL;
        nDatalen = 0;
        unsigned char *srcData = NULL;
        int  srcDatalen;

        /* 将已经捕获好视频的内存拉出已捕获视频的队列 */
       	fd_set rset;
        FD_ZERO(&rset);
        FD_SET(m_videoFd,&rset);
        struct timeval tv;
        tv.tv_sec = 1;
        tv.tv_usec = 0;
        int retsel = select(m_videoFd+1,&rset,NULL,NULL,&tv);
        if(retsel <= 0)
        {
                printf( "%s:select failed,retsel=%d,dev=%s,errno=%d,errstr=%s\n",__func__,retsel,m_strDevName.c_str(),errno,strerror(errno));
                return -1;
        }

        struct v4l2_buffer buf;
        memset(&buf,0,sizeof(struct v4l2_buffer));
	
        switch (m_dwIoType)
        {
        case IO_METHOD_MMAP:
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_MMAP;
                 if (-1 == xioctl(m_videoFd, VIDIOC_DQBUF, &buf)) 
                { 
                        printf( "xioctl VIDIOC_DQBUF failed,dev=%s,error:%d:%s\n",m_strDevName.c_str(),errno,strerror(errno));
                        return -1;
                }
                srcData = (unsigned char*)m_pBuffers[buf.index].start;
                srcDatalen = buf.bytesused;
                break;
        case IO_METHOD_USERPTR:
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_USERPTR;
                if (-1 == xioctl(m_videoFd, VIDIOC_DQBUF, &buf)) 
                { 
                         printf( "xioctl VIDIOC_DQBUF failed,dev=%s,error:%d:%s\n",m_strDevName.c_str(),errno,strerror(errno));
                        return -1;
                }
                srcData = (unsigned char*)buf.m.userptr;
                srcDatalen = buf.bytesused;
                break;
        #ifdef TZTEK_V4L2_DMA
        case IO_METHOD_DMA:
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_DMABUF;
                if (-1 == xioctl(m_videoFd, VIDIOC_DQBUF, &buf)) 
                { 
                          printf( "xioctl VIDIOC_DQBUF failed,dev=%s,error:%d:%s\n",m_strDevName.c_str(),errno,strerror(errno));
                        return -1;
                }

                NvBufferMemSyncForDevice(m_pNvbuff[buf.index].dmabuff_fd, 0, (void**)&m_pNvbuff[buf.index].start);
                srcData = m_pNvbuff[buf.index].start;
                srcDatalen = m_pNvbuff[buf.index].size;
                break;
        #endif
        default:
                break;
        }

        //数据拷贝 
        memcpy(m_pData,srcData,srcDatalen);
        
      //将buf重新入队
        if (-1 == xioctl(m_videoFd, VIDIOC_QBUF, &buf))
        {
                 printf( "xioctl VIDIOC_QBUF failed,dev=%s,error:%d:%s\n",m_strDevName.c_str(),errno,strerror(errno));
        }
	struct timeval t;
        gettimeofday(&t, NULL);
       // printf("=========================selecttime:  %ld.%06ld\n" ,t.tv_sec, t.tv_usec);
	
        pData = m_pData;
        nDatalen = srcDatalen;
        return 0;
}

bool  CV4l2Cam::clearBuffer()
{
        struct v4l2_buffer buf;
       
        /* 将已经捕获好视频的内存拉出已捕获视频的队列 */
        for(int i  = 0; i < V4L2_BUFFER_LENGHT;i++)
        {
                memset(&buf,0,sizeof(struct v4l2_buffer));
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_MMAP;

                fd_set rset;
                FD_ZERO(&rset);
                FD_SET(m_videoFd,&rset);
                struct timeval tv;
                tv.tv_sec = 0;
                tv.tv_usec = 100*1000;
                int retsel = select(m_videoFd+1,&rset,NULL,NULL,&tv);
                if(retsel <= 0)
                {
                        break;
                }
                if (-1 == xioctl(m_videoFd, VIDIOC_DQBUF, &buf)) 
                { 
                        printf( "xioctl VIDIOC_DQBUF failed,dev=%s,error:%d:%s\n",m_strDevName.c_str(),errno,strerror(errno));
                        break;
                }

                if (-1 == xioctl(m_videoFd, VIDIOC_QBUF, &buf))
                {
                        printf( "xioctl VIDIOC_QBUF failed,dev=%s,error:%d:%s\n",m_strDevName.c_str(),errno,strerror(errno));
                        break;
                }
        }
        return true;
}

bool CV4l2Cam::initUserp()
{
        struct v4l2_requestbuffers req;
        memset(&req,0,sizeof( struct v4l2_requestbuffers));

         req.count = V4L2_BUFFER_LENGHT;                                   //缓存数量,根据图像占用空间大小申请的缓存区个数     
        req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;                 //数据流类型,视频捕获模式.  
        req.memory = V4L2_MEMORY_USERPTR;                       

        //请求buf
        if (-1 == xioctl(m_videoFd, VIDIOC_REQBUFS, &req))
         {
                 printf("xioctl  VIDIOC_REQBUFS failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;    
        }

        //分别struct buffer结构
        m_pBuffers  =  new V4l2Buffer[V4L2_BUFFER_LENGHT]; 
        if (!m_pBuffers) 
        {
                printf("calloc  buffer failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;  
        }
        memset(m_pBuffers,0,sizeof(V4l2Buffer)*V4L2_BUFFER_LENGHT);

        //获取请求的buf
        bool bRet = true;
        for (uint32_t  i = 0; i < req.count; ++i)
         {
                m_pBuffers[i].length = 2*m_dwWidth*m_dwHeight;
                m_pBuffers[i].start = new char[m_pBuffers[i].length];
                if (NULL == m_pBuffers[i].start)
                {
                        bRet = false;
                        printf("new  failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                         break;
                }
        }

        //失败，释放已映射的内存
        if(bRet == false)
        {
                if(m_pBuffers)
                {
                        for(uint32_t i = 0; i < req.count;i++)
                        {
                                  if(m_pBuffers[i].start  != NULL)
                                  {
                                        free(m_pBuffers[i].start);
                                        m_pBuffers[i].start = NULL;
                                  }      
                        }
                        delete [] m_pBuffers;
                        m_pBuffers = NULL;
                }
        }
        return bRet;    
}

bool CV4l2Cam::initDevice()
{
        int bRet =  false;
        switch (m_dwIoType)
        {
        case IO_METHOD_MMAP:
               bRet = initMmap();
                break;
        case IO_METHOD_USERPTR:
                bRet = initUserp();
        break;
        #ifdef TZTEK_V4L2_DMA
        case IO_METHOD_DMA:
                bRet = initDma();
        break;
        #endif
        default:
                break;
        }
        return bRet;
}

bool CV4l2Cam::releaseDevice()
{
        if(m_videoFd != -1)
        {
                close(m_videoFd);
                m_videoFd = -1;
        }

        switch (m_dwIoType)
        {
        case IO_METHOD_MMAP:
                for (int  i = 0; i < V4L2_BUFFER_LENGHT; ++i)
                        munmap(m_pBuffers[i].start, m_pBuffers[i].length);
                break;
        case IO_METHOD_USERPTR:
                for (int  i = 0; i < V4L2_BUFFER_LENGHT; ++i)
                        free(m_pBuffers[i].start);
                break;
         #ifdef TZTEK_V4L2_DMA
        case IO_METHOD_DMA:
                 if (m_pNvbuff != NULL)
                {
                        for (unsigned i = 0; i < V4L2_BUFFER_LENGHT; i++)
                        {
                                if (m_pNvbuff[i].dmabuff_fd)
                                {
                                        NvBufferDestroy(m_pNvbuff[i].dmabuff_fd);
                                }
                        }
                        delete []m_pNvbuff;
                        m_pNvbuff = NULL;
                }
        break;
        #endif
        default:
                break;
        }

        if(m_pBuffers)
        {
                delete [] m_pBuffers;
                m_pBuffers = NULL;
        }
        return true;
}

#ifdef TZTEK_V4L2_DMA
bool CV4l2Cam::initDma()
{
         m_pNvbuff =  new nv_buffer[V4L2_BUFFER_LENGHT];
        NvBufferCreateParams input_params = {0};
         input_params.payloadType = NvBufferPayload_SurfArray;
         input_params.width = m_dwWidth;
         input_params.height = m_dwHeight;
        input_params.layout = NvBufferLayout_Pitch;

          /* Create buffer and provide it with camera */
        for (unsigned int index = 0; index < V4L2_BUFFER_LENGHT; index++)
        {
                int fd;
                //NvBufferParams params = {0};
                input_params.colorFormat = get_nvbuff_color_fmt(V4L2_VIDEO_FORMAT);
                input_params.nvbuf_tag = NvBufferTag_CAMERA;
                if (-1 == NvBufferCreateEx(&fd, &input_params))
                {
                        printf("NvBufferCreateEx failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                        return false;
                }
                m_pNvbuff[index].dmabuff_fd = fd;
                if (-1 == NvBufferMemMap(m_pNvbuff[index].dmabuff_fd, 0, NvBufferMem_Read_Write,
                                (void**)&m_pNvbuff[index].start))
                 {
                            printf("NvBufferMemMap failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                              return false;
                 }
        }

       bool bRet = true;
        struct v4l2_requestbuffers req;
        memset(&req,0,sizeof( struct v4l2_requestbuffers));
        req.count = V4L2_BUFFER_LENGHT;                                   //缓存数量,根据图像占用空间大小申请的缓存区个数     
        req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;                 //数据流类型,视频捕获模式.  
        req.memory = V4L2_MEMORY_DMABUF;                            //DMA使用方式

        //请求buf
        if (-1 == xioctl(m_videoFd, VIDIOC_REQBUFS, &req))
         {
                 printf("xioctl  VIDIOC_REQBUFS failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;    
        }

        for (unsigned int index = 0; index < V4L2_BUFFER_LENGHT; index++)
        {
                struct v4l2_buffer buf;

                /* Query camera v4l2 buf length */
                memset(&buf, 0, sizeof buf);
                buf.index = index;
                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_DMABUF;

                if (ioctl(m_videoFd, VIDIOC_QUERYBUF, &buf) < 0)
                {
                        bRet = false;
                        printf("xioctl  VIDIOC_QUERYBUF failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                        break;    
                }
              
                buf.m.fd = (unsigned long)m_pNvbuff[index].dmabuff_fd;
                if (buf.length != m_pNvbuff[index].size)
                {
                       // TZTEK_CLASSLOG(TZTEK_WARNING_LEV,"Camera v4l2 buf length is not expected,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                        m_pNvbuff[index].size = buf.length;
                }
        }

        if(bRet == false)
        {
                if (m_pNvbuff != NULL)
                {
                        for (unsigned i = 0; i < V4L2_BUFFER_LENGHT; i++)
                        {
                                if (m_pNvbuff[i].dmabuff_fd)
                                {
                                        NvBufferDestroy(m_pNvbuff[i].dmabuff_fd);
                                }
                        }
                        delete []m_pNvbuff;
                        m_pNvbuff = NULL;
                }
        }
        return bRet;
}
#endif

bool CV4l2Cam::initMmap()
{
        struct v4l2_requestbuffers req;

        memset(&req,0,sizeof( struct v4l2_requestbuffers));
        req.count = V4L2_BUFFER_LENGHT;                                   //缓存数量,根据图像占用空间大小申请的缓存区个数     
        req.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;                 //数据流类型,视频捕获模式.  
        req.memory = V4L2_MEMORY_MMAP;                                  //内存区的使用方式

        //请求buf
        if (-1 == xioctl(m_videoFd, VIDIOC_REQBUFS, &req))
         {
                 printf("xioctl  VIDIOC_REQBUFS failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;    
        }

        //分别struct buffer结构
        m_pBuffers  =  new V4l2Buffer[V4L2_BUFFER_LENGHT]; 
        if (!m_pBuffers) 
        {
                printf("calloc  buffer failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;  
        }
        memset(m_pBuffers,0,sizeof(V4l2Buffer)*V4L2_BUFFER_LENGHT);

        //获取请求的buf
        bool bRet = true;
        for (uint32_t  i = 0; i < req.count; ++i)
         {
                struct v4l2_buffer buf;
                memset(&buf,0,sizeof(struct v4l2_buffer ));

                buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
                buf.memory = V4L2_MEMORY_MMAP;
                buf.index = i;

                if (-1 == xioctl(m_videoFd, VIDIOC_QUERYBUF, &buf))
                {
                        bRet = false;
                        printf("xioctl  VIDIOC_QUERYBUF failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                        break;
                }

                m_pBuffers[i].length = buf.length;
                m_pBuffers[i].start = mmap(NULL , buf.length,  PROT_READ | PROT_WRITE ,   MAP_SHARED,   m_videoFd, buf.m.offset);
                if (MAP_FAILED == m_pBuffers[i].start)
                {
                        bRet = false;
                        printf("mmap  failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                         break;
                }
        }

        //失败，释放已映射的内存
        if(bRet == false)
        {
                if(m_pBuffers)
                {
                        for(uint32_t i = 0; i < req.count;i++)
                        {
                                  if(m_pBuffers[i].start  != MAP_FAILED && m_pBuffers[i].start  != NULL)
                                  {
                                                munmap( m_pBuffers[i].start, m_pBuffers[i].length);
                                                m_pBuffers[i].start = NULL;
                                  }      
                        }
                        delete [] m_pBuffers;
                        m_pBuffers = NULL;
                }
        }

        return bRet;
}

bool CV4l2Cam::setVideoFmt()
{
        struct v4l2_format fmt;
        memset(&fmt,0,sizeof(fmt));
            	
        fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        fmt.fmt.pix.width = m_dwWidth;
        fmt.fmt.pix.height = m_dwHeight;
        fmt.fmt.pix.pixelformat = V4L2_VIDEO_FORMAT;
        fmt.fmt.pix.field = V4L2_FIELD_INTERLACED;

        //设置当前驱动的频捕获格式
        if (-1 == xioctl(m_videoFd, VIDIOC_S_FMT, &fmt))
        {
                printf("xioctl  VIDIOC_S_FMT failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;       
        }
        return true;
}

bool  CV4l2Cam::checkCapabilities()
{
        //得到视频设备信息
        struct v4l2_capability cap;
        if (-1 == xioctl(m_videoFd, VIDIOC_QUERYCAP, &cap))
          {
                printf("xioctl  VIDIOC_QUERYCAP failed,devname=%s,errno: %d, %s\n", m_strDevName.c_str(), errno, strerror(errno));	
                return false;                    
        }

        if (!(cap.capabilities & V4L2_CAP_VIDEO_CAPTURE))
        {
                printf( "capabilities not support V4L2_CAP_VIDEO_CAPTURE \n");
                return false; 
        }

        if (!(cap.capabilities & V4L2_CAP_STREAMING))
         {
                printf( "capabilities not support V4L2_CAP_STREAMING \n");
                return false;      
        }
        return true;
}

 int CV4l2Cam::xioctl(int fh, int request, void *arg)
{
        int r;

        do {
                r = ioctl(fh, request, arg);
        } while (-1 == r && EINTR == errno);

        return r;
}
