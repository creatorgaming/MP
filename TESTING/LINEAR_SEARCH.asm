.MODEL TINY

.DATA

MSG1   DW "ELEMENT FOUND AT : $"
MSG2   DW "ELEMENT NOT FOUND $"
ARRAY1 DB 01H, 02H, 03H, 05H

.CODE

MOV SI, 0
MOV BX, 01H
MOV CX, 4

SEARCH:
        MOV AL, ARRAY1[SI]
        CMP AL, BL
        JZ FOUND
        INC SI
        CMP CX, 01H
        JZ NOTFOUND
        LOOP SEARCH

FOUND:
        MOV DX, OFFSET MSG1
        MOV AH, 09H
        INT 21H  
        MOV DX, SI
        ADD DX, 30H
        MOV AH, 02H
        INT 21H
        JMP EXIT        

NOTFOUND:
        MOV DX, OFFSET MSG2
        MOV AH, 09H
        INT 21H              


EXIT:
     .EXIT
END