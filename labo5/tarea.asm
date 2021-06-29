	org 100h

	section .text;se limpian todos los valores
	xor AX, AX
	xor SI, SI
	xor BX, BX
	XOR CX, CX
	xor DX, DX

	MOV SI, 0
	MOV DI, 0d

	MOV DH, 8;fila en la que se mostrará el cursor inicialmente
	MOV DL, 30;columna en la que se mostrará el cursor inicialmente

	CALL modotexto

	ITERAR:
		CALL movercursor
		MOV CL, [nombre+SI];Colocar en CL el caracter actual del nombre
		CALL escribircaracter
		INC SI
		INC DI  
		INC DL
		CMP DI, 6d 
		JB ITERAR;si DI es menor a 6 segurá iterando
		CALL SUP
		jmp ITERAR2

	ITERAR2:
		CALL movercursor
		MOV CL, [nombre+SI];Colocar en CL el caracter actual del nombre
		CALL escribircaracter
		INC SI
		INC DI  
		INC DL
		CMP DI, 9d 
		JB ITERAR2;si DI es menor a 9 seguirá iterando
		CALL SUP
		jmp ITERAR3

	ITERAR3:
		CALL movercursor
		MOV CL, [nombre+SI];Colocar en CL el caracter actual del nombre
		CALL escribircaracter
		INC SI
		INC DI  
		INC DL
		CMP DI, 9d 
		JB ITERAR3;si DI es menor a 9 seguirá iterando
		CALL SUP
		jmp ITERAR4

	ITERAR4:
		CALL movercursor
		MOV CL, [nombre+SI];Colocar en CL el caracter actual del nombre
		CALL escribircaracter
		INC SI
		INC DI  
		INC DL
		CMP DI, 9d 
		JB ITERAR4;si DI es menor a 9 seguirá iterando
		jmp esperartecla 

	SUP:
		mov di, 0d;regresando di a valor inicial
		mov DL, 30;regresa a la columna inicial 
		ADD DH, 2;suma 2 a la fila del cursor
		RET

	modotexto: 
		MOV AH, 0h;activa modo texto
		MOV AL, 03h;modo gráfico deseado
		INT 10h
		RET

	movercursor:
		MOV AH, 02h;posiciona el cursor en pantalla
		MOV BH, 0h 
		INT 10h
		RET

	escribircaracter:
		MOV AH, 0Ah;escribe caracter en pantalla según el cursor
		MOV AL, CL 
		MOV BH, 0h;número de página
		MOV CX, 1h;veces que escribirá el caracter
		INT 10h
		RET

	esperartecla:
		MOV AH, 00h 
		INT 16h
	exit:
		int 20h

	section .data

nombre DB 'Edwin Vladimir Martinez Alvarado '