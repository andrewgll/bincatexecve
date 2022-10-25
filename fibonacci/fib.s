global      _start
extern      printf,scanf
section     .bss
userInput   resb 1
section     .data
message     db  "Fibonacci Sequence",0x0a, "Please input max Fn", 0x0a
outFormat   db  "%d",0xa,0x00
inFormat    db  "%d",0x00
section     .text
_start:
    call printMessage
    call getInput
    call initFib
    call loopFib
    call exit
getInput:
    mov     rdi, inFormat
    mov     rsi, userInput
    sub     rsp, 8
    call    scanf
    add     rsp, 8
    ret
printMessage:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, message
    mov     rdx, 19 
    syscall
    ret
initFib:
    xor     rax, rax
    xor     rbx, rbx
    inc     rbx
    ret
loopFib:
    call    printFib
    add     rax, rbx
    xchg    rax, rbx
    cmp     rbx, [userInput]
    js      loopFib
    ret
printFib:
    push    rax
    push    rbx
    mov     rdi, outFormat
    mov     rsi, rbx
    call    printf
    pop     rbx
    pop     rax
    ret
exit:
    mov     rax, 60
    mov     rdi, 0
    syscall
