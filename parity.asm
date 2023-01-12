initds macro
mov ax,data 
mov ds,ax
endm

init8255 macro
mov al,cw
mov dx,cr
out dx,al
endm

inpb macro
mov dx,pb
in al,dx
endm

outpa
mov dx,pa
out dx,al
endm

exit macro
mov ah,4ch
int 21h
endm

data segment
pa equ 0dc50h
pb equ 0dc51h
pc equ 0dc52h
cr equ 0dc53h
cw db 82h
date ends

code segment
initds
init8255
inpb

mov bl,al
mov bh,00
mov cx,8
nextbit:ror al,1
jnc next
inc bh
next:loop nextbit
mov al,bl
or al,al
jpe dispff
mov al,00
disp:outpa
call delay
mov al,bh
outpa
exit
dispff:mov al,offh
jmp disp

delay proc
mov ax,0fffh
b2:mov cx,0fffh
b1:loop b1
dec ax
jnz b2
ret
delay endp
end



