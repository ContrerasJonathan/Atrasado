#include <stdio.h>

int main() {
    printf("--- Ejercicio 2: Impares del 7 al 51 ---\n");
    
    // Bucle 'for': inicia en 7, termina en 51, salta de 2 en 2
    for (int i = 7; i <= 51; i += 2) {
        printf("%d ", i);
    }
    
    printf("\n");
    return 0
