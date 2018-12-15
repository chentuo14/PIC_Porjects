#include <pic.h>
#include <string.h>
#include <math.h>
#include "function.h"
#include "eeprom.h"

unsigned int GetHighGainValue(void)
{
    unsigned char gain = (int)(H_S & 0x03);
    switch(gain) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 4;
        case 3:
            return 8;
        default:
            return 0;
    }
}

unsigned int GetHighDataRateValue(void)
{
    unsigned char dataRate = ((H_S>>2) &0x03);
    switch(dataRate) {
        case 0:
            return 2048;
        case 1:
            return 8192;
        case 2:
            return 16384;
        case 3:
            return 32768;
        default:
            return 0;
    }
}

unsigned int GetLowGainValue(void)
{
    unsigned char gain = (int)(L_S & 0x03);
    switch(gain) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 4;
        case 3:
            return 8;
        default:
            return 0;
    }
}

unsigned int GetLowDataRateValue(void)
{
    unsigned char dataRate = ((L_S>>2) &0x03);
    switch(dataRate) {
        case 0:
            return 2048;
        case 1:
            return 8192;
        case 2:
            return 16384;
        case 3:
            return 32768;
        default:
            return 0;
    }
}

double GetSensorH(void)
{
    int adValue = (int)((H_M<<8)|H_L);
    float minCode = GetHighGainValue();
    float pga = GetHighGainValue();
    double ret = adValue*VDD/minCode/pga;
    if(ret < 0)
        ret = ret * (-1);
    return ret;
}

double GetSensorL(void)
{
    int adValue = (int)((L_M<<8)|L_L);
    float minCode = GetLowDataRateValue();
    float pga = GetLowGainValue();
    double ret = adValue*VDD/minCode/pga;
    if(ret < 0)
        ret = ret * (-1);
    return ret;
}

double GetTemperature(void)
{
    unsigned int temperature = (unsigned int)(T_M<<8|T_L);
    double temp = temperature/16.0;
    if(temp>0.0 &&temp<100.0)
        return temp;
    else
        return 0;
}

void FormatData(unsigned char data[])
{
    double high = GetSensorH();
    double low = GetSensorL();
    int i;
    double value = (double)(fabs(high - low)*((double)ReadQitty()));
    memcpy(data, &value, 8);
}

void FormatTemperature(unsigned char data[])
{
    double temp = GetTemperature();
    memcpy(data, &temp, 8);
}
    