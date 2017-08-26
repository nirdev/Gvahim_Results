IDEAL
MODEL small
STACK 100h
DATASEG
  	;--------------------  YOUR VARIABLES HERE -------------------  
retAdd dw ?
var1 dw 1h
var2 dw 2h

var1old dw ?
var2old dw ?

CODESEG


	;--------------------  PROCEDURE STARTS HERE --------------------------------

proc incPbR
	
	push bp
	mov bp,sp
	
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	
	;save var1 original value to local pramater
	mov bx,[bp+6]
	mov ax,[word ptr ds:bx]
	mov [var1old],ax

	;save var2 original value to local pramater
	mov bx,[bp+4]
	mov ax,[word ptr ds:bx]
	mov [var2old],ax
	
	;move value of var2 to var1
	mov bx,[bp+6]
	mov ax,[var2old]
	mov [word ptr ds:bx],ax

	;move value of var1 to var2
	mov bx,[bp+4]
	mov ax,[var1old]
	mov [word ptr ds:bx],ax
	


	pop bp
	ret
endp incPbR

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	push offset var1 
	push offset var2 
	call incPbR
exit:
	mov ax, 4c00h
	int 21h

END start


