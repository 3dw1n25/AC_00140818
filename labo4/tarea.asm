org 	100h

	section	.text

        MOV BP arr
        CALL Pares

        MOV BP arr
        CALL Impares

	;FIN DEL PROGRAMA       
exit:
	int 20h

	;DATOS
        section .data

        arr db 01,21,11,10,08,06,03,12,02,17,0xA
        const equ 2

        ;SEPARAR NÚMEROS PARES
Pares:
        XOR SI,SI
        
while:  
        MOV     AX, [BP+SI]    
        CMP     AX, 0xA         
        JE      end     
        MOV     BL,const
        div     BL
        
        CMP     BL,0h
        JMP     while
        MOV     [0300h+SI], AH
        
        INC     SI             
        JMP     while
end:
        RET

Impares:
        XOR SI,SI
        
while:  
        MOV     AX, [BP+SI]    
        CMP     AX, 0xA         
        JE      end     
        MOV     BL,const
        div     BL
        
        CMP     BL,1h
        JMP     while
        MOV     [0320h+SI], AH
        
        INC     SI             
        JMP     while
end:
        RET