
.text
Main:	li $s0, 0x00 #Valor del selector
	li $s1, 0x05 #Valor de A
	li $s2, 0x03 #Valor de B
	li $s3, 0x00 #Valor de C
	
	li $t1, 0x04 #Para verificacion de selector
	li $t2, 0x01 #Para caso 1 de switch
	li $t3, 0x02 #Para caso 2 de switch
	li $t4, 0x03 #Para caso 3 de switch
	
Verificacion:
	slt $t0,$s0,$zero # Revisa si selector es menor de 0
	bne $t0,$zero,salida # Si es menor de 0 termina el programa
	slt $t0,$s0,$t1 #Revisa si es mayor que 3
	beq $t0,$zero,salida # Si es mayor que 3 termina el programa

Switch:	beq $s0, $t2, suma #Si selector es 1 se va a suma
	beq $s0, $t3, resta #Si selector es 2 se va a resta
	beq $s0, $t4, multi #Si selector es 3 se va a multipliacion
	and $s3, $s1, $s2 #Si selector es 0 hace un AND logico de A y B y lo asigna a C
	j salida #Salta al final
	
suma:	add $s3, $s1, $s2 #C = A+B
	j salida

resta: 	sub $s3, $s1, $s2 #C = A-B
	j salida

multi:	mul $s3, $s1, $s2 #C = A*B
	j salida

salida: