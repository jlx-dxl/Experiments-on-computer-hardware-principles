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
#  C:/Users/LV_PEN~1/AppData/Local/Temp/3f7159d24c614cf89cc531379ff6fddc/8086/Debug/Debug.exe: TOOL=LD
#     C:/Users/LV_PEN~1/AppData/Local/Temp/3f7159d24c614cf89cc531379ff6fddc/8086/Debug/main.obj: TOOL=ASM
#        C:/Users/LV_PEN~1/AppData/Local/Temp/3f7159d24c614cf89cc531379ff6fddc/8086/main.asm

# Build tree:
all:	Debug

Debug:	Debug.exe

Debug.exe:	main.obj 
	$(LD) $(LDFLAGS) main.obj,Debug.exe,nul.map,,,

main.obj:	../main.asm 
	$(ASM) $(ASMFLAGS) ../main.asm

# tidy - delete all temporary files which are not involved in the target generation
tidy:

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.exe
	rm -rf main.obj
