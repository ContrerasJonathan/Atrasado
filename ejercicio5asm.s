
.text
.section .rodata
    titulo_str:
        .string "--- Ejercicio 5 (Ensamblador): Potencias de 2 ---\n"
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
    mov x19, 1              // potencia = 1
loop_inicio:
    cmp x19, 1000           // if (potencia > 1000)
    b.gt loop_fin           //   goto loop_fin

    // printf("%d ", potencia)
    ldr x0, =formato_str
    mov x1, x19
    bl  printf

    // potencia = potencia * 2
    // Usamos un 'shift lógico a la izquierda', que es lo mismo que * 2
    lsl x19, x19, 1         // lsl (Logical Shift Left)
    
    b   loop_inicio
loop_fin:
    mov x0, '\n'
    bl  putchar

    mov x0, 0
    ldp x19, x30, [sp], #32
    ret
