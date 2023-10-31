#ifndef _H_V4L2CAM_H
#define _H_V4L2CAM_H
#include <iostream>
#include <string>
#include <string.h>
#include <linux/videodev2.h>
#include <thread>
#ifdef TZTEK_V4L2_DMA
#include "nvbuf_utils.h"
#endif

using namespace std;
#define IO_METHOD_MMAP                  0
#define IO_METHOD_USERPTR               1
#define  IO_METHOD_DMA                  2

typedef struct
{
         void *start;
        size_t length;
}V4l2Buffer;

#ifdef TZTEK_V4L2_DMA
typedef struct
{
    unsigned char * start;
    unsigned int size;
    int dmabuff_fd;
} nv_buffer;

typedef struct
{
    unsigned int v4l2_pixfmt;
    NvBufferColorFormat nvbuff_color;
} nv_color_fmt;
#endif

class CV4l2Cam
{
public:
	CV4l2Cam(string strDevName,int nWidth,int nHeight);
	~CV4l2Cam();
	int Init();
	int Release();
	int startAcquire();
	int stopAcquire();
	int GrabImg(unsigned char *&pData,int &nDatalen);
protected:
        bool initDevice();
        bool releaseDevice();
        bool  clearBuffer();
        bool  initMmap();
        bool initUserp();
        bool initDma();
        bool  setVideoFmt();
        bool checkCapabilities();
        int     xioctl(int fh, int request, void *arg);
private:
        int                                     m_dwIoType;
        int                                     m_dwFault;
        int32_t                             m_videoFd;
        uint32_t                                m_dwHeight;
        uint32_t                                m_dwWidth;
        string                                  m_strDevName;
        V4l2Buffer *                    m_pBuffers;
        struct timeval                  m_tv;
        struct timespec                 m_ts;
        uint32_t                        m_dwImgCnt;
        uint32_t                        m_dwSelfCnt;
        uint32_t                        m_dwGrabErrCnt;
        uint32_t                        m_dwSerialNumber;
        bool                            m_bCamReadyflag;
        bool                            m_bViewImgFlag;
	bool                            m_bSaveViewimgFlag;
        unsigned char*        m_pData;
#ifdef TZTEK_V4L2_DMA
        nv_buffer                       *m_pNvbuff ;
#endif
};


#endif
