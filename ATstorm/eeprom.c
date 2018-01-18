#include "eeprom.h"
#include <pic.h>

//EEPROM写数据函数
void WriteEE(unsigned char addr, unsigned char data)
{
    do{}
    while(WR == 1);         //等待写完成
    
    EEADR = addr;           //写入地址信息
    EEDATA = data;          //写入数据信息
    EEPGD = 0;              //操作EEPROM
    WREN = 1;               //写EEPROM允许
    EECON2 = 0x55;          //写入特定时序
    EECON2 = 0xaa;          
    WR = 1;                 //执行写操作
    do{}
    while(WR == 1);         //等待写完成
    WREN = 0;               //禁止写入EEPROM
}

//EEPROM读取数据函数
unsigned char ReadEE(unsigned char addr)
{
    unsigned char num;
    do{}
    while(RD == -1);        //等待读完成
    EEADR = addr;           //写入要读的地址
    EEPGD = 0;              //操作EEPROM
    RD = 1;                 //执行读操作
    do{}
    while(RD == 1);         //等待读完成
    num = EEDATA;
    return num;             //返回读取的数据
}

void WriteSN(unsigned int numH, unsigned int numL)
{
    //30303031
    WriteEE(0x00, 0x57);
    _nop();
    WriteEE(0x01, 0x48);
    _nop();
    WriteEE(0x02, 0x53);
    _nop();
    WriteEE(0x03, 0x45);
    _nop();
    WriteEE(0x04, (numH>>8)&0xff);
    _nop();
    WriteEE(0x05, numH&0xff);
    _nop();
    WriteEE(0x06, (numL>>8)&0xff);
    _nop();
    WriteEE(0x07, numL&0xff);
    _nop();
}

void ReadSN(unsigned char data[8])
{
    unsigned char i;
    for(i=0;i<8;i++)
        data[i] = ReadEE(i);
}

