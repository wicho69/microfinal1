#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
 i equ 0x30
 j equ 0x31
 k equ 0x32
;inicio del programa: 
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0 
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB 
BCF STATUS, RP0 ;Regresar al banco 0
movlw b'00000000'
movwf PORTB

;salir de la rutina de tiempo y regresar al 
;valor de contador de programa

INICIO
;call Tiempo;
BSF PORTB,0 ;prende
;MOVWF PORTB
INICIO2000
Call Tiempo ; 142.849 ms
NOP
NOP
NOP
NOP
start1
BTFSS PORTB,6
GOTO start
GOTO start2

start
RLF PORTB,1
call Tiempo ;142.849
NOP
NOP
GOTO start1
 
start2 
RLF PORTB,1  ;hasta aqui va 1 segundo
call Tiempo ;142.849
NOP
NOP
NOP
;NOP
start4
BTFSS PORTB,1
GOTO start3
RRF PORTB,1
GOTO INICIO
 

start3
NOP
RRF PORTB,1 ;aqui cambia 
call Tiempo; 142.849
NOP
;NOP
GOTO start4
 
;-------------------------
 
Tiempo: movlw d'255' ;226 (para 1/8)     255 ; 248
	movwf i
iloop:	movlw d'184' ;183 (para 1/8)   185  ;  183 
	movwf j
jloop:  decfsz j,f
	GOTO jloop
	NOP;aumenta i veces
	NOP
	NOP
	NOP
	decfsz i,f
	GOTO iloop

NOP
NOP
NOP
NOP     
NOP
NOP
NOP
NOP
NOP     
NOP
NOP
NOP
NOP
NOP     
NOP
NOP
NOP
NOP
NOP     
NOP
NOP
NOP
NOP
NOP     
NOP 
NOP
NOP
NOP
NOP     
NOP
NOP
NOP
NOP
NOP     
NOP 
NOP
NOP
NOP
NOP     
NOP
NOP
NOP
NOP
NOP     

Return
	
END