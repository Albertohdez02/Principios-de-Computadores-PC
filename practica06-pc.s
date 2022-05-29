# Practica 6 Subrutinas. Principios de Computadores
# Alberto Antonio Hernandez Hernandez
# 11/05/2022
# 
# Pseudocodigo en c++:
# Variables:

maximoElementos=400 # numero de enteros maximo reservado para la matriz 1600 bytes
size=4 # bytes que ocupa un entero
    .data
mat:   .word   100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119
       .word   120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139
       .word   140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159
       .word   160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179
       .word   180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199
       .word   200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219
       .word   220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239
       .word   240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259
       .word   260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279
       .word   280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299
       .word   300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319
       .word   320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339
       .word   340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359
       .word   360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379
       .word   380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399
       .word   400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419
       .word   420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439
       .word   440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459
       .word   460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479
       .word   480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499
       

nfil:   .word   20 # numero de filas de la matriz
ncol:   .word   10 # numero de columnas de la matriz
separador:  .asciiz "  " # separador entre numeros
newline:    .asciiz "\n"
menu:       .ascii  "\n(1) Cambiar dimensiones\n(2) Obtener elemento [i,j]\n"
            .asciiz "(3) Invertir fila\n(4) Invertir columna\n(5) Traspuesta\n(0) Salir\nElija opcion: "
error_op:   .asciiz "\nError: opcion incorrecta.\n"
msg_nfilas: .asciiz "\nIntroduzca numero de filas: "
msg_ncols:  .asciiz "\nIntroduzca numero de columnas: "
error_nfilas:   .asciiz "\nError: dimension incorrecta. Numero de fila incorrecto.\n"
error_ncols:    .asciiz "\nError: dimension incorrecta. Numero de columna incorrecto.\n"
error_dime:     .asciiz "\nError: dimension incorrecta. Excede el maximo numero de elementos (400).\n"
msg_i:      .asciiz "\nObtener el elemento [i,j]. Introduzca indice i (primera fila indice 0): "
msg_j:      .asciiz "\nObtener el elemento [i,j]. Introduzca indice j (primera columna indice 0): "
msg_f:      .asciiz "\nInvertir la fila [i,*]. Introduzca indice i (primera fila indice 0): "
msg_c:      .asciiz "\nInvertir la columna [*,j]. Introduzca indice j (primera columna indice 0): "
msg_elemento:   .asciiz "\nElemento obtenido en la posicion indicada: "
titulo:     .asciiz "\nPractica 6 de Principios de Computadores. Matrices con funciones.\n"
header:     .asciiz "Matriz con dimension "
x:          .asciiz " x "
msg_fin:    .asciiz "\nFin del programa.\n"
error_no_cuadrada:  .asciiz "\nError: No se puede calcular la traspuesta en matrices no cuadradas.\n"

    .text

print_matriz:
    move $t0, $a0   #cargamos en $t0 nfil pasado por parametro
    move $t1, $a1   #cargamos en $t1 ncol pasado por parametro
    move $s7, $a2
    move $t2, $zero     #indice de la fila a 0 (i)
    li $t3, size        #cargamos la palabra size que contiene un 4 en el registro $t5 (tamaño de cada elemento)

    for_1: 
        move $t4, $zero      #indice de columna (j) igual a 0
        for_2: 
            mul $t5, $t2, $t1   #metemos (indice * ncol) en $t5
            addu $t5, $t5, $t4   #metemos en $t5 la operacion (indice * ncol + j)
            mul $t5, $t5, $t3   #metemos en $t5 la operacion (indice * ncol + j)*size)
            addu $t5, $t5, $s7   #guardamos la direccion de memoria del elemento (i,j) de la matriz en $t5
            lw $t5, 0($t5)       #cargamos el elemento (i,j) de la matriz en el registro $t5

            li $v0, 1
            move $a0, $t5        #imprimimos en pantalla el elemento (i, j) de la matriz
            syscall 

            li $v0, 4
            la $a0, separador    #imprimimos un espacio entre elemento y elemento de la fila
            syscall 

            addi $t4, $t4, 1     #incrementamos el indice de la columna (++j)
            blt $t4, $t1, for_2  #si j < ncol, seguimos iterando columna a columna 
        fin_for_2:

        li $v0, 4
        la $a0, newline      #si j >= ncol, hemos acabado el numero de columnas, salto de linea y nueva fila
        syscall 

        addi $t2, $t2, 1     #incrementamos el indice de fila (++i)
        blt $t2, $t0, for_1  #si el i < nfil, seguimos iterando en una nueva fila
    fin_for_1:

    jr $ra  #volvemos al main, a la siguiente instruccion despues de la llamada a esta funcion

swap:
    lw $t7, 0($a0)     #guardamos el elemento de la primera direccion de memoria en $t7
    lw $t8, 0($a1)      #guardamos el elemento de la segunda direccion de memoria en $t8

    sw $t7, 0($a1)      #guardamos el primer elemento en la direccion del segundo
    sw $t8, 0($a0)      #guardamos el segundo elemento en la direccion del primero

    jr $ra      #volvemos a la funcion que ha invocado a esta 

traspuesta:
    move $t6, $a0      #cargamos la direccion de memoria inicial en $t6
    move $t0, $a1      #cargamos nfil pasado por parametro en $t0

    #push
    addi $sp, $sp, -4   #reservo 4 bytes en la pila
    sw $ra, 0($sp)  #guardo la direccion que está en $ra en la pila

    move $t1, $zero    #iniciamos el iterador i a 0
    for_tras_1:
        move $t2, $zero       #iniciamos el iterador j a 0
        for_tras_2:
            bgt $t1, $t2, j_traspuesta      #solo si i > j, saltamos swap
            mul $t3, $t1, $t0       #hacemos i * nfil
            add $t3, $t3, $t2       #hacemos i * nfil + j
            mul $t3, $t3, size      #hallamos el desplazamiento de dicho elemento (i,j)
            addu $t3, $t3, $t6      #hallamos la direccion de memoria del elemento (i,j)

            mul $t4, $t2, $t0       #hacemos j * nfil
            add $t4, $t4, $t1       #hacemos j * nfil + i 
            mul $t4, $t4, size      #hallamos el desplazamiento de dicho elemento (j,i)
            addu $t4, $t4, $t6      #hallamos la direccion de memoria del elemento (j,i)
    
            move $a0, $t3       #guardamos la dir. mem. de (i,j) en $a0 para pasarlo a la funcion swap
            move $a1, $t4       #guardamos la dir. mem. de (j,i) en $a1 para pasarlo a la funcion swap

            jal swap                #llamamos a la funcion swap para intercambiar los valores

            j_traspuesta:
            addi $t2, $t2, 1        #++j
            blt $t2, $t0, for_tras_2       #mientras j < nfil, volvemos a iterar el for 2
        fin_for_tras_2:
        addi $t1, $t1, 1        #++i
        blt $t1, $t0, for_tras_1    #mientras i < nfil, volvemos a iterar el for 1
    fin_for_tras_1:

    #pop
    lw $ra, 0($sp)      #recargo la direccion de retorno al main en $ra desde la pila
    addi $sp, $sp, 4        #dejo el puntero pila como estaba

    jr $ra      #volvemos al main

invertir:
    move $t0, $a0           #direccion de memoria del elemento inicial
    move $t1, $a1           #numero de elementos 
    move $t2, $a2           #bytes existentes entre elementos (size o (size*ncol)) --> distancia

    blt $t1, $s1, inv_salto         #si el numero de elementos es <= 1, salimos de la funcion

    addi $sp, $sp, -4      #guardamos ra en la pila
    sw $ra, 0($sp) 

    addi $t3, $t1, -1     #el elemento final esta en el numero de elementos -1
    mul $t3, $t3, $t2     #numero de elementos - 1 * distancia 
    add $t3, $t3, $t0     #numero de elementos - 1 * distancia + inicial / direccion de memoria del ultimo

    move $a0, $t0       #muevo la direccion del primer elemento a $a0, para pasarlo a swap
    move $a1, $t3       #muevo la direccion del ultimo elemento a $a1, para pasarlo a swap

    jal swap        #intercambiamos los valores 

    addi $t1, $t1, -2           #restamos 2 al numero de elementos (ya hemos intercambiado 2)
    add $t0, $t0, $t2           #pasamos a la siguiente posicion del primer elemento

    move $a0, $t0           #preparamos los elementos para volver a llamar a invertir
    move $a1, $t1
    move $a2, $t2

    jal invertir        #volvemos a llamar a la funcion de forma recursiva 

    inv_salto:              #saltamos la recursividad

    #pop
    lw $ra, 0($sp)          #sacamos ra de la pila para volver al main 
    addi $sp, $sp, 4

    jr $ra             #volvemos al main
main:
    li $v0, 4
    la $a0, titulo  #imprimimos el titulo de la practica 
    syscall

    while_programa:
        li $v0, 4 
        la $a0, header  #imprimimos el texto de la dimension de la matriz
        syscall

        lw $t0, nfil    #cargamos la palabra nfil en el registro entero $t0 

        li $v0, 1
        move $a0, $t0   #imprimimos el numero de filas
        syscall 

        li $v0, 4
        la $a0, x       #imprimimos la x
        syscall 

        lw $t1, ncol    #guardamos la palabra ncol en el registro entero $t1 

        li$v0, 1
        move $a0, $t1   #imprimimos el numero de columnas
        syscall 

        li $v0, 4
        la $a0, newline     #introducimos un salto de linea
        syscall 

        move $a0, $t0      #movemos nfil a $a0, para ser pasado por parametro a print_matriz
        move $a1, $t1      #movemos ncol a $a1, para ser pasado por parametro a print_matriz
        la $a2, mat        #cargamos la dirección base de la matriz en $a2 para pasarla por parametro

        jal print_matriz        #llamamos a la funcion print_matriz

        li $v0, 4
        la $a0, menu             #imprimimos el menu por pantalla
        syscall

        li $v0, 5
        syscall                 #leemos el entero y lo guardamos en $t6
        move $t6, $v0        

        #guardamos los valores para las distintas opciones
        li $s1, 1       #opcion 1: cambiar dimensiones, guardado en $s1
        li $s2, 2       #opcion 2: obtener un elemento, guardado en $s2
        li $s3, 3       #opcion 3: invertir fila, guardado en $s3
        li $s4, 4       #opcion 4: invertir columna, guardado en $s4
        li $s5, 5       #opcion 5: hacer la traspuesta de la matriz, guardado en $s5

        beqz $t6, fin_while_programa    #si introducimos un 0, finaliza el programa
        beq $t6, $s1, cambiar_dimensiones   #si introducimos un 1, cambiamos las dimensiones de la matriz
        beq $t6, $s2, obtener_elem      #si introducimos un 2, obtenemos un elemento de la matriz
        beq $t6, $s3, invertir_fila    #si se escoge la opcion 3, vamos a invertir una fila
        beq $t6, $s4, invertir_colum      #si introducimos un 4, vamos a invertir una columna
        beq $t6, $s5, hacer_traspuesta   #si introducimos un 5, hallamos la traspuesta de la matriz
        
        li $v0, 4
        la $a0, error_op      #si el valor introducido no esta entre 0 y 4, salta error
        syscall
        j while_programa      #y vuelve a imprimir la matriz y el menu

        cambiar_dimensiones:
            li $v0, 4
            la $a0, msg_nfilas       #imprimimos el mensaje que pide introducir el numero de filas
            syscall

            li $v0, 5
            syscall                     #introducimos el numero de filas deseadas y lo guardamos en $t7 
            move $t7, $v0 
            blt $t7, $s1, error_fila                #o si es menor a 1, salta error 

            li $v0, 4
            la $a0, msg_ncols       #imprimimos el mensaje que pide introducir el numero de columnas
            syscall

            li $v0, 5
            syscall                  #introducimos el numero de columnas deseadas y lo guardamos en $t8
            move $t8, $v0
            blt $t8, $s1 error_col                   #o si es menor a 1, salta error

            mul $t9, $t7, $t8                     #hayamos si el tamaño es posible 
            bgt $t9, maximoElementos, error_dim   #si el tamaño > 400, salta error

            bgt $t7, maximoElementos, error_fila    #si la fila es mayor de 400 salta error
            
            bgt $t8, maximoElementos, error_col     #si la columna es mayor de 400 salta error
         
            j redimension                         #si no continua la ejecucion normal
            error_fila:
                li $v0, 4
                la $a0, error_nfilas    #imprimimos el error de numero de fila 
                syscall
                j while_programa        #volvemos a imprimir la matriz
            error_fila_fin:
            error_col:
                li $v0, 4
                la $a0, error_ncols     #imprimimos el error de numero de columnas 
                syscall
                j while_programa        #volvemos a imprimir la matriz 
            error_col_fin:
            error_dim:
                li $v0, 4
                la $a0, error_dime      #imprimimos el error de dimension 
                syscall
                j while_programa        #volvemos a imprimir la matriz
            fin_error_dim:
            redimension:
                sw $t7, nfil            #actualizamos el valor del numero de filas 
                sw $t8, ncol            #actualizamos el valor del numero de columnas
                j while_programa        #imprimimos la matriz actualizada
            fin_redimension:
        fin_cambiar_dimensiones:

        obtener_elem:
            li $v0, 4
            la $a0, msg_i           #imprimimos la cadena que nos pide el elemento i de la matriz
            syscall 

            li $v0, 5
            syscall                 #leemos el entero (i) y lo guardamos en $t0
            move $t3, $v0
            bltz $t3, error_fila    #si i < 0, salta un error
            bge $t3, $t0, error_fila        #si i >= nfil, salta un error

            li $v0, 4
            la $a0, msg_j           #imprimimos la cadena que nos pide el elemento j de la matriz
            syscall 

            li $v0, 5
            syscall                 #leemos el entero (j) y lo guardamos en $t0
            move $t4, $v0
            bltz $t4, error_col     #si j < 0, salta un error
            bge $t4, $t1 , error_col         #si j >= ncol, salta un error 

            la $s0, mat    #cargamos la direccion base de la matriz en $s0

            mul $t0, $t3, $t1          # (i * ncol)   cada fila tiene ncol elementos
            add $t0, $t0, $t4          # j + (i * ncol)     sumandole la j vamos a ese elemento de la fila
            mul $t0, $t0, size         # size * (j + (i * ncol))    calculamos la direccion del elemento (desplazamiento)
            addu $t0, $t0, $s0         #guardamos la direccion de memoria base y le sumamos el desplazamiento
            lw $t0, 0($t0)             #cargamos el elemento en dicha posicion de memoria de la matriz en $t0

            li $v0, 4
            la $a0, msg_elemento       #imprimimos la cadena que precede al elemento
            syscall

            li $v0, 1
            move $a0, $t0           #imprimimos el elemento (i,j) de la matriz
            syscall

            li $v0, 4
            la $a0, newline         #imprimimos un salto de linea 
            syscall

            j while_programa        #volvemos a imprimir la matriz y el menu
        fin_obtener_elem:

        invertir_fila:
            li $v0, 4
            la $a0, msg_f           #imprime la cadena que pide la fila a intercambiar 
            syscall

            li $v0, 5
            syscall                 #leemos el entero introducido por consola 
            move $t2, $v0

            bltz $t2, error_fila        #si la fila a invertir es menor a 0
            bge $t2, $t0, error_fila    #o mayor o igual a la fila, salta el error

            lw $t3, nfil                #cargamos el numero de filas en $t4
            lw $t4, ncol                #cargamos el numero de columnas en $t5
            la $t6, mat                 #cargamos la primera direccion de memoria de la matriz
            li $t8, size                #cargamos size en $t8
            

            mul $t5, $t2, $t4            #hallamos el primer elemento de la fila (fila*ncol)
            mul $t5, $t5, $t8            #hallamos el desplazamiento
            addu $t5, $t5, $t6           #hallamos la direccion de memoria del primer elemento

 
            move $a0, $t5       #movemos el elemento inicial a $a0, para pasarlo por parametro a la funcion
            move $a1, $t4       #movemos el numero de elementos a $a1, para pasarlo por parametro a la funcion
            move $a2, $t8      #movemos el tamaño de los elementos a $a2, para pasarlo por parametro a la funcion    

            jal invertir            #llamamos a la funcion invertir

            j while_programa        #volvemos al comienzo del programa
        fin_invertir_fila:
    
        invertir_colum:
            li $v0, 4        
            la $a0, msg_c                    # imprimimos la cadena que pide la columna a invertir
            syscall 

            li $v0, 5
            syscall                          # leemos el numero entero introducido por el usuario (AuxColum)
            move $t2, $v0

            bltz $t2, error_col              # si el numero es menor que cero
            bge $t2, $t1, error_col          # o el numero es mayor o igual al numero de columnas, salta el error

            lw $t3, nfil            #guardamos el numero de filas de la matriz en $t3
            lw $t4, ncol            #guardamos el numero de columnas de la matriz en $t4
            la $t5, mat             #guardamos la direccion inicial de la matriz en $t5

            mul $t6, $t2, size          #hallamos el desplazamiento de la posicion inicial ($t2)
            addu $t6, $t6, $t5          #hallamos la direccion de memoria del primer elemento de la columna

            mul $t8, $t4, size        #hallamos la distancia entre elementos de la columna (ncol * size)

            move $a0, $t6           #movemos el elemento inicial a $a0, para pasarlo por parametro a la funcion
            move $a1, $t3           #movemos el numero de elementos a $a1, para pasarlo por parametro a la funcion
            move $a2, $t8           #movemos el tamaño de los elementos a $a2, para pasarlo por parametro a la funcion    

            jal invertir        #llamamos a la funcion invertir

            j while_programa        #volvemos al comienzo del programa
        fin_invertir_colum:

        hacer_traspuesta:
            beq $t0, $t1, fin_error_traspuesta   #si la matriz es cuadrada saltamos el error y hacemos la traspuesta
            error_traspuesta:
                li $v0, 4 
                la $a0, error_no_cuadrada
                syscall
                j while_programa
            fin_error_traspuesta:

            la $a0, mat     #cargamos en $a0 la direccion base de mat para pasarla por parametro a la funcion
            move $a1, $t0     #cargamos en $a1 nfil para pasarla por parametro a la funcion   

            jal traspuesta          #hacemos la matriz traspuesta

            j while_programa        #volvemos al comienzo del while
        fin_hacer_traspuesta:
        
        j while_programa    #volvemos a imprimir la matriz resultante y el menu
    fin_while_programa:

    li $v0, 4
    la $a0, msg_fin     #imprimimos el mensaje de fin de programa 
    syscall

    li $v0, 10          #finalizamos el programa
    syscall 

