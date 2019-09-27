*
*``````````````````````````````*
* COMP16        (NATHAN RIGGS) *
*                              *
* 16-BIT COMPARISON DIRECTIVE  *
*                              *
* BASED ON LEVENTHAL AND       *
* SAVILLE'S /6502 ASSEMBLY     *
* LANGUAGE ROUTINES/ LISTING   *
*                              *
* INPUT:                       *
*                              *
*  ]WPAR1 = 16-BIT CMP VALUE   *
*  ]WPAR2 = 16-BIT CMP VALUE   *
*                              *
* OUTPUT:                      *
*                              *
*  Z FLAG = 1 IF VALUES EQUAL  *
*  C FLAG = 0 IF CMP1 > CMP2,  *
*           1 IF CMP1 <= CMP2  *
*  N FLAG = 1 IF SIGNED CMP1 > *
*           SIGNED CMP2, 0 IF  *
*           SIGNED CMP1 <=     *
*           SIGNED CMP2        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^  ^^^^^^^^         *
*                              *
* CYCLES: 51+                  *
* SIZE: 27 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]CMP1    EQU   WPAR1      ; COMPARISON VAR 1
]CMP2    EQU   WPAR2      ; COMPARISON VAR 2
*
COMP16
         LDA   ]CMP1      ; FIRST, COMPARE LOW BYTES
         CMP   ]CMP2
         BEQ   :EQUAL     ; BRANCH IF EQUAL
         LDA   ]CMP1+1    ; COMPARE HIGH BYTES
         SBC   ]CMP2+1    ; SET ZERO FLAG TO 0,
         ORA   #1         ; SINCE LOW BYTES NOT EQUAL
         BVS   :OVFLOW    ; HANDLE V FLAG FOR SIGNED
         RTS
:EQUAL
         LDA   ]CMP1+1    ; COMPARE HIGH BYTES
         SBC   ]CMP2+1
         BVS   :OVFLOW    ; HANDLE OVERFLOW FOR SIGNED
         RTS
:OVFLOW
         EOR   #$80       ; COMPLEMENT NEGATIVE FLAG
         ORA   #1         ; IF OVERFLOW, Z = 0
         RTS
