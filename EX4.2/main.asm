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
y			DWORD	0

message1     BYTE	'Please enter a pattern',0
messagex	BYTE	'Please enter an X co-ordinate between 0-31',0
messagey	BYTE	'Please enter a Y co-ordinatae bewtween 0-31',0
.code
	main:nop
		invoke version
		invoke readIntegerWithMessage, addr messagex
		mov x,eax
		invoke readIntegerWithMessage, addr messagey
		mov y,eax
		invoke readIntegerWithMessage, addr message1
		invoke setPattern, eax

		lp1:
			invoke readRow, y

			mov ecx, x
			mov ebx, 1
			shl ebx, CL

			xor eax, ebx

			invoke writeRow, y,eax
			invoke Sleep, 500
			jmp lp1

	end main
