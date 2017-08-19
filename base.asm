IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------

TimesToPrintX db 5

CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	xor ax,ax
	xor bx,bx
	xor cx,bx

	;Check if TimesToPrintX is Valid and jump to exit if it does
	cmp [TimesToPrintX],0
	jle exit
	
			loopCon:	
	cmp cl,[TimesToPrintX]
	jne printXLoop
	jmp exit
			printXLoop:
	mov dl,'x'
	mov ah,2h
	int 21h
	inc cl
	jmp loopCon


exit:
	mov ax, 4c00h
	int 21h
END start


