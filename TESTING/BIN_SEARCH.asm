.MODEL TINY

.DATA

MSG1   DW "ELEMENT FOUND AT : $"
MSG2   DW "ELEMENT NOT FOUND $"
ARRAY1 DB 01H, 02H, 03H, 04H, 05H
START DW ?
END DW ?

.CODE

MOV BX, 06H
PUSH BX

MOV AX, 0H
MOV START, AX

MOV BX, 04H
MOV END, BX 

MOV CL, 02H

SEARCH:   
        CMP BX, AX
        JL NOTFOUND
        ADD AX, BX
        DIV CL   
        CBW
        MOV SI, AX        
        MOV AL, ARRAY1[SI]
        ;CBW             
        POP DX
        CMP AL, DL
        PUSH DX
        JZ FOUND
        JL LESSER
        JG GREATER

FOUND:
        MOV DX, OFFSET MSG1
        MOV AH, 09H
        INT 21H  
        MOV DX, SI
        ADD DX, 30H
        MOV AH, 02H
        INT 21H
        JMP EXIT 
        
LESSER:
        MOV DX, SI
        INC DX
        MOV AX, DX
        MOV START, AX
        MOV BX, END
        JMP SEARCH        

GREATER:
        MOV DX, SI
        DEC DX
        MOV BX, DX
        MOV AX, START
        MOV END, BX
        JMP SEARCH        
               

NOTFOUND:
        MOV DX, OFFSET MSG2
        MOV AH, 09H
        INT 21H              


EXIT:
     .EXIT
END