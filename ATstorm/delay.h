/* 
 * File:   delay.h
 * Author: Administrator
 *
 * Created on 2018年9月6日, 上午8:59
 */

#ifndef DELAY_H
#define	DELAY_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include <htc.h>
    
#define TIME_50MS     4166
#define TIME_500MS     42668
    
#define TMR1H_value  0x0B
#define TMR1L_value  0xDC

#define RL_DELAY_TIME 30    
    
extern unsigned int timer1_counter;
extern unsigned int delay_flag;

void Delay(unsigned int t);
void timer1_init();

#ifdef	__cplusplus
}
#endif

#endif	/* DELAY_H */

