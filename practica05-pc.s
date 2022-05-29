# Principio de computadores. Practica 5. Alberto Antonio Hernandez Hernandez 
# Fecha: 28/04/2022
#
# include <iostream>
# include <vector>
#
# Codigo en c++:
#
# include<iostream>
# include<vector
#
# const int Maximo {400};
#
# int main() {
#   int Nfilas {20};
#   int Ncolumnas {10};
#   int Opcion;
#   std::vector<int> A{100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
#                      120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139,
#                      140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159,
#                      160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179,
#                      180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
#                      200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219,
#                      220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239,
#                      240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259,
#                      260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279,
#                      280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299,
#                      300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319,
#                      320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339,
#                      340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359,
#                      360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379,
#                      380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399,
#                      400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419,
#                      420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439,
#                      440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459,
#                      460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479,
#                      480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499}; 
#   std::cout << "Practica 5 de Principios de Computadores. Matrices." << std::endl;
#   do {
#     int AuxFilas;
#     int AuxColum;
#     std::cout << "\nMatriz de dimension " << Nfilas << " x " << Ncolumnas << std::endl;
#     for (int i = 0; i < Nfilas; ++i) {
#       for (int j = 0; j < Ncolumnas; ++j) {
#         std::cout << A[i * Ncolumnas + j] << " ";
#       }
#       std::cout << std::endl;
#     }
#     std::cout << std::endl;
#     std::cout << "(1) Cambiar dimensiones\n";
#     std::cout << "(2) Obtener elemento [i,j]\n";
#     std::cout << "(3) Invertir fila\n";
#     std::cout << "(4) Invertir columna\n";
#     std::cout << "(0) Salir\n\nElija opcion: ";
#     std::cin >> Opcion;
#     if (Opcion == 0) break;
#     switch (Opcion) {
#     case 1:  // redimensionar matriz 
#       std::cout << "Introduzca numero de filas: ";
#       std::cin >> AuxFilas;
#       if (AuxFilas < 0 || AuxFilas > Maximo) {
#         std::cout << "Error: dimension incorrecta. Numero de fila incorrecto." << std::endl;
#         break;
#       } else {
#         std::cout << "Introduzca numero de columnas: ";
#         std::cin >> AuxColum;
#         if (AuxColum < 0 || AuxColum > Maximo) {
#           std::cout << "Error: dimension incorrecta. Numero de columna incorrecto." << std::endl;
#           break;
#         } else if (AuxColum * AuxFilas > Maximo) {
#           std::cout << "Error: dimension incorrecta. Excede el maximo numero de elementos (400).\n";
#           break; 
#         } else {
#           Nfilas = AuxFilas;
#           Ncolumnas = AuxColum;
#         }
#       } 
#       break;
#     case 2:  // obtener elemento (i,j)
#       std::cout << "Obtener el elemento [i,j]. Introduzca indice i (primera fila indice 0): ";
#       std::cin >> AuxFilas;
#       if (AuxFilas < 0 || AuxFilas > Maximo) {
#         std::cout << "Error: dimension incorrecta. Numero de fila incorrecto." << std::endl;
#         break;
#       } else {
#         std::cout << "Obtener el elemento [i,j]. Introduzca indice i (primera fila indice 0): ";
#         std::cin >> AuxColum;
#         if (AuxColum < 0 || AuxColum > Maximo) {
#           std::cout << "Error: dimension incorrecta. Numero de columna incorrecto." << std::endl;
#           break;
#         } else if (AuxColum * AuxFilas > Maximo) {
#           std::cout << "Error: dimension incorrecta. Excede el maximo numero de elementos (400).\n";
#           break; 
#         } else {
#           std::cout << "Elemento obtenido en la posicion indicada: " << A[AuxColum + (AuxFilas * Ncolumnas)] << std::endl;
#         }
#       } 
#       break;
#     case 3: // invertir fila (i,*)
#       std::cout << "Invertir la fila [i,*]. Introduzca indice i (primera fila indice 0): ";
#       std::cin >> AuxFilas;
#       if (AuxFilas < 0 || AuxFilas > Maximo) {
#         std::cout << "Error: dimension incorrecta. Numero de fila incorrecto." << std::endl;
#         break;
#       } else {
#         int cambiador;
#         for (int i = 0; i < (Ncolumnas/2); ++i) {
#           cambiador = A[AuxFilas * Ncolumnas + i];
#           A[AuxFilas * Ncolumnas + i] = A[((AuxFilas * Ncolumnas) + Ncolumnas - 1) - i];
#           A[((AuxFilas * Ncolumnas) + Ncolumnas - 1) - i] = cambiador;
#         }
#       }
#       break;
#     case 4: // invertir columna (*,j)
#       std::cout << "Invertir la columna [*,j]. Introduzca indice j (primera columna indice 0): ";
#       std::cin >> AuxColum;
#       if (AuxColum < 0 || AuxColum > Maximo) {
#         std::cout << "Error: dimension incorrecta. Numero de columna incorrecto." << std::endl;
#         break;
#       } else {
#         int cambiador;
#         for (int i = 0; i < (Nfilas/2); ++i) {
#           cambiador = A[i * Ncolumnas + AuxColum];
#           A[i * Ncolumnas + AuxColum] = A[((Nfilas - 1 - i) * Ncolumnas) + AuxColum];
#           A[((Nfilas - 1 - i) * Ncolumnas) + AuxColum] = cambiador;
#         }
#       }
#       break;
#     default:
#       std::cout << "Opcion incorrecta" << std::endl;
#       break;
#     }
#   } while (true);
#   std::cout << "FIN DEL PROGRAMA" << std::endl;
#   return 0;
# }
#
#  VARIABLES:
#       nfil          $t0
#       ncol          $t1
#       mat           $s0
#       constante 1   $s1
#       constante 2   $s2
#       constante 3   $s3
#       constante 4   $s4

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
            .asciiz "(3) Invertir fila\n(4) Invertir columna\n(0) Salir\nElija opcion: "
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
titulo:     .asciiz "\nPractica 5 de Principios de Computadores. Matrices.\n"
header:     .asciiz "Matriz con dimension "
x:          .asciiz " x "
msg_fin:    .asciiz "\nFin del programa.\n"

    .text
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

        la $s0, mat         #cargamos la direccion base de la matriz en $s0
        move $t2, $zero     #indice de la fila a 0 (i)
        li $t3, size        #cargamos la palabra size que contiene un 4 en el registro $t5 (tamaño de cada elemento)

        for_1: 
            move $t4, $zero      #indice de columna (j) igual a 0
            for_2: 
                mul $t5, $t2, $t1   #metemos (indice * ncol) en $t5
                addu $t5, $t5, $t4   #metemos en $t5 la operacion (indice * ncol + j)
                mul $t5, $t5, $t3   #metemos en $t5 la operacion (indice * ncol + j)*size)
                addu $t5, $t5, $s0   #guardamos la direccion de memoria del elemento (i,j) de la matriz en $t5
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

        #guardamos los valores para las distintas opciones
        li $s1, 1       #opcion 1: cambiar dimensiones, guardado en $s1
        li $s2, 2       #opcion 2: obtener un elemento, guardado en $s2
        li $s3, 3       #opcion 3: invertir fila, guardado en $s3
        li $s4, 4       #opcion 4: invertir columna, guardado en $s4
        li $s5, 20      #valor maximo de filas o columnas 

        li $v0, 4
        la $a0, menu             #imprimimos el menu por pantalla
        syscall

        li $v0, 5
        syscall                 #leemos el entero y lo guardamos en $t6
        move $t6, $v0

        beqz $t6, fin_while_programa    #si el numero introducido es 0, finaliza el programa
        beq	 $t6, $s1, cambiar_dimensiones  #si la opción elegida es el 1, vamos a cambiar las dimensiones
        beq  $t6, $s2, obtener_elem         #si el numero introducido es un 2, vamos a obtener un elemento
        beq  $t6, $s3, invertir_fila    #si se escoge la opcion 3, vamos a invertir una fila
        beq  $t6, $s4, invertir_colum
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
            move $t6, $v0

            bltz $t6, error_fila        #si la fila a invertir es menor a 0
            bge $t6, $t0, error_fila    #o mayor o igual a la fila, salta el error

            move $t0, $zero         #inciamos el iterador del bucle a 0
            div $t2, $t1, $s2       # realizamos la parada del bucle en ncol/2

        # for (int i = 0; i < (Ncolumnas/2); ++i) {
        #   cambiador = A[AuxFilas * Ncolumnas + i];
        #   A[AuxFilas * Ncolumnas + i] = A[((AuxFilas * Ncolumnas) + Ncolumnas - 1) - i];
        #   A[((AuxFilas * Ncolumnas) + Ncolumnas - 1) - i] = cambiador;
        # }
            for_fila:
                beq $t0, $t2, fin_for_fila   # si i = ncol/2, salimos del bucle
                mul $t3, $t6, $t1            # fila * ncol en $t3, ya que volveremos a usarlo
                add $t4, $t3, $t0            # fila * ncol + i  lo guardamos en $t4
                mul $t4, $t4, size           # hallamos el desplazamiento
                addu $t4, $t4, $s0           # hallamos la direccion de memoria
                lw $t5, 0($t4)               # guardamos el elemento en mat[i * ncol + i] en $t5

                add $t7, $t3, $t1            # fila * ncol + ncol
                sub $t7, $t7, $s1            # (fila * ncol + ncol) - 1
                sub $t7, $t7, $t0            # [((fila * ncol + ncol) - 1) - i]
                mul $t7, $t7, size           # hallamos la posicion de memoria del ultimo elemento
                addu $t7, $t7, $s0           # posicion de memoria del elemento
                lw $t8, 0($t7)               # guardamos el elemento en la posicion en el registro $t8

                sw $t8, 0($t4)               # guardamos el ultimo valor en el primer
                sw $t5, 0($t7)               # guardamos el primer elemento en la ultima posicion

                addi $t0, 1                  # ++i  
                j for_fila                   # volvemos a realizar el bucle 
            fin_for_fila:

            j while_programa                 # volvemos a imprimir la matriz modificada

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

            move $t3, $zero                  # inicializamos el iterador i a 0 
            div $t4, $t0, $s2                # hacemos el limete del bucle en nfil/2, la mitad de la fila

            #     for (int i = 0; i < (Nfilas/2); ++i) {
            #       cambiador = A[i * Ncolumnas + AuxColum];
            #       A[i * Ncolumnas + AuxColum] = A[((Nfilas - 1 - i) * Ncolumnas) + AuxColum];
            #       A[((Nfilas - 1 - i) * Ncolumnas) + AuxColum] = cambiador;
            #     }
            #   }
            for_col:
                beq $t3, $t4, fin_for_col    # iteramos hasta que i = nfil/2
                mul $t5, $t3, $t1            # hacemos i * ncol
                add $t5, $t5, $t2            # hallamos la posicion del primer elemento (i * ncol + AuxColum)
                mul $t5, $t5, size           # hallamos el desplazamiento para llegar a dicho elemento
                addu $t5, $t5, $s0           # hallamos la posicion de memoria de dicho elemento
                lw $t6, 0($t5)               # guardamos en $t6 el primer elemento

                sub $t7, $t0, $s1            # hacemos nfil - 1
                sub $t7, $t7, $t3            # hacemos nfil - 1 - i
                mul $t7, $t7, $t1            # hacemos (nfil - 1 - i) * ncol
                add $t7, $t7, $t2            # hallamos la posicion del ultimo elemento
                mul $t7, $t7, size           # hallamos el desplazamiento para llegar a dicho elemento
                addu $t7, $t7, $s0           # hallamos la direccion de memoria en la que esta
                lw $t8, 0($t7)               # guardamos el elemento en $t8

                sw $t8, 0($t5)               # cargamos el primer elemento en la ultima posicion
                sw $t6, 0($t7)               # cargamos el ultimo elemento en la primera posicion

                addi $t3, 1                  # ++i

                j for_col                    # volvemos a empezar el bucle
            fin_for_col:

            j while_programa                 # volvemos a imprimir la matriz con la columna modificada

        fin_invertir_colum:
    fin_while_programa:

    li $v0, 4
    la $a0, msg_fin     #imprimimos el mensaje de fin de programa 
    syscall

    li $v0, 10          #finalizamos el programa
    syscall 
