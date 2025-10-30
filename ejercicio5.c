
#include <stdio.h>

int main() {
    printf("--- Ejercicio 5: Potencias de 2 (<= 1000) ---\n");
    
    int potencia = 1; // Inicia en 2^0

    // Bucle 'while': se ejecuta mientras la condición sea verdadera
    while (potencia <= 1000) {
        printf("%d ", potencia);
        potencia = potencia * 2; // Calcula la siguiente potencia
    }
    
    printf("\n");
    return 0;
}
