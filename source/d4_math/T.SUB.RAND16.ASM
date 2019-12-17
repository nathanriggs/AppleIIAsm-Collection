*``````````````````````````````*
* RAND16 : 16BIT RANDOM NUMBER *
*-                            -*
* GENERATE A 16BIT PSEUDO-     *
* RANDOM NUMBER AND RETURN IT  *
* IN Y,X (LOW, HIGH).          *
*                              *
* ORIGINAL AUTHOR IS WHITE     *
* FLAME, AS SHARED ON          *
* CODEBASE64.                  *
*                              *
* NOTE: THERE ARE 2048 MAGIC   *
* NUMBERS THAT COULD BE EOR'D  *
* TO GENERATE A PSEUDO-RANDOM  *
* PATTERN THAT DOESN'T REPEAT  *
* UNTIL 65535 ITERATIONS. TOO  *
* MANY TO LIST HERE, BUT SOME  *
* ARE: $002D, $1979, $1B47,    *
* $41BB, $3D91, $B5E9, $FFEB   *
*                              *
* INPUT:                       *
*                              *
*  NONE                        *
*                              *
* OUTPUT:                      *
*                              *
*  .A = RND VAL LOW BYTE       *
*  .X = RND VAL HIGH BYTE      *
*  RETURN = RND VALUE (2B)     *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^    ^^^         *
*                              *
* CYCLES: 90+                  *
* SIZE: 60 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SEED    EQU   WPAR1
*
RAND16
         LDA   RNDL       ; GET SEED LOBYTE
         STA   ]SEED
         LDA   RNDH       ; GET SEED HIBYTE
         STA   ]SEED+1
*
         LDA   ]SEED      ; CHECK IF $0 OR $8000
         BEQ   :LOW0
*
** DO A NORMAL SHIFT
*
         ASL   ]SEED      ; MUTATE
         LDA   ]SEED+1
         ROL
         BCC   :NOEOR     ; IF CARRY CLEAR, EXIT
:DOEOR                    ; HIGH BYTE IN A
         EOR   #>$0369    ; EXCLUSIVE OR WITH MAGIC NUMBER
         STA   ]SEED+1    ; STORE BACK INTO HIBYTE
         LDA   ]SEED
         EOR   #<$0369    ; DO THE SAME WITH LOW BYTE
         STA   ]SEED
         JMP   :EXIT
:LOW0
         LDA   ]SEED+1
         BEQ   :DOEOR     ; IF HIBYTE IS ALSO 0, APPLY EOR
         ASL
         BEQ   :NOEOR     ; IF 00, THEN IT WAS $80
         BCS   :DOEOR     ; ELSE DO EOR
:NOEOR
         STA   ]SEED+1
:EXIT
         LDX   ]SEED+1    ; VAL HIBYTE IN .X
         LDY   ]SEED      ; LOBYTE TEMP IN .Y
         STY   RETURN     ; TRANSFER TO RETURN AREA
         STX   RETURN+1
         LDA   #2         ; LENGTH OF RETURN IN BYTES
         STA   RETLEN
         TYA              ; TRANSFER LOBYTE TO .A
         RTS
