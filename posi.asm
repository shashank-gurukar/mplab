data segment
a db 50h
b db ?
data ends
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
mov al,a
rol al,1
jc l1
mov b,01h
l1:mov b,02h
   jmp l2
l2:int 3
   code ends
   end begin