	AREA MYCODE, CODE, READONLY
	ENTRY

	MOV R10, #32 ; Constant 32
	MOV R11, #9 ; Constant 9
	MOV R12, #5 ; Constant 5

	; R9 is the numerator, R8 is the denominator, R7 is the result (quotient)

	MOV R0, #95 ; F = 95

	; Calculation: (F - 32) * 5 / 9
	SUB R1, R0, R10 ; F - 32
	MUL R2, R1, R12 ; (F - 32) * 5

	MOV R9, R2 ; Numerator = (F - 32) * 5
	MOV R8, R11 ; Denominator = 9
	BL DIV ; Calculate: (F - 32) * 5 / 9
	MOV R1, R7 ; Store the result in R1

	; Calculate: (C * 9) / 5 + 32
	MOV R2, #32 ; C = 32
	MUL R3, R2, R11 ; C * 9

	MOV R9, R3 ; Numerator = C * 9
	MOV R8, R12 ; Denominator = 5
	BL DIV ; Calculate: (C * 9) / 5   
		   ; BL jumps to a subroutine, storing the return address in the LR register for subsequent return
	
	MOV R4, R7 ; Store the result in R4

	ADD R3, R4, R10 ; result: (C * 9 / 5) + 32
	B STOP ; Go to infinite loop

; Division: divides R9 by R8, result in R7
DIV
	MOV R7, #0 ; Zero out result

DIVISION
	CMP R9, R8 ; Compare numerator and denominator
	BLT ENDDIV ; If numerator is less than denominator, exit
			   ; BLT jumps to the specified label if the previous comparison (CMP) showed that the first number is less than the second
	
	SUB R9, R9, R8 ; Subtract denominator from numerator
	ADD R7, R7, #1 ; Increment result
	
	B DIVISION ; Repeat

ENDDIV
	BX LR ; BX jumps to the address stored in the specified register and may switch the processor mode

STOP B STOP
	
	END