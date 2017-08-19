IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
address dw 000Eh
var1 db 5
var2 db 6 
BxValue dw 0

CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	xor ax,ax
	xor bx,bx

	mov bl,[var2]
	mov al,[var1]
		
	cmp bl,al
	je addVars
	jne subVars
			subVars:
	sub ax,bx	
	jmp finale
	
			addVars:
	add ax,bx
			finale:
	
exit:
	mov ax, 4c00h
	int 21h
END start


