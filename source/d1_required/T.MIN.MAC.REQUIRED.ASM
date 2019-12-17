_AXLIT   MAC              
         IF    #=]1       
         LDX   ]1/$100    
         LDA   ]1         
         ELSE  
         LDX   ]1+1       
         LDA   ]1         
         FIN   
         <<<   
_AXSTR   MAC   
         IF    "=]1 ;...... IF ]1 IS A STRING
         JMP   __STRCNT2  
]STRTMP  STR   ]1         
__STRCNT2 
         LDX   #>]STRTMP  
         LDA   #<]STRTMP  
         ELSE  
         _AXLIT ]1        
         FIN   
         <<<
_ISLIT   MAC   
         IF    #=]1       
         LDA   ]1/$100    
         PHA   
         LDA   ]1         
         PHA   
         ELSE  
         LDA   ]1+1       
         PHA   
         LDA   ]1         
         PHA   
         FIN   
         <<<
_ISSTR   MAC   
         IF    "=]1 ;...... IF ]1 IS A STRING
         JMP   __STRCONT  
]STRTMP  STR   ]1         
__STRCONT
         LDA   #>]STRTMP  
         PHA   
         LDA   #<]STRTMP  
         PHA   
         ELSE  
         _ISLIT ]1        
         FIN   
         <<<
_MLIT    MAC   
         IF    #=]1       
         LDA   ]1/$100    
         STA   ]2+1       
         LDA   ]1         
         STA   ]2         
         ELSE  
         LDA   ]1+1       
         STA   ]2+1       
         LDA   ]1         
         STA   ]2         
         FIN   
         <<<
_MSTR    MAC   
         IF    "=]1 ;...... IF ]1 IS A STRING
         JMP   __STRCONT  
]STRTMP  STR   ]1         
__STRCONT                 
         LDA   #>]STRTMP  
         STA   ]2+1       
         LDA   #<]STRTMP  
         STA   ]2         
         ELSE  
         _ISLIT ]1        
         FIN   
         <<<              
_PRN     MAC   
         STY   SCRATCH    
         JSR   __P        
         ASC   ]1         
         HEX   00         
         LDY   SCRATCH    
         <<<   
_WAIT    MAC   
]LP      LDA   ]KYBD      
         BPL   ]LP        
         AND   #$7F       
         STA   ]STROBE    
         <<<   
BCCL     MAC   
         BCC   ]TOBCC     
]NOBCC   JMP   ]EXIT      
]TOBCC   JMP   ]1         
]EXIT    
         <<<   
BCSL     MAC   
         BCS   ]TOBCS     
]NOBCS   JMP   ]EXIT      
]TOBCS   JMP   ]1         
]EXIT    
         <<<   
BEEP     MAC   
         STY   SCRATCH    
         LDX   ]1         
]LP1
         JSR   BELL       
         DEX   
         CPX   #0         
         BNE   ]LP1       
         LDY   SCRATCH    
         <<<   
BEQL     MAC   
         BEQ   ]TOBEQ     
]NOBEQ   JMP   ]EXIT      
]TOBEQ   JMP   ]1         
]EXIT    
         <<<   
BNEL     MAC   
         BNE   ]TOBNE     
]NOBNE   JMP   ]EXIT      
]TOBNE   JMP   ]1         
]EXIT    
         <<<   
BMIL     MAC   
         BMI   ]TOBMI     
]NOBMI   JMP   ]EXIT      
]TOBMI   JMP   ]1         
]EXIT    
         <<<   
BPLL     MAC   
         BPL   ]TOBPL     
]NOBPL   JMP   ]EXIT      
]TOBPL   JMP   ]1         
]EXIT    
         <<<   
BVCL     MAC   
         BVC   ]TOBVC     
]NOBVC   JMP   ]EXIT      
]TOBVC   JMP   ]1         
]EXIT    
         <<<   
BVSL     MAC   
         BVS   ]TOBVS     
]NOBVS   JMP   ]EXIT      
]TOBVS   JMP   ]1         
]EXIT    
         <<<   
CBRA     MAC   
         JMP   ]1
         <<<
CPHX     MAC   
         STA   SCRATCH    
         TXA   
         PHA   
         LDA   SCRATCH    
         <<<   
CPHY     MAC   
         STA   SCRATCH    
         TYA   
         PHA   
         LDA   SCRATCH    
         <<<   
CPLX     MAC   
         STA   SCRATCH    
         PLA   
         TAX   
         LDA   SCRATCH    
         <<<   
CPLY     MAC   
         STA   SCRATCH    
         PLA   
         TAY   
         LDA   SCRATCH    
         <<<   
CTXY     MAC   
         STA   SCRATCH    
         TXA   
         TAY   
         LDA   SCRATCH    
         <<<   
CTYX     MAC   
         STA   SCRATCH    
         TYA   
         TAX   
         LDA   SCRATCH    
         <<<   
CLRHI    MAC
         AND   #$F0       
         LSR   
         LSR   
         LSR   
         LSR   
         <<<
DELAY    MAC   
         STY   SCRATCH    
         LDY   ]1         
         JSR   DELAYMS    
         LDY   SCRATCH    
         <<<   
DUMP     MAC   
         _AXLIT ]1        
         STY   SCRATCH    
         LDY   ]2         
         JSR   __DUMP     
         LDY   SCRATCH    
         <<<   
GBIT     MAC   
         LDA   ]1         
         AND   ]2         
         BEQ   ]ZERO      
         LDA   #1         
         JMP   ]EXIT      
]ZERO    LDA   #0         
]EXIT    <<<
ERRH     MAC   
         STY   SCRATCH    
         _AXLIT 
         JSR   __ERRH     
         LDY   SCRATCH    
         <<<   
GRET     MAC   
         STY   SCRATCH    
         _AXLIT ]1        
         STA   ADDR1      
         STX   ADDR1+1    
         LDY   #255       
]LP
         INY              
         LDA   RETURN,Y   
         STA   (ADDR1),Y  ; ++<6C2B> COUNTER OFFSET
         CPY   RETLEN     
         BNE   ]LP        
         LDY   SCRATCH    
         <<<   
MFILL    MAC   
         STY   SCRATCH    
         _MLIT ]1;WPAR1   
         _MLIT ]2;WPAR2   
         LDA   ]3         
         STA   BPAR1      
         JSR   MEMFILL    
         LDY   SCRATCH    
MOV      MAC   
         IF    A=]1       
         IF    X=]2
         TAX
         ELSE
         IF    Y=]2
         TAY
         ELSE
         STA   ]2
         FIN
         FIN
         FIN
         IF    $=]1
         IF    A=]2
         LDA   ]1
         ELSE
         IF    X=]2
         LDX   ]1
         ELSE
         IF    Y=]2
         LDY   ]1
         ELSE
         STY   SCRATCH
         LDY   ]1
         STY   ]2
         LDY   SCRATCH
         FIN
         FIN
         FIN
         FIN
]EXIT    <<<   
MOVB     MAC   
         STY   SCRATCH    
         _MLIT ]1;WPAR1   
         _MLIT ]2;WPAR2   
         _MLIT ]3;WPAR3   
         JSR   MEMMOVE    
         LDY   SCRATCH    
         <<<   
MSWAP    MAC   
         STY   SCRATCH    
         _MLIT ]2;WPAR2   
         _MLIT ]1;WPAR1   
         LDA   ]3         
         STA   BPAR1      
         JSR   MEMSWAP    
         LDY   SCRATCH    
         <<<   
PEEK     MAC   
         LDA   ]1         
         <<<   
POKE     MAC   
         STA   ]1         
         <<<   
