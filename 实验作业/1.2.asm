DSEG SEGMENT
     RESULT DW 1 DUP(?)
     N EQU 8
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG,DS:DSEG
    
JIECHENG MACRO X 
    MUL X
    ENDM

START:MOV AX,DSEG
      MOV DS,AX
      MOV CX,N-1
      MOV AX,N
      LEA SI,RESULT
                   
AGAIN:JIECHENG Cx
      MOV DS:[SI],AX
      LOOP AGAIN 
            
CSEG ENDS
      END START

      
      
      
