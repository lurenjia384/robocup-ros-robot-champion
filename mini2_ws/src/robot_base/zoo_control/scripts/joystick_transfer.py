#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Joy
from geometry_msgs.msg import Twist
from std_msgs.msg import Int16

class JoyTransfer:
    def __init__(self):
        rospy.init_node('joystick_transfer', anonymous=True)
        rospy.on_shutdown(self.shutdown)
        self.rate = rospy.get_param('~rate', 30)       
        self.robot_enable_button = rospy.get_param('~enable_button', 0)
        self.robot_axis_linear = rospy.get_param('~axis_linear', 0)
        self.robot_axis_angular = rospy.get_param('~axis_angular', 0)
        self.scale_linear = rospy.get_param('~scale_linear', 0.2)
        self.scale_angular = rospy.get_param('~scale_angular', 1.0)

        r = rospy.Rate(self.rate)

        self.robot_cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size = 5)
        self.joystick_sub = rospy.Subscriber('/joy', Joy, self.joy_cb)

        self.axes = []
        self.buttons = []

        rospy.sleep(1)
        while not rospy.is_shutdown():
            if (self.buttons[self.robot_enable_button] == 1):
                twist = Twist()
                twist.linear.x = self.axes[self.robot_axis_linear] * self.scale_linear
                twist.angular.z = self.axes[self.robot_axis_angular] * self.scale_angular
                self.robot_cmd_vel.publish(twist)
            r.sleep()
           
    def joy_cb(self, data):
        self.axes = data.axes
        self.buttons = data.buttons
    
    def shutdown(self):
        self.robot_cmd_vel.publish(Twist())

if __name__ == '__main__':
    joytransfer = JoyTransfer()
