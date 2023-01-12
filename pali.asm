data segment
st1 db 'anaa','$'
st2 db '--palindrome','$'
st3 db '--not a palindrome','$'
data ends
code segment
assume ds:data,cs:code
begin:
mov ax,data
mov ds,ax        

main proc
        call palin
        mov ah,4ch
        int 21h
main endp
palin proc
        mov si,offset st1

        loop1:mov al,[si]
              cmp al,'$'
              je label1
              inc si
              jmp loop1

        label1:mov di,offset st1
               dec si

        label2:cmp si,di
               jl op1
               mov al,[di]
               mov bl,[si]
               cmp al,bl
               jne op2
               dec si
               inc di
               jmp label2

        op1:lea dx,st1
            mov ah,09h
            int 21h
            lea dx,st2
            mov ah,09h
            int 21h
            ret
        op2:lea dx,st1
            mov ah,09h
            int 21h
            lea dx,st3
            mov ah,09h
            int 21h
            ret

        palin endp
        code ends
        end begin