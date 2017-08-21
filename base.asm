IDEAL
MODEL small
STACK 100h
DATASEG
  	;--------------------  YOUR VARIABLES HERE -------------------  

CODESEG


	;--------------------  PROCEDURE STARTS HERE --------------------------------
proc changeRegValue 

	push ax
	push bx
	push cx
	push dx

	mov ax,1
	mov bx,2
	mov cx,3
	mov dx,4

	pop dx
	pop cx
	pop bx
	pop ax

	ret
endp changeRegValue 

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	mov ax,5
	mov bx,6
	mov cx,7
	mov dx,8
	call changeRegValue 

exit:
	mov ax, 4c00h
	int 21h
END start


