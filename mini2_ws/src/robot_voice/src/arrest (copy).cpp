/*
* 语音听写(iFly Auto Transform)技术能够实时地将语音转换成对应的文字。
*/
#include <thread>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "robot_voice/qisr.h"
#include "robot_voice/msp_cmn.h"
#include "robot_voice/msp_errors.h"
#include "robot_voice/speech_recognizer.h"
#include <iconv.h>
#include<geometry_msgs/Twist.h>

#include "ros/ros.h"
#include "std_msgs/String.h"

using namespace std;

#define FRAME_LEN   640 
#define BUFFER_SIZE 4096

int wakeupFlag   = 0 ;
int resultFlag   = 0 ;
ros::Publisher pub_cmd;
ros::Publisher pub_order;
static void show_result(char *string, char is_over)
{
    resultFlag=1;   
    printf("\rResult: [ %s ]", string);
    if(is_over)
        putchar('\n');
        std::string commandString = string;
        // if(commandString.compare("走") == 0)
        // {
        //   std_msgs::String order;
        //   order.data="begin";
        //   pub_order.publish(order);
        //   printf("Send begin\n");          
        // };
        // if(commandString.compare("导航") == 0)
        // {
        //   std_msgs::String order;
        //   order.data="begin";
        //   while(1) pub_order.publish(order);
        //   printf("Send begin\n");  

        // }
        // if(commandString.compare("开始导航") == 0)
        // {
        //   std_msgs::String order;
        //   order.data="begin";
        //   while(1) pub_order.publish(order);
        //   printf("Send begin\n");          
        // }
        if(commandString.find("导航") != std::string::npos)  // 修改了这一行
        {
            resultFlag = 2;

            std_msgs::String order;
            order.data = "begin";
            pub_order.publish(order);
            printf("Send begin\n"); 
            wakeupFlag   = 0   ;      
        }
        

}


static char *g_result = NULL;
static unsigned int g_buffersize = BUFFER_SIZE;

void on_result(const char *result, char is_last)
{
    if (result) {
        size_t left = g_buffersize - 1 - strlen(g_result);
        size_t size = strlen(result);
        if (left < size) {
            g_result = (char*)realloc(g_result, g_buffersize + BUFFER_SIZE);
            if (g_result)
                g_buffersize += BUFFER_SIZE;
            else {
                printf("mem alloc failed\n");
                return;
            }
        }
        strncat(g_result, result, size);
        show_result(g_result, is_last);
    }
}

void on_speech_begin()
{
    if (g_result)
    {
        free(g_result);
    }
    g_result = (char*)malloc(BUFFER_SIZE);
    g_buffersize = BUFFER_SIZE;
    memset(g_result, 0, g_buffersize);

    printf("Start Listening...\n");
}
void on_speech_end(int reason)
{
    if (reason == END_REASON_VAD_DETECT)
        printf("\nSpeaking done \n");
    else
        printf("\nRecognizer error %d\n", reason);
}

/* demo recognize the audio from microphone */
static void demo_mic(const char* session_begin_params)
{
    int errcode;
    int i = 0;
    struct speech_rec iat;

    struct speech_rec_notifier recnotifier = {
        on_result,
        on_speech_begin,
        on_speech_end
    };

    errcode = sr_init(&iat, session_begin_params, SR_MIC, &recnotifier);
    if (errcode) {
        printf("speech recognizer init failed\n");
        return;
    }
    
    errcode = sr_start_listening(&iat);
    if (errcode) {
        printf("start listen failed %d\n", errcode);
    }
    /* demo 10 seconds recording */
    // while(i++ < 3)
    //     sleep(1);
    // while(resultFlag!=2)
    while(resultFlag!=2)
    {sleep(2);printf("resultFlag= %d\n", resultFlag);}
    
    errcode = sr_stop_listening(&iat);
    if (errcode) {
        printf("stop listening failed %d\n", errcode);
    }
    sr_uninit(&iat);
}


/* main thread: start/stop record ; query the result of recgonization.
 * record thread: record callback(data write)
 * helper thread: ui(keystroke detection)
 */

// void WakeUp(const std_msgs::String::ConstPtr& msg)
// {
//     printf("waking up\r\n");
//     usleep(700*1000);
//     wakeupFlag=1;
// }
void checkKeyboardInput()
{
    while (ros::ok()) {
        std::string input;
        std::cin >> input;
        if (input == "wakeup") {
            wakeupFlag = 1;
            std::cout << "Wakeup command received." << std::endl;
            std::cout << "please send 'q' to quit." << std::endl;
        }
        else if (input == "q") {  // 空格键对应的字符是 ' '
            wakeupFlag = 0;
            std::cout << "Stop command received." << std::endl;
        }
    }
}


int main(int argc, char* argv[])
{
    // string asr_topic = "/robot_voice/asr_topic"; //default asr topic
    // string nlu_topic = "/order";  //default nlu topic
    // string appID = "6010cacd";
    // // 初始化ROS
    // ros::init(argc, argv, "voiceRecognition");
    // ros::NodeHandle n;
    // ros::param::get("~xunfei_id", appID);
    // ros::param::get("~asr_topic", asr_topic);
    // ros::param::get("~nlu_topic", nlu_topic);
    // ros::Rate loop_rate(10);
    // // ros::Rate loop_rate(20);
    // // 声明Publisher和Subscriber
    // // 订阅唤醒语音识别的信号
    // ros::Subscriber wakeUpSub = n.subscribe(asr_topic, 1000, WakeUp);
    // // 订阅唤醒语音识别的信号    
    // //ros::Publisher voiceWordsPub = n.advertise<std_msgs::String>(nlu_topic, 1000);
    // //pub_cmd = n.advertise<geometry_msgs::Twist>("/cmd_vel",1);
    // pub_order = n.advertise<std_msgs::String>("/order",20);

    // ROS_INFO("Sleeping...");
    // int count=0;
    // // change to hand
    // // wakeupFlag = 1;
    string asr_topic = "/robot_voice/asr_topic"; //default asr topic
    string nlu_topic = "/order";  //default nlu topic
    string appID = "6010cacd";

    ros::init(argc, argv, "voiceRecognition");
    ros::NodeHandle n;

    ros::param::get("~xunfei_id", appID);
    ros::param::get("~asr_topic", asr_topic);
    ros::param::get("~nlu_topic", nlu_topic);

    ros::Rate loop_rate(10);

    pub_order = n.advertise<std_msgs::String>("/order", 20);

    std::cout << "Program started. Type 'wakeup' to activate voice recognition." << std::endl;
    std::cout << "Enter 'wakeup' in this console window." << std::endl;

    std::thread inputThread(checkKeyboardInput);
    while(ros::ok())
    {
        // 语音识别唤醒
        if (wakeupFlag){
            ROS_INFO("Wakeup...");
            int ret = MSP_SUCCESS;
            string params = "appid = "+appID+", word_dir = .";
            const char* login_params = params.c_str();

            const char* session_begin_params =
                "sub = iat, domain = iat, language = zh_cn, "
                "accent = mandarin, sample_rate = 16000, "
                "result_type = plain, result_encoding = utf8";

            ret = MSPLogin(NULL, NULL, login_params);
            if(MSP_SUCCESS != ret){
                MSPLogout();
                printf("MSPLogin failed , Error code %d.\n",ret);
            }

            printf("Demo recognizing the speech from microphone\n");
            printf("Speak in 10 seconds\n");

            demo_mic(session_begin_params);

            printf("10 sec passed\n");
        
            wakeupFlag=0;
            MSPLogout();
        }

        // 语音识别完成
        if(resultFlag){
            resultFlag=0;
            std_msgs::String msg;
            msg.data = g_result;
            //voiceWordsPub.publish(msg);
        }

        ros::spinOnce();
        loop_rate.sleep();
        // count++;
    }

exit:
    MSPLogout(); // Logout...

    return 0;
}
