data segment
a db 20h,40h,36h,10h
len db 04h
b db ?
data ends
code segment
assume cs:code, ds:data
begin:
mov ax,data
mov ds,ax
mov cl,len
lea si,a
mov al,a[si]
up:inc si
   cmp al,a[si]
   ja large
   mov al,a[si]
large: loop up
       mov b,al
       mov ah,4ch
       int 21h
code ends
end begin