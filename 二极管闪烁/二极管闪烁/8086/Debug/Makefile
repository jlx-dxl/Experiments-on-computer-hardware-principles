###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = 8086
COMPILER = "MASM32"
TARGET = Debug
SHELL = C:\WINDOWS\system32\cmd.exe

## Tools general options
ASMFLAGS=/c /Zd /Zi
LDFLAGS=/CODEVIEW

## Processing Tools
ASM=ml.exe
LD=link16.exe
#  D:/研究生课程资料/21-22硬件技术/实验/8253计数器/二极管闪烁/8086/Debug/Debug.exe: TOOL=LD
#     D:/研究生课程资料/21-22硬件技术/实验/8253计数器/二极管闪烁/8086/Debug/Debug.obj: TOOL=ASM
#        D:/研究生课程资料/21-22硬件技术/实验/8253计数器/二极管闪烁/8086/Debug/Debug.asm

# Build tree:
all:	Debug

Debug:	Debug.exe

Debug.exe:	Debug.obj 
	$(LD) $(LDFLAGS) Debug.obj,Debug.exe,nul.map,,,

Debug.obj:	Debug.asm 
	$(ASM) $(ASMFLAGS) Debug.asm

# tidy - delete all temporary files which are not involved in the target generation
tidy:

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.exe
	rm -rf Debug.obj
