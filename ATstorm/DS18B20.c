#include	<htc.h>
#include 	"DS18B20.h"

//��λDS18B20����
unsigned char Reset(void)
{
	unsigned int i;   
	unsigned char k;	
	DQ_DIR = 0;				//����DQλ�����
	DQ = 0;     			//����DQ���߿�ʼ��λ	
   	i=67;while(i>0){i--;}	//����DQ�ʹ�Լ870uS�����ϲ�����480US��Ҫ��	
    DQ_DIR = 1;             //����DQΪ����ڣ����ͷ����ߵȵ�����������
    i=6;while(i>0){i--;}    //��Լ78uS���ж��Ƿ�λ�ɹ�
	if(DQ == 0){  	   		//�������ݲ�����
   		k = 0;
	}else{
		k = 1;
	}
   	i=31;while(i>0){i--;}   //ά��Լ400US�������ܶ�ʱ϶������480US��Ҫ��
   	return k;               //k=0Ϊ��λ�ɹ���k=1Ϊ��λʧ��
}
//д�ֽں���
void WriteByte(unsigned char dat)
{
	unsigned int i;
   	unsigned char j;
   	for(j=0;j<8;j++)
   	{             
		if(dat & 0x01){//���д1
			DQ_DIR=0;				//����DQλ�����
	   		DQ=0; 					//����      
         	NOP();NOP();NOP();NOP();NOP();NOP();//ά��6US�����ϴ���1USС��15US�Ĺ淶      
         	DQ_DIR=1;           	//����DQΪ����ڣ����ͷ����ߵȵ�����������        
         	i=5;while(i>0){i--;}	//ά��Լ63US�����ϲ�����60US��Ҫ��
		}else{//���д0
			DQ_DIR = 0;				//����DQλ�����
			DQ = 0; 				//����
         	i=5;while(i>0){i--;}	//ά��Լ63US�����ϲ�����60US��Ҫ��        
         	DQ_DIR = 1;           	//����DQΪ����ڣ����ͷ����ߵȵ�����������	        
         	NOP();NOP();       		//ά��2US�����ϴ���1US�Ĺ淶
      	}
		dat = dat >> 1;				//д���ֽ�����1λ
	}
}
//���ֽں���
unsigned char ReadByte(void)
{
	unsigned int i;
   	unsigned char j,buf = 0;
   	for(j=1; j<=8; j++)			//����8�λ�ԭһ���ֽ����� 
   	{
		buf = buf >> 1;  			//����ǰ���Ƚ����ջ���������
		DQ_DIR = 0;				//����DQλ�����   
		DQ = 0; 				//����      
        NOP();NOP();       		//ά��2US�����ϴ���1USС��15US�Ĺ淶	
      	DQ_DIR = 1;             //����DQΪ����ڣ����ͷ����ߵȵ����������� ׼����
        NOP();NOP();NOP();NOP();NOP();NOP();//ά��6US�����ϴ���1USС��15US�Ĺ淶
		if(DQ == 1){
			buf |= 0x80; //����1λ���ݱ�����buf�����λ
		}
		i=4;while(i>0){i--;}    //ά��Լ52US�������ܶ�ʱ϶������60US��Ҫ��
	}
   	return buf;             	//�˳���ͬʱ�����ջ�������������	
}
//�������¶Ⱥ���
unsigned char DS18B20Convert(void) 
{ 
	unsigned int i;
    if(Reset()==0)            	//�����λ�ɹ�
	{  
		i=77;while(i>0){i--;}	//��ʱԼ1000US
        WriteByte(0xcc);     	// ����������ʶ�� 
        WriteByte(0x44);     	// �����¶�ת�� 
		return 1;
    } 
	else
	{
		return 0;
	}
} 
//���¶Ⱥ���
void DS18B20ReadFlash(void) 
{ 
	unsigned int i;
    if(Reset() == 0) 
	{  
		i=77;while(i>0){i--;}		//��ʱԼ1000US
        WriteByte(0xCC);			// ����������ʶ�� 
        WriteByte(0xBE);			// ���ݴ��� 
        T_Lsb = ReadByte();			// ���ֽ� 
        T_Msb = ReadByte();			// ���ֽ�
    }    
	else
	{
		T_Lsb = 0;
		T_Msb = 0;
	} 
} 
//��ʼ������
void DS18B20Initial(void) 
{ 
	unsigned int i;
    if(Reset() == 0) 
	{  
		i=77;while(i>0){i--;}		//��ʱԼ1000US
		WriteByte(0xCC);			// ����������ʶ�� 
        WriteByte(0x4E);
		WriteByte(0x00);
		WriteByte(0x00);
		WriteByte(0x7F);
    }    
} 