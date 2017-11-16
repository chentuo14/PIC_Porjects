#include <htc.h>
#include <stdio.h>
#include "usart.h"
#include "port.h"

void InitUsart(void)
{
    SPBRG = DIVIDER;
	RCSTA = (NINE_BITS|0x90);
	TXSTA = (SPEED|NINE_BITS|0x20);
}

void putch(unsigned char byte) 
{
	/* output one byte */
	while(!TXIF)	/* set when register is empty */
		continue;
	TXREG = byte;
}

unsigned char getch() {
	/* retrieve one byte */
	while(!RCIF)	/* set when register is not empty */
		continue;
	return RCREG;	
}

unsigned char getche(void)
{
	unsigned char c;
	putch(c = getch());
	return c;
}

void HandleData(void)
{
    if(relayStruct.relay1 == 0x01)
        Relay1_On();
    else if(relayStruct.relay1 == 0x02)
        Relay1_Off();
    
    if(relayStruct.relay2 == 0x01)
        Relay2_On();
    else if(relayStruct.relay2 == 0x02)
        Relay2_Off();
    
    if(relayStruct.relay3 == 0x01)
        Relay3_On();
    else if(relayStruct.relay3 == 0x02)
        Relay3_Off();
    
    if(relayStruct.relay4 == 0x01)
        Relay4_On();
    else if(relayStruct.relay4 == 0x02)
        Relay4_Off();

    if(relayStruct.bell == 0x01)
        TMR0IE = 0x1;
    else if(relayStruct.bell == 0x02)
    {
        TMR0IE = 0x0;
        Bell_Off();
    }
}

void ReturnToServer(void)
{
    putch(CODE_START);
    putch(relayStruct.relay1);
    putch(relayStruct.relay2);
    putch(relayStruct.relay3);
    putch(relayStruct.relay4);
    putch(relayStruct.bell);
    putch(CODE_CR);
}

void ClearRecvStruct(void)
{ 
	relayStruct.relay1 = 0x00;
	relayStruct.relay2 = 0x00;
	relayStruct.relay3 = 0x00;
    relayStruct.relay4 = 0x00;
    relayStruct.bell = 0x00;
	
    relayFlag.rcvStartOk = 0;
	relayFlag.rcvRelay1Ok = 0;
	relayFlag.rcvRelay2Ok = 0;
	relayFlag.rcvRelay3Ok = 0;
	relayFlag.rcvRelay4Ok = 0;
	relayFlag.rcvBellOk = 0;
	relayFlag.rcvTerminalOk = 0;
}


