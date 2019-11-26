
; PIC16F877A Configuration Bit Settings

; Assembly source line config statements

#include "p16f877a.inc"

; CONFIG
; __config 0xFF32
 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
 
    ORG 0
INICIO
    ;BANCO 1 = RP1 Y RP0 = 0 1
    BCF STATUS,RP1
    BSF STATUS,RP0
    BCF	TRISD,0 ; TRISD = 0 -> SALIDA 
		; TRISD = 1 -> ENTRADA
    BCF STATUS,RP0; BANCO 0
START
    BSF	PORTD,0
    GOTO START
    END
