initds macro
mov ax,data
mov ds,data
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

inpb macro
mov dx,pb
out al,dx
endm

exit macro
mov ah,4ch
int 21h


data segment
pa equ 0dc50h
pb equ 0dc51h
pc equ 0dc52h
cr equ 0dc53h
cw db 80h
data ends

code segment
initds
init8255
inpb

mov al,01h
mov cx ,16
up:outpa
call delay
rol al,01
loop up
exit
delay proc

mov ax,offfh
b2: mov cx,0fffh
b1: loop b1
dec ax
jnz b2
ret
delay endp
end

