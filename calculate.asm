global calculate
extern a ;16bit
extern b  ;16bit
extern RESULT ;32bit

section .data
	error_massage db "***ERROR! На ноль делить нельзя!!!***",10
	error_massage_size equ ($-error_massage)
	
section .text
calculate:
movsx rax, word [a]
movsx rbx, word [b]
cmp rax,rbx
je equal

cmp eax,ebx
jl less

imul rax,rbx
mov rcx, 11
mov rdx ,rax
movsx rax, eax ; в регистре оставляем ее младшую половину, старшую кидаем в rdx
sar rdx, 32 ;; аривметическое смещение вправо на половину регистра (32 бита)
idiv rcx
mov [RESULT], eax
ret

equal:
mov [RESULT], dword 11
ret

less:
cmp rbx, 0
je err
imul rax, rax ; a*a
xor rdx, rdx ; rdx=0
mov rdx ,rax; rdx=rax
movsx rax, eax ; в регистре оставляем ее младшую половину, старшую кидаем в rdx
sar rdx, 32 ; аривметическое смещение вправо на половину регистра (32 бита)
idiv rbx 
mov [RESULT], eax
ret

err: 
	mov rsi, error_massage
	mov rdx, error_massage_size
	call stdout
	ret

stdout:
	mov rdi, 1
	mov rax, 1
	syscall
	ret