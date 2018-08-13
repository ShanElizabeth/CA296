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
left DWORD 0
right DWORD 0




.code
	main:nop
	invoke setPattern,6
	
	
	loopy:
		cmp row,32
		je done

		invoke readRow,row
		shl eax,16
		mov left, eax
		
		invoke readRow,row
		shr eax,16
		mov right,eax

		mov eax,left
		mov ebx,right

		xor eax,ebx
		invoke writeRow,row,eax
		invoke Sleep,500
		inc row 
		jmp loopy
	
	done:

		invoke ExitProcess,0
	end main
