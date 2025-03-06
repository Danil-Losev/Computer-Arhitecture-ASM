; Losev Danil EPI-4-23 lab 1
;This is my first ARM assembly language program


	AREA Lab1Task1, CODE, READONLY
	ENTRY
	MOV R2, #0x01 			; R2 = 0x00000001
	MOV R3, #0x02 			; R3 = 0x00000002
	; Other examples to move immediate values
	
	;MOV R5, #0x3210 		;(ERROR:  A1510E: Immediate 0x00003210 cannot be represented by 0-255 and a rotation) 
							;		Error A1510E: Immediate 0x00003210 cannot be represented by 0-255 and a rotation 
							;		occurs because the number 0x3210 cannot be encoded in ARM's 12-bit format 
							;		(8 bits + rotation) and must be loaded via LDR or compound instructions.
	LDR R5, =0x3210			; R5 = 0x00003210
	
	;MOVT R5, #0x7654 		;(ERROR: A1854E: Unknown opcode 'MOVT', maybe wrong target CPU?)
							;		MOVT is an instruction only available in ARMv6T2 and above 
							;		(e.g. ARM Cortex), but ARM7 does not support it.
	LDR R5, =0x7654 		; R5 = 0x00007654
	
	;MOV32 R6, #0x87654321 	;(ERROR: A1356E: Instruction not supported on targeted CPU)
							;		The error occurs because the MOV32 instruction is not supported by the ARM7 processor, 
							;		and a combination of MOV and ORR instructions or an LDR instruction should be used instead.
	LDR R6, =0x87654321		; R6 = 0x87654321
	
	
	;LDR R7, #0x87654321 	;(ERROR: A1152E: Unexpected operator)
							;		The error occurs because the ARM7 processor does not support loading large 32-bit values 
							;		using the LDR instruction in LDR R7 format, #0x87654321, and must instead use LDR with 
							;		a constant pool ( = ) or split the value into two 16-bit values using the MOV and ORR instructions.
	LDR R7, =0x87654321		; R7 = 0x87654321
	
	ADD R1,R2,R3 			; R1 = 0x00000003
	
	;MOV32 R3, #0xFFFFFFFF 	;(ERROR: A1356E: Instruction not supported on targeted CPU)
							;		The error occurs because the MOV32 instruction is not supported by the ARM7 processor, 
							;		and a combination of MOV and ORR instructions or an LDR instruction should be used instead.
	MOV R3, #0xFFFFFFFF		; R3 = 0xFFFFFFFF
	
	ADDS R1,R2,R3 			; R1 = 0x00000000
							; specify Condition Code updates
							; 	The CPSR flags has been changed
							; 	"Z" = 1 the result is zero
							; 	"C" = 1 a transfer occurred
	
	SUBS R1,R2,R3 			; R1 = 0x00000002
							; specify Condition Code updates
							; 	The CPSR flags has been changed
							; 	"Z" = 0 the result is not zero
							; 	"C" = 0 a transfer not occurred
	
	MOV R4, #0xFFFFFFFF 	; R4 = 0xFFFFFFFF
	ADD R1,R2,R4 			; R1 = 0x00000000
							; How did that operation affect the flags in CPSR?
							;	Nothing has changed

	ADDS R1,R2,R4 			; R1 = 0x00000000
							; Please specify Condition Code updates
							; and now what happened to the flags in CPSR?
							; 	The CPSR flags have been changed
							; 	"Z" = 1 the result is zero
							; 	"C" = 1 a transfer occurred

	MOV R2, #0x00000002 	; R2 = 0x00000002
	ADDS R1,R2,R4 			; R1 = 0x00000001
							; again, what happened to the flags?
							; 	The flag of CPSR has been changed: "Z" = 0 the result is not zero

	MOV R2, #0x00000001 	; R2 = 0x00000001
	MOV R3, #0x00000002 	; R3 = 0x00000002
	ADDS R1,R2,R3 			; R1 = 0x00000003
							; 	The flag of CPSR has been changed: "C" = 0  a transfer not occurred
							
							; Add some small numbers again
							; and check the flags again
	
	MOV R2, #0x00000003 	; R4 = 0x00000003
	MOV R3, #0x00000004 	; R3 = 0x00000004
	ADDS R1,R2,R3 			; R1 = 0x00000007

	; Add numbers that will create overflow
	MOV R2, #0x7FFFFFFF 	; R2 = 0x7FFFFFFF
	MOV R3, #0x7FFFFFFF 	; R3 = 0x7FFFFFFF
	ADDS R1,R2,R3 			; R1 = 0xFFFFFFFE
							; Check the flags in CPSR?
							; 	The CPSR flags have been changed
							;	"N" = 1 the result is negative
							;	"V" = 1 an overflow occurred

STOP 	B 	STOP
	END 					; End of the program