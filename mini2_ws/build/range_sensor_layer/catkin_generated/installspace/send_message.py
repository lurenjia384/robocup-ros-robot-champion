#!/usr/bin/env python2
#*-coding:utf-8-*-
import rospy
from sensor_msgs.msg import Range
from zoo_imu.msg import Sensor
import tf 
msg=0
def callback(data):
    global msg
    msg=data.ultra1
    print(msg*0.001)
    return msg
if __name__=="__main__":
    rospy.init_node('ultrasound')
    sub=rospy.Subscriber("/sensor",Sensor,callback)
    broadcast=tf.TransformBroadcaster()
    pub = rospy.Publisher('/sonar', Range)
    try:
        while not rospy.is_shutdown():
            r = Range()
            r.header.frame_id = 'ultrasound'
            r.field_of_view = 1
            r.max_range = 5
            r.range = msg*0.001
            r.header.stamp = rospy.Time.now()
            broadcast.sendTransform((0.12, 0.0, 0.05),(0, 0, 0, 1),rospy.Time.now(), "ultrasound","base_link")
            pub.publish(r)
    except rospy.ROSInterruptException:
        pass
