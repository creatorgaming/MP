.model tiny
.data
    
msg dw "the array is: $"    
msg2 dw "the subtracted array is: $"
array1 db 48,49,50,51
array2 db 52,53,54,55

.code

mov dx, offset msg
mov ah , 09h
int 21h

mov si, offset array1
mov cx, 4      

X:
 mov dl, [si]
 mov ah, 02h
 int 21h
 inc si
 loop X
 
mov si, offset array2      
mov cx, 4      

Y:
 mov dl, [si]
 mov ah, 02h
 int 21h
 inc si
 loop Y  
 

mov dl, 10          ;10 is ASCII code for newline
mov ah , 02h
int 21h

mov dx, offset msg2
mov ah , 09h
int 21h


mov di , offset array2
mov si, offset array1
mov cx, 4 

Z:
 mov dl, [si]
 sub dl, [di]      
 mov ah,02h
 int 21h
 inc si
 inc di
 loop Z

.exit
end


