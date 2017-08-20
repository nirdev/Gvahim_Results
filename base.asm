IDEAL
MODEL small
STACK 100h
DATASEG
  	;--------------------  YOUR VARIABLES HERE -------------------  
digit db 10 dup (1)

CODESEG


	;--------------------  PROCEDURE STARTS HERE --------------------------------
proc ZeroMem
	
	xor al,al
	mov cx,10
ZeroLoop:
	
	mov [bx],al
	inc bx
	loop ZeroLoop
	ret

endp ZeroMem

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	mov bx, offset digit
	call ZeroMem
exit:
	mov ax, 4c00h
	int 21h
END start


