IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
address dw 000Eh
AxValue dw 5
BxValue dw 5

CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	mov ax,[AxValue]
	mov bx,[BxValue]
	cmp ax,bx
	je copyBxToAx
	mov ax,bx
							copyBxToAx:
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


