	org 	100h

	section	.text

	;-----------------PRIMERA PARTE-----------------

	mov 	byte [200h], "E"
	mov 	byte [201h], "V"
	mov 	byte [202h], "M"
	mov 	byte [203h], "A"

	;-----------------SEGUNDA PARTE-----------------
	
	;direccionamiento directo
	mov 	AX, [200h]

	;direccionamiento indirecto
	mov 	BX, [201h]
	mov 	CX, [BX]

	;direccionamiento indirecto base más índice
	mov 	BX, [202h]
	mov 	CX, [BX+DI]

	;direccionamiento relativo
	mov 	DX, [DI+203h]

	;FIN PROGRAMA

	int 20h