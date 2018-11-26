.MODEL TINY

.DATA

ARRAY DB 9 DUP(?)
POWER DB ?

.CODE            

MOV CX, 8
MOV SI, 0H

INPUT:
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV ARRAY[SI], AL
        INC SI
        LOOP INPUT
        
MOV SI, 08H
MOV AL, 01H
MOV POWER, AL
                
CONVERT:
        MUL ARRAY[SI-1]
        DEC SI
        ADD DX, AX
        MOV AL, POWER
        MOV CH, 02H
        MUL CH
        MOV POWER, AL
        CMP SI, 0H
        JNZ CONVERT
        


MOV AH, 02H
INT 21H
        
                        
.EXIT
END 