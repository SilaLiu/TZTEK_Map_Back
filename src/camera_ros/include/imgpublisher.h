#pragma once
#include <ros/ros.h>      
#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>

class CImgpublish
{
    public:
        CImgpublish(char* name,int width,int height);
        ~CImgpublish();
        int Send(unsigned char *data,unsigned int datalen);
    private:
        ros::NodeHandle m_nh;        
        ros::Publisher m_pub;
        int m_width;
        int m_height;
	    std::vector<unsigned char> m_img;
        unsigned int m_no;
        std::string frame_id;
};
