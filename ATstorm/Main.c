/* 
 * File:   Main.c
 * Author: ZLuo
 *
 * Created on July 18, 2017, 2:15 PM
 */
#include <htc.h>
#include <stdio.h>
#include <stdlib.h>
#include "usart.h"
#include "i2c.h"
#include "DS18B20.h"
#include "eeprom.h"

//******************************************************************************
//__CONFIG(HS & WDTDIS & LVPDIS);
//__CONFIG(HS & WDTDIS & PWRTDIS & MCLREN & BORDIS & LVPDIS & UNPROTECT & CCPRB0 );
//__CONFIG(FCMDIS & IESODIS);
__CONFIG(FOSC_HS & WDTE_ON & PWRTE_OFF & MCLRE_ON & BOREN_OFF & LVP_OFF & CPD_OFF & WRT_OFF & CCPMX_RB0 & CP_OFF);
__CONFIG(FCMEN_OFF & IESO_OFF);
//******************************************************************************
#define	CMD_TEST		0x00

#define	CMD_RL_OPN		0x11
#define	CMD_RL_CLS		0x12

#define	CMD_SET_MsbODE_H	0x13 // Conversion mode
#define	CMD_SET_MsbODE_L	0x14

#define	CMD_SET_DATARATE_H	0x15 // Data Rate
#define	CMD_SET_DATARATE_L	0x16

#define	CMD_SET_GAIN_H	0x17 // Gain Setting
#define	CMD_SET_GAIN_L	0x18

#define	CMD_RE_H		0x21
#define	CMD_RE_L		0x22
#define	CMD_RE_TEMP		0x23
#define	CMD_RE_ALL		0x24

#define CMD_EEPROM_WRITE    0x31
#define CMD_EEPROM_READ     0x32
#define CMD_EEPROM_WRITESN  0x33
#define CMD_EEPROM_READSN   0x34

#define RA_1  	RA1
#define RA_2  	RA2
#define RA_3  	RA3
#define RA_4  	RA4

#define RELAY 	RB0

//******************************************************************************
#define	CODE_START	0x40	// 启始位
#define CODE_CR		0x0D	// Carriage Return (回车) 
#define CODE_LF		0x0A	// Line Feed (换行)
//******************************************************************************
static unsigned char unitAddr;
static unsigned char rcvCommand;
static unsigned char rcvLength;
static unsigned char rcvCount;
static unsigned char rcvData[8];
static unsigned char rcvCRC;

static unsigned char sndCommand;
static unsigned char sndLength;
static unsigned char sndCount;
static unsigned char sndData[8];
static unsigned char sndCRC;

static unsigned char CFG_H;	// Configuration register
static unsigned char CFG_L;    

static unsigned char H_M;
static unsigned char H_L;
static unsigned char H_S;

static unsigned char L_M;
static unsigned char L_L;
static unsigned char L_S;

static unsigned char T_M;
static unsigned char T_L;

static unsigned int idleCnt; 

static bit rcvStartOk;
static bit rcvAddrOk;
static bit rcvCommandOk;
static bit rcvLengthOk;
static bit rcvDataOk;
static bit rcvCRCOk;
static bit rcvTerminalOk;

static void RelayOn(){RELAY = 1;}
static void RelayOff(){RELAY = 0;}

//延时,最小30us,单次14us
static void Delay(unsigned int t){
    static unsigned int k; 
    for(k = 0; k < t; k++);
}
//
static void ResetUart(){
	static unsigned char i; 
	rcvCommand = 0x00;
	rcvLength = 0x00;
	rcvCount = 0x00;
	for(i=0; i < 8; i++){rcvData[i] = 0x00;}
	rcvCRC = 0x00;
	rcvStartOk = 0;
	rcvAddrOk = 0;
	rcvCommandOk = 0;
	rcvLengthOk = 0;
	rcvDataOk = 0;
	rcvCRCOk = 0;
	rcvTerminalOk = 0;
}
//
static void I2CReadH(){
	i2c_Start();
	i2c_PutByte(0x90 | I2C_WRITE);
	i2c_PutByte(CFG_H);
	i2c_Stop();
	i2c_Start();
	i2c_PutByte(0x90 | I2C_READ);
	H_M = i2c_GetByte(I2C_MORE);
	H_L = i2c_GetByte(I2C_MORE);
	H_S = i2c_GetByte(I2C_LAST);
	i2c_Stop();
}
//
static void I2CReadL(){
	i2c_Start();
	i2c_PutByte(0x92 | I2C_WRITE);
	i2c_PutByte(CFG_L);
	i2c_Stop();
	i2c_Start();
	i2c_PutByte(0x92 | I2C_READ);
	L_M = i2c_GetByte(I2C_MORE);
	L_L = i2c_GetByte(I2C_MORE);
	L_S = i2c_GetByte(I2C_LAST);
	i2c_Stop();
}
//
static void AutoAdjustGain(){
	//if(((H_M > 0) & ((CFG_H & 0x03) < 0x03)){
	//	CFG_H = CFG_H + 0x01;
	//}
}
//
static void DataHandle(){
// CMD_TEST----------------------------------------------
	if(rcvCommand == CMD_TEST){
		sndCommand = rcvCommand;
		sndLength = rcvLength;
		sndData[0] = rcvData[0];
		sndData[1] = rcvData[1];
		sndData[2] = rcvData[2];
		sndData[3] = rcvData[3];
		sndData[4] = rcvData[4];
		sndData[5] = rcvData[5];
		sndData[6] = rcvData[6];
		sndData[7] = rcvData[7];
// CMD_RL_OPN--------------------------------------------
	}else if(rcvCommand == CMD_RL_OPN){
		RelayOn();
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_RL_CLS--------------------------------------------
	}else if(rcvCommand == CMD_RL_CLS){
		RelayOff();
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_SET_MsbODE_H----------------------------------------
	}else if(rcvCommand == CMD_SET_MsbODE_H){
		CFG_H = CFG_H & 0x7F | rcvData[0] << 7 & 0x80;
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_SET_MsbODE_L----------------------------------------
	}else if(rcvCommand == CMD_SET_MsbODE_L){
		CFG_L = CFG_L & 0x7F | rcvData[0] << 7 & 0x80;
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_SET_DATARATE_H------------------------------------
	}else if(rcvCommand == CMD_SET_DATARATE_H){
		CFG_H = CFG_H & 0xF3 | rcvData[0] << 2 & 0x0C;
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_SET_DATARATE_L------------------------------------
	}else if(rcvCommand == CMD_SET_DATARATE_L){
		CFG_L = CFG_L & 0xF3 | rcvData[0] << 2 & 0x0C;
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_SET_GAIN_H----------------------------------------
	}else if(rcvCommand == CMD_SET_GAIN_H){
		CFG_H = CFG_H & 0xFC | rcvData[0] & 0x03;
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_SET_GAIN_L----------------------------------------
	}else if(rcvCommand == CMD_SET_GAIN_L){
		CFG_L = CFG_L & 0xFC | rcvData[0] & 0x03;
		sndCommand = rcvCommand;
		sndLength = 0;
// CMD_RE_H----------------------------------------------
	}else if(rcvCommand == CMD_RE_H){
		sndCommand = rcvCommand;
		sndLength = 3;
		sndData[0] = H_M;
		sndData[1] = H_L;
		sndData[2] = H_S;
// CMD_RE_L----------------------------------------------
	}else if(rcvCommand == CMD_RE_L){
		sndCommand = rcvCommand;
		sndLength = 3;
		sndData[0] = L_M;
		sndData[1] = L_L;
		sndData[2] = L_S;
// CMD_RE_TEMP----------------------------------------------
	}else if(rcvCommand == CMD_RE_TEMP){
		sndCommand = rcvCommand;
		sndLength = 2;
		sndData[0] = T_M;
		sndData[1] = T_L;
// CMD_RE_ALL-----------------------------------------------
	}else if(rcvCommand == CMD_RE_ALL){
		sndCommand = rcvCommand;
		sndLength = 8;
		sndData[0] = H_M;
		sndData[1] = H_L;
		sndData[2] = H_S;
		sndData[3] = L_M;
		sndData[4] = L_L;
		sndData[5] = L_S;
		sndData[6] = T_M;
		sndData[7] = T_L;
// Default--------------------------------------------------
	}else if(rcvCommand == CMD_EEPROM_WRITE){
        WriteEE(rcvData[0], rcvData[1]);
        sndCommand = rcvCommand;
        sndLength = 2;
        sndData[0] = rcvData[0];
        sndData[1] = rcvData[1];
    }else if(rcvCommand == CMD_EEPROM_READ) {
        sndCommand = rcvCommand;
        sndLength = 2;
        sndData[0] = rcvData[0];
        sndData[1] = ReadEE(rcvData[0]);
    }else if(rcvCommand == CMD_EEPROM_WRITESN){
        if(rcvLength == 0x04)
        {
            unsigned int snNumH, snNumL;
            snNumH = rcvData[0]<<8|rcvData[1];
            snNumL = rcvData[2]<<8|rcvData[3];
            WriteSN(snNumH, snNumL);
            
            sndCommand = rcvCommand;
            sndLength = rcvLength;
            sndData[0] = rcvData[0];
            sndData[1] = rcvData[1];
            sndData[2] = rcvData[2];
            sndData[3] = rcvData[3];
        }
    }else if(rcvCommand == CMD_EEPROM_READSN){
        sndCommand = rcvCommand;
        sndLength = 8;
        ReadSN(sndData);
    }else{
		sndCommand = rcvCommand;
		sndLength = 0;
	}
}
static void SendService()
{
	sndCRC = CODE_START ^ unitAddr ^ sndCommand ^ sndLength;
	putch(CODE_START);
	putch(unitAddr);
	putch(sndCommand);
	putch(sndLength);
	for(sndCount=0; sndCount < sndLength; sndCount++){
		putch(sndData[sndCount]);
		sndCRC ^= sndData[sndCount];
	}
	putch(sndCRC);
	putch(CODE_LF);
}
//******************************************************************************
int main(int argc, char** argv) {
    TRISA = 0B11111111;
    TRISB = 0B11110110;
	PORTA = 0x00;
	PORTB = 0x00;

	ANSEL = 0x00;
	ADCON0 = 0x00;
	ADCON1 = 0x00;
	
	CCP1CON = 0x00;
	CCPR1L = 0x7F;
	CCPR1H = 0x7F;
	T1CON = 0B00110001;
	T2CON = 0B01111111;
	PR2 = 0xD7;

	init_usart();
	SSPMode(MASTER_MODE);
	SSPEN = 1;
	CKP = 1;

	PIE1 = 0B00100000;
	PIR1 = 0B00000000;
	PIR2 = 0B00000000;
//	OPTION = 0B00001111;
	INTCON = 0B11000000;			
	
	ResetUart();
	unitAddr = 0x00;
	CFG_H = 0x0C; // DatRat = 8SPS_16bits, Gain = 1
	CFG_L = 0x0C;
	DS18B20Initial();
	while(1){
		if(OERR){ CREN = 0; CREN = 1; }
		if(rcvTerminalOk == 1){
			DataHandle();
			SendService();
			ResetUart();
		}
		idleCnt++;
		if(idleCnt >= 50000){
			idleCnt = 0;
			I2CReadH();
			Delay(100);
			I2CReadL();
			AutoAdjustGain();
			if(DS18B20Convert() == 1){//启动转换
				DS18B20ReadFlash();               	//读取温度	  		 
				T_M = T_Msb;
				T_L = T_Lsb;
			}
		}
	}
    return (EXIT_SUCCESS);
}
static void interrupt
isr(void){
	if(RCIF){
		if(rcvStartOk == 0){
			if(RCREG == CODE_START){
				ResetUart();
				rcvCRC = CODE_START;
				rcvStartOk = 1;
			}else{
				ResetUart();
			}
		}else if(rcvAddrOk == 0){
			if(RCREG == unitAddr){
				rcvCRC ^= unitAddr;
				rcvAddrOk = 1;
			}else{
				ResetUart();
			}
		}else if(rcvCommandOk == 0){
			rcvCommand = RCREG;
			rcvCRC ^= rcvCommand;
			rcvCommandOk = 1;
		}else if(!rcvLengthOk){
			rcvLength = RCREG;
			rcvCRC ^= rcvLength;
			if(rcvLength == 0){
				rcvDataOk = 1;
				rcvLengthOk = 1;
			}else if(rcvLength <= 8){
				rcvLengthOk = 1;
			}else{
				ResetUart();
			}
		}else if(rcvDataOk == 0){
			rcvData[rcvCount] = RCREG;
			rcvCRC ^= rcvData[rcvCount];
			if(rcvCount + 1 >= rcvLength){
				rcvDataOk = 1;
			}else{
				rcvCount += 1;
			}
		}else if(rcvCRCOk == 0){			
			if(rcvCRC == RCREG){
				rcvCRCOk = 1;
			}else{
				ResetUart();
			}
		}else if(rcvTerminalOk == 0){
			if(RCREG == CODE_LF){
				rcvTerminalOk = 1;
			}else{
				ResetUart();
			}
		}else{
			RCREG = RCREG;
		}
	}else{
		PIR1 = 0B00000000;
		PIR2 = 0B00000000;
		INTCON = 0B11000000;
	}
}