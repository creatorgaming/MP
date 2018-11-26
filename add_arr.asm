.model tiny
.data
    
msg dw "the array is: $"    
msg2 dw "the added array is: $"
array1 db 48,49,50,51
array2 db 52,53,54,55   

.code
                    
                    ;To Print Message                    
mov dx, offset msg  ;Put Message in dx
mov ah , 09h        ;Set AH to output string
int 21h             ;This line is used to print string on console

mov si, offset array1
mov cx, 4                   ;loop will run 4 times

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
 mov ah, 02h           ;Set AH to output character
 int 21h
 inc si
 loop Y  
 

mov dl, 10
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
 add dl, [di]      
 mov ah,02h
 int 21h
 inc si
 inc di
 loop Z

.exit
end


