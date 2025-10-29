/*
 * Autor: [TU NOMBRE COMPLETO]
 * Desc: (ASM) Impares [7, 51].
 */
.text
.section .rodata
    titulo_str:
        .string "--- Ejercicio 2 (Ensamblador): Impares 7-51 ---\n"
    formato_str:
        .string "%d "

.text
.global main
main:
    stp x19, x30, [sp, #-32]!  // Guardar x19 (contador i) y x30 (link register)
    mov x29, sp

    ldr x0, =titulo_str
    bl  printf

    // --- Bucle ---
    mov x19, 7              // i = 7
loop_inicio:
    cmp x19, 51             // if (i > 51)
    b.gt loop_fin           //   goto loop_fin

    // printf("%d ", i)
    ldr x0, =formato_str    // 1er arg: formato
    mov x1, x19             // 2do arg: i
    bl  printf

    add x19, x19, 2         // i = i + 2 (para saltar al siguiente impar)
    b   loop_inicio
loop_fin:
    mov x0, '\n'
    bl  putchar

    // --- Epílogo ---
    mov x0, 0               // Retorno 0
    ldp x19, x30, [sp], #32 // Restaurar registros
    ret
