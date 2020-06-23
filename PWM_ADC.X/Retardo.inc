CBLOCK 0x20
 CUENTA
 CUENTA_2
 
ENDC
 
Retardo_400ms 
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms 
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms
    CALL    Retardo_20ms 
    Return
 
; 5ms 
Retardo_20ms
    MOVLW   D'200'; 1cy -> k
    GOTO    Retardos_ms ; 2cy 
 
; 5ms 
Retardo_5ms
    MOVLW   D'50'; 1cy -> k
    GOTO    Retardos_ms ; 2cy
Retardos_ms  
    MOVWF   CUENTA_2; cy
Retardo_Milis
    MOVLW   D'180' ; kcy -> x
    MOVWF   CUENTA ;kcy
BUCLE_milis
    NOP
    DECFSZ  CUENTA,F; kcy(x-1) + 2cy
    GOTO    BUCLE   ; 2kcy(x-1)
    DECFSZ  CUENTA_2,F ;cy(k-1) + 2cy 
    GOTO    Retardo_Milis ;2cy(k-1)
    RETURN  ;2cy   
    
    
    
; 1ms = 1000us
Retardo_1ms
    NOP
    NOP
    NOP
    MOVLW   D'10'; 1cy -> k
    GOTO    Retardos ; 2cy

Retardo_200us
    MOVLW   D'3'; 1cy -> k
    GOTO    Retardos ; 2cy    
   
Retardo_300us
    MOVLW   D'3'; 1cy -> k
    GOTO    Retardos ; 2cy
    
;500us 
Retardo_500us
    MOVLW   D'5'; 1cy -> k
Retardos  
    MOVWF   CUENTA_2; cy
Retardo_Micros
    MOVLW   D'165' ; kcy -> x
    MOVWF   CUENTA ;kcy
BUCLE
    DECFSZ  CUENTA,F; kcy(x-1) + 2cy
    GOTO    BUCLE   ; 2kcy(x-1)
    DECFSZ  CUENTA_2,F ;cy(k-1) + 2cy 
    GOTO    Retardo_Micros ;2cy(k-1)
    RETURN  ;2cy   

    
    
;100us
Retardo_100us; 8CY + 3XCY
    MOVLW   D'164'
    NOP
    GOTO    Retardo_micros

;50us
Retardo_50us	    ;7cy + 3xcy  
    MOVLW   D'81'
    GOTO    Retardo_micros
    
;20us 
Retardo_20us;7CY + 3XCY	    
    MOVLW   D'31'
    GOTO    Retardo_micros

;10us 
Retardo_10us;8CY + 3XCY
    MOVLW   D'14'
    NOP
    GOTO    Retardo_micros  
    
;5us    
Retardo_5us;7CY + 3XCY
    MOVLW   D'6'
    GOTO    Retardo_micros
Retardo_micros
    MOVWF   CUENTA
Bucle
    DECFSZ  CUENTA,F
    GOTO    Bucle
    RETURN 
    
;1us
Retardo_1us
    NOP
    RETURN











