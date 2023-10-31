/*================================================================                                                                     
 *   Copyright (C) 2020 Xu Ltd. All rights reserved.
 *   
 *   @file   :main.cpp
 *   @author :xulei
 *   @date   :2020/10/27
 *   @brief  :
 *
 ================================================================*/
#include <unistd.h>
#include <sys/time.h>
#include <thread>
#include <queue>
#include <string>
#include <stdio.h>
#include <mutex>
#include <ros/ros.h>  
#include <image_transport/image_transport.h>
#include "imgpublisher.h"
#include "v4l2cam.hpp"
#include "libyuv.h"

#define MAX_WIDHT 4096
#define MAX_HEIGHT 2160
using namespace std;


int main(int argc, char *argv[])
{
    std::string dev;                     //dev
    std::string name;                     //设备名称
    std::int32_t width;
    std::int32_t height;

    ros::init(argc, argv, "image_publisher",1);

	ros::NodeHandle nh;
    ros::NodeHandle param("~");
    param.param<std::string>("dev", dev, "/dev/video0");
    param.param<std::string>("name", name, "camera0");
    param.param<std::int32_t>("width", width, 1920);
    param.param<std::int32_t>("height", height, 1080);
    

    printf("width=%d,height=%d\n",width,height);
    CV4l2Cam  cam(dev,width,height);
    CImgpublish imgpub((char*)name.c_str(),width,height);

    do{
    	if(cam.Init() < 0)
        {
            printf("camera init failed and retry after 3s\n");
            sleep(3);
        }
        else
        {
            break;
        }
    }while(1);
    
	cam.startAcquire();
	static unsigned char yuv[3*MAX_HEIGHT*MAX_WIDHT/2];
	unsigned char *yuyv = NULL;
	int yuyvlen = 0;

	while(1)
	{           
		if(cam.GrabImg(yuyv,yuyvlen)  == 0)
		{

			libyuv::YUY2ToI420(yuyv,2*width,
					yuv,width,
					yuv+width*height,width/2,
					yuv+5*width*height/4,width/2,
					width,
					height);	

        //save test
        {
            static int counter = 1;
            if(counter++ == 1)
            {
                printf("save\n");
                FILE *pf = fopen("/tmp/1.yuv","w");
                fwrite(yuv,1,3*width*height/2,pf);
                fclose(pf);
            }
        }

                    imgpub.Send(yuv,3*width*height/2);
		}         

	}
    cam.stopAcquire();
    cam.Release();
    ros::shutdown();
    return 0;

}
