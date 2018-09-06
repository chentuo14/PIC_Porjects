
#include "delay.h"

unsigned int timer1_counter;
unsigned int delay_flag;
//延时,最小30us,单次66.6us
void Delay(unsigned int t)
{
    static unsigned int k; 
    for(k = 0; k < t; k++);
}

void timer1_init()  
{  
    T1CONbits.TMR1CS    = 0;    /* Internal clock (FOSC/4) */  
    T1CONbits.T1CKPS1   = 1;    /* 1:4 prescale value */  
    T1CONbits.T1CKPS0   = 0;  
    TMR1L           = TMR1L_value; /* initialized value 250ms */  
    TMR1H           = TMR1H_value;  
  
    PIR1bits.TMR1IF     = 0;    /* clear TMR1 register voerflowed */  
    GIE         = 1;  
    PEIE            = 1;    /* enable outside interrupt */  
    T1CONbits.TMR1ON    = 1;    /* enable timer1 */  
    TMR1IE          = 1;    /* enable timer1 interrupt */  
    timer1_counter = 0;
    delay_flag = 0;
}  