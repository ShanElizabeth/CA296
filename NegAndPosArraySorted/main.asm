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
N=50
.data
arrayAddr DWORD  0
i		  DWORD 0
j		  DWORD 0

.code
	main:nop
		mov eax,N
		sal eax,2
		invoke allocate,eax
		mov arrayAddr,eax

		mov eax,N
		dec eax
		mov j,eax

	get_nums:
		mov ebx,i
		cmp ebx,j
		jg finish

		invoke random,50
		cmp eax,0
		jl lesser
		jg greater
		jmp get_nums
	lesser:
		mov ebx,i
		sal ebx,2
		add ebx,arrayAddr
		mov [ebx],eax
		inc i
		jmp get_nums
	greater:
		mov ecx,j
		sal ecx,2
		add ecx,arrayAddr
		mov [ecx],eax
		dec j
		jmp get_nums
	finish:
		invoke writeArray,arrayAddr,N

end main

		invoke ExitProcess,0

	end main
