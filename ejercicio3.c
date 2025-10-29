/*
 * Autor: [TU NOMBRE COMPLETO]
 * Desc: Imprime los pares en el rango [2, 48].
 */
#include <stdio.h>

int main() {
    printf("--- Ejercicio 3: Pares del 2 al 48 ---\n");
    
    // Bucle 'for': inicia en 2, termina en 48, salta de 2 en 2
    for (int i = 2; i <= 48; i += 2) {
        printf("%d ", i);
    }
    
    printf("\n");
    return 0; 
}
