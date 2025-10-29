/*
 * =====================================================================================
 *
 * Filename:  ejercicio1_asm.s
 *
 * Description:  Imprime los enteros del 9 al 43. (Versión Ensamblador ARM64)
 * Autor(a):     [TU NOMBRE COMPLETO]
 *
 * =====================================================================================
 */

.text // Inicio de la sección de código

// --- Strings que necesitamos (solo-lectura) ---
.section .rodata
titulo_str:
    .string "--- Ejercicio 1 (Ensamblador): Enteros 9-43 ---\n"
formato_str:
    .string "%d " // El string de formato para printf: "un-número seguido-de-un-espacio"


// --- Código principal ---
.text
.global main // Hacemos 'main' visible para el enlazador (linker)

main:
    // --- Prólogo: Guardar el estado de la pila ---
    // Guardamos x19 (que usaremos para nuestro contador 'i') y x30 (el Link Register)
    stp x19, x30, [sp, #-32]!
    mov x29, sp

    // --- Imprimir el título ---
    ldr x0, =titulo_str     // x0 = Puntero al string de título (1er argumento de printf)
    bl  printf              // Llama a la función 'printf'

    // --- Inicializar el bucle ---
    // Usaremos el registro x19 para nuestro contador 'i'
    mov x19, 9              // i = 9

loop_inicio:
    // --- Condición del bucle: if (i > 43) saltar al final ---
    cmp x19, 43             // Compara i con 43
    b.gt loop_fin           // Salta a 'loop_fin' si 'i' es MAYOR QUE (Greater Than) 43

    // --- Cuerpo del bucle: printf("%d ", i) ---
    ldr x0, =formato_str    // x0 = Puntero al string de formato (1er argumento)
    mov x1, x19             // x1 = i (nuestro contador en x19) (2do argumento)
    bl  printf              // Llama a printf(formato_str, i)

    // --- Incremento: i++ ---
    add x19, x19, 1         // i = i + 1

    // --- Volver al inicio del bucle ---
    b   loop_inicio

loop_fin:
    // --- Imprimir un salto de línea final ---
    // (printf("\n"))
    mov x0, '\n'            // x0 = carácter de nueva línea
    bl  putchar             // Llama a 'putchar' (más simple que printf para un solo carácter)

    // --- Epílogo: Restaurar la pila y retornar ---
    mov x0, 0               // Valor de retorno de main = 0 (éxito)
    ldp x19, x30, [sp], #32 // Restaura x19 y x30 del stack
    ret                     // Retorna de la función 'main'
