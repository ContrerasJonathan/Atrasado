/*
 * =====================================================================================
 *
 * Filename:  ejercicio4asm.s
 *
 * Description:  (ASM) Recíprocos [1, 30]. (Versión 100% Corregida y Definitiva)
 *
 * =====================================================================================
 */

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
    // Guardar x19 (nuestro contador 'i') y x30 (Link Register)
    stp x19, x30, [sp, #-32]!
    mov x29, sp

    // --- Imprimir Títulos ---
    ldr x0, =titulo_str
    bl printf
    ldr x0, =header_str
    bl printf

    // --- Inicializar Bucle ---
    mov x19, 1  // i = 1

loop_inicio:
    // --- Condición: if (i > 30) saltar ---
    cmp x19, 30
    b.gt loop_fin

    // --- Cuerpo del Bucle: Calcular y Preparar ---

    // 1. Cargar 1.0 en d1 (DEBE estar DENTRO del bucle)
    //    printf corrompe d0-d7, por eso recargamos en cada iteración.
    ldr d1, =const_1_0

    // 2. Convertir 'i' (entero en x19) a 'i' (double en d0)
    scvtf d0, x19

    // 3. Calcular 1.0 / i (flotante)
    //    d0 = d1 / d0   (ej: 1.0 / 26.0)
    fdiv d0, d1, d0

    // 4. Preparar argumentos para printf(formato_str, i, reciproco)
    ldr x0, =formato_str  // Arg 1: Puntero al formato
    mov x1, x19           // Arg 2: Entero 'i' (va en x1)
    // Arg 3: Recíproco (ya está en d0)
    bl printf

    // --- Incremento: i++ ---
    add x19, x19, 1
    b loop_inicio

loop_fin:
    // Imprimir una nueva línea para limpiar
    mov x0, '\n'
    bl putchar

    // --- Epílogo ---
    mov x0, 0  // Código de retorno 0
    // Restaurar x19 y x30
    ldp x19, x30, [sp], #32
    ret
