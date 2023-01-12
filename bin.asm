data segment

a dw 1000h, 2000h, 3000h, 4000h, 5000h

len dw ($-a)/2 
key dw 2890h
msg1 db "Key found at "
res db" th Position ",13,10,"$"
msg2 db "Key not found$"
data ends
code segment
assume cs: code, ds: data
begin:
mov ax, data
mov ds, ax
mov bx,00
mov dx,len 
mov cx, key
rpt:cmp bx,dx 
    ja fail
    mov ax, bx
    add ax,dx
    shr ax,1 
    mov si, ax
    add si,si
    cmp cx,a[si] 
    jae big
    dec ax 
    mov dx, ax
    jmp rpt
big: je success

inc ax

mov bx, ax

jmp rpt

success: add al,01 
add al, '0'

mov res, al

lea dx, msg1

jmp disp
fail:lea dx, msg2

disp: mov ah,09h

int 21h

mov ah, 4ch

int 21h

code ends 
end begin