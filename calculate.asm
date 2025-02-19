global calculate
extern a ;16bit
extern b  ;16bit
extern RESULT ;32bit

section .text
calculate:

mov ax, word 25
mov bx, word 9

idiv bx
mov [RESULT], ax
ret




movsx eax, word [a]
movsx ebx,word [b]
cmp eax,ebx
je equal

cmp eax,ebx
jl less

imul eax,ebx
mov cx, 11

mov edx ,eax
shr edx, 16
cwd
idiv cx
mov [RESULT], eax
ret

equal:
mov [RESULT], word 11
ret

less:
imul eax,eax
mov edx ,eax
shr edx, 16
cwd

idiv bx 
mov [RESULT], eax
ret