.text 
Main: 
	li $s0, 2 #Asignamos la base de la potencia
	li $s1, 5 #Asignamos la potencia a la que vamos a elevar
	li $s3, 1 #Valor de inicio del registro donde estara el resultado
Comparacion:
	bne $s1, $zero, Recursividad #Mientras no se lleguen a las iteraciones establecidas por la potencia repite la funcion
	j Termina #Salta al fin

Recursividad: 
	mul $s3, $s3, $s0 #El registro del resultado final multiplica a si mismo por la base asignada
	addi $s1, $s1, -1 #Reduce el registro de la potencia en 1 porque se completo una iteracion
	j Comparacion #Regresa a la comparacion
	
Termina: