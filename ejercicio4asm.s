.text

.section .rodata
titulo_str:
    .string "--- Ejercicio 4 (Ensamblador): Recíprocos 1-30 ---\n"
header_str:
    .string " Num | Recíproco\n-----|-----------\n"
formato_str:
    .string " %-4d| %f\n" // Formato: printf(string, int, double)

// Constantes de punto flotante que necesitamos
const_1_0:
    .double 1.0      // El número "1.0"

.text
.global main

main:
    // --- Prólogo ---
    stp x19, x30, [sp, #-32]!  // Guardamos x19 (para el contador 'i')
    mov x29, sp

    // --- Imprimir Títulos ---
    ldr x0, =titulo_str
    bl  printf
    ldr x0, =header_str
    bl  printf

    // --- Inicializar Bucle ---
    mov x19, 1                  // i = 1 (en registro de entero x19)
    ldr d1, =const_1_0          // Carga '1.0' en el registro flotante d1

loop_inicio:
    // --- Condición: if (i > 30) saltar ---
    cmp x19, 30
    b.gt loop_fin

    // --- Cuerpo del Bucle: Calcular y Preparar ---

    // 1. Convertir 'i' (entero en x19) a 'i' (double en d0)
    //    s(igned) c(onvert) v(to) t(float) f(double)
    scvtf d0, x19

    // 2. Calcular 1.0 / i (flotante)
    //    f(loat) div(ide)
    fdiv d0, d1, d0             // d0 = d1 / d0  (d0 = 1.0 / i)
                                // 'd0' ahora tiene el resultado 'reciproco'

    // 3. Preparar argumentos para printf(formato_str, i, reciproco)
    //    Según ARM64, los argumentos van en:
    //    x0 (arg1, puntero), x1 (arg2, int), d0 (arg3, double)
    ldr x0, =formato_str        // Arg 1: Puntero al formato (en x0)
    mov x1, x19                 // Arg 2: 'i' (en x1)
                                // Arg 3: 'reciproco' (ya está en d0)
    bl  printf

    // --- Incremento: i++ ---
    add x19, x19, 1
    b   loop_inicio

loop_fin:
    mov x0, '\n'
    bl  putchar

    // --- Epílogo ---
    mov x0, 0
    ldp x19, x30, [sp], #32
    ret
