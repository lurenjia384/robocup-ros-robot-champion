#include "../include/mini2_arm/serialport.h"
#include <iostream>
#include<sys/file.h>
#include <stdio.h>
#include <stdlib.h>    
#include <string.h>
#include <unistd.h>    
#include <sys/types.h>  
#include <sys/stat.h>   
#include <fcntl.h>      
#include <termios.h>  
#include <errno.h>

int speed_arr[] = {B1000000,B500000,B115200, B38400, B19200, B9600, B4800, B2400, B1200, B300};
int name_arr[] = {1000000,500000,115200, 38400, 19200, 9600, 4800, 2400, 1200, 300};

#define FALSE -1
#define TRUE   0

SerialPort::SerialPort()
{
}

SerialPort::~SerialPort()
{

}

int checkexit(const char* pfile)
{
    if (pfile == NULL)
    {
        return -1;
    }
    int lockfd = ::open(pfile,O_RDWR);
    if (lockfd == -1)
    {
        return -2;
    }
    int iret = flock(lockfd,LOCK_EX|LOCK_NB);
    if (iret == -1)
    {
        return -3;
    }

    return 0;
}

bool SerialPort::open(const char* portname, int baudrate, char parity, char databit, char stopbit)
{

    fd_serial = ::open(portname,O_RDWR|O_NONBLOCK);

    if(fd_serial==-1)
    {
        std::cout << portname << " open failed!" << std::endl;
        return false;
    }
    else
        std::cout << portname << " open success!" << std::endl;

    if(flock(fd_serial,LOCK_EX|LOCK_NB)!=0)//lock port
    {
        std::cout << portname << " is used!" << std::endl;
        ::close(fd_serial);
        return false;
    }

    set_speed(fd_serial,baudrate);
    if(!set_Parity(fd_serial,databit,stopbit,parity))
    {
        ::close(fd_serial);
        return false;
    }
    return true;
}

void SerialPort::set_speed(int fd, int speed)
{
    unsigned int   i;
    int   status;
    struct termios   Opt;
    tcgetattr(fd, &Opt);
    for ( i= 0; i < sizeof(speed_arr) / sizeof(int); i++)
    {
        if (speed == name_arr[i])
        {
            tcflush(fd, TCIOFLUSH);
            cfsetispeed(&Opt, speed_arr[i]);
            cfsetospeed(&Opt, speed_arr[i]);
            status = tcsetattr(fd, TCSANOW, &Opt);
            if (status != 0)
            {
                perror("tcsetattr fd1");
                return;
            }
            tcflush(fd,TCIOFLUSH);
        }
    }
}

/**
*@brief   设置串口数据位，停止位和效验位
*@param fd     类型 int 打开的串口文件句柄*
*@param databits 类型 int 数据位   取值 为 7 或者8*
*@param stopbits 类型 int 停止位   取值为 1 或者2*
*@param parity 类型 int 效验类型 取值为N,E,O,,S
*/
bool SerialPort::set_Parity(int fd,int databits,int stopbits,int parity)
{
    struct termios options;
    if ( tcgetattr( fd,&options) != 0)
    {
        perror("SetupSerial 1");
        return(FALSE);
    }
    options.c_cflag &= ~CSIZE;
    switch (databits) /*设置数据位数*/
    {
        case 7:
            options.c_cflag |= CS7;
            break;
        case 8:
            options.c_cflag |= CS8;
            break;
        default:
            fprintf(stderr,"Unsupported data size\n");
            return (FALSE);
    }
    switch (parity)
    {
        case 'n':
        case 'N':
    //        options.c_cflag &= ~PARENB;   /* Clear parity enable */
    //        options.c_iflag &= ~INPCK;     /* Enable parity checking */
            options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG); /*Input*/
            options.c_oflag &= ~OPOST;   /*Output*/
            break;
        case 'o':
        case 'O':
            options.c_cflag |= (PARODD | PARENB); /* 设置为奇效验*/
            options.c_iflag |= INPCK;             /* Disnable parity checking */
            break;
        case 'e':
        case 'E':
            options.c_cflag |= PARENB;     /* Enable parity */
            options.c_cflag &= ~PARODD;   /* 转换为偶效验*/
            options.c_iflag |= INPCK;       /* Disnable parity checking */
            break;
        case 'S':
        case 's': /*as no parity*/
            options.c_cflag &= ~PARENB;
            options.c_cflag &= ~CSTOPB;
            break;
        default:
            fprintf(stderr,"Unsupported parity\n");
            return (FALSE);
    }
    /* 设置停止位*/
    switch (stopbits)
    {
        case 1:
            options.c_cflag &= ~CSTOPB;
            break;
        case 2:
            options.c_cflag |= CSTOPB;
            break;
        default:
            fprintf(stderr,"Unsupported stop bits\n");
            return (FALSE);
    }
    /* Set input parity option */
    if ((parity != 'n')&&(parity != 'N'))
        options.c_iflag |= INPCK;

    options.c_cc[VTIME] = 5; // 0.5 seconds
    options.c_cc[VMIN] = 1;
    options.c_cflag &= ~HUPCL;
    options.c_iflag &= ~INPCK;
    options.c_iflag |= IGNBRK;
    options.c_iflag &= ~ICRNL;
    options.c_iflag &= ~IXON;
    options.c_lflag &= ~IEXTEN;
    options.c_lflag &= ~ECHOK;
    options.c_lflag &= ~ECHOCTL;
    options.c_lflag &= ~ECHOKE;
    options.c_oflag &= ~ONLCR;

    tcflush(fd,TCIFLUSH); /* Update the options and do it NOW */
    if (tcsetattr(fd,TCSANOW,&options) != 0)
    {
        perror("SetupSerial 3");
        return false;
    }

    return true;
}

void SerialPort::close()
{
    if(fd_serial != -1)
    {
        flock(fd_serial,LOCK_UN);
        ::close(fd_serial);
        std::cout << "close port!" << std::endl;
    }
}

int SerialPort::send(const void *buf,int len)
{
    int sendCount = 0;
    if(fd_serial != -1)
    {   
        // 将 buf 和 len 转换成api要求的格式
        const char *buffer = (char*)buf;
        size_t length = len;
        // 已写入的数据个数
        ssize_t tmp;

        while(length > 0)
        {
            if((tmp = write(fd_serial, buffer, length)) <= 0)
            {
                if(tmp < 0&&errno == EINTR)
                {
                    tmp = 0;
                }
                else
                {
                    break;
                }
            }
            length -= tmp;
            buffer += tmp;
        }

        sendCount = len - length;
    }
   
    return sendCount;
}

int SerialPort::receive(void *buf,int maxlen)
{
    int receiveCount = read(fd_serial,(char*)buf,maxlen);
    if(receiveCount < 0)
    {
        receiveCount = 0;
    }
    return receiveCount;
}

void SerialPort::clear()
{
    char buf[256];
    read(fd_serial,(char*)buf,256);
}