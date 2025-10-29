# 🔢 Impresión de Enteros del 9 al 43

```c
/* ================================================================
 * Autor: Jonathan Contreras
 * Proyecto: Impresión de enteros del 9 al 43
 * Plataforma: Raspberry Pi OS (64-bit)
 * Procesador: ARM Cortex-A72
 * Descripción:
 *   Este programa imprime en la consola todos los números enteros
 *   comprendidos entre el 9 y el 43, ambos inclusive.
 *   Utiliza un bucle for para recorrer el rango y la función printf()
 *   para mostrar los valores en la salida estándar.
 *
 *   Es un ejercicio introductorio para comprender el flujo de control
 *   iterativo en C antes de trasladarlo a su equivalente en ensamblador
 *   ARM64 dentro del entorno Raspberry Pi OS.
 *
 * Herramientas:
 *   - Compilador: GCC o aarch64-linux-gnu-gcc
 *   - Editor: Nano, Thonny o Visual Studio Code (SSH)
 *   - Sistema operativo: Raspbian OS 64 bits
 *   - Librerías: stdio.h
 * Fecha: Octubre 2025
 * ================================================================ */

#include <stdio.h>

int main() {
    printf("--- Enteros del 9 al 43 ---\n");
    for (int i = 9; i <= 43; i++) {
        printf("%d ", i);
    }
    printf("\n");
    return 0; 
}
