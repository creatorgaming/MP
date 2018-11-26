.model tiny
.data
array db 5,6,9,8
msg1 dw "-----Enter Element to Search $"
msg2 dw "-----Element Found at : $"
msg3 dw "-----Element not found $"

.code
lea dx,msg1
mov ah,09H
int 21H

mov ah,01H
int 21H
sub al,30H
mov bl,al

lea si,array
cld
mov cl,04H

SEARCH:
    lodsb
    cmp bl,al
    jz FOUND
    LOOP SEARCH
        
mov bh,0H        
cmp bh,cl
jz NOTFOUND
    
FOUND PROC
    lea dx,msg2
    mov ah,09H
    int 21H
    mov bh,04H
    sub bh,cl  
    mov dl,bh
    add dl,30H
    mov ah,02H
    int 21H
    mov cl,0H  
    ENDP
    

NOTFOUND PROC
    lea dx,msg3
    mov ah,09H
    int 21H
    ENDP
              
.exit
end