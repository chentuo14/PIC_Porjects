/* 
 * File:   eeprom.h
 * Author: Administrator
 *
 * Created on 2018年1月17日, 下午1:56
 */

#ifndef EEPROM_H
#define	EEPROM_H

#ifdef	__cplusplus
extern "C" {
#endif

void WriteEE(unsigned char addr, unsigned char data);
unsigned char ReadEE(unsigned char addr);
void WriteSN(unsigned char numH, unsigned char numL);
void ReadSN(unsigned char data[]);


#ifdef	__cplusplus
}
#endif

#endif	/* EEPROM_H */

