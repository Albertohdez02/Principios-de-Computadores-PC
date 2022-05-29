# practica 4. Principio de computadoras
# ALBERTO ANTONIO HERNANDEZ HERNANDEZ
# OBJETIVO: introduce el codigo necesario para reproducir el comportamiento del programa
# C++ que se adjunta como comentarios
# Debes documentar debidamente el uso de los registros que has elegido y la correspondencia
# con las variables que has utilizado.
#include <iostream>
#
#using namespace std;
#
#int main()
#{
#    // 1.- Solicitar dos enteros por teclado y comprobar que son positivos y que 
#    //     el primero es mayor o igual que el segundo. 
#
#    int a, // Primero de los números a recoger
#        b; // Segundo de los números a recoger
#        
#    cout << "PR4. Grupo PE105. Prueba en el aula\n";
#    do {
#        cout << "Introduzca un número entero positivo\n";
#        cin >> a;
#        cout << "Introduzca un segundo número entero positivo menor o igual al anterior\n";
#        cin >> b;
#        if ((a <= 0) || (b <= 0) || (a < b))
#            cout << "Error. Ambos números deben ser positivos y el primero debe ser mayor o igual que el segundo.\n";
#        else
#            break;
#    } while (1);
#    
#    // 2.- Mostrar por consola aquellos enteros comprendidos entre cero y el 
#    //     primer número que sean divisibles por el segundo. 
#    for (int i = 0; i <= a; i++) {
#        if ((i % b) == 0) {
#            cout << i << " es divisible entre " << b << endl;
#        } else {
#            // 3.- Para aquellos valores que no sean divisibles, deberá mostrarse por 
#            //     consola el resultado de la división expresada como un valor flotante.
#            cout << float(i) / float(b) << endl;
#        }
#    }
#    cout << "\nFin del programa\n";
#    return 0;
#}
#		VARIABLES:
#				$t0    int a 
#				$t1		 int b
#				$t3    iterador
#				$f20 	 resultado division float


	.data		# directiva que indica la zona de datos
titulo: 	     .asciiz	"PR4. Grupo PE105. Prueba en el aula\n" 
msgpregunta1:    .asciiz "Introduzca un número entero positivo\n"
msgpregunta2:    .asciiz "\nIntroduzca un segundo número entero positivo menor o igual al anterior\n"
msgerror:        .asciiz "\nError. Ambos números deben ser positivos y el primero debe ser mayor o igual que el segundo.\n"
msgdivisible:    .asciiz " es divisible entre "
msgendl:         .asciiz "\n"
msgfin:			 .asciiz "\nFin del Programa.\n"


	.text		# directiva que indica la zona de código
main:
	#int a, // Primero de los números a recoger
	#		 b; // Segundo de los números a recoger
	#        
	#cout << "PR4. Grupo PE105. Prueba en el aula\n";

	#Imprime la cadena inicial
	li $v0, 4
	la $a0, titulo
	syscall 

	etiqueta_do_while:

		#		do {
		#        cout << "Introduzca un número entero positivo\n";
		#        cin >> a;
		#        cout << "Introduzca un segundo número entero positivo menor o igual al anterior\n";
		#        cin >> b;
		#        if ((a <= 0) || (b <= 0) || (a < b))
		#            cout << "Error. Ambos números deben ser positivos y el primero debe ser mayor o igual que el segundo.\n";
		#        else
		#            break;
		#    } while (1);
		#Imprime la cadena de texto que pide el numero a
		li $v0, 4
		la $a0, msgpregunta1
		syscall 

		#lee el numero a
		li $v0, 5
		move $t0, $v0
		syscall 

		#Imprime la cadena de texto que pide el numero b
		li $v0, 4
		la $a0, msgpregunta2
		syscall 

		#lee el numero b
		li $v0, 5
		move $t1, $v0	
		syscall

		blez $t0, error   		#si a <= 0, salta a error
		blez $t1, error   		#si b <= 0, salta a error
		blt $t0, $t1, error		#si a < b, salta a error
		j fin_do_while
		error:
			#Imprime el mensaje de error
			li $v0, 4
			la $a0, msgerror
			j etiqueta_do_while	 #vuelve a empezar el bucle
		fin_error:
	fin_do_while:

	#// 2.- Mostrar por consola aquellos enteros comprendidos entre cero y el 
	#    //     primer número que sean divisibles por el segundo. 
	#    for (int i = 0; i <= a; i++) {
	#        if ((i % b) == 0) {
	#            cout << i << " es divisible entre " << b << endl;
	#        } else {
	#            // 3.- Para aquellos valores que no sean divisibles, deberá mostrarse por 
	#            //     consola el resultado de la división expresada como un valor flotante.
	#            cout << float(i) / float(b) << endl;
	#		 }
	li $t3, 0		#inicializamos el iterador
	li $t4, 1		#constante uno para sumar al iterador
	bucle_for:
		bge $t3, $t0, fin_bucle_for  #si i >= a se acaba el bucle
		div $t5, $t3 ,$t1						 #se realiza la division i / b y se guarda el resultado en $t5
		mfhi $t6										 #se guarda el resto de la división en $t6
		beqz $t6, if								 #si el resto de la division es 0, se entra en el if
		j else							 
		if:
			#Imprime el iterador
			la $v0, 1
			move $a0, $t3
			syscall

			#Imprime la cadena de texto de "es divisible entre"
			li $v0,4
			la $a0, msgdivisible
			syscall

			#Imprime el numero b
			la $v0, 1
			move $a0, $t1
			syscall

			#Imprime el endl
			li $v0, 4 
			la $a0, msgendl
			syscall
			j fin_else
		fin_if:
		else:
			mtc1 $t3, $f4       #Hacemos una copia cruda del iterador en flotante
			cvt.s.w $f6, $f4		#pasamos el iterador a flotante float(i) y lo guardamos en $f6

			mtc1 $t1, $f8				#Hacemos una copia cruda del numero b en flotante
			cvt.s.w $f10, $f8		#pasamos el iterador a flotante float(b) y lo guardamos en $f10

			div.s $f20, $f6, $f10		#Hacemos la divison flotante float(i) / float(b) 

			#Imprimimos el resultado
			li $v0, 2
			mov.s $f12, $f20
			syscall

			#Imprimimos el endl
			li $v0, 4 
			la $a0, msgendl
			syscall

		fin_else:
		addi $t3, $t3, $t4   #i++
		j bucle_for					 #vuelve a comenzar el bucle 
	fin_bucle_for:
	
	#cout << "\nFin del programa\n";
	#return 0;
	#}
	#Imprime la cadena que indica que el programa ha finalizado
	li $v0, 4
	la $a0, msgfin
	syscall

	#Finaliza el programa exitosamente
	li $v0,10
	syscall
 
