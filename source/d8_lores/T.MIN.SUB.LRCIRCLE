]XC      EQU   WPAR1      
]YC      EQU   WPAR2      
]R       EQU   WPAR3      
]COLOR   EQU   BPAR2      
]YY      EQU   VARTAB+5   
]XX      EQU   VARTAB+7   
]DX      EQU   VARTAB+9   
]DY      EQU   VARTAB+11  
]ERR     EQU   VARTAB+13  
]DIAM    EQU   VARTAB+15  
]XT      EQU   VARTAB+17  
]YT      EQU   VARTAB+19  
LRCIRCLE
         LDA   #0         
         STA   ]YY
         LDA   ]R         
         STA   ]XX        
         STA   ]ERR       
         ASL   
         STA   ]DIAM      
         LDA   ]XX        
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]XT        
         LDA   ]YY        
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]YT        
         LDA   ]XC        
         CLC   
         ADC   ]XX        
         TAX
         TAY   
         LDA   ]YC        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]XT        
         TAX
         TAY   
         LDA   ]YC        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]XX        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]XT        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
:LOOP
         LDA   ]YY        
         CMP   ]XX
         BCC   :LPCONT    
         JMP   :EXIT 
:LPCONT
:STEPY   
         LDA   ]YY        
         ASL   
         ADC   #1         
         STA   ]DY        
         INC   ]YY        
         LDA   ]DY        
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       
         STA   ]ERR       
         BPL   :PLOT      
:STEPX
         LDA   ]XX        
         ASL              
         EOR   #$FF       
         CLC
         ADC   #1
         ADC   #1         
         STA   ]DX        
         DEC   ]XX        
         LDA   ]DX        
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       
         STA   ]ERR       
:PLOT
         LDA   ]XX
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]XT
         LDA   ]YY
         EOR   #$FF       
         CLC
         ADC   #1
         STA   ]YT
         LDA   ]XC        
         CLC   
         ADC   ]XX        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]YY        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]XT        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]YY        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]XT        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]YT        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]XX        
         TAY   
         TAX   
         LDA   ]YC        
         CLC   
         ADC   ]YT        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]YY        
         TAX   
         TAY   
         LDA   ]YC        
         CLC   
         ADC   ]XX        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]YT        
         TAX   
         TAY   
         LDA   ]YC        
         CLC   
         ADC   ]XX        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]YT        
         TAX   
         TAY   
         LDA   ]YC        
         CLC   
         ADC   ]XT        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         LDA   ]XC        
         CLC   
         ADC   ]YY        
         TAY   
         TAX   
         LDA   ]YC        
         CLC
         ADC   ]XT        
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         JMP   :LOOP
:EXIT
         RTS
