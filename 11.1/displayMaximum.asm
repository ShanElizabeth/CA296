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
EXTERNDEF displayMaximum:near
.data
x	DWORD	0
y	DWORD	0

.code
	displayMaximum:
					push ebp
					mov ebp,esp

		loopy:
				mov eax,[ebp+8]
				mov ecx,[ebp+12]
				cmp eax,ecx
				jge exity
				mov eax,ecx

		
		exity:
			invoke writeInteger,eax
			mov ebp,esp
			pop ebp
			ret 8

end displayMaximum