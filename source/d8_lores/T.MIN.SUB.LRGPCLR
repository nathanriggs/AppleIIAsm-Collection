]C       EQU   VARTAB     
LRGPCLR
         STA   ]C         
         ASL   
         ASL   
         ASL   
         ASL
         CLC   
         ADC   ]C         
         STA   ]C         
         LDY   #$78       
         
         LDX   LWP        
         CPX   #2         
         BEQ   :P2        
         
:LP1
         STA   $400,Y     
         STA   $480,Y     
         STA   $500,Y     
         STA   $580,Y     
         CPY   #80
         BPL   :NDB
         STA   $600,Y     
         STA   $680,Y     
         STA   $700,Y     
         STA   $780,Y     
:NDB
         DEY   
         BPL   :LP1       
         JMP   :EXIT
:P2
         LDA   ]C
         LDY   #$78
:LP2
         STA   $800,Y     
         STA   $880,Y     
         STA   $900,Y     
         STA   $980,Y     
         CPY   #80
         BPL   :NDB2
         STA   $0A00,Y    
         STA   $0A80,Y    
         STA   $0B00,Y    
         STA   $0B80,Y    
:NDB2
         DEY   
         BPL   :LP2       
:EXIT
         RTS
