		AREA question1, CODE, READONLY
		ENTRY
		MOV r0, #2			; Assume barcode is not valid

		ADR r1, UPC-2		; Set address of UPC code to r1
		MOV r10, #12		; Initialize loop counter
OddSum	LDRB r2 , [r1, #2]!		; Copy UPC into r2, increment loop by 2 for odd
		SUB r1, r1, #48		; Subtract 48 from ASCII to align with decimal value
		ADD r3, r3, r2		; Add current value to running total
		SUBS r10, r10, #2	; Decrement counter by 2 for odd numbers
		BNE OddSum			; Repeat until all odd numbers added

		ADD r3, r3, LSL#1	; Multiply OddSum by 3

		ADR r1, UPC-1		;Set address of UPC code to r1, subtract for even
		MOV r11, #12		; Initialize loop counter
EvenSum	LDRB r2 , [r1, #2]!		; Copy UPC into r2, increment loop by 2 for even
		SUB r1, r1, #48		; Subtract 48 from ASCII to align with decimal value
		ADD r4, r4, r2		; Add current value to running total
		SUBS r11, r11, #2 	; Decrement counter by 2 for odd numbers
		BNE EvenSum			; Repeat until all even numbers added

		ADD	r5, r4, r3		; Add values of OddSum*3 and EvenSum together

Comp	SUBS r5, r5, #10			; Subtract 10 until value is less tan or equal to 0
		BGT Comp			; If value is greater than 0, reloop
		CMP r5, #0			; Compare r0 == 0
		SUBEQ r0, r0, #1		; If (r0 == 0)Set barcode as valid

loop	B loop

		AREA question1, DATA, READONLY
UPC 	DCB "013800150738"	;correct UPC string
		END
