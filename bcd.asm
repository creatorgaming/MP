.model tiny  

.code   

mov AX,5678H
mov BX,5678H
mov CX,5678H
mov DX,5678H    

add AL,BL
daa   
mov BL,AL

adc AH,BH
mov AL,AH
daa
mov BH,AL

adc CL,DL
mov AL,CL
daa
mov CL,AL

adc CH,DH
mov AL,CH
daa
mov CH,AL

jc Carry

C:
mov DX,CX  

DISP PROC
    

PUSH CX
mov CL, 4
mov CH, 8

D1:
  ROL DX, CL
  PUSH DX
  AND DL, 0FH
  add DL , 30H
  CMP DL, '9'
  
  JBE D2
  add DL , 7H
  
D2:
  mov AH, 02H
  INT 21H
  POP DX 
  DEC CH 
  cmp ch,04h
  je CHC
  cmp ch,0h
  JNZ D1
  POP CX
  RET
  DISP ENDP
      
.exit 
Carry:mov AH, 02H
      mov DL, 1
      add DL,30H
      INT 21H  
      JMP C   
      
CHC: mov dx,bx
    jmp D1 

end