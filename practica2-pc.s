# Practica 2. Principio de computadores
# Alumno: Alberto Antonio Hernandez Hernandez 
# Fecha: 17/03/2022

# OBJETIVO: introduce el codigo necesario para reproducir el comportamiento del programa
# C++ que se adjunta como comentarios
# Debes documentar debidamente el uso de los registros que has elegido y la correspondencia
# con las variables que has utilizado.

##include <iostream>
# int main()
# {
#     std::cout << "Suma las cifras de un número entero." << std::endl;
#     std::cout << "Introduzca un 0 para salir del programa." << std::endl;

#     int numero,cifra,suma;
#     do {
#         std::cout << "Introduzca un entero para calcular la suma de sus cifras (0 para salir): ";
#         std::cin >> numero;
#		  if (numero == 0) break;
#         if (numero < 0 ) numero = 0 - numero; 
#         suma = 0;
#         while ( numero != 0 ){
#             cifra = numero % 10;
#             suma += cifra;
#             numero /= 10;
#         }
#         std::cout << "La suma de las cifras es " << suma << std::endl;
#     } while (true);
#     std::cout << "FIN DEL PROGRAMA. " << std::endl;
#     return 0;
# }
# VARIABLES:
# 		número  $t0
#			cifra		$t1
#			suma		$t2
#			constante 10 $t3

	.data		# directiva que indica la zona de datos

titulo: 	.asciiz	"\nSuma las cifras de un número entero. Introduzca un 0 para salir del programa.\n "
msgnumero:	.asciiz	"\n\nIntroduzca un entero para calcular la suma de sus cifras (0 para salir): "

msgresultado1:	.asciiz	"\nLa suma de las cifras es  "
msgfin:			.asciiz "\nFIN DEL PROGRAMA."


	.text		# directiva que indica la zona de código

main:
	# IMPRIME EL TITULO POR CONSOLA
	# std::cout << "Suma las cifras de un número entero." << std::endl;
	# std::cout << "Introduzca un 0 para salir del programa." << std::endl;
	la	$a0,titulo
	li	$v0,4
	syscall

	# EL MAYOR PORCENTAJE DEL CÓDIGO C++ SE ENCUENTRA DENTRO DE UNA ESTRUCTURA do { ...  } while (true).
	# IMPLEMENTA EN MIPS ESE BUCLE INFINITO, Y A CONTINUACIÓN DESARROLLA CADA UNA DE LAS SECCIONES QUE 
	# SE ENCUENTRAN EN SU INTERIOR.

	#Definimos las variables número, cifra y suma y las inicializamos a 0
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t3, 10  #le damos al registro $t3 el valor 10 para posterior uso en las divisiones

	etiqueta_do:
	# INTRODUCE EN ESTA SECCION EL CÓDIGO MIPS EQUIVALENTE AL SIGUIENTE FRAGMENTO C++
	# TEN EN CUENTA QUE break NO ES SINO UN SALTO A LA SIGUIENTE INSTRUCCION QUE ESTE FUERA DEL BUCLE
	# do { ...  } while (true).
	#         std::cout << "Introduzca un entero para calcular la suma de sus cifras (0 para salir): ";
	#         std::cin >> numero;
	#		  if (numero == 0) break;
	la	$a0,msgnumero
	li	$v0,4						  #Imprime el mensaje para pedir el numero entero
	syscall

	#Leer el número entero
	li $v0, 5
	syscall 
	move $t0, $v0         #mueve el entero introducido a $t0

	#Comparar si el número es 0 para acabar el programa
	beqz $t0, fin  

	# INTRODUCE EN ESTA SECCION EL CODIGO MIPS EQUIVALENTE AL SIGUIENTE FRAGMENTO C++
	#         if (numero < 0 ) numero = 0 - numero;
	if:

	bgtz $t0, fin_if      #si numero > 0, salta el if
	sub $t0, $zero, $t0   #le cambia el signo al número negativo
	
	fin_if:

	# INTRODUCE EN ESTA SECCION EL CODIGO MIPS EQUIVALENTE AL SIGUIENTE FRAGMENTO C++
	#         suma = 0;
	#         while ( numero != 0 ){
	#             cifra = numero % 10;
	#             suma += cifra;
	#             numero /= 10;
	#         }
	li $t2, 0   			   # suma = 0 inicializa a 0 cada vez antes de entrar al while

	while: 

	beqz $t0, fin_while  #si el número = 0 sale del bucle while
	div $t0, $t3  			 #divide numero/10
	mfhi $t1 						 #asigna el resto de numero/10 a $t1
	add $t2, $t2, $t1  	 #suma = suma + cifra
	div $t0, $t0, $t3    #numero = numero/10 
	j while              #vuelve a empezar el bucle

	fin_while:
		
	# INTRODUCE EN ESTA SECCION EL CODIGO MIPS EQUIVALENTE AL SIGUIENTE FRAGMENTO C++
	#         std::cout << "La suma de las cifras es " << suma << std::endl;	
	la	$a0, msgresultado1
	li	$v0,4
	syscall

	li $v0,1
	move $a0,$t2         #mueve el valor de suma de $t2 a $a0 para poder imprimir el entero
	syscall

	j etiqueta_do 			 #vuelve al principio del do while
	fin:

	# las siguientes instrucciones  imprimen la cadena de fin y finalizan el programa
	li $v0,4
	la $a0,msgfin
	syscall
	li $v0,10
	syscall
 
