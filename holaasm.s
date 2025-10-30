// --- Sección de Datos ---
// Aquí ponemos datos que no cambian, como nuestro texto.
.data

msg: .ascii "Hola desde ARM64!\n este es mi primer acercamiento wuuuu c8"   // Define nuestra cadena de texto
len = . - msg                      // El '.' es la dirección actual.
                                   // Esta línea calcula la longitud del mensaje.

// --- Sección de Código ---
// Aquí van las instrucciones
.text
.global _start                     // Hacemos '_start' visible para el enlazador (linker)

_start:
    // --- 1. Syscall: write (Escribir en consola) ---
    // Queremos llamar a: write(fd, buf, count)
    // - Número de syscall 'write' en ARM64 es 64
    // - fd (file descriptor): 1 (para stdout, la consola)
    // - buf (buffer): la dirección de nuestro mensaje 'msg'
    // - count (longitud): la longitud de nuestro mensaje 'len'

    mov x8, 64       // 64 es el número de la syscall 'write'
    mov x0, 1        // Argumento 1: 1 (stdout)
    adr x1, msg      // Argumento 2: Carga la dirección de 'msg' en x1
    mov x2, len      // Argumento 3: Carga la longitud 'len' en x2
    svc 0            // ¡Llama al kernel!

    // --- 2. Syscall: exit (Salir del programa) ---
    // Queremos llamar a: exit(code)
    // - Número de syscall 'exit' en ARM64 es 93
    // - code (código de salida): 0 (para "todo bien")
    
    mov x8, 93       // 93 es el número de la syscall 'exit'
    mov x0, 0        // Argumento 1: 0 (éxito)
    svc 0            // ¡Llama al kernel!
