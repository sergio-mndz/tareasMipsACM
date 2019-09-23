
.text
Main:	li $s0, 1 #Valor del contador
	li $s1, 0 #Valor de variable
	li $t1, 4 #Divisor
Compare:
	slti $s2, $s1, 20 #Revisa si variable es menor que 20
	bne $s2, $zero, Suma #Salta a suma mientras variable es menor que 20
	j Termina #Salta al fin
	
Suma:	add $s0, $s0, $s0 #Suma el contador con si mismo
	div $s0, $t1 #Divide contador entre 4
	mflo $s1 #Variable tiene el valor del cociente de la division 
	j Compare
Termina: