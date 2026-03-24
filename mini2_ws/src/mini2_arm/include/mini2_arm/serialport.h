#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <string>
#include <vector>

typedef unsigned char uchar;
class SerialPort
{
private:
	int pHandle[16];
    int fd_serial;
    void set_speed(int fd, int speed);
    bool set_Parity(int fd,int databits,int stopbits,int parity);
	char synchronizeflag;
public:
    SerialPort();
    ~SerialPort();
    bool open(const char* portname, int baudrate, char parity, char databit, char stopbit);
    void close();
    int send(const void *buf, int len);
    int receive(void *buf, int maxlen);
    void clear();
};

#endif