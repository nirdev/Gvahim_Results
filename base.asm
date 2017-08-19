IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
var1 db 5
var2 db 4
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
	
	mov cl,[var2]
			addA:

	mov al,[var1]
	mov ah,[sum]
	add ah,[var1]
	mov [sum],ah
	xor ax,ax
	loop addA

	
	
exit:
	mov ax, 4c00h
	int 21h
END start


