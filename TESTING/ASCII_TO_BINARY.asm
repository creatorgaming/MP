.MODEL TINY

.DATA

ARRAY DB 9 DUP(?)

.CODE            

MOV AL, 'A'
MOV SI, 0H
MOV BL, 02H

CONVERT:
        DIV BL
        MOV ARRAY[SI], AH
        INC SI
        MOV AH, 0H
        CMP AL, 0H
        JZ FINISH
        JNZ CONVERT
   
FINISH:
        MOV DL, ARRAY[SI-1]
        ADD DL, 30H
        MOV AH, 02H
        INT 21H        
        CMP SI, 00H
        DEC SI
        JNZ FINISH


.EXIT
END 