/* 
 * File:   function.h
 * Author: Administrator
 *
 * Created on 2018年12月15日, 下午2:55
 */

#ifndef _FUNCTION_H
#define	_FUNCTION_H

#ifdef	__cplusplus
extern "C" {
#endif

#define VDD 5.0
    
extern unsigned char CFG_H;	// Configuration register
extern unsigned char CFG_L;    

extern unsigned char H_M;
extern unsigned char H_L;
extern unsigned char H_S;

extern unsigned char L_M;
extern unsigned char L_L;
extern unsigned char L_S;

extern unsigned char T_M;
extern unsigned char T_L;  

unsigned int GetHighGainValue(void);
unsigned int GetHighDataRateValue(void);
unsigned int GetLowGainValue(void);
unsigned int GetLowDataRateValue(void);

double GetSensorH(void);
double GetSensorL(void);

double GetTemperature(void);

void FormatData(unsigned char data[]);
void FormatTemperature(unsigned char temp[]);

#ifdef	__cplusplus
}
#endif

#endif	/* FUNCTION_H */

