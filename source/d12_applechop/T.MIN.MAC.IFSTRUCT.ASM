IFJ      MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         FIN
         IF    ]2,N       
         BNE   ]J4
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         FIN
         IF    ]2,L       
         BCC   ]J4
         FIN
         IF    ]2,)       
         BCS   ]J4
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         FIN
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JMP   ]4
]EXIT
         LDA   SCRATCH
         <<<
IFJE     MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         JMP   ]5
         FIN
         IF    ]2,N       
         BNE   ]J4
         JMP   ]5
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         JMP   ]5
         FIN
         IF    ]2,L       
         BCC   ]J4
         FIN
         IF    ]2,)       
         BCS   ]J4
         JMP   ]5
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         JMP   ]5
         FIN
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JMP   ]4
]EXIT
         LDA   SCRATCH
         <<<
IFRJ     MAC
         STA   SCRATCH
         STX   RESULT
         STY   RESULT+1
         IF    ]1,A       
         LDA   SCRATCH
         FIN
         IF    ]1,X
         LDA   RESULT
         FIN
         IF    ]1,Y
         LDA   RESULT+1
         FIN
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         FIN
         IF    ]2,N       
         BNE   ]J4
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         FIN
         IF    ]2,L       
         BCC   ]J4
         FIN
         IF    ]2,)       
         BCS   ]J4
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         FIN
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         JMP   ]4
]EXIT
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         <<<
IFRJE    MAC
         STA   SCRATCH
         STX   RESULT
         STY   RESULT+1
         IF    ]1,A       
         LDA   SCRATCH
         FIN
         IF    ]1,X
         LDA   RESULT
         FIN
         IF    ]1,Y
         LDA   RESULT+1
         FIN
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         JMP   ]5
         FIN
         IF    ]2,N       
         BNE   ]J4
         JMP   ]5
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         JMP   ]5
         FIN
         IF    ]2,L       
         BCC   ]J4
         JMP   ]5
         FIN
         IF    ]2,)       
         BCS   ]J4
         JMP   ]5
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         JMP   ]5
         FIN
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         JMP   ]4
]EXIT
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         <<<
IFS      MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         FIN
         IF    ]2,N       
         BNE   ]J4
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         FIN
         IF    ]2,L       
         BCC   ]J4
         FIN
         IF    ]2,)       
         BCS   ]J4
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         FIN
         LDA   SCRATCH
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JSR   ]4
]EXIT
         <<<
IFSE     MAC
         STA   SCRATCH
         LDA   ]1
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,N       
         BNE   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,L       
         BCC   ]J4
         FIN
         IF    ]2,)       
         BCS   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         LDA   SCRATCH
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         JSR   ]4
]EXIT
         <<<
IFRS     MAC
         STA   SCRATCH
         STX   RESULT
         STY   RESULT+1
         IF    ]1,A       
         LDA   SCRATCH
         FIN
         IF    ]1,X
         LDA   RESULT
         FIN
         IF    ]1,Y
         LDA   RESULT+1
         FIN
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         FIN
         IF    ]2,N       
         BNE   ]J4
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         FIN
         IF    ]2,L       
         BCC   ]J4
         FIN
         IF    ]2,)       
         BCS   ]J4
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         FIN
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         JSR   ]4
]EXIT
         <<<
IFRSE    MAC
         STA   SCRATCH
         STX   RESULT
         STY   RESULT+1
         IF    ]1,A       
         LDA   SCRATCH
         FIN
         IF    ]1,X
         LDA   RESULT
         FIN
         IF    ]1,Y
         LDA   RESULT+1
         FIN
         CMP   ]3
         IF    ]2,E       
         BEQ   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,N       
         BNE   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,G       
         BEQ   ]SKPGT     
         BCS   ]J4
]SKPGT
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,L       
         BCC   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,)       
         BCS   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         IF    ]2,(       
         BEQ   ]J4
         BCC   ]J4
         LDA   SCRATCH
         JSR   ]5
         FIN
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         JMP   ]EXIT
]J4
         LDA   SCRATCH
         LDX   RESULT
         LDY   RESULT+1
         JSR   ]4
]EXIT
         <<<
IFB      MAC
         STA   SCRATCH
]PTR     EQU   *
         LDA   ]PTR
         STA   ADDR1
         LDA   ]PTR+1
         STA   ADDR1/$100
_LOOP1
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$1B
         BNE   _LOOP1
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$9B
         BNE   _LOOP1
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$18
         BNE   _LOOP1
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$09
         BNE   _LOOP1
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         LDY   #0
         LDA   (ADDR1),Y
         CMP   #$06
         BNE   _LOOP1
         LDA   ADDR1
         LDA   ]1
         CMP   ]3
         IF    ]2,E       
         BEQ   _IFBOD
         FIN
         IF    ]2,N       
         BNE   _IFBOD
         FIN
         IF    ]2,G       
         BEQ   SKPGT      
         BCS   _IFBOD
SKPGT
         FIN
         IF    ]2,L       
         BCC   _IFBOD
         FIN
         IF    ]2,)       
         BCS   _IFBOD
         FIN
         IF    ]2,(       
         BEQ   _IFBOD
         BCC   _IFBOD
         FIN
         _PRN  "NOPE",8D8D
         LDA   ADDR1
         CLC
         ADC   #1
         STA   ADDR1
         LDA   ADDR1+1
         ADC   #0
         STA   ADDR1+1
         JMP   (ADDR1)
_IFBOD
         _PRN  "YEP",8D8D
         LDA   SCRATCH
         <<<
ENDIFB   MAC
         JMP   SKIPHEX
         HEX   1B9B180906 
SKIPHEX
         <<<
