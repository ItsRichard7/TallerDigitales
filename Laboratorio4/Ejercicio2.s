    .section .text
    .global _start

_start:
    MOV R0, #10         @ Número de Fibonacci deseado
    MOV R1, #0          @ Inicializar el primer número de Fibonacci (F(0))
    MOV R2, #1          @ Inicializar el segundo número de Fibonacci (F(1))

fib_loop:
    CMP R0, #0          @ Comprobar si hemos alcanzado el final de la secuencia
    BEQ end_fib         @ Si sí, salir del bucle

    MOV R3, R1          @ Guardar el valor actual de F(n-1)
    ADD R1, R1, R2      @ Calcular F(n) = F(n-1) + F(n-2)
    MOV R2, R3          @ Mover el valor anterior de F(n-1) a F(n-2)

    SUB R0, R0, #1      @ Decrementar el contador
    B fib_loop          @ Volver al inicio del bucle

end_fib:
    @ Aquí puedes agregar código para mostrar o almacenar el resultado
    @ En este ejemplo, simplemente terminamos el programa
    MOV R7, #1          @ Código de salida para terminar el programa
    SWI 0               @ Llamar al sistema para salir


	