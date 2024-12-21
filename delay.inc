; Este sólo fuciona para un oscilador de 4Mhz

cblock		
   temp1		
endc		

; Parte de la función para que el bucle del milisegundo se ejecute 100 veces
delay_ms:
    movwf   temp1      
    call    delay_1ms  
    decfsz  temp1, 1   
    goto    $-2        
    return

; Creamos el bucle para contar el milisegundo
delay_1ms:
    clrf    TMR0      
    btfss   TMR0, 2   
    goto    $-1       
    return            
