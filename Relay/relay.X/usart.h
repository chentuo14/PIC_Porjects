/* 
 * File:   usart.h
 * Author: win7
 *
 * Created on 2017年11月13日, 上午11:00
 */

#ifndef USART_H
#define	USART_H

#ifdef	__cplusplus
extern "C" {
#endif

#define BAUD 9600      
#define FOSC 4000000L
#define NINE 0     /* Use 9bit communication? FALSE=8bit */

#define DIVIDER ((int)(FOSC/(16UL * BAUD) - 1))
#define HIGH_SPEED 1

#if NINE == 1
#define NINE_BITS 0x40
#else
#define NINE_BITS 0
#endif

#if HIGH_SPEED == 1
#define SPEED 0x4
#else
#define SPEED 0
#endif

#if defined(_16F87) || defined(_16F88)
	#define RX_PIN TRISB2
	#define TX_PIN TRISB5
#else
	#define RX_PIN TRISC7
	#define TX_PIN TRISC6
#endif

#define UART_DEBUG 0

#define	CMD_TEST		0x00

#define RELAY_ONE_ON    0x01
#define RELAY_ONE_OFF   0x02
#define RELAY_TWO_ON    0x03
#define RELAY_TWO_OFF   0x04
#define RELAY_THREE_ON  0x05
#define RELAY_THREE_OFF 0x06
#define RELAY_FOUR_ON   0x07
#define RELAY_FOUR_OFF  0x08

#define BELL_ON         0x11
#define BELL_OFF        0x12

    
//******************************************************************************
#define	CODE_START	0xF0	// 启始位
#define CODE_CR		0x0D	// Carriage Return (回车) 
#define CODE_LF		0x0A	// Line Feed (换行)
//******************************************************************************

struct RelayStruct {
    unsigned char relay1;
    unsigned char relay2;
    unsigned char relay3;
    unsigned char relay4;
    unsigned char bell;
}relayStruct;

struct RelayFlag {
    unsigned char rcvStartOk;
    unsigned char rcvRelay1Ok;
    unsigned char rcvRelay2Ok;
    unsigned char rcvRelay3Ok;
    unsigned char rcvRelay4Ok;
    unsigned char rcvBellOk;
    unsigned char rcvTerminalOk;
}relayFlag;

void InitUsart(void);
void putch(unsigned char);
unsigned char getch(void);
unsigned char getche(void);
void HandleData(void);
void ReturnToServer(void);
void ClearRecvStruct(void);


#ifdef	__cplusplus
}
#endif

#endif	/* USART_H */

