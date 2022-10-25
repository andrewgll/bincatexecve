; simplest helloworld in asm, I should also write it in shellcode without NULL-bytes
global      _start
section     .data
message db  "Hello World!",0xa
length  equ $-message
section     .text
_start:
    xor     rax,rax
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, message
    mov     rdx, length
    syscall
    mov     rax, 60
    mov     rdi, 0
    syscall

