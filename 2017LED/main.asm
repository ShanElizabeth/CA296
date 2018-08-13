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
row DWORD 13
start DWORD 5
finish DWORD 8
i DWORD 0

.code
	main:nop
		invoke setPattern,1
		invoke readRow,row

		loopy:
			mov ebx,1
			mov ecx,start
			shl ebx,CL
			not ebx
			and eax,ebx
			
			
			mov ebx,finish
			cmp start, ebx
			jg done
			inc start
			jmp loopy

			done:
				invoke writeRow,row,eax
				invoke Sleep,500
				invoke ExitProcess,0
	end main
