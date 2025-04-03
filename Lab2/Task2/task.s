    AREA SUM_POS_NEG, CODE, READONLY
    ENTRY
    LDR R0, = NUMBERS  
    LDR R1, = POS_SUM  
    LDR R2, = NEG_SUM  
    
    LDR R3, [R1]      
    LDR R4, [R2]      
    
    BL CHECK        
    B STOP        

STOP B STOP          

ADD_TO_NEG
    ADD R4, R4, #1   
    B CHECK        

ADD_TO_POS
    ADD R3, R3, #1    
    B CHECK     

STOP_CHECK
    STR R3, [R1]       
    STR R4, [R2]     
    BX LR           

CHECK
    LDR R5, [R0], #4    
    CMP R5, #0         
    BEQ STOP_CHECK      
    BLT ADD_TO_NEG     
    BGT ADD_TO_POS          

    AREA SUM_POS_NEG, DATA, READWRITE
    ALIGN

NUMBERS  DCD 20, -8, -35, 10, 15, -7, 0
POS_SUM  DCD 0                      
NEG_SUM  DCD 0                    

    END                       