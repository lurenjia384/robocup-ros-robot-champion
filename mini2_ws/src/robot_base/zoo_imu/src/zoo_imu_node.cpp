#include "zoo_imu/zoo_imu.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "zoo_imu");
  ros::NodeHandle nh, pnh("~");
  ZooIMU zoo_imu(nh, pnh);

  ros::spin();

  return 0;
}
