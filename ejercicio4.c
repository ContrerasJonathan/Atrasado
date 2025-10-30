#include <stdio.h>

int main() {
    printf("--- Ejercicio 4: Enteros 1-30 y sus Recíprocos ---\n");
    printf(" Num | Recíproco\n");
    printf("-----|-----------\n");

    for (int i = 1; i <= 30; i++) {

        // ¡Importante! Usamos '1.0' (un double) en lugar de '1' (un int).
        // Esto fuerza a C a hacer una división de punto flotante.
        double reciproco = 1.0 / i; 

        // %-4d: alinea el entero (4 espacios, a la izquierda)
        // %f: imprime el flotante/double
        printf(" %-4d| %f\n", i, reciproco);
    }

    printf("\n");
    return 0; // Termina el programa
}
