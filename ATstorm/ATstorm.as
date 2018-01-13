opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6738"

opt pagewidth 120

	opt pm

	processor	16F88
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 14 "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 14 "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	dw 0x3FEE & 0x3FFB & 0x3F7F ;#
	FNCALL	_main,_ResetUart
	FNCALL	_main,_DataHandle
	FNCALL	_main,_SendService
	FNCALL	_main,_I2CService
	FNCALL	_I2CService,_i2c_Restart
	FNCALL	_I2CService,_i2c_PutByte
	FNCALL	_I2CService,_i2c_Stop
	FNCALL	_I2CService,_i2c_GetByte
	FNCALL	_I2CService,_DelayInt
	FNCALL	_i2c_GetByte,_i2c_ReadByte
	FNCALL	_i2c_GetByte,_i2c_SendAcknowledge
	FNCALL	_i2c_PutByte,_i2c_SendByte
	FNCALL	_i2c_PutByte,_i2c_ReadAcknowledge
	FNCALL	_i2c_ReadByte,_i2c_WaitForSCL
	FNCALL	_i2c_ReadAcknowledge,_i2c_WaitForSCL
	FNCALL	_i2c_SendByte,_i2c_WaitForSCL
	FNCALL	_SendService,_putch
	FNCALL	_DataHandle,_RelayOn
	FNCALL	_DataHandle,_RelayOff
	FNROOT	_main
	FNCALL	_isr,i1_ResetUart
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_rcvData
	global	_sndData
	global	DelayInt@k
	global	_idleCnt
	global	_CFG_H
	global	_CFG_L
	global	_H_H
	global	_H_L
	global	_H_S
	global	_L_H
	global	_L_L
	global	_L_S
	global	_rcvCRC
	global	_sndCRC
	global	_sndCommand
	global	_sndCount
	global	_sndLength
	global	ResetUart@i
	global	_rcvCommand
	global	_rcvCount
	global	_rcvLength
	global	_unitAddr
	global	_rcvAddrOk
	global	_rcvCRCOk
	global	_rcvCommandOk
	global	_rcvDataOk
	global	_rcvLengthOk
	global	_rcvStartOk
	global	_rcvTerminalOk
	global	_ADCON0
psect	text644,local,class=CODE,delta=2
global __ptext644
__ptext644:
_ADCON0	set	31
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PIR2
_PIR2	set	13
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TXREG
_TXREG	set	25
	global	_CREN
_CREN	set	196
	global	_OERR
_OERR	set	193
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB4
_RB4	set	52
	global	_RCIF
_RCIF	set	101
	global	_TXIF
_TXIF	set	100
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_OPTION
_OPTION	set	129
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TXSTA
_TXSTA	set	152
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISB2
_TRISB2	set	1074
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	file	"ATstorm.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_rcvAddrOk:
       ds      1

_rcvCRCOk:
       ds      1

_rcvCommandOk:
       ds      1

_rcvDataOk:
       ds      1

_rcvLengthOk:
       ds      1

_rcvStartOk:
       ds      1

_rcvTerminalOk:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
ResetUart@i:
       ds      1

_rcvCommand:
       ds      1

_rcvCount:
       ds      1

_rcvLength:
       ds      1

_unitAddr:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_rcvData:
       ds      8

_sndData:
       ds      8

DelayInt@k:
       ds      2

_idleCnt:
       ds      2

_CFG_H:
       ds      1

_CFG_L:
       ds      1

_H_H:
       ds      1

_H_L:
       ds      1

_H_S:
       ds      1

_L_H:
       ds      1

_L_L:
       ds      1

_L_S:
       ds      1

_rcvCRC:
       ds      1

_sndCRC:
       ds      1

_sndCommand:
       ds      1

_sndCount:
       ds      1

_sndLength:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+021h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_i2c_Restart
?_i2c_Restart:	; 0 bytes @ 0x0
	global	?_i2c_Stop
?_i2c_Stop:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_RelayOn
?_RelayOn:	; 0 bytes @ 0x0
	global	?_RelayOff
?_RelayOff:	; 0 bytes @ 0x0
	global	?_ResetUart
?_ResetUart:	; 0 bytes @ 0x0
	global	?_I2CService
?_I2CService:	; 0 bytes @ 0x0
	global	?_DataHandle
?_DataHandle:	; 0 bytes @ 0x0
	global	?_SendService
?_SendService:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_i2c_SendAcknowledge
?_i2c_SendAcknowledge:	; 0 bytes @ 0x0
	global	?i1_ResetUart
?i1_ResetUart:	; 0 bytes @ 0x0
	global	??i1_ResetUart
??i1_ResetUart:	; 0 bytes @ 0x0
	global	?_i2c_PutByte
?_i2c_PutByte:	; 1 bytes @ 0x0
	global	?_i2c_GetByte
?_i2c_GetByte:	; 1 bytes @ 0x0
	global	?_i2c_WaitForSCL
?_i2c_WaitForSCL:	; 1 bytes @ 0x0
	global	?_i2c_SendByte
?_i2c_SendByte:	; 1 bytes @ 0x0
	global	?_i2c_ReadAcknowledge
?_i2c_ReadAcknowledge:	; 1 bytes @ 0x0
	global	?_i2c_ReadByte
?_i2c_ReadByte:	; 1 bytes @ 0x0
	ds	6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_i2c_Restart
??_i2c_Restart:	; 0 bytes @ 0x0
	global	??_i2c_Stop
??_i2c_Stop:	; 0 bytes @ 0x0
	global	??_putch
??_putch:	; 0 bytes @ 0x0
	global	??_i2c_WaitForSCL
??_i2c_WaitForSCL:	; 0 bytes @ 0x0
	global	??_RelayOn
??_RelayOn:	; 0 bytes @ 0x0
	global	??_RelayOff
??_RelayOff:	; 0 bytes @ 0x0
	global	?_DelayInt
?_DelayInt:	; 0 bytes @ 0x0
	global	??_ResetUart
??_ResetUart:	; 0 bytes @ 0x0
	global	??_DataHandle
??_DataHandle:	; 0 bytes @ 0x0
	global	??_i2c_SendAcknowledge
??_i2c_SendAcknowledge:	; 0 bytes @ 0x0
	global	putch@byte
putch@byte:	; 1 bytes @ 0x0
	global	DelayInt@t
DelayInt@t:	; 2 bytes @ 0x0
	ds	1
	global	??_SendService
??_SendService:	; 0 bytes @ 0x1
	global	??_i2c_SendByte
??_i2c_SendByte:	; 0 bytes @ 0x1
	global	??_i2c_ReadAcknowledge
??_i2c_ReadAcknowledge:	; 0 bytes @ 0x1
	global	??_i2c_ReadByte
??_i2c_ReadByte:	; 0 bytes @ 0x1
	global	i2c_SendAcknowledge@status
i2c_SendAcknowledge@status:	; 1 bytes @ 0x1
	ds	1
	global	??_DelayInt
??_DelayInt:	; 0 bytes @ 0x2
	global	i2c_SendByte@byte
i2c_SendByte@byte:	; 1 bytes @ 0x2
	global	i2c_ReadAcknowledge@ack
i2c_ReadAcknowledge@ack:	; 1 bytes @ 0x2
	global	i2c_ReadByte@byte
i2c_ReadByte@byte:	; 1 bytes @ 0x2
	ds	1
	global	i2c_SendByte@i
i2c_SendByte@i:	; 1 bytes @ 0x3
	global	i2c_ReadByte@i
i2c_ReadByte@i:	; 1 bytes @ 0x3
	ds	1
	global	??_i2c_PutByte
??_i2c_PutByte:	; 0 bytes @ 0x4
	global	??_i2c_GetByte
??_i2c_GetByte:	; 0 bytes @ 0x4
	global	i2c_PutByte@data
i2c_PutByte@data:	; 1 bytes @ 0x4
	global	i2c_GetByte@more
i2c_GetByte@more:	; 1 bytes @ 0x4
	ds	1
	global	i2c_GetByte@byte
i2c_GetByte@byte:	; 2 bytes @ 0x5
	ds	2
	global	??_I2CService
??_I2CService:	; 0 bytes @ 0x7
	global	?_main
?_main:	; 2 bytes @ 0x7
	global	main@argc
main@argc:	; 2 bytes @ 0x7
	ds	2
	global	main@argv
main@argv:	; 2 bytes @ 0x9
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0xB
;;Data sizes: Strings 0, constant 0, data 0, bss 38, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80     11      44
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _I2CService->_i2c_GetByte
;;   _i2c_GetByte->_i2c_ReadByte
;;   _i2c_PutByte->_i2c_SendByte
;;   _i2c_ReadByte->_i2c_WaitForSCL
;;   _i2c_ReadAcknowledge->_i2c_WaitForSCL
;;   _i2c_SendByte->_i2c_WaitForSCL
;;   _SendService->_putch
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     0      4     523
;;                                              7 BANK0      4     0      4
;;                          _ResetUart
;;                         _DataHandle
;;                        _SendService
;;                         _I2CService
;; ---------------------------------------------------------------------------------
;; (1) _I2CService                                           0     0      0     492
;;                        _i2c_Restart
;;                        _i2c_PutByte
;;                           _i2c_Stop
;;                        _i2c_GetByte
;;                           _DelayInt
;; ---------------------------------------------------------------------------------
;; (2) _i2c_GetByte                                          3     3      0     204
;;                                              4 BANK0      3     3      0
;;                       _i2c_ReadByte
;;                _i2c_SendAcknowledge
;; ---------------------------------------------------------------------------------
;; (2) _i2c_PutByte                                          1     1      0     257
;;                                              4 BANK0      1     1      0
;;                       _i2c_SendByte
;;                _i2c_ReadAcknowledge
;; ---------------------------------------------------------------------------------
;; (3) _i2c_ReadByte                                         3     3      0     108
;;                                              1 BANK0      3     3      0
;;                     _i2c_WaitForSCL
;; ---------------------------------------------------------------------------------
;; (3) _i2c_ReadAcknowledge                                  2     2      0      34
;;                                              1 BANK0      2     2      0
;;                     _i2c_WaitForSCL
;; ---------------------------------------------------------------------------------
;; (3) _i2c_SendByte                                         3     3      0     192
;;                                              1 BANK0      3     3      0
;;                     _i2c_WaitForSCL
;; ---------------------------------------------------------------------------------
;; (3) _i2c_SendAcknowledge                                  2     2      0      31
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _i2c_WaitForSCL                                       1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _SendService                                          0     0      0      31
;;                              _putch
;; ---------------------------------------------------------------------------------
;; (1) _DataHandle                                           2     2      0       0
;;                                              0 BANK0      2     2      0
;;                            _RelayOn
;;                           _RelayOff
;; ---------------------------------------------------------------------------------
;; (2) _i2c_Stop                                             1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _i2c_Restart                                          1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _putch                                                1     1      0      31
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _ResetUart                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DelayInt                                             2     0      2      31
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _RelayOff                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _RelayOn                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _isr                                                  6     6      0       0
;;                                              0 COMMON     6     6      0
;;                        i1_ResetUart
;; ---------------------------------------------------------------------------------
;; (6) i1_ResetUart                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _ResetUart
;;   _DataHandle
;;     _RelayOn
;;     _RelayOff
;;   _SendService
;;     _putch
;;   _I2CService
;;     _i2c_Restart
;;     _i2c_PutByte
;;       _i2c_SendByte
;;         _i2c_WaitForSCL
;;       _i2c_ReadAcknowledge
;;         _i2c_WaitForSCL
;;     _i2c_Stop
;;     _i2c_GetByte
;;       _i2c_ReadByte
;;         _i2c_WaitForSCL
;;       _i2c_SendAcknowledge
;;     _DelayInt
;;
;; _isr (ROOT)
;;   i1_ResetUart
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       8       2        0.0%
;;ABS                  0      0      38       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      B      2C       5       55.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      40      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 254 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;  argc            2    7[BANK0 ] int 
;;  argv            2    9[BANK0 ] PTR PTR unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    7[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ResetUart
;;		_DataHandle
;;		_SendService
;;		_I2CService
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	254
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	255
	
l3378:	
;Main.c: 255: TRISA = 0B11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	256
;Main.c: 256: TRISB = 0B11111110;
	movlw	(0FEh)
	movwf	(134)^080h	;volatile
	line	257
;Main.c: 257: PORTA = 0B11111111;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	258
;Main.c: 258: PORTB = 0B11101100;
	movlw	(0ECh)
	movwf	(6)	;volatile
	line	259
	
l3380:	
;Main.c: 259: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	260
	
l3382:	
;Main.c: 260: ADCON1 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	261
;Main.c: 261: ADRESL = 0B00000001;
	movlw	(01h)
	movwf	(158)^080h	;volatile
	line	263
	
l3384:	
;Main.c: 263: CCP1CON = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(23)	;volatile
	line	264
	
l3386:	
;Main.c: 264: CCPR1L = 0x7F;
	movlw	(07Fh)
	movwf	(21)	;volatile
	line	265
	
l3388:	
;Main.c: 265: CCPR1H = 0x7F;
	movlw	(07Fh)
	movwf	(22)	;volatile
	line	266
	
l3390:	
;Main.c: 266: T1CON = 0B00110001;
	movlw	(031h)
	movwf	(16)	;volatile
	line	267
	
l3392:	
;Main.c: 267: T2CON = 0B01111111;
	movlw	(07Fh)
	movwf	(18)	;volatile
	line	268
	
l3394:	
;Main.c: 268: PR2 = 0xD7;
	movlw	(0D7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	270
	
l3396:	
;Main.c: 270: TRISB2 = 1; TRISB5 = 1; SPBRG = ((int)(4000000L/(16UL * 9600) -1)); RCSTA = (0|0x90); TXSTA = (0x4|0|0x20);
	bsf	(1074/8)^080h,(1074)&7
	
l3398:	
	bsf	(1077/8)^080h,(1077)&7
	
l3400:	
	movlw	(019h)
	movwf	(153)^080h	;volatile
	
l3402:	
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	
l3404:	
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(152)^080h	;volatile
	line	273
	
l3406:	
;Main.c: 273: PIE1 = 0B00100000;
	movlw	(020h)
	movwf	(140)^080h	;volatile
	line	274
;Main.c: 274: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	275
;Main.c: 275: PIR2 = 0B00000000;
	clrf	(13)	;volatile
	line	276
	
l3408:	
;Main.c: 276: OPTION = 0B00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	277
	
l3410:	
;Main.c: 277: INTCON = 0B11000000;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	279
	
l3412:	
;Main.c: 279: ResetUart();
	fcall	_ResetUart
	line	281
	
l3414:	
;Main.c: 281: CFG_H = 0x0C;
	movlw	(0Ch)
	movwf	(_CFG_H)
	line	282
	
l3416:	
;Main.c: 282: CFG_L = 0x0C;
	movlw	(0Ch)
	movwf	(_CFG_L)
	line	284
	
l3418:	
;Main.c: 284: if(OERR){ CREN = 0; CREN = 1; }
	bcf	status, 5	;RP0=0, select bank0
	btfss	(193/8),(193)&7
	goto	u1421
	goto	u1420
u1421:
	goto	l618
u1420:
	
l3420:	
	bcf	(196/8),(196)&7
	bsf	(196/8),(196)&7
	
l618:	
	line	285
;Main.c: 285: if(rcvTerminalOk == 1){
	btfss	(_rcvTerminalOk/8),(_rcvTerminalOk)&7
	goto	u1431
	goto	u1430
u1431:
	goto	l3428
u1430:
	line	286
	
l3422:	
;Main.c: 286: DataHandle();
	fcall	_DataHandle
	line	287
	
l3424:	
;Main.c: 287: SendService();
	fcall	_SendService
	line	288
	
l3426:	
;Main.c: 288: ResetUart();
	fcall	_ResetUart
	line	290
	
l3428:	
;Main.c: 289: }
;Main.c: 290: idleCnt++;
	incf	(_idleCnt),f
	skipnz
	incf	(_idleCnt+1),f
	line	291
	
l3430:	
;Main.c: 291: if(idleCnt >= 50000){
	movlw	high(0C350h)
	subwf	(_idleCnt+1),w
	movlw	low(0C350h)
	skipnz
	subwf	(_idleCnt),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l3418
u1440:
	line	292
	
l3432:	
;Main.c: 292: idleCnt = 0;
	clrf	(_idleCnt)
	clrf	(_idleCnt+1)
	line	293
	
l3434:	
;Main.c: 293: I2CService();
	fcall	_I2CService
	goto	l3418
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	297
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,8314
	global	_I2CService
psect	text645,local,class=CODE,delta=2
global __ptext645
__ptext645:

;; *************** function _I2CService *****************
;; Defined at:
;;		line 118 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_i2c_Restart
;;		_i2c_PutByte
;;		_i2c_Stop
;;		_i2c_GetByte
;;		_DelayInt
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text645
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	118
	global	__size_of_I2CService
	__size_of_I2CService	equ	__end_of_I2CService-_I2CService
	
_I2CService:	
	opt	stack 2
; Regs used in _I2CService: [wreg+status,2+status,0+pclath+cstack]
	line	119
	
l3376:	
;Main.c: 119: i2c_Restart();
	fcall	_i2c_Restart
	line	120
;Main.c: 120: i2c_PutByte(0x90 | 0x00);
	movlw	(090h)
	fcall	_i2c_PutByte
	line	121
;Main.c: 121: i2c_PutByte(CFG_H);
	movf	(_CFG_H),w
	fcall	_i2c_PutByte
	line	122
;Main.c: 122: i2c_Stop();
	fcall	_i2c_Stop
	line	123
;Main.c: 123: i2c_Restart();
	fcall	_i2c_Restart
	line	124
;Main.c: 124: i2c_PutByte(0x90 | 0x01);
	movlw	(091h)
	fcall	_i2c_PutByte
	line	125
;Main.c: 125: H_H = i2c_GetByte(!0);
	movlw	(01h)
	fcall	_i2c_GetByte
	movwf	(_H_H)
	line	126
;Main.c: 126: H_L = i2c_GetByte(!0);
	movlw	(01h)
	fcall	_i2c_GetByte
	movwf	(_H_L)
	line	127
;Main.c: 127: H_S = i2c_GetByte(0);
	movlw	(0)
	fcall	_i2c_GetByte
	movwf	(_H_S)
	line	128
;Main.c: 128: i2c_Stop();
	fcall	_i2c_Stop
	line	129
;Main.c: 129: DelayInt(100);
	movlw	064h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_DelayInt)
	clrf	(?_DelayInt+1)
	fcall	_DelayInt
	line	130
;Main.c: 130: i2c_Restart();
	fcall	_i2c_Restart
	line	131
;Main.c: 131: i2c_PutByte(0x92 | 0x00);
	movlw	(092h)
	fcall	_i2c_PutByte
	line	132
;Main.c: 132: i2c_PutByte(CFG_L);
	movf	(_CFG_L),w
	fcall	_i2c_PutByte
	line	133
;Main.c: 133: i2c_Stop();
	fcall	_i2c_Stop
	line	134
;Main.c: 134: i2c_Restart();
	fcall	_i2c_Restart
	line	135
;Main.c: 135: i2c_PutByte(0x92 | 0x01);
	movlw	(093h)
	fcall	_i2c_PutByte
	line	136
;Main.c: 136: L_H = i2c_GetByte(!0);
	movlw	(01h)
	fcall	_i2c_GetByte
	movwf	(_L_H)
	line	137
;Main.c: 137: L_L = i2c_GetByte(!0);
	movlw	(01h)
	fcall	_i2c_GetByte
	movwf	(_L_L)
	line	138
;Main.c: 138: L_S = i2c_GetByte(0);
	movlw	(0)
	fcall	_i2c_GetByte
	movwf	(_L_S)
	line	139
;Main.c: 139: i2c_Stop();
	fcall	_i2c_Stop
	line	140
	
l580:	
	return
	opt stack 0
GLOBAL	__end_of_I2CService
	__end_of_I2CService:
;; =============== function _I2CService ends ============

	signat	_I2CService,88
	global	_i2c_GetByte
psect	text646,local,class=CODE,delta=2
global __ptext646
__ptext646:

;; *************** function _i2c_GetByte *****************
;; Defined at:
;;		line 180 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;  more            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  more            1    4[BANK0 ] unsigned char 
;;  byte            2    5[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_i2c_ReadByte
;;		_i2c_SendAcknowledge
;; This function is called by:
;;		_I2CService
;; This function uses a non-reentrant model
;;
psect	text646
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	180
	global	__size_of_i2c_GetByte
	__size_of_i2c_GetByte	equ	__end_of_i2c_GetByte-_i2c_GetByte
	
_i2c_GetByte:	
	opt	stack 2
; Regs used in _i2c_GetByte: [wreg+status,2+status,0+pclath+cstack]
;i2c_GetByte@more stored from wreg
	line	183
	movwf	(i2c_GetByte@more)
	
l3364:	
;i2c.c: 181: int byte;
;i2c.c: 183: if((byte = i2c_ReadByte()) == (-1))
	fcall	_i2c_ReadByte
	movwf	(i2c_GetByte@byte)
	clrf	(i2c_GetByte@byte+1)
	incf	((i2c_GetByte@byte)),w
	skipnz
	incf	((i2c_GetByte@byte+1)),w

	skipz
	goto	u1411
	goto	u1410
u1411:
	goto	l3370
u1410:
	line	184
	
l3366:	
;i2c.c: 184: return (-1);
	movlw	(0FFh)
	goto	l1676
	line	186
	
l3370:	
;i2c.c: 186: i2c_SendAcknowledge(more);
	movf	(i2c_GetByte@more),w
	fcall	_i2c_SendAcknowledge
	line	188
	
l3372:	
;i2c.c: 188: return byte;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(i2c_GetByte@byte),w
	line	189
	
l1676:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_GetByte
	__end_of_i2c_GetByte:
;; =============== function _i2c_GetByte ends ============

	signat	_i2c_GetByte,4217
	global	_i2c_PutByte
psect	text647,local,class=CODE,delta=2
global __ptext647
__ptext647:

;; *************** function _i2c_PutByte *****************
;; Defined at:
;;		line 169 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_i2c_SendByte
;;		_i2c_ReadAcknowledge
;; This function is called by:
;;		_I2CService
;; This function uses a non-reentrant model
;;
psect	text647
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	169
	global	__size_of_i2c_PutByte
	__size_of_i2c_PutByte	equ	__end_of_i2c_PutByte-_i2c_PutByte
	
_i2c_PutByte:	
	opt	stack 2
; Regs used in _i2c_PutByte: [wreg+status,2+status,0+pclath+cstack]
;i2c_PutByte@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(i2c_PutByte@data)
	line	170
	
l3354:	
;i2c.c: 170: if(i2c_SendByte(data))
	movf	(i2c_PutByte@data),w
	fcall	_i2c_SendByte
	xorlw	0
	skipnz
	goto	u1401
	goto	u1400
u1401:
	goto	l3360
u1400:
	line	171
	
l3356:	
;i2c.c: 171: return (-1);
	movlw	(-1)
	goto	l1672
	line	172
	
l3360:	
;i2c.c: 172: return i2c_ReadAcknowledge();
	fcall	_i2c_ReadAcknowledge
	line	173
	
l1672:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_PutByte
	__end_of_i2c_PutByte:
;; =============== function _i2c_PutByte ends ============

	signat	_i2c_PutByte,4217
	global	_i2c_ReadByte
psect	text648,local,class=CODE,delta=2
global __ptext648
__ptext648:

;; *************** function _i2c_ReadByte *****************
;; Defined at:
;;		line 125 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    3[BANK0 ] unsigned char 
;;  byte            1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_i2c_WaitForSCL
;; This function is called by:
;;		_i2c_GetByte
;; This function uses a non-reentrant model
;;
psect	text648
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	125
	global	__size_of_i2c_ReadByte
	__size_of_i2c_ReadByte	equ	__end_of_i2c_ReadByte-_i2c_ReadByte
	
_i2c_ReadByte:	
	opt	stack 2
; Regs used in _i2c_ReadByte: [wreg+status,2+status,0+pclath+cstack]
	line	127
	
l3322:	
;i2c.c: 126: unsigned char i;
;i2c.c: 127: unsigned char byte = 0;
	clrf	(i2c_ReadByte@byte)
	line	129
;i2c.c: 129: for(i=0; i<8; i++)
	clrf	(i2c_ReadByte@i)
	line	130
	
l1660:	
	line	131
;i2c.c: 130: {
;i2c.c: 131: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	132
	
l3328:	
;i2c.c: 132: _delay((unsigned long)((50)*(4000000/4000000.0)));
	opt asmopt_off
movlw	16
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_ReadByte+0)+0,f
u1457:
decfsz	(??_i2c_ReadByte+0)+0,f
	goto	u1457
	clrwdt
opt asmopt_on

	line	133
	
l3330:	
;i2c.c: 133: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	135
	
l3332:	
;i2c.c: 135: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	136
	
l3334:	
;i2c.c: 136: if(i2c_WaitForSCL())
	fcall	_i2c_WaitForSCL
	xorlw	0
	skipnz
	goto	u1381
	goto	u1380
u1381:
	goto	l3340
u1380:
	line	137
	
l3336:	
;i2c.c: 137: return (-1);
	movlw	(0FFh)
	goto	l1663
	line	138
	
l3340:	
;i2c.c: 138: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
movwf	(??_i2c_ReadByte+0)+0,f
u1467:
decfsz	(??_i2c_ReadByte+0)+0,f
	goto	u1467
opt asmopt_on

	line	139
	
l3342:	
;i2c.c: 139: byte = byte << 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(i2c_ReadByte@byte),f
	line	140
	
l3344:	
;i2c.c: 140: byte |= RB1;
	movlw	0
	btfsc	(49/8),(49)&7
	movlw	1
	iorwf	(i2c_ReadByte@byte),f
	line	141
	
l3346:	
;i2c.c: 141: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	129
	bcf	status, 5	;RP0=0, select bank0
	incf	(i2c_ReadByte@i),f
	
l3348:	
	movlw	(08h)
	subwf	(i2c_ReadByte@i),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l1660
u1390:
	line	143
	
l3350:	
;i2c.c: 142: }
;i2c.c: 143: return (int)byte;
	movf	(i2c_ReadByte@byte),w
	line	144
	
l1663:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_ReadByte
	__end_of_i2c_ReadByte:
;; =============== function _i2c_ReadByte ends ============

	signat	_i2c_ReadByte,89
	global	_i2c_ReadAcknowledge
psect	text649,local,class=CODE,delta=2
global __ptext649
__ptext649:

;; *************** function _i2c_ReadAcknowledge *****************
;; Defined at:
;;		line 94 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ack             1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      char 
;; Registers used:
;;		wreg, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_i2c_WaitForSCL
;; This function is called by:
;;		_i2c_PutByte
;; This function uses a non-reentrant model
;;
psect	text649
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	94
	global	__size_of_i2c_ReadAcknowledge
	__size_of_i2c_ReadAcknowledge	equ	__end_of_i2c_ReadAcknowledge-_i2c_ReadAcknowledge
	
_i2c_ReadAcknowledge:	
	opt	stack 2
; Regs used in _i2c_ReadAcknowledge: [wreg+pclath+cstack]
	line	97
	
l3304:	
;i2c.c: 95: unsigned char ack;
;i2c.c: 97: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	98
;i2c.c: 98: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	99
	
l3306:	
;i2c.c: 99: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_ReadAcknowledge+0)+0,f
u1477:
decfsz	(??_i2c_ReadAcknowledge+0)+0,f
	goto	u1477
opt asmopt_on

	line	100
	
l3308:	
;i2c.c: 100: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	101
;i2c.c: 101: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_ReadAcknowledge+0)+0,f
u1487:
decfsz	(??_i2c_ReadAcknowledge+0)+0,f
	goto	u1487
opt asmopt_on

	line	102
;i2c.c: 102: ack = RB1;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(49/8),(49)&7
	movlw	1
	movwf	(i2c_ReadAcknowledge@ack)
	line	103
	
l3310:	
;i2c.c: 103: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	106
	
l3312:	
;i2c.c: 106: if(i2c_WaitForSCL())
	fcall	_i2c_WaitForSCL
	xorlw	0
	skipnz
	goto	u1371
	goto	u1370
u1371:
	goto	l3318
u1370:
	line	107
	
l3314:	
;i2c.c: 107: return (-1);
	movlw	(-1)
	goto	l1654
	line	108
	
l3318:	
;i2c.c: 108: return ack;
	movf	(i2c_ReadAcknowledge@ack),w
	line	109
	
l1654:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_ReadAcknowledge
	__end_of_i2c_ReadAcknowledge:
;; =============== function _i2c_ReadAcknowledge ends ============

	signat	_i2c_ReadAcknowledge,89
	global	_i2c_SendByte
psect	text650,local,class=CODE,delta=2
global __ptext650
__ptext650:

;; *************** function _i2c_SendByte *****************
;; Defined at:
;;		line 63 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    2[BANK0 ] unsigned char 
;;  i               1    3[BANK0 ] char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_i2c_WaitForSCL
;; This function is called by:
;;		_i2c_PutByte
;; This function uses a non-reentrant model
;;
psect	text650
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	63
	global	__size_of_i2c_SendByte
	__size_of_i2c_SendByte	equ	__end_of_i2c_SendByte-_i2c_SendByte
	
_i2c_SendByte:	
	opt	stack 2
; Regs used in _i2c_SendByte: [wreg+status,2+status,0+pclath+cstack]
;i2c_SendByte@byte stored from wreg
	line	66
	movwf	(i2c_SendByte@byte)
	
l3272:	
;i2c.c: 64: signed char i;
;i2c.c: 66: for(i=7; i>=0; i--)
	movlw	(07h)
	movwf	(i2c_SendByte@i)
	line	67
	
l1645:	
	line	68
;i2c.c: 67: {
;i2c.c: 68: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	71
	
l3278:	
;i2c.c: 71: TRISB1 = ((byte>>i)&0x01);
	bcf	status, 5	;RP0=0, select bank0
	movf	(i2c_SendByte@byte),w
	movwf	(??_i2c_SendByte+0)+0
	incf	(i2c_SendByte@i),w
	goto	u1304
u1305:
	clrc
	rrf	(??_i2c_SendByte+0)+0,f
u1304:
	addlw	-1
	skipz
	goto	u1305
	btfsc	0+(??_i2c_SendByte+0)+0,0
	goto	u1311
	goto	u1310
	
u1311:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7
	goto	u1324
u1310:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1073/8)^080h,(1073)&7
u1324:
	line	72
;i2c.c: 72: if ((byte>>i)&0x01) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(i2c_SendByte@byte),w
	movwf	(??_i2c_SendByte+0)+0
	incf	(i2c_SendByte@i),w
	goto	u1334
u1335:
	clrc
	rrf	(??_i2c_SendByte+0)+0,f
u1334:
	addlw	-1
	skipz
	goto	u1335
	btfss	0+(??_i2c_SendByte+0)+0,(0)&7
	goto	u1341
	goto	u1340
u1341:
	goto	l1647
u1340:
	line	73
	
l3280:	
;i2c.c: 73: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	74
;i2c.c: 74: }else {
	goto	l3282
	
l1647:	
	line	75
;i2c.c: 75: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	77
	
l3282:	
;i2c.c: 76: }
;i2c.c: 77: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_SendByte+0)+0,f
u1497:
decfsz	(??_i2c_SendByte+0)+0,f
	goto	u1497
opt asmopt_on

	line	78
	
l3284:	
;i2c.c: 78: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	80
	
l3286:	
;i2c.c: 80: if(i2c_WaitForSCL())
	fcall	_i2c_WaitForSCL
	xorlw	0
	skipnz
	goto	u1351
	goto	u1350
u1351:
	goto	l3292
u1350:
	line	81
	
l3288:	
;i2c.c: 81: return !0;
	movlw	(01h)
	goto	l1650
	line	83
	
l3292:	
;i2c.c: 83: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
movwf	(??_i2c_SendByte+0)+0,f
u1507:
decfsz	(??_i2c_SendByte+0)+0,f
	goto	u1507
opt asmopt_on

	line	84
	
l3294:	
;i2c.c: 84: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	66
	
l3296:	
	bcf	status, 5	;RP0=0, select bank0
	decf	(i2c_SendByte@i),f
	
l3298:	
	btfss	(i2c_SendByte@i),7
	goto	u1361
	goto	u1360
u1361:
	goto	l1645
u1360:
	line	86
	
l3300:	
;i2c.c: 85: }
;i2c.c: 86: return 0;
	movlw	(0)
	line	87
	
l1650:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_SendByte
	__end_of_i2c_SendByte:
;; =============== function _i2c_SendByte ends ============

	signat	_i2c_SendByte,4217
	global	_i2c_SendAcknowledge
psect	text651,local,class=CODE,delta=2
global __ptext651
__ptext651:

;; *************** function _i2c_SendAcknowledge *****************
;; Defined at:
;;		line 151 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;  status          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  status          1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2c_GetByte
;; This function uses a non-reentrant model
;;
psect	text651
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	151
	global	__size_of_i2c_SendAcknowledge
	__size_of_i2c_SendAcknowledge	equ	__end_of_i2c_SendAcknowledge-_i2c_SendAcknowledge
	
_i2c_SendAcknowledge:	
	opt	stack 3
; Regs used in _i2c_SendAcknowledge: [wreg]
;i2c_SendAcknowledge@status stored from wreg
	movwf	(i2c_SendAcknowledge@status)
	line	152
	
l3260:	
;i2c.c: 152: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	153
	
l3262:	
;i2c.c: 153: if (status) {
	bcf	status, 5	;RP0=0, select bank0
	movf	(i2c_SendAcknowledge@status),w
	skipz
	goto	u1290
	goto	l1666
u1290:
	line	154
	
l3264:	
;i2c.c: 154: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	155
;i2c.c: 155: }else {
	goto	l3266
	
l1666:	
	line	156
;i2c.c: 156: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	158
	
l3266:	
;i2c.c: 157: }
;i2c.c: 158: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_SendAcknowledge+0)+0,f
u1517:
decfsz	(??_i2c_SendAcknowledge+0)+0,f
	goto	u1517
opt asmopt_on

	line	159
	
l3268:	
;i2c.c: 159: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	160
;i2c.c: 160: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_SendAcknowledge+0)+0,f
u1527:
decfsz	(??_i2c_SendAcknowledge+0)+0,f
	goto	u1527
opt asmopt_on

	line	162
	
l1668:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_SendAcknowledge
	__end_of_i2c_SendAcknowledge:
;; =============== function _i2c_SendAcknowledge ends ============

	signat	_i2c_SendAcknowledge,4216
	global	_i2c_WaitForSCL
psect	text652,local,class=CODE,delta=2
global __ptext652
__ptext652:

;; *************** function _i2c_WaitForSCL *****************
;; Defined at:
;;		line 241 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2c_SendByte
;;		_i2c_ReadAcknowledge
;;		_i2c_ReadByte
;; This function uses a non-reentrant model
;;
psect	text652
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	241
	global	__size_of_i2c_WaitForSCL
	__size_of_i2c_WaitForSCL	equ	__end_of_i2c_WaitForSCL-_i2c_WaitForSCL
	
_i2c_WaitForSCL:	
	opt	stack 2
; Regs used in _i2c_WaitForSCL: [wreg]
	line	243
	
l3246:	
;i2c.c: 243: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l3256
u1270:
	line	245
	
l3248:	
;i2c.c: 244: {
;i2c.c: 245: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
movwf	(??_i2c_WaitForSCL+0)+0,f
u1537:
decfsz	(??_i2c_WaitForSCL+0)+0,f
	goto	u1537
opt asmopt_on

	line	247
	
l3250:	
;i2c.c: 247: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u1281
	goto	u1280
u1281:
	goto	l3256
u1280:
	line	248
	
l3252:	
;i2c.c: 248: return !0;
	movlw	(01h)
	goto	l1698
	line	250
	
l3256:	
;i2c.c: 249: }
;i2c.c: 250: return 0;
	movlw	(0)
	line	251
	
l1698:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_WaitForSCL
	__end_of_i2c_WaitForSCL:
;; =============== function _i2c_WaitForSCL ends ============

	signat	_i2c_WaitForSCL,89
	global	_SendService
psect	text653,local,class=CODE,delta=2
global __ptext653
__ptext653:

;; *************** function _SendService *****************
;; Defined at:
;;		line 242 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text653
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	242
	global	__size_of_SendService
	__size_of_SendService	equ	__end_of_SendService-_SendService
	
_SendService:	
	opt	stack 4
; Regs used in _SendService: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	243
	
l3234:	
;Main.c: 243: putch(0x40);
	movlw	(040h)
	fcall	_putch
	line	244
;Main.c: 244: putch(unitAddr);
	movf	(_unitAddr),w
	fcall	_putch
	line	245
;Main.c: 245: putch(sndCommand);
	movf	(_sndCommand),w
	fcall	_putch
	line	246
;Main.c: 246: putch(sndLength);
	movf	(_sndLength),w
	fcall	_putch
	line	247
	
l3236:	
;Main.c: 247: for(sndCount=0; sndCount < sndLength; sndCount++){
	clrf	(_sndCount)
	goto	l3242
	line	248
	
l3238:	
;Main.c: 248: putch(sndData[sndCount]);
	movf	(_sndCount),w
	addlw	_sndData&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_putch
	line	247
	
l3240:	
	incf	(_sndCount),f
	
l3242:	
	movf	(_sndLength),w
	subwf	(_sndCount),w
	skipc
	goto	u1261
	goto	u1260
u1261:
	goto	l3238
u1260:
	line	250
	
l3244:	
;Main.c: 249: }
;Main.c: 250: putch(sndCRC);
	movf	(_sndCRC),w
	fcall	_putch
	line	251
;Main.c: 251: putch(0x0A);
	movlw	(0Ah)
	fcall	_putch
	line	252
	
l614:	
	return
	opt stack 0
GLOBAL	__end_of_SendService
	__end_of_SendService:
;; =============== function _SendService ends ============

	signat	_SendService,88
	global	_DataHandle
psect	text654,local,class=CODE,delta=2
global __ptext654
__ptext654:

;; *************** function _DataHandle *****************
;; Defined at:
;;		line 141 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_RelayOn
;;		_RelayOff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text654
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	141
	global	__size_of_DataHandle
	__size_of_DataHandle	equ	__end_of_DataHandle-_DataHandle
	
_DataHandle:	
	opt	stack 4
; Regs used in _DataHandle: [wreg+status,2+status,0+pclath+cstack]
	line	143
	
l3118:	
;Main.c: 143: if(rcvCommand == 0x00){
	movf	(_rcvCommand),f
	skipz
	goto	u1111
	goto	u1110
u1111:
	goto	l3122
u1110:
	line	144
	
l3120:	
;Main.c: 144: sndCommand = rcvCommand;
	movf	(_rcvCommand),w
	movwf	(_sndCommand)
	line	145
;Main.c: 145: sndLength = rcvLength;
	movf	(_rcvLength),w
	movwf	(_sndLength)
	line	146
;Main.c: 146: sndData[0] = rcvData[0];
	movf	(_rcvData),w
	movwf	(_sndData)
	line	147
;Main.c: 147: sndData[1] = rcvData[1];
	movf	0+(_rcvData)+01h,w
	movwf	0+(_sndData)+01h
	line	148
;Main.c: 148: sndData[2] = rcvData[2];
	movf	0+(_rcvData)+02h,w
	movwf	0+(_sndData)+02h
	line	149
;Main.c: 149: sndData[3] = rcvData[3];
	movf	0+(_rcvData)+03h,w
	movwf	0+(_sndData)+03h
	line	150
;Main.c: 150: sndData[4] = rcvData[4];
	movf	0+(_rcvData)+04h,w
	movwf	0+(_sndData)+04h
	line	151
;Main.c: 151: sndData[5] = rcvData[5];
	movf	0+(_rcvData)+05h,w
	movwf	0+(_sndData)+05h
	line	152
;Main.c: 152: sndData[6] = rcvData[6];
	movf	0+(_rcvData)+06h,w
	movwf	0+(_sndData)+06h
	line	153
;Main.c: 153: sndData[7] = rcvData[7];
	movf	0+(_rcvData)+07h,w
	movwf	0+(_sndData)+07h
	line	154
;Main.c: 154: sndCRC = rcvCRC;
	movf	(_rcvCRC),w
	movwf	(_sndCRC)
	line	156
;Main.c: 156: }else if(rcvCommand == 0x11){
	goto	l608
	
l3122:	
	movf	(_rcvCommand),w
	xorlw	011h
	skipz
	goto	u1121
	goto	u1120
u1121:
	goto	l3132
u1120:
	line	157
	
l3124:	
;Main.c: 157: RelayOn();
	fcall	_RelayOn
	line	158
	
l3126:	
;Main.c: 158: sndCommand = rcvCommand;
	movf	(_rcvCommand),w
	movwf	(_sndCommand)
	line	159
	
l3128:	
;Main.c: 159: sndLength = 0;
	clrf	(_sndLength)
	line	160
	
l3130:	
;Main.c: 160: sndCRC = 0x00;
	clrf	(_sndCRC)
	line	162
;Main.c: 162: }else if(rcvCommand == 0x12){
	goto	l608
	
l3132:	
	movf	(_rcvCommand),w
	xorlw	012h
	skipz
	goto	u1131
	goto	u1130
u1131:
	goto	l3142
u1130:
	line	163
	
l3134:	
;Main.c: 163: RelayOff();
	fcall	_RelayOff
	goto	l3126
	line	168
	
l3142:	
	movf	(_rcvCommand),w
	xorlw	013h
	skipz
	goto	u1141
	goto	u1140
u1141:
	goto	l3152
u1140:
	line	169
	
l3144:	
;Main.c: 169: CFG_H = CFG_H & 0x7F | rcvData[0] << 7 & 0x80;
	movf	(_rcvData),w
	movwf	(??_DataHandle+0)+0
	movlw	07h
u1155:
	clrc
	rlf	(??_DataHandle+0)+0,f
	addlw	-1
	skipz
	goto	u1155
	movlw	(080h)
	andwf	0+(??_DataHandle+0)+0,w
	movwf	(??_DataHandle+1)+0
	movf	(_CFG_H),w
	andlw	07Fh
	iorwf	0+(??_DataHandle+1)+0,w
	movwf	(_CFG_H)
	goto	l3126
	line	174
	
l3152:	
	movf	(_rcvCommand),w
	xorlw	014h
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l3162
u1160:
	line	175
	
l3154:	
;Main.c: 175: CFG_L = CFG_L & 0x7F | rcvData[0] << 7 & 0x80;
	movf	(_rcvData),w
	movwf	(??_DataHandle+0)+0
	movlw	07h
u1175:
	clrc
	rlf	(??_DataHandle+0)+0,f
	addlw	-1
	skipz
	goto	u1175
	movlw	(080h)
	andwf	0+(??_DataHandle+0)+0,w
	movwf	(??_DataHandle+1)+0
	movf	(_CFG_L),w
	andlw	07Fh
	iorwf	0+(??_DataHandle+1)+0,w
	movwf	(_CFG_L)
	goto	l3126
	line	180
	
l3162:	
	movf	(_rcvCommand),w
	xorlw	015h
	skipz
	goto	u1181
	goto	u1180
u1181:
	goto	l3172
u1180:
	line	181
	
l3164:	
;Main.c: 181: CFG_H = CFG_H & 0xF3 | rcvData[0] << 2 & 0x0C;
	movf	(_rcvData),w
	movwf	(??_DataHandle+0)+0
	clrc
	rlf	(??_DataHandle+0)+0,f
	clrc
	rlf	(??_DataHandle+0)+0,f
	movlw	(0Ch)
	andwf	0+(??_DataHandle+0)+0,w
	movwf	(??_DataHandle+1)+0
	movf	(_CFG_H),w
	andlw	0F3h
	iorwf	0+(??_DataHandle+1)+0,w
	movwf	(_CFG_H)
	goto	l3126
	line	186
	
l3172:	
	movf	(_rcvCommand),w
	xorlw	016h
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l3182
u1190:
	line	187
	
l3174:	
;Main.c: 187: CFG_L = CFG_L & 0xF3 | rcvData[0] << 2 & 0x0C;
	movf	(_rcvData),w
	movwf	(??_DataHandle+0)+0
	clrc
	rlf	(??_DataHandle+0)+0,f
	clrc
	rlf	(??_DataHandle+0)+0,f
	movlw	(0Ch)
	andwf	0+(??_DataHandle+0)+0,w
	movwf	(??_DataHandle+1)+0
	movf	(_CFG_L),w
	andlw	0F3h
	iorwf	0+(??_DataHandle+1)+0,w
	movwf	(_CFG_L)
	goto	l3126
	line	192
	
l3182:	
	movf	(_rcvCommand),w
	xorlw	017h
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l3192
u1200:
	line	193
	
l3184:	
;Main.c: 193: CFG_H = CFG_H & 0xFC | rcvData[0] & 0x03;
	movlw	(03h)
	andwf	(_rcvData),w
	movwf	(??_DataHandle+0)+0
	movf	(_CFG_H),w
	andlw	0FCh
	iorwf	0+(??_DataHandle+0)+0,w
	movwf	(_CFG_H)
	goto	l3126
	line	198
	
l3192:	
	movf	(_rcvCommand),w
	xorlw	018h
	skipz
	goto	u1211
	goto	u1210
u1211:
	goto	l3202
u1210:
	line	199
	
l3194:	
;Main.c: 199: CFG_L = CFG_L & 0xFC | rcvData[0] & 0x03;
	movlw	(03h)
	andwf	(_rcvData),w
	movwf	(??_DataHandle+0)+0
	movf	(_CFG_L),w
	andlw	0FCh
	iorwf	0+(??_DataHandle+0)+0,w
	movwf	(_CFG_L)
	goto	l3126
	line	204
	
l3202:	
	movf	(_rcvCommand),w
	xorlw	021h
	skipz
	goto	u1221
	goto	u1220
u1221:
	goto	l3208
u1220:
	line	205
	
l3204:	
;Main.c: 205: sndCommand = rcvCommand;
	movf	(_rcvCommand),w
	movwf	(_sndCommand)
	line	206
;Main.c: 206: sndLength = 3;
	movlw	(03h)
	movwf	(_sndLength)
	line	207
;Main.c: 207: sndData[0] = H_H;
	movf	(_H_H),w
	movwf	(_sndData)
	line	208
;Main.c: 208: sndData[1] = H_L;
	movf	(_H_L),w
	movwf	0+(_sndData)+01h
	line	209
;Main.c: 209: sndData[2] = H_S;
	movf	(_H_S),w
	movwf	0+(_sndData)+02h
	goto	l3130
	line	212
	
l3208:	
	movf	(_rcvCommand),w
	xorlw	022h
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l3214
u1230:
	line	213
	
l3210:	
;Main.c: 213: sndCommand = rcvCommand;
	movf	(_rcvCommand),w
	movwf	(_sndCommand)
	line	214
;Main.c: 214: sndLength = 3;
	movlw	(03h)
	movwf	(_sndLength)
	line	215
;Main.c: 215: sndData[0] = L_H;
	movf	(_L_H),w
	movwf	(_sndData)
	line	216
;Main.c: 216: sndData[1] = L_L;
	movf	(_L_L),w
	movwf	0+(_sndData)+01h
	line	217
;Main.c: 217: sndData[2] = L_S;
	movf	(_L_S),w
	movwf	0+(_sndData)+02h
	goto	l3130
	line	220
	
l3214:	
	movf	(_rcvCommand),w
	xorlw	023h
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l3224
u1240:
	line	221
	
l3216:	
;Main.c: 221: sndCommand = rcvCommand;
	movf	(_rcvCommand),w
	movwf	(_sndCommand)
	line	222
;Main.c: 222: sndLength = 2;
	movlw	(02h)
	movwf	(_sndLength)
	line	223
	
l3218:	
;Main.c: 223: sndData[0] = T_H;
	clrf	(_sndData)
	line	224
	
l3220:	
;Main.c: 224: sndData[1] = T_L;
	clrf	0+(_sndData)+01h
	goto	l3130
	line	227
	
l3224:	
	movf	(_rcvCommand),w
	xorlw	024h
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l602
u1250:
	line	228
	
l3226:	
;Main.c: 228: sndCommand = rcvCommand;
	movf	(_rcvCommand),w
	movwf	(_sndCommand)
	line	229
;Main.c: 229: sndLength = 8;
	movlw	(08h)
	movwf	(_sndLength)
	line	230
;Main.c: 230: sndData[0] = H_H;
	movf	(_H_H),w
	movwf	(_sndData)
	line	231
;Main.c: 231: sndData[1] = H_L;
	movf	(_H_L),w
	movwf	0+(_sndData)+01h
	line	232
;Main.c: 232: sndData[2] = H_S;
	movf	(_H_S),w
	movwf	0+(_sndData)+02h
	line	233
;Main.c: 233: sndData[3] = L_H;
	movf	(_L_H),w
	movwf	0+(_sndData)+03h
	line	234
;Main.c: 234: sndData[4] = L_L;
	movf	(_L_L),w
	movwf	0+(_sndData)+04h
	line	235
;Main.c: 235: sndData[5] = L_S;
	movf	(_L_S),w
	movwf	0+(_sndData)+05h
	line	236
	
l3228:	
;Main.c: 236: sndData[6] = T_H;
	clrf	0+(_sndData)+06h
	line	237
	
l3230:	
;Main.c: 237: sndData[7] = T_L;
	clrf	0+(_sndData)+07h
	goto	l3130
	line	240
	
l602:	
	
l608:	
	return
	opt stack 0
GLOBAL	__end_of_DataHandle
	__end_of_DataHandle:
;; =============== function _DataHandle ends ============

	signat	_DataHandle,88
	global	_i2c_Stop
psect	text655,local,class=CODE,delta=2
global __ptext655
__ptext655:

;; *************** function _i2c_Stop *****************
;; Defined at:
;;		line 19 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2CService
;; This function uses a non-reentrant model
;;
psect	text655
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	19
	global	__size_of_i2c_Stop
	__size_of_i2c_Stop	equ	__end_of_i2c_Stop-_i2c_Stop
	
_i2c_Stop:	
	opt	stack 4
; Regs used in _i2c_Stop: [wreg]
	line	21
	
l3102:	
;i2c.c: 21: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	22
	
l3104:	
;i2c.c: 22: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Stop+0)+0,f
u1547:
decfsz	(??_i2c_Stop+0)+0,f
	goto	u1547
opt asmopt_on

	line	23
	
l3106:	
;i2c.c: 23: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	24
;i2c.c: 24: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Stop+0)+0,f
u1557:
decfsz	(??_i2c_Stop+0)+0,f
	goto	u1557
opt asmopt_on

	line	25
	
l3108:	
;i2c.c: 25: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	26
;i2c.c: 26: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Stop+0)+0,f
u1567:
decfsz	(??_i2c_Stop+0)+0,f
	goto	u1567
opt asmopt_on

	line	27
	
l3110:	
;i2c.c: 27: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	28
;i2c.c: 28: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Stop+0)+0,f
u1577:
decfsz	(??_i2c_Stop+0)+0,f
	goto	u1577
opt asmopt_on

	line	29
	
l3112:	
;i2c.c: 29: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	30
;i2c.c: 30: _delay((unsigned long)((50)*(4000000/4000000.0)));
	opt asmopt_off
movlw	16
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Stop+0)+0,f
u1587:
decfsz	(??_i2c_Stop+0)+0,f
	goto	u1587
	clrwdt
opt asmopt_on

	line	31
	
l3114:	
;i2c.c: 31: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	34
	
l1639:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_Stop
	__end_of_i2c_Stop:
;; =============== function _i2c_Stop ends ============

	signat	_i2c_Stop,88
	global	_i2c_Restart
psect	text656,local,class=CODE,delta=2
global __ptext656
__ptext656:

;; *************** function _i2c_Restart *****************
;; Defined at:
;;		line 43 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2CService
;; This function uses a non-reentrant model
;;
psect	text656
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\i2c.c"
	line	43
	global	__size_of_i2c_Restart
	__size_of_i2c_Restart	equ	__end_of_i2c_Restart-_i2c_Restart
	
_i2c_Restart:	
	opt	stack 4
; Regs used in _i2c_Restart: [wreg]
	line	44
	
l3090:	
;i2c.c: 44: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	46
	
l3092:	
;i2c.c: 46: _delay((unsigned long)((10)*(4000000/4000000.0)));
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Restart+0)+0,f
u1597:
decfsz	(??_i2c_Restart+0)+0,f
	goto	u1597
opt asmopt_on

	line	48
	
l3094:	
;i2c.c: 48: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	49
;i2c.c: 49: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Restart+0)+0,f
u1607:
decfsz	(??_i2c_Restart+0)+0,f
	goto	u1607
opt asmopt_on

	line	51
	
l3096:	
;i2c.c: 51: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	52
;i2c.c: 52: _delay((unsigned long)((40)*(4000000/4000000.0)));
	opt asmopt_off
movlw	13
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_i2c_Restart+0)+0,f
u1617:
decfsz	(??_i2c_Restart+0)+0,f
	goto	u1617
opt asmopt_on

	line	54
	
l3098:	
;i2c.c: 54: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	56
	
l1642:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_Restart
	__end_of_i2c_Restart:
;; =============== function _i2c_Restart ends ============

	signat	_i2c_Restart,88
	global	_putch
psect	text657,local,class=CODE,delta=2
global __ptext657
__ptext657:

;; *************** function _putch *****************
;; Defined at:
;;		line 7 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\usart.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SendService
;; This function uses a non-reentrant model
;;
psect	text657
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\usart.c"
	line	7
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 4
; Regs used in _putch: [wreg]
;putch@byte stored from wreg
	movwf	(putch@byte)
	line	9
	
l3086:	
	line	10
;usart.c: 9: while(!TXIF)
	
l1138:	
	line	9
	btfss	(100/8),(100)&7
	goto	u1101
	goto	u1100
u1101:
	goto	l1138
u1100:
	line	11
	
l3088:	
;usart.c: 11: TXREG = byte;
	movf	(putch@byte),w
	movwf	(25)	;volatile
	line	12
	
l1141:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_ResetUart
psect	text658,local,class=CODE,delta=2
global __ptext658
__ptext658:

;; *************** function _ResetUart *****************
;; Defined at:
;;		line 103 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text658
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	103
	global	__size_of_ResetUart
	__size_of_ResetUart	equ	__end_of_ResetUart-_ResetUart
	
_ResetUart:	
	opt	stack 5
; Regs used in _ResetUart: [wreg-fsr0h+status,2+status,0]
	line	105
	
l3058:	
;Main.c: 104: static unsigned char i;
;Main.c: 105: rcvCommand = 0x00;
	clrf	(_rcvCommand)
	line	106
;Main.c: 106: rcvLength = 0x00;
	clrf	(_rcvLength)
	line	107
;Main.c: 107: rcvCount = 0x00;
	clrf	(_rcvCount)
	line	108
;Main.c: 108: for(i=0; i < 8; i++){rcvData[i] = 0x00;}
	clrf	(ResetUart@i)
	
l3060:	
	movlw	(08h)
	subwf	(ResetUart@i),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l3064
u1090:
	goto	l3070
	
l3064:	
	movf	(ResetUart@i),w
	addlw	_rcvData&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	
l3066:	
	incf	(ResetUart@i),f
	goto	l3060
	line	109
	
l3070:	
;Main.c: 109: rcvCRC = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_rcvCRC)
	line	110
	
l3072:	
;Main.c: 110: rcvStartOk = 0;
	bcf	(_rcvStartOk/8),(_rcvStartOk)&7
	line	111
	
l3074:	
;Main.c: 111: rcvAddrOk = 0;
	bcf	(_rcvAddrOk/8),(_rcvAddrOk)&7
	line	112
	
l3076:	
;Main.c: 112: rcvCommandOk = 0;
	bcf	(_rcvCommandOk/8),(_rcvCommandOk)&7
	line	113
	
l3078:	
;Main.c: 113: rcvLengthOk = 0;
	bcf	(_rcvLengthOk/8),(_rcvLengthOk)&7
	line	114
	
l3080:	
;Main.c: 114: rcvDataOk = 0;
	bcf	(_rcvDataOk/8),(_rcvDataOk)&7
	line	115
	
l3082:	
;Main.c: 115: rcvCRCOk = 0;
	bcf	(_rcvCRCOk/8),(_rcvCRCOk)&7
	line	116
	
l3084:	
;Main.c: 116: rcvTerminalOk = 0;
	bcf	(_rcvTerminalOk/8),(_rcvTerminalOk)&7
	line	117
	
l577:	
	return
	opt stack 0
GLOBAL	__end_of_ResetUart
	__end_of_ResetUart:
;; =============== function _ResetUart ends ============

	signat	_ResetUart,88
	global	_DelayInt
psect	text659,local,class=CODE,delta=2
global __ptext659
__ptext659:

;; *************** function _DelayInt *****************
;; Defined at:
;;		line 99 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;  t               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2CService
;; This function uses a non-reentrant model
;;
psect	text659
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	99
	global	__size_of_DelayInt
	__size_of_DelayInt	equ	__end_of_DelayInt-_DelayInt
	
_DelayInt:	
	opt	stack 4
; Regs used in _DelayInt: [wreg+status,2+status,0]
	line	101
	
l3052:	
;Main.c: 100: static unsigned int k;
;Main.c: 101: for(k = 0; k < t; k++);
	clrf	(DelayInt@k)
	clrf	(DelayInt@k+1)
	goto	l3056
	
l3054:	
	incf	(DelayInt@k),f
	skipnz
	incf	(DelayInt@k+1),f
	
l3056:	
	movf	(DelayInt@t+1),w
	subwf	(DelayInt@k+1),w
	skipz
	goto	u1085
	movf	(DelayInt@t),w
	subwf	(DelayInt@k),w
u1085:
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l3054
u1080:
	line	102
	
l570:	
	return
	opt stack 0
GLOBAL	__end_of_DelayInt
	__end_of_DelayInt:
;; =============== function _DelayInt ends ============

	signat	_DelayInt,4216
	global	_RelayOff
psect	text660,local,class=CODE,delta=2
global __ptext660
__ptext660:

;; *************** function _RelayOff *****************
;; Defined at:
;;		line 94 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DataHandle
;; This function uses a non-reentrant model
;;
psect	text660
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	94
	global	__size_of_RelayOff
	__size_of_RelayOff	equ	__end_of_RelayOff-_RelayOff
	
_RelayOff:	
	opt	stack 4
; Regs used in _RelayOff: []
	
l3050:	
	bcf	(48/8),(48)&7
	
l554:	
	return
	opt stack 0
GLOBAL	__end_of_RelayOff
	__end_of_RelayOff:
;; =============== function _RelayOff ends ============

	signat	_RelayOff,88
	global	_RelayOn
psect	text661,local,class=CODE,delta=2
global __ptext661
__ptext661:

;; *************** function _RelayOn *****************
;; Defined at:
;;		line 93 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DataHandle
;; This function uses a non-reentrant model
;;
psect	text661
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	93
	global	__size_of_RelayOn
	__size_of_RelayOn	equ	__end_of_RelayOn-_RelayOn
	
_RelayOn:	
	opt	stack 4
; Regs used in _RelayOn: []
	
l3048:	
	bsf	(48/8),(48)&7
	
l551:	
	return
	opt stack 0
GLOBAL	__end_of_RelayOn
	__end_of_RelayOn:
;; =============== function _RelayOn ends ============

	signat	_RelayOn,88
	global	_isr
psect	text662,local,class=CODE,delta=2
global __ptext662
__ptext662:

;; *************** function _isr *****************
;; Defined at:
;;		line 299 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_ResetUart
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text662
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	299
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 2
; Regs used in _isr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+3)
	movf	fsr0,w
	movwf	(??_isr+4)
	movf	pclath,w
	movwf	(??_isr+5)
	ljmp	_isr
psect	text662
	line	300
	
i1l2618:	
;Main.c: 300: if(RCIF){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u58_21
	goto	u58_20
u58_21:
	goto	i1l655
u58_20:
	line	301
	
i1l2620:	
;Main.c: 301: if(rcvStartOk == 0){
	btfsc	(_rcvStartOk/8),(_rcvStartOk)&7
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l627
u59_20:
	line	302
	
i1l2622:	
;Main.c: 302: if(RCREG == 0x40){
	movf	(26),w	;volatile
	xorlw	040h
	skipz
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l2628
u60_20:
	line	303
	
i1l2624:	
;Main.c: 303: ResetUart();
	fcall	i1_ResetUart
	line	304
	
i1l2626:	
;Main.c: 304: rcvStartOk = 1;
	bsf	(_rcvStartOk/8),(_rcvStartOk)&7
	line	305
;Main.c: 305: }else{
	goto	i1l655
	line	306
	
i1l2628:	
;Main.c: 306: ResetUart();
	fcall	i1_ResetUart
	goto	i1l655
	line	308
	
i1l627:	
	btfsc	(_rcvAddrOk/8),(_rcvAddrOk)&7
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l631
u61_20:
	line	309
	
i1l2630:	
;Main.c: 309: if(RCREG == unitAddr){
	movf	(26),w	;volatile
	xorwf	(_unitAddr),w
	skipz
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l2628
u62_20:
	line	310
	
i1l2632:	
;Main.c: 310: rcvAddrOk = 1;
	bsf	(_rcvAddrOk/8),(_rcvAddrOk)&7
	line	311
;Main.c: 311: }else{
	goto	i1l655
	line	314
	
i1l631:	
	btfsc	(_rcvCommandOk/8),(_rcvCommandOk)&7
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l635
u63_20:
	line	315
	
i1l2636:	
;Main.c: 315: rcvCommand = RCREG;
	movf	(26),w	;volatile
	movwf	(_rcvCommand)
	line	316
	
i1l2638:	
;Main.c: 316: rcvCommandOk = 1;
	bsf	(_rcvCommandOk/8),(_rcvCommandOk)&7
	line	317
;Main.c: 317: }else if(!rcvLengthOk){
	goto	i1l655
	
i1l635:	
	btfsc	(_rcvLengthOk/8),(_rcvLengthOk)&7
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l637
u64_20:
	line	318
	
i1l2640:	
;Main.c: 318: rcvLength = RCREG;
	movf	(26),w	;volatile
	movwf	(_rcvLength)
	line	319
	
i1l2642:	
;Main.c: 319: if(rcvLength == 0){
	movf	(_rcvLength),f
	skipz
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l2646
u65_20:
	line	320
	
i1l2644:	
;Main.c: 320: rcvDataOk = 1;
	bsf	(_rcvDataOk/8),(_rcvDataOk)&7
	line	321
;Main.c: 321: rcvLengthOk = 1;
	bsf	(_rcvLengthOk/8),(_rcvLengthOk)&7
	line	322
;Main.c: 322: }else if(rcvLength <= 8){
	goto	i1l655
	
i1l2646:	
	movlw	(09h)
	subwf	(_rcvLength),w
	skipnc
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l2628
u66_20:
	line	323
	
i1l2648:	
;Main.c: 323: rcvLengthOk = 1;
	bsf	(_rcvLengthOk/8),(_rcvLengthOk)&7
	line	324
;Main.c: 324: }else{
	goto	i1l655
	line	327
	
i1l637:	
	btfsc	(_rcvDataOk/8),(_rcvDataOk)&7
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l643
u67_20:
	line	328
	
i1l2652:	
;Main.c: 328: rcvData[rcvCount] = RCREG;
	movf	(_rcvCount),w
	addlw	_rcvData&0ffh
	movwf	fsr0
	movf	(26),w	;volatile
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	329
	
i1l2654:	
;Main.c: 329: if(rcvCount + 1 >= rcvLength){
	movf	(_rcvCount),w
	addlw	low(01h)
	movwf	(??_isr+0)+0
	movlw	high(01h)
	skipnc
	movlw	(high(01h)+1)&0ffh
	movwf	((??_isr+0)+0)+1
	movf	1+(??_isr+0)+0,w
	xorlw	80h
	movwf	(??_isr+2)+0
	movlw	80h
	subwf	(??_isr+2)+0,w
	skipz
	goto	u68_25
	movf	(_rcvLength),w
	subwf	0+(??_isr+0)+0,w
u68_25:

	skipc
	goto	u68_21
	goto	u68_20
u68_21:
	goto	i1l2658
u68_20:
	line	330
	
i1l2656:	
;Main.c: 330: rcvDataOk = 1;
	bsf	(_rcvDataOk/8),(_rcvDataOk)&7
	line	331
;Main.c: 331: }else{
	goto	i1l655
	line	332
	
i1l2658:	
;Main.c: 332: rcvCount += 1;
	incf	(_rcvCount),f
	goto	i1l655
	line	334
	
i1l643:	
	btfsc	(_rcvCRCOk/8),(_rcvCRCOk)&7
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l647
u69_20:
	line	335
	
i1l2660:	
;Main.c: 335: if(rcvCRC == RCREG){
	movf	(_rcvCRC),w
	xorwf	(26),w	;volatile
	skipz
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l2628
u70_20:
	line	336
	
i1l2662:	
;Main.c: 336: rcvCRCOk = 1;
	bsf	(_rcvCRCOk/8),(_rcvCRCOk)&7
	line	337
;Main.c: 337: }else{
	goto	i1l655
	line	340
	
i1l647:	
	btfsc	(_rcvTerminalOk/8),(_rcvTerminalOk)&7
	goto	u71_21
	goto	u71_20
u71_21:
	goto	i1l2672
u71_20:
	line	341
	
i1l2666:	
;Main.c: 341: if(RCREG == 0x0A){
	movf	(26),w	;volatile
	xorlw	0Ah
	skipz
	goto	u72_21
	goto	u72_20
u72_21:
	goto	i1l2628
u72_20:
	line	342
	
i1l2668:	
;Main.c: 342: rcvTerminalOk = 1;
	bsf	(_rcvTerminalOk/8),(_rcvTerminalOk)&7
	line	343
;Main.c: 343: }else{
	goto	i1l655
	line	347
	
i1l2672:	
;Main.c: 347: RCREG = RCREG;
	movf	(26),w	;volatile
	movwf	(26)	;volatile
	line	356
	
i1l655:	
	movf	(??_isr+5),w
	movwf	pclath
	movf	(??_isr+4),w
	movwf	fsr0
	movf	(??_isr+3),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	i1_ResetUart
psect	text663,local,class=CODE,delta=2
global __ptext663
__ptext663:

;; *************** function i1_ResetUart *****************
;; Defined at:
;;		line 103 in file "H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text663
	file	"H:\LuoZQ\ATstorm\SourceCode\20170721\ATstorm\Main.c"
	line	103
	global	__size_ofi1_ResetUart
	__size_ofi1_ResetUart	equ	__end_ofi1_ResetUart-i1_ResetUart
	
i1_ResetUart:	
	opt	stack 2
; Regs used in i1_ResetUart: [wreg-fsr0h+status,2+status,0]
	line	105
	
i1l2674:	
;Main.c: 104: static unsigned char i;
;Main.c: 105: rcvCommand = 0x00;
	clrf	(_rcvCommand)
	line	106
;Main.c: 106: rcvLength = 0x00;
	clrf	(_rcvLength)
	line	107
;Main.c: 107: rcvCount = 0x00;
	clrf	(_rcvCount)
	line	108
;Main.c: 108: for(i=0; i < 8; i++){rcvData[i] = 0x00;}
	clrf	(ResetUart@i)
	
i1l2676:	
	movlw	(08h)
	subwf	(ResetUart@i),w
	skipc
	goto	u73_21
	goto	u73_20
u73_21:
	goto	i1l2680
u73_20:
	goto	i1l2686
	
i1l2680:	
	movf	(ResetUart@i),w
	addlw	_rcvData&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	
i1l2682:	
	incf	(ResetUart@i),f
	goto	i1l2676
	line	109
	
i1l2686:	
;Main.c: 109: rcvCRC = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_rcvCRC)
	line	110
	
i1l2688:	
;Main.c: 110: rcvStartOk = 0;
	bcf	(_rcvStartOk/8),(_rcvStartOk)&7
	line	111
	
i1l2690:	
;Main.c: 111: rcvAddrOk = 0;
	bcf	(_rcvAddrOk/8),(_rcvAddrOk)&7
	line	112
	
i1l2692:	
;Main.c: 112: rcvCommandOk = 0;
	bcf	(_rcvCommandOk/8),(_rcvCommandOk)&7
	line	113
	
i1l2694:	
;Main.c: 113: rcvLengthOk = 0;
	bcf	(_rcvLengthOk/8),(_rcvLengthOk)&7
	line	114
	
i1l2696:	
;Main.c: 114: rcvDataOk = 0;
	bcf	(_rcvDataOk/8),(_rcvDataOk)&7
	line	115
	
i1l2698:	
;Main.c: 115: rcvCRCOk = 0;
	bcf	(_rcvCRCOk/8),(_rcvCRCOk)&7
	line	116
	
i1l2700:	
;Main.c: 116: rcvTerminalOk = 0;
	bcf	(_rcvTerminalOk/8),(_rcvTerminalOk)&7
	line	117
	
i1l577:	
	return
	opt stack 0
GLOBAL	__end_ofi1_ResetUart
	__end_ofi1_ResetUart:
;; =============== function i1_ResetUart ends ============

	signat	i1_ResetUart,88
psect	text664,local,class=CODE,delta=2
global __ptext664
__ptext664:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
