#include "port.h"

//LED1--RB7
//LED2--RB3
//Relay1--RA1
//Relay2--RA0
//Relay3--RB6
//Relay4--RB4

void InitPort(void)
{
    TRISA = 0x00;	
    TRISB = 0x00|(1<<2)|(1<<5); //RB2,RB5 for usart

    PORTA = 0x00;               //close all port
    PORTB = 0x00;
    
    ANSEL = 0x00;               //digital mode
    ADCON0 = 0x00;
	ADCON1 = 0x00;
    
    OPTION_REG |= (1<<7);       //pull-up
}

void InitTim0(void)
{
    OPTION_REG = 0x87;          //256 prescale
    TMR0IF=0;
    TMR0=61;
}

void SetInterrupt(void)
{
    TMR0IE = 0x0;                 //TIM0 interrupt
    RCIE = 0X1;                   //使能接收中断
    GIE = 0X1;                    //开放全局中断
    PEIE = 0X1;                   //使能外部中断
}
