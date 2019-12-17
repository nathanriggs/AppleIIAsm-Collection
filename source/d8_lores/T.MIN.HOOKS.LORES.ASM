TEXTOFF  EQU   $C050      
TEXTON   EQU   $C051      
MIXEDOFF EQU   $C052      
MIXEDON  EQU   $C053      
LORES    EQU   $C056      
HIRES    EQU   $C057      
VPG1     EQU   $C054      
VPG2     EQU   $C055      
LRGBCALC EQU   $F847      
GBASLO   EQU   $26        
GBASHI   EQU   $27        
]BLACK   EQU   $00        
]MAGENTA EQU   $01        
]DBLUE   EQU   $02        
]PURPLE  EQU   $03        
]DGREEN  EQU   $04        
]GREY1   EQU   $05        
]MBLUE   EQU   $06        
]LBLUE   EQU   $07        
]BROWN   EQU   $08        
]ORANGE  EQU   $09        
]GREY2   EQU   $0A        
]PINK    EQU   $0B        
MGREEN   EQU   $0C        
]YELLOW  EQU   $0D        
]AQUA    EQU   $0E        
]WHITE   EQU   $0F        
         JMP   ]EOF
]LOCCOL  DS    1          
]MASK    DS    2          
]COLMASK DS    2          
]X       DS    1          
]Y       DS    1          
]PAGEOFF DS    1          
LOCPLOT
         STY   ]Y         
         STX   ]X         
         STA   ]LOCCOL    
         LDA   ]LOCCOL    
         ASL   
         ASL   
         ASL
         ASL
         CLC   
         ADC   ]LOCCOL    
         STA   ]LOCCOL    
         LDA   LWP        
         CMP   #2         
         BNE   :PG1       
         LDA   #4         
         STA   ]PAGEOFF   
         JMP   :CNT       
:PG1
         LDA   #0         
         STA   ]PAGEOFF   
:CNT
         LDA   #0
         LDY   #0
         LDX   #0
         LDA   ]Y         
         LSR              
         
         BCC   :EVEN      
         LDX   #$F0       ; OTHERWISE, IT IS ODD
         
         BCS   :LPLOT     
:EVEN
         LDX   #$0F       
:LPLOT
         STX   ]MASK      
         ASL   
         TAY   
         LDA   LROFF,Y    
         CLC   
         ADC   ]X         
         STA   GBASLO     
         INY   
         LDA   LROFF,Y    
         ADC   ]PAGEOFF    
         STA   GBASHI     
         LDY   #0
         LDA   ]MASK      
         EOR   #$FF       
         AND   (GBASLO),Y 
         STA   ]COLMASK   
         LDA   ]LOCCOL    
         AND   ]MASK      
         ORA   ]COLMASK   
         STA   (GBASLO),Y 
         RTS
LWP      DS    1,1        
LROFF    DW    $400,$480,$500,$580,$600,$680,$700,$780
         DW    $428,$4A8,$528,$5A8,$628,$6A8,$728,$7A8
         DW    $450,$4D0,$550,$5D0,$650,$6D0,$750,$7D0
]EOF
