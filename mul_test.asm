.model tiny
.code      

mov ax,40h
mov bx,40
mul bx     

aam     
        
mov cl, al
mov ch, ah        
        
mov dl,ch
add dl,30H
mov ah,02h
int 21h 

mov dl,cl
add dl,30H
mov ah,02h
int 21h 

.exit
end