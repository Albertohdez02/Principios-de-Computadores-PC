#PRACTICA 03 PRINCIPIO DE COMPUTADORES
#APROXIMACIÓN DE UNA FUNCIÓN
#ALBERTO ANTONIO HERNÁNDEZ HERNÁNDEZ
#FECHA: 25/03/2022
#Código de alto nivel (C++)
#include <iostream>
#include <cmath>
# int main() {
#   float numero;
#   std::cout << "PR3 aproximación por serie geométrica" << std::endl;
#   do {
#     do {
#       std::cout << "Introduzca el valor de x (|x|<1): ";
#       std::cin >> numero;
#     } while (fabs(numero) > 1);
#     if (numero == 0) break;
#     float resultado;
#     resultado = 1 / (1 + numero);
#     std::cout << "Resultado real = " << resultado << std::endl;
#     double error_objetivo;
#     do {
#       std::cout << "Introduzca el error objetivo: ";
#       std::cin >> error_objetivo;
#     } while (error_objetivo < 0 || error_objetivo > resultado);
#     int iterador = 1;
#     float sumatorio, error_suma = -1;
#     float total = 1, error_total = 1;
#     sumatorio = numero;
#     do {
#       total = total + error_suma * sumatorio;
#       error_total = fabs(total - resultado);
#       sumatorio = sumatorio * numero;
#       error_suma = error_suma * -1;
#       iterador++;
#     } while (error_total > error_objetivo);
#     std::cout << "Resultado calculadado para " << iterador 
#               << " terminos = " << total << std::endl;
#     std::cout << "error cometido para " << iterador
#               << " terminos = " << error_total << std::endl;
#   } while (true);
#   std::cout << "FIN DEL PROGRAMA. " << std::endl;
#   return 0;
# } 
#
# VARIABLES:
#   numero                  $f20
#   resultado               $f22
#   error_objetivo          $f24
#   total                   $f26
#   error_total             $f28
#   error_suma              $f30
#   sumatorio               $f4


    .data
titulo: .asciiz "PR3 aproximación por serie geométrica\n"
finmsg: .asciiz "\nFIN DEL PROGRAMA.\n"
calmsg: .asciiz "\nResultado real = "
pidex:  .asciiz "\nIntroduzca el valor de x (|x|<1): "
piderr: .asciiz "\nIntroduzca el error objetivo: "
resmsg: .asciiz "\nResultado calculado para " 
termsg: .asciiz " terminos = " 
errmsg: .asciiz "\nError cometido para " 
    .text
main:

#Imprime en pantalla la cadena "PR3 aproximación por serie geométrica"
li $v0, 4 
la $a0, titulo
syscall

do_while_principal:     
    #     do {
    #       std::cout << "Introduzca el valor de x (|x|<1): ";
    #       std::cin >> numero;
    #     } while (fabs(numero) > 1);
    do_while_numero:
        #Imprime en pantalla la cadena "Introduzca el valor de x (|x|<1): "
        li $v0, 4 
        la $a0, pidex
        syscall

        #Pide el numero flotante de entrada 
        li $v0, 6         #Lee un numero flotante y lo guarda en $f0
        syscall
        mov.s $f20, $f0   #Asigna el valor del numero al registro $f20

        abs.s $f5, $f20      #Halla el valor absoluto del numero 
        li.s $f6, 1.0        #Carga en el registro $f6 el valor "1"
        c.lt.s $f5, $f6      #Si |x| < 1 
        bc1f do_while_numero   #si es falso repite el bucle
        
    fin_do_while_numero: 

    #if (numero == 0) break;
    li.s $f7, 0.0          #Asignamos al registro $f7 el valor 0.0
    c.eq.s $f20, $f7       #Si numero == 0 
    bc1t fin               #se acaba el programa

    #double resultado;
    #resultado = 1 / (1 + numero);
    #std::cout << "Resultado real = " << resultado << std::endl;
    #double error_objetivo;
    li.s $f22, 0.0    #Inicializo la variable resultado a 0
    add.s $f8, $f6, $f20    #hago la operacion 1 + numero
    div.s $f22, $f6, $f8    #hace la operacion resultado = 1 / (1 + numero)

    #Imprime la cadena de texto "El resultado es"
    li $v0, 4 
    la $a0, calmsg
    syscall

    #Imprime el resultado
    li $v0, 2
    mov.s $f12, $f22        #mueve el flotante de $f22 a $f12 oara imprimirlo
    syscall

    li.s $f24, 0.0  #Inicializamos la variable error_obj a 0

    # do {
    #   std::cout << "Introduzca el error objetivo: ";
    #   std::cin >> error_objetivo;
    # } while (error_objetivo < 0 || error_objetivo > resultado);
    do_while_error:
        #Imprime la cadena de texto "Introduzca el error objetivo:"
        li $v0, 4
        la $a0, piderr
        syscall

        #Pide un numero flotante por terminal
        li $v0, 6
        syscall
        mov.s $f24, $f0      #mueve el numero introducido a $f24

        c.le.s $f24, $f7     #Si error_objetivo < 0
        bc1t do_while_error  #vuelve a comenzar el bucle 
        c.lt.s $f22, $f24    #o si resultado < error_objetivo
        bc1t do_while_error  #salta al comienzo del bucle
    fin_do_while_error:

    #int iterador = 1;
    #float sumatorio, error_suma = -1;
    #float total = 1, error_total = 1;
    #sumatorio = numero;
    li $s0, 1           #iterador
    li.s $f30, -1.0      #error_suma = 1
    li.s $f26, 1.0      #total = 1
    li.s $f28, 1.0      #error_total = 1
    mov.s $f4, $f20     #sumatorio = numero

    #do {
    #   total = total + error_suma * sumatorio;
    #   error_total = fabs(total - resultado);
    #   sumatorio = sumatorio * numero;
    #   error_suma = error_suma * -1;
    #   iterador++;
    # } while (error_total > error_objetivo);
    do_while_sumatorio:
        # total = total + error_suma * sumatorio
        mul.s $f6, $f30, $f4       # error_suma * sumatorio
        add.s $f26, $f26, $f6      # total = total + $f6

        # error_total = fabs(total - resultado)
        sub.s $f9, $f26, $f22      # total - resultado
        abs.s $f9, $f9             # valor absoluto de $f30
        mov.s $f28, $f9            # $f28 pasa a ser error total

        #sumatorio = sumatorio * numero
        mul.s $f4, $f4, $f20       #sumatorio = sumatorio * numero

        #error_suma = error_suma * -1
        li.s $f7, -1.0
        mul.s $f30, $f30, $f7      # error_suma * -1

        #iterador++
        addi $s0, 1                #iterador++

        #while (error_total > error_objetivo)
        c.lt.s $f24, $f28          # si error objetivo es menor que error_total
        bc1t  do_while_sumatorio   #repite el bucle

        #si no abandona el bucle

    fin_do_while_sumatorio:

    #std::cout << "Resultado calculado para " << iterador 
    #          << " terminos = " << total << std::endl;
    #std::cout << "error cometido para " << iterador
    #          << " terminos = " << error_total << std::endl;
    #Imprime la cadena "Resultado calculado para "
    li $v0, 4
    la $a0, resmsg
    syscall 

    #Imprime el iterador
    li $v0, 1
    move $a0, $s0
    syscall

    #Imprime la cadena "terminos = "
    li $v0, 4
    la $a0, termsg
    syscall

    #imprime el total
    li $v0,2
    mov.s $f12, $f26
    syscall

    #Imprime la cadena "error cometido para "
    li $v0, 4
    la $a0, errmsg
    syscall 

    #Imprime el iterador
    li $v0, 1
    move $a0, $s0
    syscall 

    #Imprime la cadena "terminos = "
    li $v0, 4
    la $a0, termsg
    syscall

    #imprime el error
    li $v0,2
    mov.s $f12, $f28
    syscall

    j do_while_principal        #vuelve a pedir que introduzca un numero, hasta introducir 0
fin: 

#Imprime la cadena "FIN DEL PROGRAMA"
li $v0, 4
la $a0, finmsg
syscall

#Finaliza el programa con exito
li $v0, 10
syscall 


#PREGUNTAS TEÓRICAS 
#1) Mejora tu programa, minimizando el número de operaciones que se realizan al calcular cada término.
#   Para minimizar las operaciones en los terminos he disminuido el numero de directivas, por ejemplo
#   en la línea 176 he usado la directiva addi en vez de add para ahorrar el uso de otro registro, de
#   de la misma manera, he sobreescrito los registros en las operaciones de suma y multiplicación, 
#   guardando el resultado de los comandos que usan operadores += o *= en c++ en el mismo registro que
#   estaban. De esta manera, he conseguido optimizar bastante el programa en mips, aunque puede ser que 
#   haya margen de mejoria en cuanto al uso de registros, ya que si es cierto que he usado bastantes. 
#
#
#2) Cuando se programa en ensamblador hay que elegir de manera adecuadalos registros para realizar las 
#   operaciones. Di qué registros utilizaste para tus cálculos y cuál fue tu criterio para elegirlos.
#
#   Para el desarrollo de esta practica he hecho uso de los registros de punto flotante $f y de algunos
#   registros enteros, basicamente del registro salvado $s0 por elección propia, ya que podia haber usado
#   un registro entero temporal ($t0) para el iterador. La mayor parte de las operaciones y variables de 
#   este problema, sin embargo, están guardadas tanto en registros flotantes temporales ($f4-$f10) y los 
#   registros flotantes salvados ($f20-$f30), en mayor medida. Estos registros me permiten guardar y hacer
#   operaciones con numeros decimales de precisión simple o doble. Aparte de esto, he operado sobre los 
#   registros $v0, $a0, $f0 para operaciones de lectura y salida por consola.
#
#
#3) Explica brevemente cómo puedes transformar tu programa a doble precisión. Escribe de forma detallada si 
#   realizar este cambio afecta a la elección de tus registros. Explica también si tiene algún efecto en el
#   programa (sobre todo si mejora en algo los resultados).
#
#   Para adaptar el programa a doble precision habria que hacer dos modificaciones basicamente: en primer 
#   lugar debemos de usar solo registros pares para guardar los numeros y operaciones, es decir que tendriamos
#   una escacez mayor de registros para nuestro programa a cambio de mayor precision decimal. Por otra parte, 
#   las directivas que acaban en .s debemos cambiarlas a .d para poder operar correctamente con dos registros, 
#   ya que los decimales de doble precision (double) ocupan mas memoria.