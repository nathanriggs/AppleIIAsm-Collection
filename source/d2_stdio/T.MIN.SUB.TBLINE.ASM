]X1      EQU   WPAR1      
]X2      EQU   WPAR2      
]Y1      EQU   WPAR1+1
]Y2      EQU   WPAR2+1
]F       EQU   BPAR1
]DX      EQU   VARTAB     ; CHANGE IN X
]DY      EQU   VARTAB+1   ; CHANGE IN Y
]SX      EQU   VARTAB+2   ; X POSITION STEP
]SY      EQU   VARTAB+3   ; Y POSITION STEP
]ERR     EQU   VARTAB+4   ; SLOPE ERROR
]ERR2    EQU   VARTAB+5   ; COMPARISON COPY OF ]ERR
TBLINE
         LDX   #$FF       
         LDA   ]Y1        
         SEC   
         SBC   ]Y2
         BPL   :YSTORE    
         LDX   #1         
         EOR   #$FF       
         CLC
         ADC   #1
:YSTORE
         STA   ]DY        
         STX   ]SY        
         LDX   #$FF       
         LDA   ]X1        
         SEC   
         SBC   ]X2        
         BPL   :XSTORE    
         LDX   #1         
         EOR   #$FF       
         CLC
         ADC   #1
:XSTORE
         STA   ]DX        
         STX   ]SX        
         CMP   ]DY        
         BEQ   :SKIP      
         BPL   :SKIP2     
:SKIP
         LDA   ]DY        
         EOR   #$FF       
         CLC
         ADC   #1
:SKIP2
         STA   ]ERR       
         ASL   ]DX        
         ASL   ]DY        
:LP
         LDA   ]Y1 
         LDY   ]X1 
         JSR   GBCALC 
         LDA   ]F 
         STA   (GBPSH),Y 
         LDA   ]X1        
         CMP   ]X2        
         BNE   :KEEPGO
         LDA   ]Y1        
         CMP   ]Y2
         BEQ   :EXIT      ; IF EQUAL, EXIT
:KEEPGO
         LDA   ]ERR       
         STA   ]ERR2      
         CLC   
         ADC   ]DX        
         BMI   :SKIPX     
         BEQ   :SKIPX     
         LDA   ]ERR       
         SEC   
         SBC   ]DY        
         STA   ]ERR       
         LDA   ]X1        
         CLC   
         ADC   ]SX        
         STA   ]X1        
:SKIPX
         LDA   ]ERR2      
         CMP   ]DY        
         BPL   :SKIPY     
         LDA   ]ERR       
         CLC   
         ADC   ]DX        
         STA   ]ERR       
         LDA   ]Y1        
         CLC   
         ADC   ]SY        
         STA   ]Y1        
:SKIPY
         JMP   :LP        
:EXIT
         RTS
