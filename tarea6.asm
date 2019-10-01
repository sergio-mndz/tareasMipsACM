.text

Main: 
	li $a1, 8	#Se elige el termino a buscar
	jal Fibo 	#Se salta a fiboncaci, se guarda la dirección
	j Exit		#Se termina el programa

Fibo:	 	 	 
	addi $sp, $sp, -12	#Hace espacio en el stack para guardar datos
	sw $ra, 0($sp)		#Guarda direccion de regreso en el stack
	sw $a1, 4($sp)		#Guarda termino en el stack
	
	#Si se llega a 1 se hace caso base
	blt  $a1, 2, Base	# Si el termino es 1 salta a base, no va a ser menor que 1 porque se decrementa en 1
	sub $a1, $a1, 1		# se va al termino n-1 
	jal Fibo		# Realiza el proceso de la función para el termino anterior
	sub $a1, $a1, 1		# Se va al termino n-2
	jal Fibo		# Realiza el proceso de la función para el termino anteanterior
	j Extraer

Base:
	add $v0, $v0, $a1	#Se realiza la suma de v0 con el termino actual de a1, aquí se tendrá la suma final
	j Extraer		#Salta a extraer para obtener valores del stack pointer y recorrerlo		

Extraer:
	lw $ra, 0($sp)		# Regresa el valor de la dirección en la primera posición del stack
	lw $a1, 4($sp)		# Carga el valor del termino del stack en a1
	addi $sp, $sp, 12	# Recorre el stack para sacar las siguientes dirección y termino
	jr $ra			# Regresa a la dirección obtenida del stack
	
Exit: