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

row DWORD 0

idx DWORD 0

.code 
	main:nop
	invoke version

	invoke setPattern,1

	loopy:
		invoke readRow,row
		mov ebx,1
		mov ecx,idx
		shl ebx,CL
		and eax,ebx
		not eax
		

		
		invoke writeRow,row,eax
		inc row
		inc idx
		invoke Sleep,500
		jmp loopy

	invoke ExitProcess,0
	end main