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

lvar1 equ [bp -2]
lvar2 equ [bp -4]
lvar3 equ [bp -6]

var3 equ [bp +4]
var2 equ [bp +6]
var1 equ [bp +8]

	push bp
	mov bp,sp
	sub sp,6 ;allocate mememory for 2 dw vars

	;set var1 to local var in stack
	mov ax,var1
	mov lvar1,ax

	;set var2 to local var in stack
	mov ax,var2
	mov lvar2,ax

	;set var3 to local var in stack
	mov ax,var3
	mov lvar3,ax

	add sp,6
	pop bp
	ret 6

endp findMaxProc

start:
	mov ax, @data
	mov ds, ax
	;--------------------  CODE STARTS HERE --------------------------------
	
	push 1 
	push 2 
	push 3
	call findMaxProc
	xor ax,ax
exit:
	mov ax, 4c00h
	int 21h

END start


