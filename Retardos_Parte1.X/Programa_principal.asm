#include "p16f877a.inc"

; CONFIG
; __config 0xFF32
 __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
 
CBLOCK 0X20
    CUENTA
 ENDC
 
    ORG	    0

INICIO
    BSF	    STATUS,RP0
    BCF	    STATUS,RP1
    BCF	    TRISD,0
    BCF	    STATUS,RP0
    BCF	    PORTD,0
START
    BSF	    PORTD,0 ; 1cy = 200nSeg
    CALL    Retardo_100us ;2cy = 400nSeg
    BCF	    PORTD,0
    CALL    Retardo_50us
    GOTO    START	;2CY = 400nSeg
      
Retardo_1us
    NOP
    RETURN; 2cy = 400nSeg
 
Retardo_10us;8CY + 3XCY 
    MOVLW   D'14'
    NOP
    GOTO    RETARDOS_MICROS
    
Retardo_20us
    MOVLW   D'31'
    GOTO    RETARDOS_MICROS
    
Retardo_50us
    MOVLW   D'81'
    GOTO    RETARDOS_MICROS
    
Retardo_100us
    MOVLW   D'164'
    NOP
    GOTO    RETARDOS_MICROS
    
Retardo_5us ;2CY + 1CY + 2CY + 1CY + CY(X-1) + 2CY + 2CY(X-1) + 2CY = 10CY + CYX - CY +2CY - 2CY = 7CY + 3XCY = 10US -> x = 6
    MOVLW   D'6'; W = NUMERO
    GOTO    RETARDOS_MICROS
    
RETARDOS_MICROS
    MOVWF   CUENTA; CUENTA = W
BUCLE
    DECFSZ  CUENTA,1 ;DECREMENTAR DE 1 EN 1, SE GUARDE EN CUENTA
		     ;SI AL DECREMENTAR CUENTA ES 0, SALTA 2
    GOTO    BUCLE
    RETURN;2CY
    
;FOSC = 20MHZ 
;FCY = 20MHZ/ 4 = 5MHZ
;TCY = 1/5MHZ = 200nSeg
    
;retardos:
;1us -> 200nseg * 5 
    
    
    
    END