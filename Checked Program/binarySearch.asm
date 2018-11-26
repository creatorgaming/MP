.model tiny
.data
array db 0H,1H,3H,8H,9H 
msg1 dw "----Enter the element to search$"
msg2 dw "----Element found at $"
msg3 dw "----Element not found$" 
start dw ?
end dw ?

.code
lea dx,msg1
mov ah,09H
int 21H

mov al, 01h

mov bl,al

PUSH bx

mov ax,0H
mov start ,ax

mov bx, 04H  
mov end,bx

mov cl,02H

SEARCH:
    add ax,bx
    div cl
    mov ch,al
    cbw   
    mov si,ax
    mov al, array[si]
    cbw
    POP dx
    cmp ax,dx 
    PUSH dx
    jz FOUND
    jl LESS
    jg GREAT 
    

FOUND:
   lea dx,msg2
   mov ah,09H
   int 21H
   
   add ch,30H
   mov ah,02H
   mov dl,ch
   int 21H 
   .exit 
   
LESS:
    mov dl,ch
    mov dh,00H
    inc dx
    mov ax,dx
    mov start,ax
    mov bx,end
    jmp SEARCH
    
GREAT:
    mov dl,ch
    mov dh,00H
    dec dx
    mov bx,dx
    mov end,bx
    mov ax,start
    jmp SEARCH
    
    
.exit
end
