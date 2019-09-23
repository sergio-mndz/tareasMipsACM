.data
	#Declaracion de vectores 1, 2 y de resultados
	v2: .word 1 2 3	 
	v1: .word 6 7 8	
	res: .word 0 	

.text
Main: 
	li $s0, 3 	#K = 3
	li $s1, 0	#i = 0
	li $s2, 0	#acc = 0
	la $a0, v1 	#direccion de v1 
	la $a1, v2 	#direccion de v2
	la $a2, res 	#direccion de res
	
For:
	
	beq $s0, $s1, Salir 	#Cuando sea 3 sale del programa
	jal multAndAccumulate	#Entra a la primera funcion y guarda la direccion
	sw $s2, 0($a2)		#Guarda en el vector results el resultado
	addi $a2,$a2, 4		#incrementa los punteros $a2 vector resultados
	sub $s0, $s0, 1		#Decrementa para ir avanzando en el for
	j For		#Regresa al for
	
multAndAccumulate:
	addi $sp, $sp, -4 	# Bajamos en uno la direccion del stack pointer
	sw $ra, 0($sp)		# Guardamos la direccion en la que estabamos en el ciclo for
	
	lw $t0, 0($a0)		#t0 tiene el valor de v1
	lw $t1, 0($a1) 		#t1 tiene el valor de v2
	mul $s3, $t1, $t0	#Se multiplican los valores de los vectores y se guardan en s3
	
	jal Accumulate		#Vamos a la funcion Accumulate
	lw $ra, 0($sp) 		#El resgistro ra ahora tiene la direccion de regreso
	addi $sp, $sp, 4	#Aumentamos el stack debido al decremento pasado
	jr $ra			#Regresamos al ciclo for


Accumulate:
	add $s2, $s2, $s3	#t2 es la suma de si mismo con el resultado de la multipliacion
	addi $a0,$a0, 4		#Pasamos al siguiente dato del vector v1
	addi $a1,$a1, 4		#Pasamos al siguiente dato del vector v2
	jr $ra			#Salta a la funcion anterior
 
Salir: 