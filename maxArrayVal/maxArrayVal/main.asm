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
a DWORD 10 DUP(0)
MAX DWORD 0
CURR DWORD 0
i DWORD 0
.code
	main:nop
	invoke fillWithRandomValues,addr a,10,10
	
	
	loopy:
		mov ebx,0
		cmp i,10
		je exit
		mov eax,4
		mul i     ;moves the position in array by 4 in eax 
		add eax, offset a
		add ebx,[eax]
		cmp ebx,MAX
		jg change
		inc i
		jmp loopy


	change:
		mov MAX, ebx
		inc i 
		jmp loopy



	exit:
		invoke writeArray,addr a,10
		invoke writeInteger,MAX
		invoke ExitProcess,0

	end main

		