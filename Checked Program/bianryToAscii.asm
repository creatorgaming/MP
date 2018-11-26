.model tiny
.data
array db 8 dup(?) 
power db ?

.code
mov si,0
mov cl,8
mov dx,0

ENTER:
mov ah,01H
int 21h
sub al,30H
mov array[si],al
inc si
LOOP ENTER

mov si,08H
mov al,01H
mov power,al

DECIMAL:
mul array[si-1]
dec si
mov bx,ax
add dx,bx
mov al,power
mov ch,02H
mul ch    
mov power,al
cmp si,0H
jnz DECIMAL
         
         
mov ah,02H
int 21H


.exit    
end

