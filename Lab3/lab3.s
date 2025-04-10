; Losev Danil EPI-4-23 Lab 3

	AREA LAB3, CODE, READONLY
	ENTRY
	ADR R0, STRING
	MOV R1, #0
	MOV R2, #0
	BL LOOP
	B STOP
	
	
LOOP	
	LDRB R3, [R0], #1
	
	CMP R3, #0
	BEQ END_LOOP
	
	MOV R4, LR
	BL CHECK_FOR_VOWEL
	MOV LR, R4
	
	;MOV R4, LR
	;BL CHECK_FOR_SIGNS
	;MOV LR, R4
	
	ADD R2, R2, #1
	
	B LOOP
	
END_LOOP
	BX LR


;CHECK_FOR_SIGNS
;	CMP R3, #' '
;    BEQ IS_SIGN
;    CMP R3, #'!'
;    BEQ IS_SIGN
;	BX LR
;	
;IS_SIGN
;	MOV LR, R4
;	B LOOP
	
CHECK_FOR_VOWEL
	
	CMP R3, #'A'
    BEQ IS_VOWEL
    CMP R3, #'E'
    BEQ IS_VOWEL
    CMP R3, #'I'
    BEQ IS_VOWEL
    CMP R3, #'O'
    BEQ IS_VOWEL
    CMP R3, #'U'
    BEQ IS_VOWEL
    CMP R3, #'a'
    BEQ IS_VOWEL
    CMP R3, #'e'
    BEQ IS_VOWEL
    CMP R3, #'i'
    BEQ IS_VOWEL
    CMP R3, #'o'
    BEQ IS_VOWEL
    CMP R3, #'u'
    BEQ IS_VOWEL
	
	BX LR
	
	
IS_VOWEL
	MOV LR, R4
	ADD R1, R1, #1
	B LOOP
	
	
STOP B STOP	

	AREA LAB3, DATA, READWRITE
STRING 
	DCB "ARM assembly language is important to learn!",0
	
	END