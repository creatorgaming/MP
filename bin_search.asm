.model tiny
.data
array db 1,2,4,7,9  
msg1 dw "Array:$"
msg2 dw "Element found at:$" 
size dw 0
ele dw 07h

.code  
mov ax,5
mov size,ax
                 
mov dx,offset msg1
mov ah, 09h
int 21h

mov si, offset array   
mov cx,size

X:
 mov dl,[si] 
 add dl, 30h
 mov ah,02h
 int 21h
 inc si
 loop X 

mov dx,0Ah
mov ah,02h
int 21h
 
mov si,0h  
mov dx,0h
mov di,size
dec di
 
search: 
 mov ax,0h 
 mov dl,02h
 add ax,si
 add ax,di
 div dl  
 mov bl,al
 PUSH di 
 PUSH bx
 mov bx,offset array 
 POP di
 mov dl,[bx+di] 
 PUSH di
 POP bx
 POP di
 mov ax,ele
 cmp dx,ax
 jz found
 jg first 
 add bx,1 
 mov si,bx
 jmp search

 
found:
 mov dx,offset msg2
 mov ah,09h
 int 21h
 
 ;mov si, offset array
 ;sub bx,si
 mov dx,bx
 add dx,31h
 mov ah,02h
 int 21h
 jmp finish   
 
first:     
 sub di,1
 mov di, bx
 jmp search
     
 
finish:
.exit
END
