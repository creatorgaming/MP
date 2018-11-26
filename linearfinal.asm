.model tiny
.data
    
msg dw "the array is: $"   
msg2 dw " the element found at:$" 
msg3 dw " the element not found $"

array1 db 4h,1h,2h,3h
  

.code   

mov dx, offset msg
mov ah , 09h
int 21h

mov si, offset array1
mov cx, 4      

X:
 mov dl, [si]
 mov ah, 02h
 add dl, 30h
 int 21h
 inc si
 loop X

mov si, 0
mov cx, 4 

Z:
 cmp array1[si],4h
 jz success
 inc si
 cmp cx,1
 jz fail
 loop z
      
        
success:
        mov dx, offset msg2
        mov ah , 09h
        int 21h 
        mov dx , si
        add dx,30h  
        mov ah, 02h
        int 21h
        jmp c 

fail:
     mov dx, offset msg3
     mov ah , 09h
     int 21h 

c:    
  .exit
end


