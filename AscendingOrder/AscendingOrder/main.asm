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
EXTERNDEF ascend:near
.data
N=8
array DWORD		1,70,65,3,102,100,5,2



.code
	main:nop
		push offset array
		push N
		call ascend

		invoke writeArray, addr array ,N


		invoke ExitProcess,0

	end main
