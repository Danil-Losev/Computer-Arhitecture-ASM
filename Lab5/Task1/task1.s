    AREA TASK1, CODE, READONLY
    ENTRY

START
    ADR R0, STRING
    BL STRING_LENGTH 
	ADR R0, STRING
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
	
	B LOOP
	
END_LOOP
	BX LR


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
	CMP R3, #'Y'
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
	CMP R3, #'y'
    BEQ IS_VOWEL
	
	BX LR
	
	
IS_VOWEL
	MOV LR, R4
	ADD R2, R2, #1
	B LOOP
  
STOP B  STOP


STRING_LENGTH 
	MOV R12, LR
    MOV R1, #0       

STRING_LOOP
    LDRB R4, [R0], #1  
    CMP R4, #0     
    BEQ STRING_ENDED 
    ADD R1, R1, #1   
    B STRING_LOOP  

STRING_ENDED
	MOV LR, R12
    BX LR     


    AREA TASK1, DATA, READWRITE
	
STRING
    DCB "Almost every ARM instruction has a conditional execution feature called predication, which is implemented with a 4-bit condition code selector!", 0

    END