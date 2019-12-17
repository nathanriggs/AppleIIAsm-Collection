LWORKPG  MAC
         LDA   ]1         
         CMP   #2         
         BNE   ]__P1      
         LDA   #2         
         STA   LWP        
         JMP   ]EXIT
]__P1
         LDA   #1         
         STA   LWP
]EXIT
         <<<
LVIEWPG  MAC
         LDA   ]1         
         CMP   #2         
         BNE   ]P1        
         BIT   VPG2       
         JMP   ]EXIT
]P1
         BIT   VPG1       
]EXIT
         <<<
LRGF     MAC
         BIT   LORES
         BIT   MIXEDOFF
         BIT   TEXTOFF    
         <<<
LRGP     MAC
         BIT   LORES
         BIT   MIXEDON
         BIT   TEXTOFF    
         <<<
LFCLR    MAC
         STY   SCRATCH
         LDA   ]1
         JSR   LRGFCLR
         LDY   SCRATCH
         <<<
LPCLR    MAC
         STY   SCRATCH
         LDA   ]1
         JSR   LRGPCLR
         LDY   SCRATCH
         <<<
LPLOT    MAC
         STY   SCRATCH
         LDX   ]1
         LDY   ]2
         LDA   ]3
         JSR   LRPLOT
         LDY   SCRATCH
         <<<
LLINE    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   WPAR2
         LDA   ]4
         STA   WPAR2+1
         LDA   ]5
         STA   BPAR1
         JSR   LRBLINE
         LDY   SCRATCH
         <<<
LCIRC    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR2
         LDA   ]3
         STA   WPAR3
         LDA   ]4
         STA   BPAR2
         JSR   LRCIRCLE
         LDY   SCRATCH
         <<<
LVLIN    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   BPAR1
         LDA   ]4
         STA   BPAR2
         JSR   LRVLINE
         LDY   SCRATCH
         <<<
LHLIN    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   BPAR1
         LDA   ]4
         STA   BPAR2
         JSR   LRHLINE
         LDY   SCRATCH
         <<<
LRGET    MAC
         STY   SCRATCH
         LDA   ]1
         STA   BPAR1
         LDA   ]2
         STA   BPAR2
         JSR   LRGETPIX
         LDY   SCRATCH
         <<<
LCHAR    MAC
         STY   SCRATCH
         LDA   ]1
         STA   BPAR1
         LDA   ]2
         STA   BPAR2
         LDA   #>]3
         STA   WPAR1+1
         LDA   #<]3
         STA   WPAR1
         LDA   ]4
         STA   BPAR3
         JSR   LRCHAR
         LDY   SCRATCH
         <<<
