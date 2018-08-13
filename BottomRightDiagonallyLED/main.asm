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

include    c:\masm32\include\windows.inc
include     c:\masm32\include\kernel32.inc
include		c:\masm32\include\user32.inc
include		c:\masm32\include\msvcrt.inc
include		c:\masm32\include\ca296.inc

includelib c:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib


;
; Data & Code
;

.data
x			DWORD	0
row			DWORD	31
msg			BYTE	'Enter Pattern(1-7)',0
pattern		DWORD	0

.code
	main:nop

		invoke version
		invoke readIntegerWithMessage, addr msg
		invoke setPattern,eax

		loopy:
			cmp row,0
			je exity
			invoke readRow,row
			mov ebx,1
			mov ecx,x
			shl ebx,CL
			not ebx
			and eax,ebx
			invoke writeRow,row,eax
			inc x
			dec row
			invoke Sleep,500
			jmp loopy

		exity:
			invoke ExitProcess,0

	end main
