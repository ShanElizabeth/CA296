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
	mov ebx,1
	mov ecx,0
	mov COUNTER,1

	loopy:
		cmp N,0
		jl exity
		mov eax,ebx
		add ebx,ecx
		mov ecx,eax

		mov edx,COUNTER
		cmp N,edx
		je done
		add COUNTER,1
		jmp loopy
	done:
		invoke writeInteger,ebx
		invoke readInteger
		mov N,eax
		mov ebx,1
		mov ecx,0
		mov COUNTER,1
		jmp loopy
	
	exity: 
		invoke ExitProcess,0
end main