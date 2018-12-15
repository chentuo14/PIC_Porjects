#include "eeprom.h"
#include <pic.h>

//EEPROMд���ݺ���
void WriteEE(unsigned char addr, unsigned char data)
{
    do{}
    while(WR == 1);         //�ȴ�д���
    
    EEADR = addr;           //д���ַ��Ϣ
    EEDATA = data;          //д��������Ϣ
    EEPGD = 0;              //����EEPROM
    WREN = 1;               //дEEPROM����
    EECON2 = 0x55;          //д���ض�ʱ��
    EECON2 = 0xaa;          
    WR = 1;                 //ִ��д����
    do{}
    while(WR == 1);         //�ȴ�д���
    WREN = 0;               //��ֹд��EEPROM
}

//EEPROM��ȡ���ݺ���
unsigned char ReadEE(unsigned char addr)
{
    unsigned char num;
    do{}
    while(RD == -1);        //�ȴ������
    EEADR = addr;           //д��Ҫ���ĵ�ַ
    EEPGD = 0;              //����EEPROM
    RD = 1;                 //ִ�ж�����
    do{}
    while(RD == 1);         //�ȴ������
    num = EEDATA;
    return num;             //���ض�ȡ������
}

void WriteSN(unsigned char numH, unsigned char numL)
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
    WriteEE(0x04, numH&0xff);
    _nop();
    WriteEE(0x05, numL&0xff);
    _nop();
}

void ReadSN(unsigned char data[])
{
    unsigned char i;
    for(i=0;i<6;i++)
        data[i] = ReadEE(i);
}

void WriteQitty(unsigned char qitty)
{
    WriteEE(0x06, qitty);
    _nop();
}

unsigned char ReadQitty()
{
    return ReadEE(0x06);
}

