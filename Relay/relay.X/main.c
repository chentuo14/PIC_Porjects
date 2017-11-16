/* 
 * File:   main.c
 * Author: chentuo
 *
 * Created on 2017年11月13日, 上午10:24
 */

#include <stdio.h>
#include <stdlib.h>
#include <pic.h>
#include "usart.h"
#include "port.h"

// PIC16F88 Configuration Bit Settings
// 'C' source line config statements
#include <htc.h>

__CONFIG(FOSC_XT & WDTE_OFF & PWRTE_OFF & MCLRE_ON & BOREN_OFF & LVP_OFF & CPD_OFF & WRT_OFF & CCPMX_RB0 & CP_OFF);
__CONFIG(FCMEN_OFF & IESO_ON);

void Delay(unsigned int t);

/*
 * 
 */
int main()
{
//    OSCCON = 0x70;
    InitPort();
    InitUsart();
    Led1_On();
    Led2_On();
    InitTim0();
    SetInterrupt();
    
    while(1)
    { 
        if(relayFlag.rcvTerminalOk == 1) {
			HandleData();
            ReturnToServer();			
			ClearRecvStruct();
		}  
    }
    return (EXIT_SUCCESS);
}

//延时,最小30us,单次14us
void Delay(unsigned int t){
    unsigned int k; 
    for(k = 0; k < t; k++);
}

void interrupt usart(void)
{
    if(RCIE&&RCIF)            //判断是否为串口接收中断
    {      
#if UART_DEBUG
        TXREG = RCREG;
#else        
        if(relayFlag.rcvStartOk == 0) {
            if(RCREG == CODE_START) {
                ClearRecvStruct();
                relayFlag.rcvStartOk = 1;
            } else {
                ClearRecvStruct();
            }
        } else if (relayFlag.rcvRelay1Ok == 0) {
            relayStruct.relay1 = RCREG;
            relayFlag.rcvRelay1Ok = 1;
        } else if (relayFlag.rcvRelay2Ok == 0) {
            relayStruct.relay2 = RCREG;
            relayFlag.rcvRelay2Ok = 1;
        } else if (relayFlag.rcvRelay3Ok == 0) {
            relayStruct.relay3 = RCREG;
            relayFlag.rcvRelay3Ok = 1;
        } else if (relayFlag.rcvRelay4Ok == 0) {
            relayStruct.relay4 = RCREG;
            relayFlag.rcvRelay4Ok = 1;
        } else if (relayFlag.rcvBellOk == 0) {
            relayStruct.bell = RCREG;
            relayFlag.rcvBellOk = 1;
        } else if (relayFlag.rcvTerminalOk == 0) {
            if(RCREG == CODE_LF)
                relayFlag.rcvTerminalOk = 1;
            else
                ClearRecvStruct();
        } else {
            unsigned char temp = RCREG;
            putch(temp);
        } 
#endif
    }
    
    if(TMR0IF==1 && TMR0IE==1)
    {
        PORTBbits.RB3 = ~PORTBbits.RB3;
        PORTBbits.RB1 = ~PORTBbits.RB1;
        TMR0IF = 0;
        TMR0 = 61;
    }
}
