#include <stdio.h>
#include "imgpublisher.h"
#include "libyuv.h"

CImgpublish::CImgpublish(char* name,int width,int height)
{
    m_pub = m_nh.advertise<sensor_msgs::Image>(name, 1);
    m_width = width;
    m_height = height;
    m_img.resize(3*width*height);
    param.param<std::string>("frame_id", frame_id, "camera0");

}

CImgpublish::~CImgpublish()
{
}

int CImgpublish::Send(unsigned char *data,unsigned int datalen)
{
        unsigned char*  y = data;
        unsigned char*  u = y+m_height*m_width;
         unsigned char*  v = u +( m_height*m_width/4);

        sensor_msgs::Image msg;                        //发布的消息格式
        
       // struct timeval t1,t2;
       // gettimeofday(&t1,NULL);
        unsigned char *rgb = m_img.data();
        libyuv::I420ToRGB24(y,m_width,u,m_width/2,v,m_width/2,rgb,3*m_width,m_width,m_height);
       // gettimeofday(&t2,NULL);
       // printf("cost:%ldms\n",(t2.tv_sec-t1.tv_sec)*1000+(t2.tv_usec-t1.tv_usec)/1000);

        //将RGB图像按照格式进行存取
        struct timeval tv;
        gettimeofday(&tv,NULL);
        msg.header.seq = m_no++;
        msg.header.frame_id = frame_id;
        msg.header.stamp.sec = tv.tv_sec;
        msg.header.stamp.nsec = tv.tv_usec*1000;  
        msg.width =   m_width;             //图像长
        msg.height =  m_height;            //图像高
        msg.encoding = "bgr8";             //图像编码格式
        msg.is_bigendian = 0;
        msg.step = m_width*3;              //图像宽度*通道数
        msg.data = m_img;
        m_pub.publish(msg);
}
