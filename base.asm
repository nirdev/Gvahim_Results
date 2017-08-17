IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
address dw 000Eh
value dw 5

CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	mov ax,[value]
	cmp ax,0
	jle AfterdecAxByOn
	dec ax
							AfterdecAxByOn:
	
	
exit:
	mov ax, 4c00h
	int 21h
END start


