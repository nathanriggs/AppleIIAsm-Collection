]XC      EQU   WPAR1
]YC      EQU   WPAR2
]R       EQU   BPAR1
]F       EQU   BPAR2
]Y       EQU   VARTAB     
]X       EQU   VARTAB+1   
]DY      EQU   VARTAB+2   
]DX      EQU   VARTAB+4   
]ERR     EQU   VARTAB+6   
]DIAM    EQU   VARTAB+8   
]XT      EQU   VARTAB+10  
]YT      EQU   VARTAB+12  
TCIRCLE
         LDA   #0         
         STA   ]Y
         LDA   ]R         
         STA   ]X         
         STA   ]ERR       
         ASL   
         STA   ]DIAM      
         LDA   ]X         
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]XT        
         LDA   ]Y         
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]YT        
         LDA   ]XC        
         CLC   
         ADC   ]X         
         TAY   
         TAX   
         LDA   ]YC        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]XT        
         TAX   
         TAY   
         LDA   ]YC        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]X         
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]XT        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
:LOOP
         LDA   ]Y         
         CMP   ]X
         BCC   :LPCONT    
         JMP   :EXIT      
:LPCONT
:STEPY   
         LDA   ]Y         
         ASL   
         ADC   #1         
         STA   ]DY        
         INC   ]Y         
         LDA   ]DY        
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       
         STA   ]ERR       
         BPL   :PLOT      
:STEPX
         LDA   ]X         
         ASL              
         EOR   #$FF       
         CLC
         ADC   #1
         ADC   #1         
         STA   ]DX        
         DEC   ]X         
         LDA   ]DX        
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       
         STA   ]ERR       
:PLOT
         LDA   ]X
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]XT
         LDA   ]Y
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]YT
         LDA   ]XC        
         CLC   
         ADC   ]X         
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]Y         
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]XT        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]Y         
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]XT        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]YT        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]X         
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]YT        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]Y         
         TAX   
         TAY   
         LDA   ]YC        
         CLC   
         ADC   ]X         
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]YT        
         TAX   
         TAY   
         LDA   ]YC        
         CLC   
         ADC   ]X         
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]YT        
         TAX   
         TAY   
         LDA   ]YC        
         CLC   
         ADC   ]XT        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         LDA   ]XC        
         CLC   
         ADC   ]Y         
         TAY   
         TAX   
         LDA   ]YC        
         CLC
         ADC   ]XT        
         JSR   GBCALC     
         LDA   ]F         
         STA   (GBPSH),Y  
         JMP   :LOOP      
:EXIT
         RTS
