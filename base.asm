IDEAL
MODEL small
STACK 100h
DATASEG
; -------------------------- 
; Your variables here
; --------------------------

arr db 10 dup (?)
;arrLen will represent the genral lenght of the loop and array
arrLen db 10
prev1 db 1
prev2 db 0
cur db 0

CODESEG
start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	mov cl,[arrLen]
	;We already set the first two args so we dec twice
	dec cx
	dec cx
	mov [arr + 0],0
	mov [arr + 1],1

				addFNum:

	mov al,[prev1]
	mov bl,[prev2]
	;Save prev1 before add overwrite al
	mov dl,al

	;Add new 2 previouses into current 
	add al,bl	
	mov [cur],al
	
	;Check if we're not pass 0
	cmp cx,0
	je exit

	;Set prev1 in prev2 and current in prev 1
	mov [prev2],dl
	mov [prev1],al
	
	;Check wich array index we are and Sets the new current in the array
	xor al,al
	xor dx,dx
	xor si,si
	mov ah,[cur]
	mov bl,[arrLen]

	sub bl,cl
	mov si,bx
	mov [arr+si],ah


	;loop addFNum
	dec cx
	cmp cx,0
	jne addFNum

exit:
	mov ax, 4c00h
	int 21h
END start


