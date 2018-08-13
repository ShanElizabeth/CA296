
.586
.model flat,stdcall
.stack 4096

EXTERNDEF swap:near


.data
tmp DWORD 0
tmp1 DWORD 0
.code 
swap:
	push ebp
	mov ebp,esp
	mov eax,0

	loopy:
		cmp i,3
		je done

		mov ecx,i
		sal ecx,2
		add ecx,[ebp+12]
		mov eax,[ecx]

		mov ebx,j
		sal ebx,2
		add ebx,[ebp+12]
		

		mov [ebx],eax
		mov [ecx],[ebx]

		inc i
		dec j
		jmp loopy

	done:
		mov esp,ebp
		pop ebp
		ret 8
end