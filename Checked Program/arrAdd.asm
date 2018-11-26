.model tiny
.data
msg dw " --- The array is : $"
msg1 dw "---Result is : $"
array1 db 1H,2H,3H,4H
array2 db 2H,3H,4H,5H 

.code

mov ah, 09H
lea dx,msg
int 21H

mov cl, 04H
lea si,array1
cld

OUTPUT1:
    lodsb
    mov ah,02H
    add al,30H
    mov dl,al
    int 21H
    loop OUTPUT1
         

lea si,array2
mov cl,04H

lea dx,msg
mov ah,09H
int 21H     
         
OUTPUT2:
    lodsb
    mov ah,02H
    add al,30H
    mov dl,al
    int 21H
    loop OUTPUT2

lea dx,msg1
mov ah,09H
int 21H

mov cl,04H    
lea si,array1
lea di,array2

RESULT:
    lodsb
    mov bl,[di]
    add al,bl
    inc di
    mov ah,02H
    add al,30H
    mov dl,al
    int 21H
    LOOP RESULT
    
    
            
     
     
.exit 
end

