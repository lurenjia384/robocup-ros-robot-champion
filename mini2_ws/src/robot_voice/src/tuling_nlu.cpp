#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Int16.h>
#include <sstream>
#include <jsoncpp/json/json.h>
#include <curl/curl.h>
#include <string>
#include <exception>
#include <codecvt>
#include "geometry_msgs/Twist.h"

using namespace std;

static int flag = 0;
static string result;
static string tuling_key="175418b0747f4c50b15843fe0849067e"; //default tuling key
static string move_forward_str = "向前进";
static string move_back_str = "向后退";
static string turn_left_str = "向左转";
static string turn_right_str = "向右转";
static string back_home_str = "回家";
static string go_away_str = "出门";
static string stop_move_str = "停下来";


#define MOVE_FORWARD_CMD 1
#define MOVE_BACK_CMD    2
#define TURN_LEFT_CMD    5
#define TURN_RIGHT_CMD   6
#define STOP_MOVE_CMD    7

#define BACK_HOME_CMD    8
#define GO_AWAY_CMD      9

ros::Publisher cmd_vel_pub;
ros::Publisher nav_move_pub;

int writer(char *data, size_t size, size_t nmemb, string *writerData)
{
     if (writerData == NULL)
     {
         return -1;
     }
     int len = size*nmemb;
     writerData->append(data, len);

     return len;
}

/**
 * parse tuling server response json string
 */
int parseJsonResonse(string input)
{
    Json::Value root;
    Json::Reader reader;
    cout << "tuling server response origin json str:" << input << endl;
    bool parsingSuccessful = reader.parse(input, root);

    if(!parsingSuccessful)
    {
        cout << "!!! Failed to parse the response data" <<endl;
        return 1;
    }
    const Json::Value code = root["code"];
    const Json::Value text = root["text"];
    result = text.asString();
    flag = 1;
    cout << "response code:" << code << endl;
    cout << "response text:" << result <<endl;

    return 0;
}

/**
 * send tuling server http pose requeset
 */
int HttpPostRequest(string input, string key)
{
  string buffer;
  std::string strJson = "{";
  strJson += "\"key\" : ";
  strJson += "\"";
  strJson += key;
  strJson += "\",";
  strJson += "\"info\" : ";
  strJson += "\"";
  strJson += input;
  strJson += "\"";
  strJson += "}";
  cout<< "post json string:" << strJson <<endl;
  try
  {
    CURL *pCurl = NULL;
    CURLcode res;
    curl_global_init(CURL_GLOBAL_ALL);
    pCurl = curl_easy_init();
    if (pCurl != NULL)
    {
      //set url timeout
      curl_easy_setopt(pCurl, CURLOPT_TIMEOUT, 5);

      // First set the URL that is about to receive our POST.
      curl_easy_setopt(pCurl, CURLOPT_URL, "http://www.tuling123.com/openapi/api");

      // set curl http header
      curl_slist *plist = curl_slist_append(NULL,"Content-Type:application/json; charset=UTF-8");
      curl_easy_setopt(pCurl, CURLOPT_HTTPHEADER, plist);

      // set curl post content fileds
      curl_easy_setopt(pCurl, CURLOPT_POSTFIELDS, strJson.c_str());

      curl_easy_setopt(pCurl, CURLOPT_WRITEFUNCTION, writer);
      curl_easy_setopt(pCurl, CURLOPT_WRITEDATA, &buffer);

      // Perform the request, res will get the return code
      res = curl_easy_perform(pCurl);

      // Check for errors
      if (res != CURLE_OK)
      {
          printf("curl_easy_perform() failed:%s\n", curl_easy_strerror(res));
      }
      // always cleanup
      curl_easy_cleanup(pCurl);
    }
    curl_global_cleanup();
  }
  catch(std::exception &ex)
  {
    printf("!!! curl exception %s.\n", ex.what());
  }
  if(buffer.empty())
  {
      cout << "!!! ERROR The TuLing server response NULL" <<endl;
  }
  else
  {
      parseJsonResonse(buffer);
  }
  return 0;
}

wstring str2wstr(const std::string& str)
{
    using convert_typeX = std::codecvt_utf8<wchar_t>;
    wstring_convert<convert_typeX, wchar_t> converterX;

    return converterX.from_bytes(str);
}

int parseInputString(string input)
{
    int ret = 0;
    wstring convertStr = str2wstr(input);

    wstring forwardStr   = str2wstr(move_forward_str);
    wstring backStr      = str2wstr(move_back_str);
    wstring turnLeftStr  = str2wstr(turn_left_str);
    wstring turnRightStr = str2wstr(turn_right_str);
    wstring backHomeStr  = str2wstr(back_home_str);
    wstring goAwayStr    = str2wstr(go_away_str);
    wstring stopMoveStr  = str2wstr(stop_move_str);

    if(convertStr.find(forwardStr) != string::npos)
    {
        ret = MOVE_FORWARD_CMD;
    }
    else if(convertStr.find(backStr) != string::npos)
    {
        ret = MOVE_BACK_CMD;
    }
    else if(convertStr.find(turnLeftStr) != string::npos)
    {
        ret = TURN_LEFT_CMD;
    }
    else if(convertStr.find(turnRightStr) != string::npos)
    {
        ret = TURN_RIGHT_CMD;
    }
    else if(convertStr.find(backHomeStr) != string::npos)
    {
        ret = BACK_HOME_CMD;
    }
    else if(convertStr.find(goAwayStr) != string::npos)
    {
        ret = GO_AWAY_CMD;
    }
    else if(convertStr.find(stopMoveStr) != string::npos)
    {
        ret = STOP_MOVE_CMD;
    }

    return ret;
}

void nluCallback(const std_msgs::String::ConstPtr& msg)
{
  int ret = 0;
  std::cout<<"tuling_nlu_node get input is:" << msg->data << std::endl;
  ret = parseInputString(msg->data);
  ROS_INFO("tuling_nlu_node get parseInputString return: %d", ret);
  if(ret == 0) //send tuling nlu server to process
  {
      HttpPostRequest(msg->data, tuling_key);
  }
  else if((ret >= MOVE_FORWARD_CMD)&&(ret <= STOP_MOVE_CMD))
  {
      //std_msgs::Int16 move_msg;
      //move_msg.data = ret;
      geometry_msgs::Twist twist;
      float linear_speed = 0;
      float rotation_speed = 0;
      if(ret == MOVE_FORWARD_CMD)
      {
          linear_speed = 1;
          rotation_speed = 0;
      }
      else if(ret == MOVE_BACK_CMD)
      {
          linear_speed = -1;
          rotation_speed = 0;
      }
      else if(ret == TURN_LEFT_CMD)
      {
          linear_speed = 0;
          rotation_speed = -1;
      }
      else if(ret == TURN_RIGHT_CMD)
      {
          linear_speed = 0;
          rotation_speed = 1;
      }
      else if(ret == STOP_MOVE_CMD)
      {
          linear_speed = 0;
          rotation_speed = 0;
      }
      twist.linear.x = linear_speed;
      twist.linear.y = 0;
      twist.linear.z = 0;
      twist.angular.x = 0;
      twist.angular.y = 0;
      twist.angular.z = rotation_speed;
      cmd_vel_pub.publish(twist);
  }
  else //send nav msg
  {
      std_msgs::Int16 nav_msg;
      nav_msg.data = ret;
      nav_move_pub.publish(nav_msg);
  }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "tuling_nlu_node");
  ros::NodeHandle n;
  string nlu_topic = "/robot_voice/nlu_topic";
  string tts_topic = "/robot_voice/tts_topic";
  ros::param::get("~tuling_id", tuling_key);
  ros::param::get("~nlu_topic", nlu_topic);
  ros::param::get("~tts_topic", tts_topic);
  ros::Subscriber sub_nlu = n.subscribe(nlu_topic, 3, nluCallback);
  ros::Publisher pub_tts = n.advertise<std_msgs::String>(tts_topic, 1);
  cmd_vel_pub  = n.advertise<geometry_msgs::Twist>("/cmd_vel", 1000);
  nav_move_pub = n.advertise<std_msgs::Int16>("nav_topic", 1);
  ros::Rate loop_rate(10);
  while(ros::ok())
  {
    if(flag)
    {
      std_msgs::String msg;
      msg.data = result;
      pub_tts.publish(msg);
      flag = 0;
    }
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}
