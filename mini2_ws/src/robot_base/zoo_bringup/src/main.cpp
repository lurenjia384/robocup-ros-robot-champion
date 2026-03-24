#include <ros/ros.h>
#include "zoo_bringup/base_driver.h"

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "zoo_driver");
    
    BaseDriver::Instance()->work_loop();

    ros::spin();

    return 0;
}
