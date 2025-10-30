

.section .rodata
titulo_str:
    .string "--- Ejercicio 4 (Ensamblador): Recíprocos 1-30 ---\n"
header_str:
    .string " Num | Recíproco\n-----|-----------\n"
formato_str:
    .string " %-4d| %f\n"

// Constante 1.0 para el cálculo del recíproco
const_1_0:
    .double 1.0

.text
.global main

main:
    // --- Prólogo ---
    stp x19, x30, [sp, #-32]!     // Guarda x19 y x30
    mov x29, sp

    // --- Imprimir títulos ---
    ldr x0, =titulo_str
    bl printf
    ldr x0, =header_str
    bl printf

    // --- Inicializar contador ---
    mov x19, 1                    // i = 1

loop_inicio:
    // Condición: si i > 30, salir del bucle
    cmp x19, 30
    b.gt loop_fin

    // --- Cargar 1.0 en d1 correctamente desde memoria ---
    adrp x9, const_1_0
    add x9, x9, :lo12:const_1_0
    ldr d1, [x9]

    // --- Convertir entero a doble ---
    scvtf d0, x19

    // --- Calcular recíproco: d0 = 1.0 / i ---
    fdiv d0, d1, d0

    // --- Imprimir resultado ---
    ldr x0, =formato_str          // Formato
    mov x1, x19                   // Entero i
    // d0 ya contiene el valor flotante
    bl printf

    // --- Incrementar contador ---
    add x19, x19, 1
    b loop_inicio

loop_fin:
    // Imprimir salto de línea final
    mov x0, '\n'
    bl putchar

    // --- Epílogo ---
    mov x0, 0
    ldp x19, x30, [sp], #32
    ret
