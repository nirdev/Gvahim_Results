IDEAL
MODEL small
STACK 100h
DATASEG
  	;--------------------  YOUR VARIABLES HERE -------------------  
timeToPrintX dw -1
returnAdd dw ?

CODESEG


	;--------------------  PROCEDURE STARTS HERE --------------------------------
proc printX

	pop [returnAdd] ;poping the sp value
	pop cx ;poping the nubmer of times to run
	
	;checks if received valid valu to loop
	cmp cx,0
	jle procEnding

	printXLoop:

	mov dl,'x'
	mov ah,2h
	int 21h

	loop printXLoop

			procEnding:
	push [returnAdd] ;push sp value back
	ret
	
endp printX

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------

	push [timeToPrintX]
	call printX
	xor ax,ax
	
exit:
	mov ax, 4c00h
	int 21h
END start


