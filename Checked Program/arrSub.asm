.model tiny

.data
msg1 dw "--The Array is : $"
msg2 dw "--Result is : $"
array1 db 01H,02H,03H,04H
array2 db 03H,05H,06H,07H

.code
lea dx,msg1
mov ah,09H
int 21H

lea si,array1
cld
mov cl,04H

OUTPUT1:
    lodsb
    mov dl,al
    add dl,30H
    mov ah,02H
    int 21H
    LOOP OUTPUT1
       
lea si,array2
mov cl,04H
lea dx,msg1
mov ah,09H
int 21H                

OUTPUT2:
    lodsb
    mov dl,al
    add dl,30H
    mov ah,02H
    int 21H
    LOOP OUTPUT2
    
lea si,array1
lea di,array2
mov cl,04H
lea dx,msg2
mov ah,09H
int 21H
RESULT:
    lodsb
    mov bl,[di]
    inc di
    sub bl,al
    add bl,30H
    mov dl,bl
    mov ah,02H
    int 21H
    LOOP RESULT
        
        
.exit

end