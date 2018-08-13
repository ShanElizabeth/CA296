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
EXTERNDEF ascend :near

.data
min DWORD 10000
i DWORD 0

counter DWORD 0
.code
ascend:
	push ebp
	mov ebp,esp


	search:
		mov eax,[ebp+8]
		cmp counter,eax
		jge change
		mov eax,0
		mov ecx,counter
		sal ecx,2
		add ecx,[ebp+12]
		mov eax,[ecx]				;

		cmp eax,min
		jl new_min

		
		inc counter
		
		jmp search

	new_min:
		mov min,eax
		mov edx,counter
		sal edx,2
		add edx,[ebp+12]
		inc counter
		jmp search

	change:
		mov eax,[ebp+8]
		cmp i,eax
		je exit
		mov eax,0

		mov ebx,i
		sal ebx,2
		add ebx,[ebp+12]
		mov eax,[ebx]
		
		mov ecx,min
		mov [ebx],ecx
		mov [edx],eax
		
		
		inc i
		mov eax,0
		mov eax,i
		mov counter,eax
		mov min,1000
		jmp search
	exit:
		
		mov esp,ebp
		pop ebp
		ret 8
end
