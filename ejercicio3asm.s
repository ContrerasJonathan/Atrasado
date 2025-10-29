/*
 * Autor: [TU NOMBRE COMPLETO]
 * Desc: (ASM) Pares [2, 48].
 */
.text
.section .rodata
    titulo_str:
        .string "--- Ejercicio 3 (Ensamblador): Pares 2-48 ---\n"
    formato_str:
        .string "%d "

.text
.global main
main:
    stp x19, x30, [sp, #-32]!
    mov x29, sp

    ldr x0, =titulo_str
    bl  printf

    // --- Bucle ---
    mov x19, 2              // i = 2
loop_inicio:
    cmp x19, 48             // if (i > 48)
    b.gt loop_fin           //   goto loop_fin

    // printf("%d ", i)
    ldr x0, =formato_str
    mov x1, x19
    bl  printf

    add x19, x19, 2         // i = i + 2 (para saltar al siguiente par)
    b   loop_inicio
loop_fin:
    mov x0, '\n'
    bl  putchar

    mov x0, 0
    ldp x19, x30, [sp], #32
    ret
