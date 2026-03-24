#include "ros/ros.h"
#include "../include/mini2_arm/mini2_arm.h"


Mini2_ARM::Mini2_ARM()
{
    
}

Mini2_ARM::~Mini2_ARM()
{

}

bool Mini2_ARM::init(const char* port_name, int baudrate)
{
    return s.open( port_name, baudrate, 'N', 8, 1);
}

int Mini2_ARM::send_cmd(uint8_t cmd, uint8_t* buffer, uint8_t len)
{
    uint8_t sum = 0x5A;
    uint8_t i;
    uint8_t send_buffer[300];

    send_buffer[0] = 0x5A;
    send_buffer[1] = cmd;
    sum += cmd;
    send_buffer[2] = len;
    sum += len;
    for(i=0;i<len;i++)
    {
        send_buffer[i+3] = buffer[i];
        sum += buffer[i];
    }
    send_buffer[i+3] = sum;
    s.send(send_buffer, len+4);
    return 0;
}

int Mini2_ARM::armSetZeroCal()
{
    int res;
    res = send_cmd(MSG_ID_W_ARM_ZEROCAL,nullptr,0);
    if(res) return -1;
    else return 0;
}

int Mini2_ARM::armSetStop()
{
    int res;
    res = send_cmd(MSG_ID_W_ARM_STOP, nullptr, 0);
    if (res) return -1;
    else return 0;
}

int Mini2_ARM::armSetPump(bool enable)
{
    int res;
    uint8_t data;
    if (enable) data = 1;
    else data = 0;
    res = send_cmd(MSG_ID_W_ARM_VACUUM_PUMP, &data, 1);
    if (res) return -1;
    else return 0;
}

int Mini2_ARM::armSetValve(bool enable)
{
    int res;
    uint8_t data;
    if (enable) data = 1;
    else data = 0;
    res = send_cmd(MSG_ID_W_ARM_VACUUM_VALVE, &data, 1);
    if(res) return -1;
    else return 0;
}


int Mini2_ARM::armSetRunPara(cmd_arm_run_parameter_struct* para)
{
    int res;
    res = send_cmd(MSG_ID_W_ARM_PARA, (unsigned char*)para, 4);
    if (res) return -1;
    else return 0;
}

int Mini2_ARM::armSetSingleSteps(uint8_t index, int32_t steps)
{
    int res;
    res = send_cmd(MSG_ID_W_ARM_X_STEP+index, (uint8_t*)&steps, 4);
}

int Mini2_ARM::armSetSingleAbsSteps(uint8_t index, int32_t abssteps)
{
    int res;
    res = send_cmd(MSG_ID_W_ARM_X_ABS_STEP+index,(uint8_t*)&abssteps,4);
    if(res) return -1;
    else return 0;
}

int Mini2_ARM::armSetAbsSteps(int32_t* abssteps)
{
    int res;
    res = send_cmd(MSG_ID_W_ARM_XYZ_ABS_STEP, (uint8_t*)abssteps, 12);
    if(res) return -1;
    else return 0;
}

int Mini2_ARM::armGetState(cmd_arm_state_struct* state)
{
    int res;
    res = send_cmd(MSG_ID_R_ARM_STATE, nullptr,0);
    if(res) return -1;
    uchar rec_data[1024];
    int readlen = 0, count = 0, totallen = 0;
    do{
        count ++;
        readlen = s.receive(rec_data, 256);
        uSleep(100);
    }while (readlen<=0 && count<50);
    if(count >= 50)//timeout
        return -1;
    totallen = readlen;
    do{
        uSleep(100);
        readlen = s.receive(&rec_data[totallen-1], 256);
        totallen += readlen;
    }while (readlen != 0);   
    if(rec_data[0] == 0x5A && rec_data[1] == MSG_ID_R_ARM_STATE)
    {
        state->arm_state = rec_data[3];
        return 0;
    }
    return -1;
}

void Mini2_ARM::mSleep(int mtime)
{
    struct timeval tv;
    unsigned long usec = static_cast<unsigned long>(mtime*1000) ;
    tv.tv_sec = usec / 1000000;
    tv.tv_usec = usec % 1000000;

    int err;
    do {
        err = select(0, NULL, NULL, NULL, &tv);
    } while(err < 0 && errno == EINTR);
}

void Mini2_ARM::uSleep(int usec)
{
    struct timeval tv;
    tv.tv_sec = usec / 1000000;
    tv.tv_usec = usec % 1000000;

    int err;
    do {
        err = select(0, NULL, NULL, NULL, &tv);
    } while(err < 0 && errno == EINTR);
}
