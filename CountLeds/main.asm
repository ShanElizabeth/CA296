;
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

.data
x			DWORD	0
count		DWORD 0
y		DWORD 0
.code
	main:nop
	invoke setPattern,5
reset:
	invoke readRow,x

loopy:
	shl eax,1
	adc count,0
	inc y
	cmp y,32

	jl loopy
	inc x
	mov y,0
	cmp x,32
	jl reset
exit:
	invoke writeInteger,count
	invoke Sleep,500
	invoke ExitProcess,0	

end main
