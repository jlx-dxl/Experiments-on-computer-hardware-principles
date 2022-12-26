;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   周四 11月 26 2020
; Processor: 8086
; Compiler:  MASM32
;
; Before starting simulation set Internal Memory Size 
; in the 8086 model properties to 0x10000
;====================================================================

STACK SEGMENT 'STACK'              ;定义堆栈段
      STA DB 100 DUP(?)            ;定义堆栈大小
      TOP EQU LENGTH STA           ;栈顶偏移地址
STACK ENDS 

DATA SEGMENT 'DATA'   
      ORG 2H                       ;数据段起始地址
      LED1 EQU 8800H               ;输出端口1地址
      LED2 EQU 8900H               ;输出端口2地址
      LED3 EQU 8A00H               ;输出端口3地址
      LED4 EQU 8B00H               ;输出端口4地址
      SWITCH1 EQU 9000H            ;输入端口SWITCH1地址
      SWITCH2 EQU 0A000H           ;输入端口SWITCH2地址
      SEG7 DB 3fh,06h,5bh,4fh,66h,6dh,7dh,07h       ;SEG7储存七段管码表（0-F共十六个数）
      DB 7fh,6fh,77h,7ch,39h,5eh,79h,71h
DATA ENDS 

CODE SEGMENT 'CODE' 
     ASSUME CS:CODE,SS:STACK,DS:DATA 
 
START: MOV AX, DATA 
       MOV DS, AX 
       MOV AX, STACK 
       MOV SS, AX 
       MOV AX, TOP 
       MOV SP, AX                    ;初始化段寄存器
       LEA BX,SEG7                   ;取7段码表基地址
       MOV AX,0H                     ;AX清零
    
GO: 
;低两位
    ;第一位
    MOV DX,SWITCH1             ;状态接口的地址
    IN  AL,DX                    ;读入开关状态
    AND AL,0FH	                 ;保留低4位
    MOV SI,AX                    ;作为7段码表的表内位移量    
    MOV AL,[BX+SI]               ;取7段码
    MOV DX, LED4                ;输出接口地址
    OUT DX,AL                   ;输出到对应接口
    ;CALL DELAY

    ;第二位
    MOV DX,SWITCH1             ;状态接口的地址
    IN  AL,DX                    ;读入开关状态
    AND AL,0F0H	                 ;保留高4位
    MOV CL,4
    SHR AL,CL                    ;AL右移四位
    MOV SI,AX                    ;作为7段码表的表内位移量    
    MOV AL,[BX+SI]               ;取7段码
    MOV DX, LED1               ;输出接口地址
    OUT DX,AL                   ;输出到对应接口
    ;CALL DELAY

;高两位
    ;第三位
    MOV DX,SWITCH2             ;状态接口的地址
    IN  AL,DX                    ;读入开关状态
    AND AL,0FH	                 ;保留低4位
    MOV SI,AX                    ;作为7段码表的表内位移量    
    MOV AL,[BX+SI]               ;取7段码
    MOV DX, LED2               ;输出接口地址
    OUT DX,AL                   ;输出到对应接口
    ;CALL DELAY
    
    ;第四位
    MOV DX,SWITCH2             ;状态接口的地址
    IN  AL,DX                    ;读入开关状态
    AND AL,0F0H	                 ;保留高4位
    MOV CL,4
    SHR AL,CL                    ;AL右移四位
    MOV SI,AX                    ;作为7段码表的表内位移量    
    MOV AL,[BX+SI]               ;取7段码
    MOV DX, LED3               ;输出接口地址
    OUT DX,AL                   ;输出到对应接口
    ;CALL DELAY
    
    JMP GO

DELAY PROC   ; ----延时子程序----
     PUSH CX
     MOV CX,3FFH
     DELAY1:  NOP 
     LOOP DELAY1 
     POP CX
     RET 
DELAY ENDP
CODE ENDS
END START 
