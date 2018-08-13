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
EXTERNDEF reduce: near
.data
x DWORD 0
message	BYTE	'%d%',1010b,0
.code
	reduce:
		push ebp
		mov ebp,esp


	loopy:
		mov eax,[ebp+8]
		cmp eax,0
		jle exit

		mov ecx,[ebp+8]
		dec ecx
		invoke crt_printf,addr message,ecx
		dec DWORD PTR[ebp+8]
		jmp loopy
		
	exit:
		mov esp,ebp
		pop ebp
		ret 4
end reduce