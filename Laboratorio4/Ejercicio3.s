.section .data

matrix1:
    .word 1, 2, 3, 4
    .word 5, 6, 7, 8
    .word 9, 10, 11, 12
    .word 13, 14, 15, 16

matrix2:
    .word 16, 15, 14, 13
    .word 12, 11, 10, 9
    .word 8, 7, 6, 5
    .word 4, 3, 2, 1

result:
    .space 64   @ Espacio para la matriz de resultado

.section .text
.global main

main:
    @ Cargar las direcciones de las matrices en los registros
    ldr r0, =matrix1
    ldr r1, =matrix2
    ldr r2, =result

    @ Iterar sobre todas las filas y columnas para sumar las matrices
    mov r6, #0       @ Índice de fila
outer_loop:
    cmp r6, #4       @ Comprobar si hemos alcanzado el final de las filas
    beq end_outer    @ Si sí, salir del bucle exterior
    mov r5, #0       @ Índice de columna
inner_loop:
    cmp r5, #4       @ Comprobar si hemos alcanzado el final de las columnas
    beq end_inner    @ Si sí, salir del bucle interior
    ldr r3, [r0], #4 @ Cargar el elemento de la matriz 1
    ldr r4, [r1], #4 @ Cargar el elemento de la matriz 2
    add r7, r3, r4   @ Sumar los elementos
    str r7, [r2], #4 @ Guardar el resultado en la matriz resultado
    add r5, #1       @ Incrementar el índice de columna
    b inner_loop     @ Volver al bucle interior
end_inner:
    add r6, #1       @ Incrementar el índice de fila
    b outer_loop     @ Volver al bucle exterior
end_outer:
    @ Terminar el programa
    mov r7, #1
    swi 0
