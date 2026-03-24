#include"ros/ros.h"
#include"std_msgs/String.h"
#include <sstream>

int main(int argc,char** argv)
{
	ros::init(argc,argv,"talker");
        ros::NodeHandle n;
        ros::Publisher chat_pub =n.advertise<std_msgs::String>("/robot_voice/tts_topic",1000);
	ros::Rate loop_rate(0.1);
        while(ros::ok())
	{
		std_msgs::String msg;
	  	std::stringstream ss;
	 	ss<<"到达目标点A";
	 	msg.data=ss.str();
	 	chat_pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 0;
}
