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
*  Z FLAG = 1 IF VALUES EQUAL  *
*  C FLAG = 0 IF CMP1 > CMP2,  *
*           1 IF CMP1 <= CMP2  *
*  N FLAG = 1 IF SIGNED CMP1 > *
*           SIGNED CMP2, 0 IF  *
*           SIGNED CMP1 <=     *
*           SIGNED CMP2        *
*                              *
* INPUT:                       *
*                              *
*  ]WPAR1 = 16-BIT CMP VALUE   *
*  ]WPAR2 = 16-BIT CMP VALUE   *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 53+                  *
* SIZE: 26 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]CMP1    EQU   WPAR1      ; COMPARISON VAR 1
]CMP2    EQU   WPAR2      ; COMPARISON VAR 2
*
COMP16
         LDA   ]CMP1      ; {3C2B} FIRST, COMPARE LOW BYTES
         CMP   ]CMP2      ; {3C2B}
         BEQ   :EQUAL     ; {3C2B} BRANCH IF EQUAL
         LDA   ]CMP1+1    ; {3C2B} COMPARE HIGH BYTES
         SBC   ]CMP2+1    ; {3C2B} SET ZERO FLAG TO 0,
         ORA   #1         ; {2C1B} SINCE LOW BYTES NOT EQUAL
         BVS   :OVFLOW    ; {3C2B} HANDLE V FLAG FOR SIGNED
         RTS              ; {6C1B}
:EQUAL
         LDA   ]CMP1+1    ; {3C2B} COMPARE HIGH BYTES
         SBC   ]CMP2+1    ; {3C2B}
         BVS   :OVFLOW    ; {3C2B} HANDLE OVERFLOW FOR SIGNED
         RTS              ; {6C1B}
:OVFLOW
         EOR   #$80       ; {3C2B} COMPLEMENT NEGATIVE FLAG
         ORA   #1         ; {3C2B} IF OVERFLOW, Z = 0
         RTS              ; {6C1B}
