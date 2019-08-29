default rel

%define SYSCALL_WRITE 0x2000004
%define SYSCALL_EXIT  0x2000001
%define SYSCALL_READ  0x2000003

SECTION .bss
    num1 resb 1
    result resb 2

SECTION .data
    prompt db "Input a number "
    promptlen equ $ - prompt

    message db "Number Entered is: "
    msglen equ $ - message 


SECTION .text

    global _start

_start:

    mov rax, SYSCALL_WRITE
    mov rdi, 1
    mov rsi, prompt
    mov rdx, promptlen
    syscall

    mov rax, SYSCALL_READ
    mov rdi, 0
    mov rsi, num1
    mov rdx, 1
    syscall


    mov r8, [num1]
    sub r8, '0'

    mov [result], r8

    mov rax, SYSCALL_WRITE
    mov rdi, 1
    mov rsi, message
    mov rdx, msglen
    syscall

    mov rax, SYSCALL_WRITE
    mov rdi, 1
    mov rsi, result
    mov rdx, 2
    syscall

    mov rax, SYSCALL_EXIT
    mov rdi, 0
    syscall
