	org 	100h

		section	.text

		; print msg1
		mov 	DX, msg1
		call  	EscribirCadena

		; input contra
		mov 	BP, contra
		call  	LeerCadena

		call Comparacion
		call EscribirCadena

		call	EsperarTecla

		int 	20h

		section	.data

		msg1	db	"Ingrese la contrasenia: ", "$"
		msg2 	db 	"Sea bienvenido! "
		msg3 	db 	"Ingrese la contrasenia correcta! >:( "
		msg4 	db 	"contra123$"
		contra 	times 	10 db " " 	

	EsperarTecla:
		mov     AH, 01h         
		int     21h
		ret

	LeerCadena:
		xor     SI, SI        
	while:  
		call    EsperarTecla   
		cmp     AL, 0x0D       
		je      exit         
		mov     [BP+SI], AL   
		inc     SI              
		jmp     while           
	exit:
		mov 	byte [BP+SI], "$"	
		ret

	Comparacion:
		XOR SI, SI
		MOV DX, msg2
	Iterar:
		MOV BL, [contra+SI] 
		mov AL, [msg4+SI]
		inc SI
		cmp AL, BL; 
		jne contrant
		cmp SI, 9
		je fin
		jmp Iterar
	fin:
        	ret
	
	contrant:
	    	xor DX, DX 
		mov DX, msg3 
		jmp fin

	EscribirCadena:
		mov 	AH, 09h
		int 	21h
		ret



	

	