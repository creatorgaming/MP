.model tiny
.data
array db 8 dup(?)

.code
mov si,0H
mov al,'x'
mov bl,02H

DIVIDE:
    div bl
    mov array[si],ah
    inc si
    mov ah,0H
    cmp al,0H
    jz FINISH
    jnz DIVIDE
    
FINISH:
    mov dl,array[si-1]
    add dl,30H
    mov ah,02H
    int 21H
    cmp si, 0H
    dec si
    jnz FINISH 
    .exit    
    
    
end     
