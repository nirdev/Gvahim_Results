IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
h db ?
l db ?
sum db 0
CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	xor cx,cx
	xor si,si
	xor ax,ax
	xor bx,bx
	
	;get hight
	mov ah,1h
	int 21h
	sub al,'0'
	mov [h], al

	;get length	
	mov ah,1h
	int 21h
	sub al,'0'
	mov [l],al
	
	;/n
	mov dl,0ah
	mov ah,2h
	int 21h
	

	;Set outer loop indexes (cx for inner)
	mov bl,[h]
			outerLoop:
	mov cl,[l]
			innerLoop:
	
	mov dl,'x'
	mov ah,2h
	int 21h

	loop innerLoop
	;/n
	mov dl,0ah
	mov ah,2h
	int 21h
	
	;outer looping
	dec bx
	cmp bx,0
	jne outerLoop

	;finished
	;get length	
	mov ah,1h
	int 21h
	sub al,'0'
	mov [l],al
	
exit:
	mov ax, 4c00h
	int 21h
END start


