/* 
 * File:   port.h
 * Author: win7
 *
 * Created on 2017年11月14日, 下午3:35
 */

#ifndef PORT_H
#define	PORT_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <pic.h>

#define Led1_On() PORTBbits.RB7 = 1
#define Led1_Off() PORTBbits.RB7 = 0
#define Led2_On() PORTBbits.RB3 = 1
#define Led2_Off() PORTBbits.RB3 = 0

#define Relay1_On() PORTAbits.RA1 = 1
#define Relay1_Off() PORTAbits.RA1 = 0
#define Relay2_On() PORTAbits.RA0 = 1
#define Relay2_Off() PORTAbits.RA0 = 0
#define Relay3_On() PORTBbits.RB6 = 1
#define Relay3_Off() PORTBbits.RB6 = 0
#define Relay4_On() PORTBbits.RB4 = 1
#define Relay4_Off() PORTBbits.RB4 = 0    
    
#define Bell_On()   PORTBbits.RB1 = 1
#define Bell_Off()  PORTBbits.RB1 = 0
    
void InitPort(void);
void InitTim0(void);
void SetInterrupt(void);

#ifdef	__cplusplus
}
#endif

#endif	/* PORT_H */

