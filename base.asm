IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------
arrLen db 5
arr db 5 dup (?)
CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	xor cx,cx
	xor si,si

	mov si,5
	mov cx,5
			newChar:
	mov ah,1h
	int 21h
	mov si,5
	sub si,cx
	mov [arr+si],al
	loop newChar
	

exit:
	mov ax, 4c00h
	int 21h
END start


