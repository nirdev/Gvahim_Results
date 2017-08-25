IDEAL
MODEL small
STACK 100h
DATASEG
  	;--------------------  YOUR VARIABLES HERE -------------------  
retAdd dw ?
var1 dw 33h

CODESEG


	;--------------------  PROCEDURE STARTS HERE --------------------------------

proc incPbR

	pop [retAdd] ;save ret address
	pop bx ;save parm ref

	add [byte ptr ds:bx],1

	push [retAdd]
	ret
endp incPbR

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	push offset var1 
	call incPbR
exit:
	mov ax, 4c00h
	int 21h

END start


