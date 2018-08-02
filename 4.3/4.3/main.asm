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

include     c:\masm32\include\windows.inc
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
row			DWORD	0
msg			BYTE	'PLEASE INPUT PATTERN NO.1-7'
.code
	main:nop

		invoke version
		
		invoke readIntegerWithMessage, addr msg
		invoke setPattern,eax

		Reset:
			mov row,0
			invoke Sleep,500

		loopy:
			cmp row,0
			jl Reset
			invoke readRow, row
			sub row,1
			invoke writeRow,row ,eax
			add row,2
			jmp loopy
	end main
