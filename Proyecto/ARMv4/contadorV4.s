        .data
var_num: .word 2           @ Definimos la variable numérica del 1 al 5
text:    .asciz "Hola esto es un texto con varias palabras  #"

        .text
        .global _start

_start:
        LDR R0, =var_num
        LDR R1, [R0]        @ Cargar la variable numérica en R1

        LDR R2, =text       @ R2 apunta al inicio del texto
        MOV R5, R2          @ R5 marcará el inicio de cada palabra
        MOV R6, #0          @ R6 será el contador de vocales

loop_text:
        LDRB R3, [R2], #1   @ Cargar siguiente carácter del texto en R3
        CMP R3, #0
        BEQ end             @ Si es fin de texto, terminar
        CMP R3, #'#'
        BEQ end             @ Si es '#', terminar
        CMP R3, #' '
        BEQ process_word    @ Si es espacio, procesar palabra
        BL check_vowel      @ Verificar si el carácter es una vocal
        B loop_text

process_word:
        CMP R6, R1
        BNE reset_counters  @ Si el número de vocales no coincide, resetear y continuar
        MOV R4, R5          @ R4 recorrerá la palabra desde el inicio

replace_vowels:
        CMP R4, R2
        BGE reset_counters  @ Si llegamos al final de la palabra, resetear contadores
        LDRB R3, [R4]
        CMP R3, #'a'
        BEQ replace_char
        CMP R3, #'e'
        BEQ replace_char
        CMP R3, #'i'
        BEQ replace_char
        CMP R3, #'o'
        BEQ replace_char
        CMP R3, #'u'
        BEQ replace_char
        CMP R3, #'A'
        BEQ replace_char
        CMP R3, #'E'
        BEQ replace_char
        CMP R3, #'I'
        BEQ replace_char
        CMP R3, #'O'
        BEQ replace_char
        CMP R3, #'U'
        BEQ replace_char
        B increment_pointer

replace_char:
        MOV R7, #'*'
        STRB R7, [R4]
        B increment_pointer

increment_pointer:
        ADD R4, R4, #1      @ Avanzar al siguiente carácter en la palabra
        B replace_vowels

reset_counters:
        MOV R6, #0          @ Resetear contador de vocales
        ADD R5, R2, #1      @ Marcar el inicio de la próxima palabra
        B loop_text

check_vowel:
        CMP R3, #'a'
        BEQ increment_vowel
        CMP R3, #'e'
        BEQ increment_vowel
        CMP R3, #'i'
        BEQ increment_vowel
        CMP R3, #'o'
        BEQ increment_vowel
        CMP R3, #'u'
        BEQ increment_vowel
        CMP R3, #'A'
        BEQ increment_vowel
        CMP R3, #'E'
        BEQ increment_vowel
        CMP R3, #'I'
        BEQ increment_vowel
        CMP R3, #'O'
        BEQ increment_vowel
        CMP R3, #'U'
        BEQ increment_vowel
        BX LR

increment_vowel:
        ADD R6, R6, #1      @ Incrementar contador de vocales
        BX LR

end:
        MOV R7, #1          @ syscall: exit
        SWI 0
