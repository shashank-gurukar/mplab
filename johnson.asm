initds
macro ax,data
mov ds,ax
endm

init8255 macro
mov al,cw
mov dx,cr
out dx,al
endm

outpa macro
mov dx,pa
out dx,al
endm


data segment
pa equ 0dc50h
pb equ 0dc51h
pc equ 0dc52h
cr dw 0dc53h
cw db 80h
data ends

code segment
initds
init8255


mov al,00h
mov cx,16
up:outpa
call delay
rol al,01
xor al,01h
loop up
exit
delay proc
mov bx,0fffh
b2: mov cx,0fffh
b1: loop b1
dec bx
jnz b2
ret delay 
endp
end


