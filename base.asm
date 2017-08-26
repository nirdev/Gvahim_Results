IDEAL
MODEL small
STACK 100h
DATASEG
  	;--------------------  YOUR VARIABLES HERE -------------------  
localMax dw ?
max dw 0

CODESEG


	;--------------------  PROCEDURE STARTS HERE --------------------------------

proc findMaxProc
	
	push bp
	mov bp,sp
	
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	
	mov ax,[bp + 6];var1	
	mov cx,[bp + 4];var2	
	cmp ax,cx
	jg var1bigger

			var2bigger:
	mov [localMax],cx
	jmp setNewMax

			var1bigger:
	mov [localMax],ax
	jmp setNewMax
			setNewMax:
	mov bx,[bp + 8]
	mov dx,[localMax]
	mov [word ptr ds:bx],dx
	
	pop bp
	ret
endp findMaxProc

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	
	push offset max
	push 10
	push 5
	call findMaxProc
exit:
	mov ax, 4c00h
	int 21h

END start


