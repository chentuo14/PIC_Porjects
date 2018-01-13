#include	<htc.h>
#include 	"DS18B20.h"

//复位DS18B20函数
unsigned char Reset(void)
{
	unsigned int i;   
	unsigned char k;	
	DQ_DIR = 0;				//设置DQ位输出口
	DQ = 0;     			//拉低DQ总线开始复位	
   	i=67;while(i>0){i--;}	//保持DQ低大约870uS，符合不低于480US的要求	
    DQ_DIR = 1;             //设置DQ为输入口，以释放总线等电阻拉高总线
    i=6;while(i>0){i--;}    //大约78uS后，判断是否复位成功
	if(DQ == 0){  	   		//读出数据并保存
   		k = 0;
	}else{
		k = 1;
	}
   	i=31;while(i>0){i--;}   //维持约400US，符合总读时隙不低于480US的要求
   	return k;               //k=0为复位成功，k=1为复位失败
}
//写字节函数
void WriteByte(unsigned char dat)
{
	unsigned int i;
   	unsigned char j;
   	for(j=0;j<8;j++)
   	{             
		if(dat & 0x01){//如果写1
			DQ_DIR=0;				//设置DQ位输出口
	   		DQ=0; 					//拉低      
         	NOP();NOP();NOP();NOP();NOP();NOP();//维持6US，符合大于1US小于15US的规范      
         	DQ_DIR=1;           	//设置DQ为输入口，以释放总线等电阻拉高总线        
         	i=5;while(i>0){i--;}	//维持约63US，符合不低于60US的要求
		}else{//如果写0
			DQ_DIR = 0;				//设置DQ位输出口
			DQ = 0; 				//拉低
         	i=5;while(i>0){i--;}	//维持约63US，符合不低于60US的要求        
         	DQ_DIR = 1;           	//设置DQ为输入口，以释放总线等电阻拉高总线	        
         	NOP();NOP();       		//维持2US，符合大于1US的规范
      	}
		dat = dat >> 1;				//写入字节右移1位
	}
}
//读字节函数
unsigned char ReadByte(void)
{
	unsigned int i;
   	unsigned char j,buf = 0;
   	for(j=1; j<=8; j++)			//接收8次还原一个字节数据 
   	{
		buf = buf >> 1;  			//接收前，先将接收缓冲区右移
		DQ_DIR = 0;				//设置DQ位输出口   
		DQ = 0; 				//拉低      
        NOP();NOP();       		//维持2US，符合大于1US小于15US的规范	
      	DQ_DIR = 1;             //设置DQ为输入口，以释放总线等电阻拉高总线 准备读
        NOP();NOP();NOP();NOP();NOP();NOP();//维持6US，符合大于1US小于15US的规范
		if(DQ == 1){
			buf |= 0x80; //读出1位数据保存于buf中最高位
		}
		i=4;while(i>0){i--;}    //维持约52US，符合总读时隙不低于60US的要求
	}
   	return buf;             	//退出的同时将接收缓冲区参数返回	
}
//启动读温度函数
unsigned char DS18B20Convert(void) 
{ 
	unsigned int i;
    if(Reset()==0)            	//如果复位成功
	{  
		i=77;while(i>0){i--;}	//延时约1000US
        WriteByte(0xcc);     	// 跳过多器件识别 
        WriteByte(0x44);     	// 启动温度转换 
		return 1;
    } 
	else
	{
		return 0;
	}
} 
//读温度函数
void DS18B20ReadFlash(void) 
{ 
	unsigned int i;
    if(Reset() == 0) 
	{  
		i=77;while(i>0){i--;}		//延时约1000US
        WriteByte(0xCC);			// 跳过多器件识别 
        WriteByte(0xBE);			// 读暂存器 
        T_Lsb = ReadByte();			// 低字节 
        T_Msb = ReadByte();			// 高字节
    }    
	else
	{
		T_Lsb = 0;
		T_Msb = 0;
	} 
} 
//初始化函数
void DS18B20Initial(void) 
{ 
	unsigned int i;
    if(Reset() == 0) 
	{  
		i=77;while(i>0){i--;}		//延时约1000US
		WriteByte(0xCC);			// 跳过多器件识别 
        WriteByte(0x4E);
		WriteByte(0x00);
		WriteByte(0x00);
		WriteByte(0x7F);
    }    
} 