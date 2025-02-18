global print

section .bss
char_msg resq 1
char resb 1
section .data


section .text
print:
	mov [char_msg], rdi
	xor rbx,rbx
	while:
	mov rax,  [char_msg]
	add rax, rbx

	cmp [rax],  byte 0 ; провекряе есть ли терминатор сивол 0 в аски
	je endwhile
	
	mov rsi, rax
	mov rdx, 1
	call stdout
	inc rbx
	jmp while
	
	endwhile:
	mov rax, rbx
	ret
	
	stdout:
	mov rdi, 1
	mov rax, 1
	syscall
	ret