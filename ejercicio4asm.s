.text

.section .rodata
titulo_str:
    .string "--- Ejercicio4 (Ensamblador): Recíprocos 1-30 ---\n"
header_str:
    .string " Num | Recíproco\n-----|-----------\n"
formato_str:
    .string " %-4d| %f\n"

const_1_0:
    .double 1.0

.text
.global main

main:
    // --- Prólogo ---
    stp x19, x30, [sp, #-32]!
    mov x29, sp

    // --- Imprimir Títulos ---
    ldr x0, =titulo_str
    bl printf
    ldr x0, =header_str
    bl printf

    // --- Inicializar Bucle ---
    mov x19, 1
    ldr d1, =const_1_0

loop_inicio:
    // --- Condición: if (i > 30) saltar ---
    cmp x19, 30
    b.gt loop_fin

    // --- Cuerpo del Bucle: Calcular y Preparar ---

    // 1. Convertir 'i' (entero en x19) a 'i' (double en d0)
    scvtf d0, x19

    // 2. Calcular 1.0 / i (flotante)
    fdiv d0, d1, d0

    // 3. Preparar argumentos para printf(formato_str, i, reciproco)
    ldr x0, =formato_str
    mov x1, x19
    // Arg 3 (d0) ya está listo
    bl printf

    // --- Incremento: i++ ---
    add x19, x19, 1
    b loop_inicio

loop_fin:
    mov x0, '\n'
    bl putchar

    // --- Epílogo ---
    mov x0, 0
    ldp x19, x30, [sp], #32
    ret
