; Liam Newton
; 2/17/2018
; Note to myself: How this works ebx,ecx = 1
;				  prev = ecx
;				  add ecx, ebx
;				  ebx  = prev
; ebx holds the previous value n-2 when we go up in the sequence
; we add n-2 and n-1 where n + 0 is the new value. now ecx holds n - 1 for the
; next value in the sequence and we set ebx to the previous value of ecx therefor
; ebx is our new n - 2
; max value that can be entered is 46

.586
.MODEL FLAT

INCLUDE io.h							 ; header file for input/output

.STACK 4096

.DATA
fib	      DWORD   ?						 ; order of fib sequence
prev	  DWORD   1						 ; prev n-1
fin_val   DWORD    11 DUP (?), 0		 ; final value

prompt1   BYTE    "Enter order of Fib sequence", 0
string    BYTE    40 DUP (?)
resultLbl BYTE    "The sum is", 0

.CODE
_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
        atod    string					 ; convert to integer
		mov		fib, eax				 ; move fib into eax register
		mov		ebx, 1					 ; set ebx and ecx registers to one
		mov		ecx, 1
										 ; begin fibanocci loop
loop1:  cmp     eax, 1					 ; compare value in eax to one e.g the order of the fib
	    je      endloop					 ; jumps to endloop when comparison is equal
		mov		prev, ecx				 ; move value in ecx into prev variable
		add		ecx, ebx				 ; add ecx and ebx registers, stores the next value in fib sequence in ecx
		mov		ebx, prev 			     ; store prev value in ebx
		dec		eax						 ; decrement order of fib sequence
		jmp		loop1					 ; jumps back to loop1 to repeat the process

endloop:								 ; repent the end is nigh, the rest is from the template 
        dtoa    fin_val, ebx		     ; convert to ASCII characters
        output  resultLbl, fin_val       ; output label and sum

        mov     eax, 0  ; exit with return code 0
		mov     ebx, 0
		mov		ecx, 0
        ret

_MainProc ENDP
END										; end of source code

