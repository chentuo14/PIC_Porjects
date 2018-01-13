#ifndef	_DS18B20_H_
#define _DS18B20_H_

	#define DQ_DIR	TRISA0
	#define DQ	RA0

    unsigned char T_Lsb,T_Msb;
	void DS18B20Initial(void);
	unsigned char DS18B20Convert(void);
	void DS18B20ReadFlash(void);

#endif