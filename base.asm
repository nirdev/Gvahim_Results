IDEAL
MODEL small
STACK 20h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	xor ax,ax
	xor bx,bx
	mov ax, 1234h
	push ax
	pop bx

exit:
	mov ax, 4c00h
	int 21h
END start


