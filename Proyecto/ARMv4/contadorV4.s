        .data
var_num: .word 3            @ Definimos la variable numérica del 1 al 5
text:    .asciz "Hola esto es un texto con varias palabras"

        .bss
buffer:  .space 256         @ Buffer para almacenar palabra actual

        .text
        .global _start

_start:
        LDR R0, =var_num
        LDR R1, [R0]        @ Cargar la variable numérica en R1

        LDR R2, =text
        LDR R3, =buffer

loop_text:
        LDRB R4, [R2], #1   @ Cargar siguiente carácter del texto en R4
        CMP R4, #0
        BEQ end             @ Si es fin de texto, terminar
        CMP R4, #' '
        BEQ process_word    @ Si es espacio, procesar palabra
        STRB R4, [R3], #1   @ Almacenar carácter en buffer
        B loop_text

process_word:
        STRB R4, [R3], #1   @ Almacenar espacio en buffer
        MOV R3, #0
        LDR R5, =buffer

count_vowels:
        LDRB R6, [R5], #1   @ Cargar siguiente carácter de la palabra en R6
        CMP R6, #0
        BEQ compare_vowels  @ Si es fin de palabra, comparar vocales
        CMP R6, #'a'
        BEQ increment_vowel
        CMP R6, #'e'
        BEQ increment_vowel
        CMP R6, #'i'
        BEQ increment_vowel
        CMP R6, #'o'
        BEQ increment_vowel
        CMP R6, #'u'
        BEQ increment_vowel
        CMP R6, #'A'
        BEQ increment_vowel
        CMP R6, #'E'
        BEQ increment_vowel
        CMP R6, #'I'
        BEQ increment_vowel
        CMP R6, #'O'
        BEQ increment_vowel
        CMP R6, #'U'
        BEQ increment_vowel
        B count_vowels

increment_vowel:
        ADD R3, R3, #1      @ Incrementar contador de vocales
        B count_vowels

compare_vowels:
        CMP R3, R1
        BNE reset_buffer    @ Si no coincide con la variable, resetear buffer

replace_vowels:
        LDR R5, =buffer
replace_loop:
        LDRB R6, [R5], #1
        CMP R6, #0
        BEQ reset_buffer    @ Si es fin de palabra, resetear buffer
        CMP R6, #'a'
        BEQ replace_char
        CMP R6, #'e'
        BEQ replace_char
        CMP R6, #'i'
        BEQ replace_char
        CMP R6, #'o'
        BEQ replace_char
        CMP R6, #'u'
        BEQ replace_char
        CMP R6, #'A'
        BEQ replace_char
        CMP R6, #'E'
        BEQ replace_char
        CMP R6, #'I'
        BEQ replace_char
        CMP R6, #'O'
        BEQ replace_char
        CMP R6, #'U'
        BEQ replace_char
        B replace_loop

replace_char:
        MOV R7, #'*'
        STRB R7, [R5, #-1]  @ Reemplazar por '*'
        B replace_loop

reset_buffer:
        LDR R3, =buffer     @ Resetear buffer
        MOV R7, #0
        STRB R7, [R3]       @ Colocar fin de cadena
        B loop_text

end:
        MOV R7, #1          @ syscall: exit
        SWI 0
