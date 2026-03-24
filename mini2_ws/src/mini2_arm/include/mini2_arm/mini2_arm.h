#ifndef MINI2_ARM_H
#define MINI2_ARM_H

#include "serialport.h"

class Mini2_ARM
{
private:
    SerialPort s;
    int send_cmd(uint8_t cmd, uint8_t* buffer, uint8_t len);
    void mSleep(int mtime);
    void uSleep(int utime);
    
public:
    typedef enum{
        MSG_ID_R_ARM_STATE = 0x10,
        MSG_ID_W_ARM_ZEROCAL = 0x11,
        MSG_ID_W_ARM_STOP = 0x12,
        MSG_ID_W_ARM_PARA = 0x13,
        MSG_ID_W_ARM_VACUUM_PUMP = 0x14,
        MSG_ID_W_ARM_VACUUM_VALVE = 0x15,
        MSG_ID_W_ARM_X_STEP = 0x16,
        MSG_ID_W_ARM_Y_STEP = 0x17,
        MSG_ID_W_ARM_Z_STEP = 0x18,
        MSG_ID_W_ARM_X_ABS_STEP = 0x19,
        MSG_ID_W_ARM_Y_ABS_STEP = 0x1A,
        MSG_ID_W_ARM_Z_ABS_STEP = 0x1B,
        MSG_ID_W_ARM_XYZ_STEP = 0x1C,
        MSG_ID_W_ARM_XYZ_ABS_STEP = 0x1D,
    }MESSAGE_ID;

    typedef enum{
        X=0,
        Y=1,
        Z=2,
    }STEPPER_INDEX;

    typedef struct 
    {
        uint8_t arm_state;
        uint8_t running_flag;
        uint8_t key_state;
        uint8_t pump_valve_state;
        int16_t run_speed;
        int16_t run_acc;
        int32_t pos_x;
        int32_t pos_y;
        int32_t pos_z;
    }cmd_arm_state_struct;
    
    typedef struct{
        int16_t run_speed;
        int16_t run_acc;
    }cmd_arm_run_parameter_struct;

    typedef struct{
        uint8_t head;
        uint8_t id;
        uint8_t len;
        uint8_t data[256];
        uint8_t check;
        uint8_t new_message;
    }command_message_struct;

    cmd_arm_state_struct s_arm_state;
    cmd_arm_run_parameter_struct s_arm_run_para;

    Mini2_ARM();
    ~Mini2_ARM();

    int armGetState(cmd_arm_state_struct* state);
    int armSetZeroCal();
    int armSetStop();
    int armSetPump(bool enable);
    int armSetValve(bool enable);
    int armSetSingleSteps(uint8_t index, int32_t steps);
    int armSetSingleAbsSteps(uint8_t index, int32_t abssteps);
    int armSetAbsSteps(int32_t* abssteps);
    int armSetRunPara(cmd_arm_run_parameter_struct* para);

    bool init(const char* port_name, int baudrate);
};

#endif