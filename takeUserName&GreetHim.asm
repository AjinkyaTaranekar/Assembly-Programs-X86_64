section .bss
	buffer resb 64
	buffer_len resq 1
section .data
	ma db "Hello, "
	lena equ $ - ma
	mb db "Hello,what is your name?",10
	lenb equ $ - mb
	mc db " welcome to assembly language",10
	lenc equ $ -mc
section .text
global _start
_start:
        mov rax,1 ;Print welcome msg
        mov rdi,1
        mov rsi, mb
	mov rdx,lenb
        syscall

	mov rax, 0 ;Take user input
	mov rdi, 0
	mov rsi, buffer
	mov rdx,64
	syscall

	mov [buffer_len],rax

	mov rax,1 ;Print hello
	mov rdi,1
	mov rsi,ma
	mov rdx,lena
	syscall

	mov rax,1
	mov rdi,1
	mov rsi,buffer
	mov rdx, [buffer_len]
	syscall

	mov rax,1 ;Print welcome string
	mov rdi,1
	mov rsi,mc
	mov rdx,lenc
	syscall

	mov rax, 60 ;Exit
	mov rdi, 0
	syscall
