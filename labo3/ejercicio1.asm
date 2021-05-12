	org 	100h

	section	.text
	XOR SI, SI 
        MOV BX, 0d
        MOV byte [200], 0d
        MOV byte [201], 0d 
	MOV byte [202], 1d
        MOV byte [203], 4d
        MOV byte [204], 0d
        MOV byte [205], 8d
        MOV byte [206], 1d
        MOV byte [207], 8d
	jmp iterar


	;SUMA DE LOS DATOS, CARNET: 00140818	
iterar:
        CMP BX, 8d
        JE exit
        ADD AX, [200+SI] 
	INC SI
        ADD BX, 1d 
	jmp iterar

        ;DIVISIÓN
        MOV BL, 8d
        DIV BL

        ;ÚLTIMO MOVIMIENTO
        MOV [20Ah], BL

	;FIN DEL PROGRAMA       
exit:
	int 20h

	;guardar todo en 20Ah

	