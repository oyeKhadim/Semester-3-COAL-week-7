INCLUDE Irvine32.inc
.data
	myArray1 BYTE 1,2,3,4,5
	s = $-myarray1
	l BYTE 0dh,0ah,0


.code

main PROC


	call intSum
	call ReadInt
	mov ecx,eax

	ptr1:
		call Random32			
		mov myArray1[0],al		
		call intSum
		loop ptr1
	exit

main ENDP	;end of main


intSum Proc USES ecx
	push ecx
	mov ecx,s
	mov esi , 0
	;		pushing into stack
	L1:
		movzx eax,myarray1[esi]
		push eax
		inc esi
		loop L1
	mov ecx,s
	mov esi , 0
	;		poping from stack
	L2:
		pop eax
		mov myarray1[esi],al
		inc esi
		loop L2
	mov ecx,s
	mov esi , 0
	mov eax,0
	;		adding
	L3:
		add al,myarray1[esi]
		inc esi
		loop L3	
	;		printing
	mov edx , offset l
	call writeBin
	call writeString
	call writeHex
	call writeString
	call writeInt
	call writeString
	pop ecx
	ret	

intSum ENDP

END main
