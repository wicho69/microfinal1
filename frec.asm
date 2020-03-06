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
 q equ 0x33
 w equ 0x34
 e equ 0x35
;inicio del programa: 
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0 
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB 
BCF STATUS, RP0 ;Regresar al banco 0


;salir de la rutina de tiempo y regresar al 
;valor de contador de programa

INICIO

;Desde aqui empieza el de 1 segundo prendido 
BSF PORTB,0 ; 2 segundos prende
BSF PORTB,1 ; 1 segundo prende
BSF PORTB,2 ; 0.5 segundos prenge
BSF PORTB,3 ;0.25 segundos prende
call Tiempo.5H
NOP ;
NOP
NOP
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
NOP
NOP

BCF PORTB,2 ;0.5 segundos apagado		    ;hasta aqui el tiempo esta bien 
BSF PORTB,3 ; 0.25 segundos prende
call Tiempo.5H
NOP
NOP 
NOP
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
NOP
 
BCF PORTB,1  ; 1 segundo apagado     aqui empieza el segundo 2    +++++++++++++++++
BSF PORTB,2 ; 0.5 segundos prende				    ++++++++++++++++
BSF PORTB,3 ;0.25 segundos prende			    ;aqui va bien el portb 3 
call Tiempo.5H
NOP
NOP
NOP
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
NOP
NOP

BCF PORTB,2 ;0.5 segundos apagado
BSF PORTB,3 ; 0.25 segundos prende		    +++++++
call Tiempo.5H
NOP
NOP
NOP
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
;NOP 
BCF PORTB,0 ; 2 segundos apagado ;ya pasaron 2 segundos ----------------------------
BSF PORTB,1 ; 1 segundo prende
BSF PORTB,2 ; 0.5 segundos prenge
BSF PORTB,3 ;0.25 segundos prende
call Tiempo.5H
NOP
NOP
NOP
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
NOP
NOP
BCF PORTB,2 ;0.5 segundos apagado
BSF PORTB,3 ; 0.25 segundos prende
call Tiempo.5H
NOP
NOP
NOP
 
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
NOP
 
BCF PORTB,1  ; 1 segundo apagado     aqui empieza el segundo 3
BSF PORTB,2 ; 0.5 segundos prende
BSF PORTB,3 ;0.25 segundos prende
call Tiempo.5H
NOP
NOP
NOP
 
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
NOP
NOP
 
BCF PORTB,2 ;0.5 segundos apagado
BSF PORTB,3 ; 0.25 segundos prende
call Tiempo.5H
NOP
;NOP
;NOP
BCF PORTB,3 ; 0.25 segundos apagado
call Tiempo.5H
;NOP

GOTO INICIO ; aqui acaban los 2 segundos maximos (nuevo codigo)

 
Tiempo.5H: movlw d'242' ;establecer el valor de la variable i 255,252
	movwf i
iloop: movlw d'54' ;establecer el valor de la variable j 103,104
	movwf j
jloop:  movlw d'5' ;establecer el valor de la variable k  5,5
	movwf k
kloop: decfsz k,f
	goto kloop
	decfsz j,f
	goto jloop
	NOP
	NOP
	NOP
	
	decfsz i,f
	goto iloop
	
NOP
NOP
NOP
NOP
NOP
;NOP
	return
     
END
