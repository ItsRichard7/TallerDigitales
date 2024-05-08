.global _start

.equ ARRAY_SIZE, 10
.equ Y_CONSTANT, 5

_start:
    @ Inicializar el arreglo
    ldr r1, =array            @ Dirección base del arreglo
    ldr r2, =ARRAY_SIZE       @ Tamaño del arreglo
    mov r3, #0                @ Inicializar contador i a 0
init_loop:
    cmp r3, r2                @ Comprobar si hemos alcanzado el final del arreglo
    bge end_init              @ Si hemos terminado, salir del bucle
    ldr r4, [r1, r3, lsl #2]  @ Cargar el valor actual del arreglo en r4
    ldr r5, =Y_CONSTANT       @ Cargar la constante Y_CONSTANT en r5
    cmp r4, r5                @ Comparar el valor del elemento con la constante
    movge r6, r4, lsl #0      @ Si el valor del elemento es mayor o igual, multiplicar
    movlt r6, r4, lsl #0      @ Si el valor del elemento es menor, sumar
    str r6, [r1, r3, lsl #2]  @ Almacenar el nuevo valor en el arreglo
    add r3, r3, #1            @ Incrementar el contador i
    b init_loop               @ Volver al inicio del bucle

end_init:

    bx lr                     @ Salir de la función

.data
array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  @ Arreglo inicial
	