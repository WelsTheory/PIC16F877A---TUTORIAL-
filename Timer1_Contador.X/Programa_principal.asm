
; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFF32
 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

 CBLOCK
 CUENTA
 ENDC
 
	ORG	0
	GOTO	INICIO
	ORG	4
	GOTO	INT_TMR1
	
INICIO
	BSF	STATUS,RP0
	BCF	STATUS,RP1
	CLRF	TRISD
	BSF	TRISC,0
	BSF	PIE1,0 ;TMR1 ENABLE
	BCF	STATUS,RP0
	BCF	T1CON,5
	BCF	T1CON,4 ;PRESCALER 0
	BCF	T1CON,3 ;RC0
	BCF	T1CON,2	;SINCRONIZACION
	BSF	T1CON,1 ;CONTADOR
	BSF	INTCON,7; GIE
	BSF	INTCON,6; PIEI
	BCF	PIR1,0; FLANCO TIMER1
	BSF	T1CON,0; TMR1 ON
	MOVLW	D'255'
	MOVWF	TMR1H
	MOVLW	D'247'
	MOVWF	TMR1L
	MOVLW	.0
	MOVWF	PORTD
START
	MOVF	CUENTA,W
	MOVWF	PORTD
	GOTO	START
	
INT_TMR1
	MOVLW	D'255'
	MOVWF	TMR1H
	MOVLW	D'247'
	MOVWF	TMR1L
	INCF	CUENTA,F
	BCF	PIR1,0
	RETFIE

	END