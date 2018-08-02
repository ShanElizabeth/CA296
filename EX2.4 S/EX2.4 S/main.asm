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
N DWORD 0
COUNTER DWORD 0

.code
	main:nop
	invoke version

	invoke readInteger
	mov N,eax
	mov COUNTER,0

	loopy:
		cmp N,0
		jl exit
		mov ebx,COUNTER
		cmp N,ebx
		je done
		invoke writeInteger,COUNTER
		add COUNTER,1
		jmp loopy
	done:
		invoke readInteger
		mov N,eax
		mov COUNTER,0
		jmp loopy
	exit:
		invoke ExitProcess,0

end main
