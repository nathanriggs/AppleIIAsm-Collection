0901-   AA          TAX
0902-   AA          TAX
0903-   AA          TAX
0904-   AA          TAX
0905-   AA          TAX
0906-   AA          TAX
0907-   AA          TAX
0908-   AA          TAX
0909-   AA          TAX
090A-   AA          TAX
090B-   AA          TAX
090C-   AA          TAX
090D-   AA          TAX
090E-   AA          TAX
090F-   AA          TAX
0910-   AA          TAX
0911-   AA          TAX
0912-   AA          TAX
0913-   AA          TAX
0914-   AA          TAX
0915-   AA          TAX
0916-   AA          TAX
0917-   AA          TAX
0918-   AA          TAX
0919-   AA          TAX
091A-   AA          TAX
091B-   AA          TAX
091C-   AA          TAX
091D-   AA          TAX
091E-   AA          TAX
091F-   AA          TAX
0920-   AA          TAX
0921-   8D AA 20    STA   $20AA
0924-   20 20 20    JSR   $2020
0927-   20 20 20    JSR   $2020
092A-   20 20 20    JSR   $2020
092D-   20 20 20    JSR   $2020
0930-   20 20 20    JSR   $2020
0933-   20 20 20    JSR   $2020
0936-   20 20 20    JSR   $2020
0939-   20 20 20    JSR   $2020
093C-   20 20 20    JSR   $2020
093F-   20 20 AA    JSR   $AA20
0942-   8D AA 20    STA   $20AA
0945-   CD C1 DA    CMP   $DAC1
0948-   C5 20       CMP   $20
094A-   C7          ???
094B-   C5 CE       CMP   $CE
094D-   C5 D2       CMP   $D2
094F-   C1 D4       CMP   ($D4,X)
0951-   CF          ???
0952-   D2 20       CMP   ($20)
0954-   20 20 20    JSR   $2020
0957-   20 20 20    JSR   $2020
095A-   20 20 20    JSR   $2020
095D-   20 20 20    JSR   $2020
0960-   20 20 AA    JSR   $AA20
0963-   8D AA 20    STA   $20AA
0966-   20 20 20    JSR   $2020
0969-   20 20 20    JSR   $2020
096C-   20 20 20    JSR   $2020
096F-   20 20 20    JSR   $2020
0972-   20 20 20    JSR   $2020
0975-   20 20 20    JSR   $2020
0978-   20 20 20    JSR   $2020
097B-   20 20 20    JSR   $2020
097E-   20 20 20    JSR   $2020
0981-   20 20 AA    JSR   $AA20
0984-   8D AA AA    STA   $AAAA
0987-   AA          TAX
0988-   AA          TAX
0989-   AA          TAX
098A-   AA          TAX
098B-   AA          TAX
098C-   AA          TAX
098D-   AA          TAX
098E-   AA          TAX
098F-   AA          TAX
0990-   AA          TAX
0991-   AA          TAX
0992-   AA          TAX
0993-   AA          TAX
0994-   AA          TAX
0995-   AA          TAX
0996-   AA          TAX
0997-   AA          TAX
0998-   AA          TAX
0999-   AA          TAX
099A-   AA          TAX
099B-   AA          TAX
099C-   AA          TAX
099D-   AA          TAX
099E-   AA          TAX
099F-   AA          TAX
09A0-   AA          TAX
09A1-   AA          TAX
09A2-   AA          TAX
09A3-   AA          TAX
09A4-   AA          TAX
09A5-   8D AA 8D    STA   $8DAA
09A8-   AA          TAX
09A9-   AA          TAX
09AA-   20 C1 D3    JSR   $D3C1
09AD-   D3          ???
09AE-   C5 CD       CMP   $CD
09B0-   C2          ???
09B1-   CC C5 D2    CPY   $D2C5
09B4-   20 C4 C9    JSR   $C9C4
09B7-   D2 C5       CMP   ($C5)
09B9-   C3          ???
09BA-   D4          ???
09BB-   C9 D6       CMP   #$D6
09BD-   C5 D3       CMP   $D3
09BF-   8D AA 8D    STA   $8DAA
09C2-   A0 C3       LDY   #$C3
09C4-   D9 C3 A0    CMP   $A0C3,Y
09C7-   C1 D6       CMP   ($D6,X)
09C9-   C5 8D       CMP   $8D
09CB-   A0 C5       LDY   #$C5
09CD-   D8          CLD
09CE-   D0 A0       BNE   $0970
09D0-   CF          ???
09D1-   C6 C6       DEC   $C6
09D3-   8D A0 C4    STA   $C4A0
09D6-   D3          ???
09D7-   CB          ???
09D8-   A0 CD       LDY   #$CD
09DA-   C1 CB       CMP   ($CB,X)
09DC-   C5 CD       CMP   $CD
09DE-   C1 DA       CMP   ($DA,X)
09E0-   C5 8D       CMP   $8D
09E2-   A0 D4       LDY   #$D4
09E4-   D2 A0       CMP   ($A0)
09E6-   CF          ???
09E7-   CE 8D A0    DEC   $A08D
09EA-   CF          ???
09EB-   C2          ???
09EC-   CA          DEX
09ED-   A0 A4       LDY   #$A4
09EF-   C2          ???
09F0-   C6 C5       DEC   $C5
09F2-   B0 8D       BCS   $0981
09F4-   A0 CF       LDY   #$CF
09F6-   D2 C7       CMP   ($C7)
09F8-   A0 A4       LDY   #$A4
09FA-   B6 B0       LDX   $B0,Y
09FC-   B0 B0       BCS   $09AE
09FE-   8D AA 8D    STA   $8DAA
0A01-   A0 D0       LDY   #$D0
0A03-   D5 D4       CMP   $D4,X
0A05-   A0 D2       LDY   #$D2
0A07-   C5 D1       CMP   $D1
0A09-   D5 C9       CMP   $C9,X
0A0B-   D2 C5       CMP   ($C5)
0A0D-   C4 AE       CPY   $AE
0A0F-   D6 C1       DEC   $C1,X
0A11-   D2 D3       CMP   ($D3)
0A13-   8D A0 D5    STA   $D5A0
0A16-   D3          ???
0A17-   C5 A0       CMP   $A0
0A19-   D2 C5       CMP   ($C5)
0A1B-   D1 D5       CMP   ($D5),Y
0A1D-   C9 D2       CMP   #$D2
0A1F-   C5 C4       CMP   $C4
0A21-   AE CD C1    LDX   $C1CD
0A24-   C3          ???
0A25-   AE CD C9    LDX   $C9CD
0A28-   CE 8D 20    DEC   $208D
0A2B-   A0 D5       LDY   #$D5
0A2D-   D3          ???
0A2E-   C5 A0       CMP   $A0
0A30-   C1 D2       CMP   ($D2,X)
0A32-   D2 C1       CMP   ($C1)
0A34-   D9 D3 AE    CMP   $AED3,Y
0A37-   CD C1 C3    CMP   $C3C1
0A3A-   AE CD C9    LDX   $C9CD
0A3D-   CE 8D 20    DEC   $208D
0A40-   A0 D5       LDY   #$D5
0A42-   D3          ???
0A43-   C5 A0       CMP   $A0
0A45-   CD C1 D4    CMP   $D4C1
0A48-   C8          INY
0A49-   AE CD C1    LDX   $C1CD
0A4C-   C3          ???
0A4D-   AE CD C9    LDX   $C9CD
0A50-   CE 8D A0    DEC   $A08D
0A53-   D5 D3       CMP   $D3,X
0A55-   C5 A0       CMP   $A0
0A57-   D3          ???
0A58-   D4          ???
0A59-   C4 C9       CPY   $C9
0A5B-   CF          ???
0A5C-   AE CD C1    LDX   $C1CD
0A5F-   C3          ???
0A60-   AE CD C9    LDX   $C9CD
0A63-   CE 8D A0    DEC   $A08D
0A66-   D0 D5       BNE   $0A3D
0A68-   D4          ???
0A69-   A0 D2       LDY   #$D2
0A6B-   C5 D1       CMP   $D1
0A6D-   D5 C9       CMP   $C9,X
0A6F-   D2 C5       CMP   ($C5)
0A71-   C4 AE       CPY   $AE
0A73-   C8          INY
0A74-   CF          ???
0A75-   CF          ???
0A76-   CB          ???
0A77-   D3          ???
0A78-   AE CD C9    LDX   $C9CD
0A7B-   CE 8D A0    DEC   $A08D
0A7E-   D0 D5       BNE   $0A55
0A80-   D4          ???
0A81-   A0 D3       LDY   #$D3
0A83-   D4          ???
0A84-   C4 C9       CPY   $C9
0A86-   CF          ???
0A87-   AE C8 CF    LDX   $CFC8
0A8A-   CF          ???
0A8B-   CB          ???
0A8C-   D3          ???
0A8D-   8D A0 D0    STA   $D0A0
0A90-   D5 D4       CMP   $D4,X
0A92-   A0 CD       LDY   #$CD
0A94-   C1 D4       CMP   ($D4,X)
0A96-   C8          INY
0A97-   AE C8 CF    LDX   $CFC8
0A9A-   CF          ???
0A9B-   CB          ???
0A9C-   D3          ???
0A9D-   8D A0 D0    STA   $D0A0
0AA0-   D5 D4       CMP   $D4,X
0AA2-   A0 C1       LDY   #$C1
0AA4-   D2 D2       CMP   ($D2)
0AA6-   C1 D9       CMP   ($D9,X)
0AA8-   D3          ???
0AA9-   AE C8 CF    LDX   $CFC8
0AAC-   CF          ???
0AAD-   CB          ???
0AAE-   D3          ???
0AAF-   8D AA 8D    STA   $8DAA
0AB2-   AA          TAX
0AB3-   AA          TAX
0AB4-   AA          TAX
0AB5-   AA          TAX
0AB6-   AA          TAX
0AB7-   AA          TAX
0AB8-   AA          TAX
0AB9-   AA          TAX
0ABA-   AA          TAX
0ABB-   AA          TAX
0ABC-   AA          TAX
0ABD-   AA          TAX
0ABE-   AA          TAX
0ABF-   AA          TAX
0AC0-   AA          TAX
0AC1-   AA          TAX
0AC2-   AA          TAX
0AC3-   AA          TAX
0AC4-   AA          TAX
0AC5-   AA          TAX
0AC6-   AA          TAX
0AC7-   AA          TAX
0AC8-   AA          TAX
0AC9-   AA          TAX
0ACA-   AA          TAX
0ACB-   AA          TAX
0ACC-   AA          TAX
0ACD-   AA          TAX
0ACE-   AA          TAX
0ACF-   AA          TAX
0AD0-   AA          TAX
0AD1-   AA          TAX
0AD2-   8D AA 20    STA   $20AA
0AD5-   20 20 20    JSR   $2020
0AD8-   20 20 20    JSR   $2020
0ADB-   20 20 20    JSR   $2020
0ADE-   20 20 20    JSR   $2020
0AE1-   20 20 20    JSR   $2020
0AE4-   20 20 20    JSR   $2020
0AE7-   20 20 20    JSR   $2020
0AEA-   20 20 20    JSR   $2020
0AED-   20 20 20    JSR   $2020
0AF0-   20 20 AA    JSR   $AA20
0AF3-   8D AA 20    STA   $20AA
0AF6-   C3          ???
0AF7-   CF          ???
0AF8-   CE D3 D4    DEC   $D4D3
0AFB-   C1 CE       CMP   ($CE,X)
0AFD-   D4          ???
0AFE-   20 C4 C5    JSR   $C5C4
0B01-   C3          ???
0B02-   CC C1 D2    CPY   $D2C1
0B05-   C1 D4       CMP   ($D4,X)
0B07-   C9 CF       CMP   #$CF
0B09-   CE D3 20    DEC   $20D3
0B0C-   20 20 20    JSR   $2020
0B0F-   20 20 20    JSR   $2020
0B12-   20 AA 8D    JSR   $8DAA
0B15-   AA          TAX
0B16-   20 20 20    JSR   $2020
0B19-   20 20 20    JSR   $2020
0B1C-   20 20 20    JSR   $2020
0B1F-   20 20 20    JSR   $2020
0B22-   20 20 20    JSR   $2020
0B25-   20 20 20    JSR   $2020
0B28-   20 20 20    JSR   $2020
0B2B-   20 20 20    JSR   $2020
0B2E-   20 20 20    JSR   $2020
0B31-   20 20 20    JSR   $2020
0B34-   AA          TAX
0B35-   8D AA AA    STA   $AAAA
0B38-   AA          TAX
0B39-   AA          TAX
0B3A-   AA          TAX
0B3B-   AA          TAX
0B3C-   AA          TAX
0B3D-   AA          TAX
0B3E-   AA          TAX
0B3F-   AA          TAX
0B40-   AA          TAX
0B41-   AA          TAX
0B42-   AA          TAX
0B43-   AA          TAX
0B44-   AA          TAX
0B45-   AA          TAX
0B46-   AA          TAX
0B47-   AA          TAX
0B48-   AA          TAX
0B49-   AA          TAX
0B4A-   AA          TAX
0B4B-   AA          TAX
0B4C-   AA          TAX
0B4D-   AA          TAX
0B4E-   AA          TAX
0B4F-   AA          TAX
0B50-   AA          TAX
0B51-   AA          TAX
0B52-   AA          TAX
0B53-   AA          TAX
0B54-   AA          TAX
0B55-   AA          TAX
0B56-   8D AA 8D    STA   $8DAA
0B59-   C2          ???
0B5A-   C1 D3       CMP   ($D3,X)
0B5C-   A0 C5       LDY   #$C5
0B5E-   D1 D5       CMP   ($D5),Y
0B60-   A0 A4       LDY   #$A4
0B62-   B2 B0       LDA   ($B0)
0B64-   B0 B0       BCS   $0B16
0B66-   A0 BB       LDY   #$BB
0B68-   20 C2 C1    JSR   $C1C2
0B6B-   D3          ???
0B6C-   C5 20       CMP   $20
0B6E-   C1 C4       CMP   ($C4,X)
0B70-   C4 D2       CPY   $D2
0B72-   C5 D3       CMP   $D3
0B74-   D3          ???
0B75-   20 C6 CF    JSR   $CFC6
0B78-   D2 20       CMP   ($20)
0B7A-   C1 D2       CMP   ($D2,X)
0B7C-   D2 C1       CMP   ($C1)
0B7E-   D9 D3 8D    CMP   $8DD3,Y
0B81-   AA          TAX
0B82-   8D AA AA    STA   $AAAA
0B85-   20 CE CF    JSR   $CFCE
0B88-   D4          ???
0B89-   C5 20       CMP   $20
0B8B-   D4          ???
0B8C-   C8          INY
0B8D-   C1 D4       CMP   ($D4,X)
0B8F-   20 D8 CC    JSR   $CCD8
0B92-   C5 CE       CMP   $CE
0B94-   20 C1 CE    JSR   $CEC1
0B97-   C4 20       CPY   $20
0B99-   D9 CC C5    CMP   $C5CC,Y
0B9C-   CE 20 C3    DEC   $C320
0B9F-   C1 CE       CMP   ($CE,X)
0BA1-   CE CF D4    DEC   $D4CF
0BA4-   20 C5 D8    JSR   $D8C5
0BA7-   C3          ???
0BA8-   C5 C5       CMP   $C5
0BAA-   C4 20       CPY   $20
0BAC-   B1 B3       LDA   ($B3),Y
0BAE-   AC 20 C1    LDY   $C120
0BB1-   D3          ???
0BB2-   20 D4 C8    JSR   $C8D4
0BB5-   C9 D3       CMP   #$D3
0BB7-   8D AA AA    STA   $AAAA
0BBA-   20 D7 CF    JSR   $CFD7
0BBD-   D5 CC       CMP   $CC,X
0BBF-   C4 20       CPY   $20
0BC1-   CD C1 CB    CMP   $CBC1
0BC4-   C5 20       CMP   $20
0BC6-   D4          ???
0BC7-   C8          INY
0BC8-   C5 20       CMP   $20
0BCA-   C1 D2       CMP   ($D2,X)
0BCC-   D2 C1       CMP   ($C1)
0BCE-   D9 20 D3    CMP   $D320,Y
0BD1-   C9 DA       CMP   #$DA
0BD3-   C5 D3       CMP   $D3
0BD5-   20 BE B2    JSR   $B2BE
0BD8-   B5 B6       LDA   $B6,X
0BDA-   AC 20 D7    LDY   $D720
0BDD-   C8          INY
0BDE-   C9 C3       CMP   #$C3
0BE0-   C8          INY
0BE1-   20 C9 D3    JSR   $D3C9
0BE4-   CE A7 D4    DEC   $D4A7
0BE7-   8D AA AA    STA   $AAAA
0BEA-   20 D7 C8    JSR   $C8D7
0BED-   C1 D4       CMP   ($D4,X)
0BEF-   20 B8 AD    JSR   $ADB8
0BF2-   C2          ???
0BF3-   C9 D4       CMP   #$D4
0BF5-   20 C1 D2    JSR   $D2C1
0BF8-   D2 C1       CMP   ($C1)
0BFA-   D9 D3 20    CMP   $20D3,Y
0BFD-   C1 D2       CMP   ($D2,X)
0BFF-   C5 20       CMP   $20
0C01-   D0 D2       BNE   $0BD5
0C03-   C5 D0       CMP   $D0
0C05-   C1 D2       CMP   ($D2,X)
0C07-   C5 C4       CMP   $C4
0C09-   20 D4 CF    JSR   $CFD4
0C0C-   20 C8 C1    JSR   $C1C8
0C0F-   CE C4 CC    DEC   $CCC4
0C12-   C5 AE       CMP   $AE
0C14-   8D AA 8D    STA   $8DAA
0C17-   AA          TAX
0C18-   AA          TAX
0C19-   20 D4 C8    JSR   $C8D4
0C1C-   C5 20       CMP   $20
0C1E-   CE C5 D8    DEC   $D8C5
0C21-   D4          ???
0C22-   20 D5 D0    JSR   $D0D5
0C25-   C4 C1       CPY   $C1
0C27-   D4          ???
0C28-   C5 20       CMP   $20
0C2A-   D7          ???
0C2B-   C9 CC       CMP   #$CC
0C2D-   CC 20 D5    CPY   $D520
0C30-   D4          ???
0C31-   C9 CC       CMP   #$CC
0C33-   C9 DA       CMP   #$DA
0C35-   C5 20       CMP   $20
0C37-   B1 B6       LDA   ($B6),Y
0C39-   AD C2 C9    LDA   $C9C2
0C3C-   D4          ???
0C3D-   20 C1 D2    JSR   $D2C1
0C40-   D2 C1       CMP   ($C1)
0C42-   D9 D3 8D    CMP   $8DD3,Y
0C45-   AA          TAX
0C46-   AA          TAX
0C47-   20 D4 CF    JSR   $CFD4
0C4A-   20 C1 C4    JSR   $C4C1
0C4D-   C4 D2       CPY   $D2
0C4F-   C5 D3       CMP   $D3
0C51-   D3          ???
0C52-   20 D4 C8    JSR   $C8D4
0C55-   C9 D3       CMP   #$D3
0C57-   20 D0 D2    JSR   $D2D0
0C5A-   CF          ???
0C5B-   C2          ???
0C5C-   CC C5 CD    CPY   $CDC5
0C5F-   AE 8D AA    LDX   $AA8D
0C62-   8D D8 CC    STA   $CCD8
0C65-   C5 CE       CMP   $CE
0C67-   A0 CB       LDY   #$CB
0C69-   C2          ???
0C6A-   C4 A0       CPY   $A0
0C6C-   A2 C5       LDX   #$C5
0C6E-   CE D4 C5    DEC   $C5D4
0C71-   D2 20       CMP   ($20)
0C73-   CD C1 DA    CMP   $DAC1
0C76-   C5 20       CMP   $20
0C78-   D3          ???
0C79-   C9 DA       CMP   #$DA
0C7B-   C5 20       CMP   $20
0C7D-   A8          TAY
0C7E-   BC B1 B4    LDY   $B4B1,X
0C81-   A9 A2       LDA   #$A2
0C83-   8D D9 CC    STA   $CCD9
0C86-   C5 CE       CMP   $CE
0C88-   A0 C5       LDY   #$C5
0C8A-   D1 D5       CMP   ($D5),Y
0C8C-   A0 D8       LDY   #$D8
0C8E-   CC C5 CE    CPY   $CEC5
0C91-   A0 BB       LDY   #$BB
0C93-   20 C3 D5    JSR   $D5C3
0C96-   D2 D2       CMP   ($D2)
0C98-   C5 CE       CMP   $CE
0C9A-   D4          ???
0C9B-   20 C1 CC    JSR   $CCC1
0C9E-   C7          ???
0C9F-   CF          ???
0CA0-   20 CF CE    JSR   $CECF
0CA3-   CC D9 20    CPY   $20D9
0CA6-   C4 CF       CPY   $CF
0CA8-   C5 D3       CMP   $D3
0CAA-   20 D3 D1    JSR   $D1D3
0CAD-   D5 C1       CMP   $C1,X
0CAF-   D2 C5       CMP   ($C5)
0CB1-   8D D8 CD    STA   $CDD8
0CB4-   C1 D8       CMP   ($D8,X)
0CB6-   A0 C5       LDY   #$C5
0CB8-   D1 D5       CMP   ($D5),Y
0CBA-   A0 D8       LDY   #$D8
0CBC-   CC C5 CE    CPY   $CEC5
0CBF-   AB          ???
0CC0-   B2 A0       LDA   ($A0)
0CC2-   BB          ???
0CC3-   20 C1 C4    JSR   $C4C1
0CC6-   C4 20       CPY   $20
0CC8-   C5 D8       CMP   $D8
0CCA-   D4          ???
0CCB-   D2 C1       CMP   ($C1)
0CCD-   20 C3 CF    JSR   $CFC3
0CD0-   CC D5 CD    CPY   $CDD5
0CD3-   CE 8D D9    DEC   $D98D
0CD6-   CD C1 D8    CMP   $D8C1
0CD9-   A0 C5       LDY   #$C5
0CDB-   D1 D5       CMP   ($D5),Y
0CDD-   A0 D9       LDY   #$D9
0CDF-   CC C5 CE    CPY   $CEC5
0CE2-   AB          ???
0CE3-   B2 A0       LDA   ($A0)
0CE5-   BB          ???
0CE6-   20 C1 C4    JSR   $C4C1
0CE9-   C4 20       CPY   $20
0CEB-   C5 D8       CMP   $D8
0CED-   D4          ???
0CEE-   D2 C1       CMP   ($C1)
0CF0-   20 D2 CF    JSR   $CFD2
0CF3-   D7          ???
0CF4-   8D D8 CE    STA   $CED8
0CF7-   D5 CD       CMP   $CD,X
0CF9-   A0 C5       LDY   #$C5
0CFB-   D1 D5       CMP   ($D5),Y
0CFD-   A0 B2       LDY   #$B2
0CFF-   AA          TAX
0D00-   D8          CLD
0D01-   CC C5 CE    CPY   $CEC5
0D04-   AB          ???
0D05-   B2 8D       LDA   ($8D)
0D07-   C1 D3       CMP   ($D3,X)
0D09-   DA          PHX
0D0A-   A0 C5       LDY   #$C5
0D0C-   D1 D5       CMP   ($D5),Y
0D0E-   A0 D8       LDY   #$D8
0D10-   CD C1 D8    CMP   $D8C1
0D13-   AA          TAX
0D14-   D9 CD C1    CMP   $C1CD,Y
0D17-   D8          CLD
0D18-   AB          ???
0D19-   B4 A0       LDY   $A0,X
0D1B-   BB          ???
0D1C-   20 C1 D2    JSR   $D2C1
0D1F-   D2 C1       CMP   ($C1)
0D21-   D9 20 D3    CMP   $D320,Y
0D24-   C9 DA       CMP   #$DA
0D26-   C5 AB       CMP   $AB
0D28-   C9 CE       CMP   #$CE
0D2A-   C6 CF       DEC   $CF
0D2C-   20 C2 D9    JSR   $D9C2
0D2F-   D4          ???
0D30-   C5 D3       CMP   $D3
0D32-   8D D8 D3    STA   $D3D8
0D35-   D4          ???
0D36-   C1 CB       CMP   ($CB,X)
0D38-   D3          ???
0D39-   A0 C5       LDY   #$C5
0D3B-   D1 D5       CMP   ($D5),Y
0D3D-   A0 C1       LDY   #$C1
0D3F-   D3          ???
0D40-   DA          PHX
0D41-   A0 BB       LDY   #$BB
0D43-   20 C3 CF    JSR   $CFC3
0D46-   CC D5 CD    CPY   $CDD5
0D49-   CE 20 D3    DEC   $D320
0D4C-   D4          ???
0D4D-   C1 C3       CMP   ($C3,X)
0D4F-   CB          ???
0D50-   20 D3 C9    JSR   $C9D3
0D53-   DA          PHX
0D54-   C5 BB       CMP   $BB
0D56-   20 D8 20    JSR   $20D8
0D59-   AA          TAX
0D5A-   20 D9 20    JSR   $20D9
0D5D-   AB          ???
0D5E-   20 B1 8D    JSR   $8DB1
0D61-   D9 D3 D4    CMP   $D4D3,Y
0D64-   C1 CB       CMP   ($CB,X)
0D66-   D3          ???
0D67-   A0 C5       LDY   #$C5
0D69-   D1 D5       CMP   ($D5),Y
0D6B-   A0 C1       LDY   #$C1
0D6D-   D3          ???
0D6E-   DA          PHX
0D6F-   A0 BB       LDY   #$BB
0D71-   20 D2 CF    JSR   $CFD2
0D74-   D7          ???
0D75-   20 D3 D4    JSR   $D4D3
0D78-   C1 C3       CMP   ($C3,X)
0D7A-   CB          ???
0D7B-   20 D3 C9    JSR   $C9D3
0D7E-   DA          PHX
0D7F-   C5 BB       CMP   $BB
0D81-   20 D8 20    JSR   $20D8
0D84-   AA          TAX
0D85-   20 D9 20    JSR   $20D9
0D88-   AB          ???
0D89-   20 B1 8D    JSR   $8DB1
0D8C-   AA          TAX
0D8D-   8D D3 CF    STA   $CFD3
0D90-   D5 D4       CMP   $D4,X
0D92-   C8          INY
0D93-   D7          ???
0D94-   A0 C5       LDY   #$C5
0D96-   D1 D5       CMP   ($D5),Y
0D98-   A0 C2       LDY   #$C2
0D9A-   C1 D3       CMP   ($D3,X)
0D9C-   A0 BB       LDY   #$BB
0D9E-   20 D3 CF    JSR   $CFD3
0DA1-   D5 D4       CMP   $D4,X
0DA3-   C8          INY
0DA4-   20 D7 C1    JSR   $C1D7
0DA7-   CC CC D3    CPY   $D3CC
0DAA-   20 C1 D2    JSR   $D2C1
0DAD-   D2 C1       CMP   ($C1)
0DAF-   D9 8D D7    CMP   $D78D,Y
0DB2-   C5 D3       CMP   $D3
0DB4-   D4          ???
0DB5-   D7          ???
0DB6-   A0 C5       LDY   #$C5
0DB8-   D1 D5       CMP   ($D5),Y
0DBA-   A0 C1       LDY   #$C1
0DBC-   D3          ???
0DBD-   DA          PHX
0DBE-   AB          ???
0DBF-   C2          ???
0DC0-   C1 D3       CMP   ($D3,X)
0DC2-   A0 BB       LDY   #$BB
0DC4-   20 D7 C5    JSR   $C5D7
0DC7-   D3          ???
0DC8-   D4          ???
0DC9-   20 D7 C1    JSR   $C1D7
0DCC-   CC CC D3    CPY   $D3CC
0DCF-   20 C1 D2    JSR   $D2C1
0DD2-   D2 C1       CMP   ($C1)
0DD4-   D9 8D D6    CMP   $D68D,Y
0DD7-   C9 D3       CMP   #$D3
0DD9-   C9 D4       CMP   #$D4
0DDB-   C5 C4       CMP   $C4
0DDD-   A0 C5       LDY   #$C5
0DDF-   D1 D5       CMP   ($D5),Y
0DE1-   A0 B2       LDY   #$B2
0DE3-   AA          TAX
0DE4-   C1 D3       CMP   ($D3,X)
0DE6-   DA          PHX
0DE7-   AB          ???
0DE8-   C2          ???
0DE9-   C1 D3       CMP   ($D3,X)
0DEB-   A0 BB       LDY   #$BB
0DED-   20 C3 C5    JSR   $C5C3
0DF0-   CC CC D3    CPY   $D3CC
0DF3-   20 D6 C9    JSR   $C9D6
0DF6-   D3          ???
0DF7-   C9 D4       CMP   #$D4
0DF9-   C5 C4       CMP   $C4
0DFB-   8D D8 D3    STA   $D3D8
0DFE-   D4          ???
0DFF-   C1 C3       CMP   ($C3,X)
0E01-   CB          ???
0E02-   A0 C5       LDY   #$C5
0E04-   D1 D5       CMP   ($D5),Y
0E06-   A0 B3       LDY   #$B3
0E08-   AA          TAX
0E09-   C1 D3       CMP   ($D3,X)
0E0B-   DA          PHX
0E0C-   AB          ???
0E0D-   C2          ???
0E0E-   C1 D3       CMP   ($D3,X)
0E10-   A0 BB       LDY   #$BB
0E12-   20 D3 D4    JSR   $D4D3
0E15-   C1 C3       CMP   ($C3,X)
0E17-   CB          ???
0E18-   20 C6 CF    JSR   $CFC6
0E1B-   D2 20       CMP   ($20)
0E1D-   C3          ???
0E1E-   CF          ???
0E1F-   CC D5 CD    CPY   $CDD5
0E22-   CE D3 8D    DEC   $8DD3
0E25-   D9 D3 D4    CMP   $D4D3,Y
0E28-   C1 C3       CMP   ($C3,X)
0E2A-   CB          ???
0E2B-   A0 C5       LDY   #$C5
0E2D-   D1 D5       CMP   ($D5),Y
0E2F-   A0 B4       LDY   #$B4
0E31-   AA          TAX
0E32-   C1 D3       CMP   ($D3,X)
0E34-   DA          PHX
0E35-   AB          ???
0E36-   C2          ???
0E37-   C1 D3       CMP   ($D3,X)
0E39-   A0 BB       LDY   #$BB
0E3B-   20 D3 D4    JSR   $D4D3
0E3E-   C1 C3       CMP   ($C3,X)
0E40-   CB          ???
0E41-   20 C6 CF    JSR   $CFC6
0E44-   D2 20       CMP   ($20)
0E46-   D2 CF       CMP   ($CF)
0E48-   D7          ???
0E49-   D3          ???
0E4A-   8D AA 8D    STA   $8DAA
0E4D-   AA          TAX
0E4E-   AA          TAX
0E4F-   AA          TAX
0E50-   AA          TAX
0E51-   AA          TAX
0E52-   AA          TAX
0E53-   AA          TAX
0E54-   AA          TAX
0E55-   AA          TAX
0E56-   AA          TAX
0E57-   AA          TAX
0E58-   AA          TAX
0E59-   AA          TAX
0E5A-   AA          TAX
0E5B-   AA          TAX
0E5C-   AA          TAX
0E5D-   AA          TAX
0E5E-   AA          TAX
0E5F-   AA          TAX
0E60-   AA          TAX
0E61-   AA          TAX
0E62-   AA          TAX
0E63-   AA          TAX
0E64-   AA          TAX
0E65-   AA          TAX
0E66-   AA          TAX
0E67-   AA          TAX
0E68-   AA          TAX
0E69-   AA          TAX
0E6A-   AA          TAX
0E6B-   AA          TAX
0E6C-   AA          TAX
0E6D-   8D AA 20    STA   $20AA
0E70-   20 20 20    JSR   $2020
0E73-   20 20 20    JSR   $2020
0E76-   20 20 20    JSR   $2020
0E79-   20 20 20    JSR   $2020
0E7C-   20 20 20    JSR   $2020
0E7F-   20 20 20    JSR   $2020
0E82-   20 20 20    JSR   $2020
0E85-   20 20 20    JSR   $2020
0E88-   20 20 20    JSR   $2020
0E8B-   20 20 AA    JSR   $AA20
0E8E-   8D AA 20    STA   $20AA
0E91-   CD C1 C9    CMP   $C9C1
0E94-   CE 20 D0    DEC   $D020
0E97-   D2 CF       CMP   ($CF)
0E99-   C7          ???
0E9A-   D2 C1       CMP   ($C1)
0E9C-   CD 20 CC    CMP   $CC20
0E9F-   CF          ???
0EA0-   CF          ???
0EA1-   D0 20       BNE   $0EC3
0EA3-   20 20 20    JSR   $2020
0EA6-   20 20 20    JSR   $2020
0EA9-   20 20 20    JSR   $2020
0EAC-   20 20 AA    JSR   $AA20
0EAF-   8D AA 20    STA   $20AA
0EB2-   20 20 20    JSR   $2020
0EB5-   20 20 20    JSR   $2020
0EB8-   20 20 20    JSR   $2020
0EBB-   20 20 20    JSR   $2020
0EBE-   20 20 20    JSR   $2020
0EC1-   20 20 20    JSR   $2020
0EC4-   20 20 20    JSR   $2020
0EC7-   20 20 20    JSR   $2020
0ECA-   20 20 20    JSR   $2020
0ECD-   20 20 AA    JSR   $AA20
0ED0-   8D AA AA    STA   $AAAA
0ED3-   AA          TAX
0ED4-   AA          TAX
0ED5-   AA          TAX
0ED6-   AA          TAX
0ED7-   AA          TAX
0ED8-   AA          TAX
0ED9-   AA          TAX
0EDA-   AA          TAX
0EDB-   AA          TAX
0EDC-   AA          TAX
0EDD-   AA          TAX
0EDE-   AA          TAX
0EDF-   AA          TAX
0EE0-   AA          TAX
0EE1-   AA          TAX
0EE2-   AA          TAX
0EE3-   AA          TAX
0EE4-   AA          TAX
0EE5-   AA          TAX
0EE6-   AA          TAX
0EE7-   AA          TAX
0EE8-   AA          TAX
0EE9-   AA          TAX
0EEA-   AA          TAX
0EEB-   AA          TAX
0EEC-   AA          TAX
0EED-   AA          TAX
0EEE-   AA          TAX
0EEF-   AA          TAX
0EF0-   AA          TAX
0EF1-   8D AA 8D    STA   $8DAA
0EF4-   C9 CE       CMP   #$CE
0EF6-   C9 D4       CMP   #$D4
0EF8-   8D AA 8D    STA   $8DAA
0EFB-   AA          TAX
0EFC-   CC C4 C1    CPY   $C1C4
0EFF-   20 A3 B0    JSR   $B0A3
0F02-   8D AA D3    STA   $D3AA
0F05-   D4          ???
0F06-   C1 20       CMP   ($20,X)
0F08-   C5 D2       CMP   $D2
0F0A-   D2 C3       CMP   ($C3)
0F0C-   D4          ???
0F0D-   D2 CC       CMP   ($CC)
0F0F-   20 BB 20    JSR   $20BB
0F12-   D4          ???
0F13-   D5 D2       CMP   $D2,X
0F15-   CE 20 CF    DEC   $CF20
0F18-   C6 C6       DEC   $C6
0F1A-   20 C5 D2    JSR   $D2C5
0F1D-   D2 CF       CMP   ($CF)
0F1F-   D2 D3       CMP   ($D3)
0F21-   8D A0 CA    STA   $CAA0
0F24-   D3          ???
0F25-   D2 A0       CMP   ($A0)
0F27-   C8          INY
0F28-   CF          ???
0F29-   CD C5 8D    CMP   $8DC5
0F2C-   A0 D0       LDY   #$D0
0F2E-   D2 CE       CMP   ($CE)
0F30-   A0 A2       LDY   #$A2
0F32-   C9 CE       CMP   #$CE
0F34-   C9 D4       CMP   #$D4
0F36-   C9 C1       CMP   #$C1
0F38-   CC C9 DA    CPY   $DAC9
0F3B-   C9 CE       CMP   #$CE
0F3D-   C7          ???
0F3E-   AE AE AE    LDX   $AEAE
0F41-   A2 AC       LDX   #$AC
0F43-   B8          CLV
0F44-   C4 8D       CPY   $8D
0F46-   AA          TAX
0F47-   8D A0 CA    STA   $CAA0
0F4A-   D3          ???
0F4B-   D2 A0       CMP   ($A0)
0F4D-   BA          TSX
0F4E-   D3          ???
0F4F-   C5 D4       CMP   $D4
0F51-   D6 C1       DEC   $C1,X
0F53-   D2 D3       CMP   ($D3)
0F55-   8D A0 CA    STA   $CAA0
0F58-   D3          ???
0F59-   D2 A0       CMP   ($A0)
0F5B-   BA          TSX
0F5C-   CF          ???
0F5D-   D5 D4       CMP   $D4,X
0F5F-   D7          ???
0F60-   C1 CC       CMP   ($CC,X)
0F62-   CC D3 8D    CPY   $8DD3
0F65-   AA          TAX
0F66-   8D AA AA    STA   $AAAA
0F69-   20 C7 C5    JSR   $C5C7
0F6C-   D4          ???
0F6D-   20 D2 C1    JSR   $C1D2
0F70-   CE C4 CF    DEC   $CFC4
0F73-   CD 20 D3    CMP   $D320
0F76-   D4          ???
0F77-   C1 D2       CMP   ($D2,X)
0F79-   D4          ???
0F7A-   C9 CE       CMP   #$CE
0F7C-   C7          ???
0F7D-   20 D0 CF    JSR   $CFD0
0F80-   C9 CE       CMP   #$CE
0F82-   D4          ???
0F83-   8D AA 8D    STA   $8DAA
0F86-   A0 D2       LDY   #$D2
0F88-   CE C4 C2    DEC   $C2C4
0F8B-   20 A3 B2    JSR   $B2A3
0F8E-   BB          ???
0F8F-   A3          ???
0F90-   D8          CLD
0F91-   CC C5 CE    CPY   $CEC5
0F94-   8D A0 D3    STA   $D3A0
0F97-   D4          ???
0F98-   C1 A0       CMP   ($A0,X)
0F9A-   D8          CLD
0F9B-   D8          CLD
0F9C-   8D A0 D2    STA   $D2A0
0F9F-   CE C4 C2    DEC   $C2C4
0FA2-   20 A3 B2    JSR   $B2A3
0FA5-   BB          ???
0FA6-   A3          ???
0FA7-   D9 CC C5    CMP   $C5CC,Y
0FAA-   CE 8D A0    DEC   $A08D
0FAD-   D3          ???
0FAE-   D4          ???
0FAF-   C1 A0       CMP   ($A0,X)
0FB1-   D9 D9 8D    CMP   $8DD9,Y
0FB4-   AA          TAX
0FB5-   8D A0 CA    STA   $CAA0
0FB8-   CD D0 A0    CMP   $A0D0
0FBB-   C2          ???
0FBC-   D5 C9       CMP   $C9,X
0FBE-   CC C4 8D    CPY   $8DC4
0FC1-   AA          TAX
0FC2-   8D AA AA    STA   $AAAA
0FC5-   AA          TAX
0FC6-   AA          TAX
0FC7-   AA          TAX
0FC8-   AA          TAX
0FC9-   AA          TAX
0FCA-   AA          TAX
0FCB-   AA          TAX
0FCC-   AA          TAX
0FCD-   AA          TAX
0FCE-   AA          TAX
0FCF-   AA          TAX
0FD0-   AA          TAX
0FD1-   AA          TAX
0FD2-   AA          TAX
0FD3-   AA          TAX
0FD4-   AA          TAX
0FD5-   AA          TAX
0FD6-   AA          TAX
0FD7-   AA          TAX
0FD8-   AA          TAX
0FD9-   AA          TAX
0FDA-   AA          TAX
0FDB-   AA          TAX
0FDC-   AA          TAX
0FDD-   AA          TAX
0FDE-   AA          TAX
0FDF-   AA          TAX
0FE0-   AA          TAX
0FE1-   AA          TAX
0FE2-   AA          TAX
0FE3-   8D AA 8D    STA   $8DAA
0FE6-   BA          TSX
0FE7-   D3          ???
0FE8-   C5 D4       CMP   $D4
0FEA-   D6 C1       DEC   $C1,X
0FEC-   D2 D3       CMP   ($D3)
0FEE-   8D AA 8D    STA   $8DAA
0FF1-   AA          TAX
0FF2-   AA          TAX
0FF3-   20 C4 C9    JSR   $C9C4
0FF6-   CD 20 C1    CMP   $C120
0FF9-   D2 D2       CMP   ($D2)
0FFB-   C1 D9       CMP   ($D9,X)
0FFD-   D3          ???
0FFE-   20 C1 CE    JSR   $CEC1
1001-   C4 20       CPY   $20
1003-   C6 C9       DEC   $C9
1005-   CC CC 8D    CPY   $8DCC
1008-   AA          TAX
1009-   8D A0 C4    STA   $C4A0
100C-   C9 CD       CMP   #$CD
100E-   B8          CLV
100F-   B2 A0       LDA   ($A0)
1011-   D3          ???
1012-   CF          ???
1013-   D5 D4       CMP   $D4,X
1015-   C8          INY
1016-   D7          ???
1017-   BB          ???
1018-   A3          ???
1019-   D8          CLD
101A-   CD C1 D8    CMP   $D8C1
101D-   BB          ???
101E-   A3          ???
101F-   D9 CD C1    CMP   $C1CD,Y
1022-   D8          CLD
1023-   BB          ???
1024-   A3          ???
1025-   B1 BB       LDA   ($BB),Y
1027-   A3          ???
1028-   B1 8D       LDA   ($8D),Y
102A-   A0 C4       LDY   #$C4
102C-   C9 CD       CMP   #$CD
102E-   B8          CLV
102F-   B2 20       LDA   ($20)
1031-   D7          ???
1032-   C5 D3       CMP   $D3
1034-   D4          ???
1035-   D7          ???
1036-   BB          ???
1037-   A3          ???
1038-   D8          CLD
1039-   CD C1 D8    CMP   $D8C1
103C-   BB          ???
103D-   A3          ???
103E-   D9 CD C1    CMP   $C1CD,Y
1041-   D8          CLD
1042-   BB          ???
1043-   A3          ???
1044-   B1 BB       LDA   ($BB),Y
1046-   A3          ???
1047-   B1 8D       LDA   ($8D),Y
1049-   A0 C4       LDY   #$C4
104B-   C9 CD       CMP   #$CD
104D-   B8          CLV
104E-   B2 20       LDA   ($20)
1050-   D6 C9       DEC   $C9,X
1052-   D3          ???
1053-   C9 D4       CMP   #$D4
1055-   C5 C4       CMP   $C4
1057-   BB          ???
1058-   A3          ???
1059-   D8          CLD
105A-   CD C1 D8    CMP   $D8C1
105D-   BB          ???
105E-   A3          ???
105F-   D9 CD C1    CMP   $C1CD,Y
1062-   D8          CLD
1063-   BB          ???
1064-   A3          ???
1065-   B1 BB       LDA   ($BB),Y
1067-   A3          ???
1068-   B0 8D       BCS   $0FF7
106A-   A0 C4       LDY   #$C4
106C-   C9 CD       CMP   #$CD
106E-   B8          CLV
106F-   B1 A0       LDA   ($A0),Y
1071-   D8          CLD
1072-   D3          ???
1073-   D4          ???
1074-   C1 C3       CMP   ($C3,X)
1076-   CB          ???
1077-   BB          ???
1078-   A3          ???
1079-   D8          CLD
107A-   D3          ???
107B-   D4          ???
107C-   C1 CB       CMP   ($CB,X)
107E-   D3          ???
107F-   BB          ???
1080-   A3          ???
1081-   B1 BB       LDA   ($BB),Y
1083-   A3          ???
1084-   B0 8D       BCS   $1013
1086-   A0 C4       LDY   #$C4
1088-   C9 CD       CMP   #$CD
108A-   B8          CLV
108B-   B1 A0       LDA   ($A0),Y
108D-   D9 D3 D4    CMP   $D4D3,Y
1090-   C1 C3       CMP   ($C3,X)
1092-   CB          ???
1093-   BB          ???
1094-   A3          ???
1095-   D9 D3 D4    CMP   $D4D3,Y
1098-   C1 CB       CMP   ($CB,X)
109A-   D3          ???
109B-   BB          ???
109C-   A3          ???
109D-   B1 BB       LDA   ($BB),Y
109F-   A3          ???
10A0-   B0 8D       BCS   $102F
10A2-   AA          TAX
10A3-   8D AA AA    STA   $AAAA
10A6-   20 CE CF    JSR   $CFCE
10A9-   D7          ???
10AA-   20 C1 D3    JSR   $D3C1
10AD-   D3          ???
10AE-   C9 C7       CMP   #$C7
10B0-   CE 20 D6    DEC   $D620
10B3-   C1 D2       CMP   ($D2,X)
10B5-   C9 C1       CMP   #$C1
10B7-   C2          ???
10B8-   CC C5 20    CPY   $20C5
10BB-   D6 C1       DEC   $C1,X
10BD-   CC D5 C5    CPY   $C5D5
10C0-   D3          ???
10C1-   8D AA 8D    STA   $8DAA
10C4-   A0 CC       LDY   #$CC
10C6-   C4 C1       CPY   $C1
10C8-   A0 A3       LDY   #$A3
10CA-   B0 8D       BCS   $1059
10CC-   A0 D3       LDY   #$D3
10CE-   D4          ???
10CF-   C1 A0       CMP   ($A0,X)
10D1-   D3          ???
10D2-   D0 D4       BNE   $10A8
10D4-   D2 8D       CMP   ($8D)
10D6-   A0 D3       LDY   #$D3
10D8-   D4          ???
10D9-   C1 A0       CMP   ($A0,X)
10DB-   D6 B0       DEC   $B0,X
10DD-   8D A0 CC    STA   $CCA0
10E0-   C4 C1       CPY   $C1
10E2-   A0 A3       LDY   #$A3
10E4-   B1 8D       LDA   ($8D),Y
10E6-   A0 D3       LDY   #$D3
10E8-   D4          ???
10E9-   C1 A0       CMP   ($A0,X)
10EB-   D6 B1       DEC   $B1,X
10ED-   8D A0 D2    STA   $D2A0
10F0-   D4          ???
10F1-   D3          ???
10F2-   8D AA 8D    STA   $8DAA
10F5-   AA          TAX
10F6-   AA          TAX
10F7-   AA          TAX
10F8-   AA          TAX
10F9-   AA          TAX
10FA-   AA          TAX
10FB-   AA          TAX
10FC-   AA          TAX
10FD-   AA          TAX
10FE-   AA          TAX
10FF-   AA          TAX
1100-   AA          TAX
1101-   AA          TAX
1102-   AA          TAX
1103-   AA          TAX
1104-   AA          TAX
1105-   AA          TAX
1106-   AA          TAX
1107-   AA          TAX
1108-   AA          TAX
1109-   AA          TAX
110A-   AA          TAX
110B-   AA          TAX
110C-   AA          TAX
110D-   AA          TAX
110E-   AA          TAX
110F-   AA          TAX
1110-   AA          TAX
1111-   AA          TAX
1112-   AA          TAX
1113-   AA          TAX
1114-   AA          TAX
1115-   8D AA 8D    STA   $8DAA
1118-   BA          TSX
1119-   CF          ???
111A-   D5 D4       CMP   $D4,X
111C-   D7          ???
111D-   C1 CC       CMP   ($CC,X)
111F-   CC D3 8D    CPY   $8DD3
1122-   AA          TAX
1123-   8D AA AA    STA   $AAAA
1126-   20 CD C1    JSR   $C1CD
1129-   CB          ???
112A-   C5 20       CMP   $20
112C-   C3          ???
112D-   CF          ???
112E-   CC D5 CD    CPY   $CDD5
1131-   CE 20 CD    DEC   $CD20
1134-   C9 CE       CMP   #$CE
1136-   20 C1 CE    JSR   $CEC1
1139-   C4 20       CPY   $20
113B-   CD C1 D8    CMP   $D8C1
113E-   20 D4 CF    JSR   $CFD4
1141-   20 C2 C5    JSR   $C5C2
1144-   20 C1 CC    JSR   $CCC1
1147-   CC 8D AA    CPY   $AA8D
114A-   AA          TAX
114B-   20 D7 C1    JSR   $C1D7
114E-   CC CC 20    CPY   $20CC
1151-   A8          TAY
1152-   C3          ???
1153-   CF          ???
1154-   C4 C5       CPY   $C5
1156-   BA          TSX
1157-   20 B1 A9    JSR   $A9B1
115A-   AE 8D AA    LDX   $AA8D
115D-   8D A0 CC    STA   $CCA0
1160-   C4 C1       CPY   $C1
1162-   A0 A3       LDY   #$A3
1164-   B0 A0       BCS   $1106
1166-   BB          ???
1167-   20 D3 CF    JSR   $CFD3
116A-   20 D8 AC    JSR   $ACD8
116D-   D9 20 D7    CMP   $D720,Y
1170-   C9 CC       CMP   #$CC
1172-   CC 20 C9    CPY   $C920
1175-   CE C3 20    DEC   $20C3
1178-   D4          ???
1179-   CF          ???
117A-   20 B1 8D    JSR   $8DB1
117D-   A0 D3       LDY   #$D3
117F-   D4          ???
1180-   C1 A0       CMP   ($A0,X)
1182-   D8          CLD
1183-   D8          CLD
1184-   8D A0 D3    STA   $D3A0
1187-   D4          ???
1188-   C1 A0       CMP   ($A0,X)
118A-   D9 D9 8D    CMP   $8DD9,Y
118D-   AA          TAX
118E-   8D BA C3    STA   $C3BA
1191-   CF          ???
1192-   CC C5 C4    CPY   $C4C5
1195-   C7          ???
1196-   C5 8D       CMP   $8D
1198-   A0 C9       LDY   #$C9
119A-   CE C3 A0    DEC   $A0C3
119D-   D8          CLD
119E-   D8          CLD
119F-   8D A0 D0    STA   $D0A0
11A2-   D5 D4       CMP   $D4,X
11A4-   B8          CLV
11A5-   B2 A0       LDA   ($A0)
11A7-   D6 B1       DEC   $B1,X
11A9-   BB          ???
11AA-   D6 C9       DEC   $C9,X
11AC-   D3          ???
11AD-   C9 D4       CMP   #$D4
11AF-   C5 C4       CMP   $C4
11B1-   BB          ???
11B2-   D8          CLD
11B3-   D8          CLD
11B4-   BB          ???
11B5-   A3          ???
11B6-   B1 8D       LDA   ($8D),Y
11B8-   A0 D0       LDY   #$D0
11BA-   D5 D4       CMP   $D4,X
11BC-   B8          CLV
11BD-   B2 A0       LDA   ($A0)
11BF-   D6 B1       DEC   $B1,X
11C1-   BB          ???
11C2-   D6 C9       DEC   $C9,X
11C4-   D3          ???
11C5-   C9 D4       CMP   #$D4
11C7-   C5 C4       CMP   $C4
11C9-   BB          ???
11CA-   D8          CLD
11CB-   D8          CLD
11CC-   BB          ???
11CD-   A3          ???
11CE-   D9 CD C1    CMP   $C1CD,Y
11D1-   D8          CLD
11D2-   8D A0 CC    STA   $CCA0
11D5-   C4 C1       CPY   $C1
11D7-   A0 D8       LDY   #$D8
11D9-   D8          CLD
11DA-   8D A0 C3    STA   $C3A0
11DD-   CD D0 A0    CMP   $A0D0
11E0-   A3          ???
11E1-   D8          CLD
11E2-   CD C1 D8    CMP   $D8C1
11E5-   8D A0 C2    STA   $C2A0
11E8-   CE C5 A0    DEC   $A0C5
11EB-   BA          TSX
11EC-   C3          ???
11ED-   CF          ???
11EE-   CC C5 C4    CPY   $C4C5
11F1-   C7          ???
11F2-   C5 8D       CMP   $8D
11F4-   AA          TAX
11F5-   8D AA AA    STA   $AAAA
11F8-   20 CD C1    JSR   $C1CD
11FB-   CB          ???
11FC-   C5 20       CMP   $20
11FE-   CD C9 CE    CMP   $CEC9
1201-   20 C1 CE    JSR   $CEC1
1204-   C4 20       CPY   $20
1206-   CD C1 D8    CMP   $D8C1
1209-   20 D2 CF    JSR   $CFD2
120C-   D7          ???
120D-   D3          ???
120E-   20 D4 CF    JSR   $CFD4
1211-   20 C2 C5    JSR   $C5C2
1214-   20 C1 CC    JSR   $CCC1
1217-   CC 20 D7    CPY   $D720
121A-   C1 CC       CMP   ($CC,X)
121C-   CC 8D AA    CPY   $AA8D
121F-   8D BA D2    STA   $D2BA
1222-   CF          ???
1223-   D7          ???
1224-   C5 C4       CMP   $C4
1226-   C7          ???
1227-   C5 8D       CMP   $8D
1229-   A0 C9       LDY   #$C9
122B-   CE C3 A0    DEC   $A0C3
122E-   D9 D9 8D    CMP   $8DD9,Y
1231-   A0 D0       LDY   #$D0
1233-   D5 D4       CMP   $D4,X
1235-   B8          CLV
1236-   B2 A0       LDA   ($A0)
1238-   D6 B1       DEC   $B1,X
123A-   BB          ???
123B-   D6 C9       DEC   $C9,X
123D-   D3          ???
123E-   C9 D4       CMP   #$D4
1240-   C5 C4       CMP   $C4
1242-   BB          ???
1243-   A3          ???
1244-   B1 BB       LDA   ($BB),Y
1246-   D9 D9 8D    CMP   $8DD9,Y
1249-   A0 D0       LDY   #$D0
124B-   D5 D4       CMP   $D4,X
124D-   B8          CLV
124E-   B2 A0       LDA   ($A0)
1250-   D6 B1       DEC   $B1,X
1252-   BB          ???
1253-   D6 C9       DEC   $C9,X
1255-   D3          ???
1256-   C9 D4       CMP   #$D4
1258-   C5 C4       CMP   $C4
125A-   BB          ???
125B-   A3          ???
125C-   D8          CLD
125D-   CD C1 D8    CMP   $D8C1
1260-   BB          ???
1261-   D9 D9 8D    CMP   $8DD9,Y
1264-   A0 CC       LDY   #$CC
1266-   C4 C1       CPY   $C1
1268-   A0 D9       LDY   #$D9
126A-   D9 8D A0    CMP   $A08D,Y
126D-   C3          ???
126E-   CD D0 A0    CMP   $A0D0
1271-   A3          ???
1272-   D9 CD C1    CMP   $C1CD,Y
1275-   D8          CLD
1276-   8D A0 C2    STA   $C2A0
1279-   CE C5 A0    DEC   $A0C5
127C-   BA          TSX
127D-   D2 CF       CMP   ($CF)
127F-   D7          ???
1280-   C5 C4       CMP   $C4
1282-   C7          ???
1283-   C5 8D       CMP   $8D
1285-   A0 D2       LDY   #$D2
1287-   D4          ???
1288-   D3          ???
1289-   8D AA 8D    STA   $8DAA
128C-   AA          TAX
128D-   AA          TAX
128E-   AA          TAX
128F-   AA          TAX
1290-   AA          TAX
1291-   AA          TAX
1292-   AA          TAX
1293-   AA          TAX
1294-   AA          TAX
1295-   AA          TAX
1296-   AA          TAX
1297-   AA          TAX
1298-   AA          TAX
1299-   AA          TAX
129A-   AA          TAX
129B-   AA          TAX
129C-   AA          TAX
129D-   AA          TAX
129E-   AA          TAX
129F-   AA          TAX
12A0-   AA          TAX
12A1-   AA          TAX
12A2-   AA          TAX
12A3-   AA          TAX
12A4-   AA          TAX
12A5-   AA          TAX
12A6-   AA          TAX
12A7-   AA          TAX
12A8-   AA          TAX
12A9-   AA          TAX
12AA-   AA          TAX
12AB-   AA          TAX
12AC-   8D AA 20    STA   $20AA
12AF-   20 20 20    JSR   $2020
12B2-   20 20 20    JSR   $2020
12B5-   20 20 20    JSR   $2020
12B8-   20 20 20    JSR   $2020
12BB-   20 20 20    JSR   $2020
12BE-   20 20 20    JSR   $2020
12C1-   20 20 20    JSR   $2020
12C4-   20 20 20    JSR   $2020
12C7-   20 20 20    JSR   $2020
12CA-   20 20 AA    JSR   $AA20
12CD-   8D AA 20    STA   $20AA
12D0-   20 20 C2    JSR   $C220
12D3-   D5 C9       CMP   $C9,X
12D5-   CC C4 20    CPY   $20C4
12D8-   D4          ???
12D9-   C8          INY
12DA-   C5 20       CMP   $20
12DC-   CD C1 DA    CMP   $DAC1
12DF-   C5 20       CMP   $20
12E1-   20 20 20    JSR   $2020
12E4-   20 20 20    JSR   $2020
12E7-   20 20 20    JSR   $2020
12EA-   20 20 20    JSR   $2020
12ED-   AA          TAX
12EE-   8D AA 20    STA   $20AA
12F1-   20 20 20    JSR   $2020
12F4-   20 20 20    JSR   $2020
12F7-   20 20 20    JSR   $2020
12FA-   20 20 20    JSR   $2020
12FD-   20 20 20    JSR   $2020
1300-   20 20 20    JSR   $2020
1303-   20 20 20    JSR   $2020
1306-   20 20 20    JSR   $2020
1309-   20 20 20    JSR   $2020
130C-   20 20 AA    JSR   $AA20
130F-   8D AA AA    STA   $AAAA
1312-   AA          TAX
1313-   AA          TAX
1314-   AA          TAX
1315-   AA          TAX
1316-   AA          TAX
1317-   AA          TAX
1318-   AA          TAX
1319-   AA          TAX
131A-   AA          TAX
131B-   AA          TAX
131C-   AA          TAX
131D-   AA          TAX
131E-   AA          TAX
131F-   AA          TAX
1320-   AA          TAX
1321-   AA          TAX
1322-   AA          TAX
1323-   AA          TAX
1324-   AA          TAX
1325-   AA          TAX
1326-   AA          TAX
1327-   AA          TAX
1328-   AA          TAX
1329-   AA          TAX
132A-   AA          TAX
132B-   AA          TAX
132C-   AA          TAX
132D-   AA          TAX
132E-   AA          TAX
132F-   AA          TAX
1330-   8D AA 8D    STA   $8DAA
1333-   C2          ???
1334-   D5 C9       CMP   $C9,X
1336-   CC C4 8D    CPY   $8DC4
1339-   AA          TAX
133A-   8D A0 D0    STA   $D0A0
133D-   D2 CE       CMP   ($CE)
133F-   A0 A2       LDY   #$A2
1341-   C2          ???
1342-   D5 C9       CMP   $C9,X
1344-   CC C4 C9    CPY   $C9C4
1347-   CE C7 20    DEC   $20C7
134A-   CD C1 DA    CMP   $DAC1
134D-   C5 AE       CMP   $AE
134F-   AE AE A2    LDX   $A2AE
1352-   AC B8 C4    LDY   $C4B8
1355-   B8          CLV
1356-   C4 8D       CPY   $8D
1358-   AA          TAX
1359-   8D AA AA    STA   $AAAA
135C-   AA          TAX
135D-   AA          TAX
135E-   AA          TAX
135F-   AA          TAX
1360-   AA          TAX
1361-   AA          TAX
1362-   AA          TAX
1363-   AA          TAX
1364-   AA          TAX
1365-   AA          TAX
1366-   AA          TAX
1367-   AA          TAX
1368-   AA          TAX
1369-   AA          TAX
136A-   AA          TAX
136B-   AA          TAX
136C-   AA          TAX
136D-   AA          TAX
136E-   AA          TAX
136F-   AA          TAX
1370-   AA          TAX
1371-   AA          TAX
1372-   AA          TAX
1373-   AA          TAX
1374-   AA          TAX
1375-   AA          TAX
1376-   AA          TAX
1377-   AA          TAX
1378-   AA          TAX
1379-   AA          TAX
137A-   8D AA 8D    STA   $8DAA
137D-   D3          ???
137E-   D4          ???
137F-   C1 CB       CMP   ($CB,X)
1381-   D0 D5       BNE   $1358
1383-   D3          ???
1384-   C8          INY
1385-   8D AA 8D    STA   $8DAA
1388-   A0 C9       LDY   #$C9
138A-   CE C3 A0    DEC   $A0C3
138D-   D3          ???
138E-   D0 D4       BNE   $1364
1390-   D2 8D       CMP   ($8D)
1392-   A0 D0       LDY   #$D0
1394-   D5 D4       CMP   $D4,X
1396-   B8          CLV
1397-   B1 A0       LDA   ($A0),Y
1399-   D8          CLD
139A-   D8          CLD
139B-   BB          ???
139C-   D8          CLD
139D-   D3          ???
139E-   D4          ???
139F-   C1 C3       CMP   ($C3,X)
13A1-   CB          ???
13A2-   BB          ???
13A3-   D3          ???
13A4-   D0 D4       BNE   $137A
13A6-   D2 A0       CMP   ($A0)
13A8-   BB          ???
13A9-   20 D0 D5    JSR   $D5D0
13AC-   D4          ???
13AD-   20 C3 CF    JSR   $CFC3
13B0-   CC 20 CF    CPY   $CF20
13B3-   CE 20 D3    DEC   $D320
13B6-   D4          ???
13B7-   C1 C3       CMP   ($C3,X)
13B9-   CB          ???
13BA-   8D A0 D0    STA   $D0A0
13BD-   D5 D4       CMP   $D4,X
13BF-   B8          CLV
13C0-   B1 A0       LDA   ($A0),Y
13C2-   D9 D9 BB    CMP   $BBD9,Y
13C5-   D9 D3 D4    CMP   $D4D3,Y
13C8-   C1 C3       CMP   ($C3,X)
13CA-   CB          ???
13CB-   BB          ???
13CC-   D3          ???
13CD-   D0 D4       BNE   $13A3
13CF-   D2 A0       CMP   ($A0)
13D1-   BB          ???
13D2-   20 D0 D5    JSR   $D5D0
13D5-   D4          ???
13D6-   20 D2 CF    JSR   $CFD2
13D9-   D7          ???
13DA-   20 CF CE    JSR   $CECF
13DD-   20 D3 D4    JSR   $D4D3
13E0-   C1 C3       CMP   ($C3,X)
13E2-   CB          ???
13E3-   8D A0 D0    STA   $D0A0
13E6-   D5 D4       CMP   $D4,X
13E8-   B8          CLV
13E9-   B2 A0       LDA   ($A0)
13EB-   D6 B1       DEC   $B1,X
13ED-   BB          ???
13EE-   D6 C9       DEC   $C9,X
13F0-   D3          ???
13F1-   C9 D4       CMP   #$D4
13F3-   C5 C4       CMP   $C4
13F5-   BB          ???
13F6-   D8          CLD
13F7-   D8          CLD
13F8-   BB          ???
13F9-   D9 D9 A0    CMP   $A0D9,Y
13FC-   BB          ???
13FD-   20 CD C1    JSR   $C1CD
1400-   D2 CB       CMP   ($CB)
1402-   20 C2 CC    JSR   $CCC2
1405-   CF          ???
1406-   C3          ???
1407-   CB          ???
1408-   20 C1 D3    JSR   $D3C1
140B-   20 D6 C9    JSR   $C9D6
140E-   D3          ???
140F-   C9 D4       CMP   #$D4
1411-   C5 C4       CMP   $C4
1413-   8D AA 8D    STA   $8DAA
1416-   AA          TAX
1417-   AA          TAX
1418-   AA          TAX
1419-   AA          TAX
141A-   AA          TAX
141B-   AA          TAX
141C-   AA          TAX
141D-   AA          TAX
141E-   AA          TAX
141F-   AA          TAX
1420-   AA          TAX
1421-   AA          TAX
1422-   AA          TAX
1423-   AA          TAX
1424-   AA          TAX
1425-   AA          TAX
1426-   AA          TAX
1427-   AA          TAX
1428-   AA          TAX
1429-   AA          TAX
142A-   AA          TAX
142B-   AA          TAX
142C-   AA          TAX
142D-   AA          TAX
142E-   AA          TAX
142F-   AA          TAX
1430-   AA          TAX
1431-   AA          TAX
1432-   AA          TAX
1433-   AA          TAX
1434-   AA          TAX
1435-   AA          TAX
1436-   8D AA 8D    STA   $8DAA
1439-   C3          ???
143A-   C8          INY
143B-   C5 C3       CMP   $C3
143D-   CB          ???
143E-   C1 CC       CMP   ($CC,X)
1440-   CC 8D AA    CPY   $AA8D
1443-   8D AA AA    STA   $AAAA
1446-   20 C3 C8    JSR   $C8C3
1449-   C5 C3       CMP   $C3
144B-   CB          ???
144C-   D3          ???
144D-   20 C1 CC    JSR   $CCC1
1450-   CC 20 C1    CPY   $C120
1453-   C4 CA       CPY   $CA
1455-   C1 C3       CMP   ($C3,X)
1457-   C5 CE       CMP   $CE
1459-   D4          ???
145A-   20 C2 CC    JSR   $CCC2
145D-   CF          ???
145E-   C3          ???
145F-   CB          ???
1460-   D3          ???
1461-   20 C6 CF    JSR   $CFC6
1464-   D2 20       CMP   ($20)
1466-   C1 20       CMP   ($20,X)
1468-   D7          ???
1469-   C1 CC       CMP   ($CC,X)
146B-   CC AE 20    CPY   $20AE
146E-   C9 C6       CMP   #$C6
1470-   8D AA AA    STA   $AAAA
1473-   20 C3 CF    JSR   $CFC3
1476-   CD D0 CC    CMP   $CCD0
1479-   C5 D4       CMP   $D4
147B-   C5 CC       CMP   $CC
147D-   D9 20 D3    CMP   $D320,Y
1480-   D5 D2       CMP   $D2,X
1482-   D2 CF       CMP   ($CF)
1484-   D5 CE       CMP   $CE,X
1486-   C4 C5       CPY   $C5
1488-   C4 AC       CPY   $AC
148A-   20 D0 CF    JSR   $CFD0
148D-   D0 20       BNE   $14AF
148F-   D4          ???
1490-   C8          INY
1491-   C5 20       CMP   $20
1493-   D3          ???
1494-   D4          ???
1495-   C1 C3       CMP   ($C3,X)
1497-   CB          ???
1498-   20 C1 CE    JSR   $CEC1
149B-   C4 8D       CPY   $8D
149D-   AA          TAX
149E-   AA          TAX
149F-   20 C1 CE    JSR   $CEC1
14A2-   C4 20       CPY   $20
14A4-   D3          ???
14A5-   D4          ???
14A6-   C1 D2       CMP   ($D2,X)
14A8-   D4          ???
14A9-   20 CF D6    JSR   $D6CF
14AC-   C5 D2       CMP   $D2
14AE-   20 D5 CE    JSR   $CED5
14B1-   D4          ???
14B2-   C9 CC       CMP   #$CC
14B4-   AE 8D AA    LDX   $AA8D
14B7-   8D A0 CC    STA   $CCA0
14BA-   C4 C1       CPY   $C1
14BC-   A0 D9       LDY   #$D9
14BE-   D9 A0 BB    CMP   $BBA0,Y
14C1-   20 D3 D4    JSR   $D4D3
14C4-   CF          ???
14C5-   D2 C5       CMP   ($C5)
14C7-   20 D6 C1    JSR   $C1D6
14CA-   CC D5 C5    CPY   $C5D5
14CD-   D3          ???
14CE-   20 C6 CF    JSR   $CFC6
14D1-   D2 8D       CMP   ($8D)
14D3-   A0 D3       LDY   #$D3
14D5-   D4          ???
14D6-   C1 A0       CMP   ($A0,X)
14D8-   D9 D0 B1    CMP   $B1D0,Y
14DB-   A0 BB       LDY   #$BB
14DD-   20 C3 D5    JSR   $D5C3
14E0-   D2 D2       CMP   ($D2)
14E2-   C5 CE       CMP   $CE
14E4-   D4          ???
14E5-   20 D2 CF    JSR   $CFD2
14E8-   D7          ???
14E9-   20 CD C9    JSR   $C9CD
14EC-   CE D5 D3    DEC   $D3D5
14EF-   20 CF CE    JSR   $CECF
14F2-   C5 8D       CMP   $8D
14F4-   A0 D3       LDY   #$D3
14F6-   D4          ???
14F7-   C1 A0       CMP   ($A0,X)
14F9-   D9 CD B1    CMP   $B1CD,Y
14FC-   A0 BB       LDY   #$BB
14FE-   20 C1 CE    JSR   $CEC1
1501-   C4 20       CPY   $20
1503-   C3          ???
1504-   D5 D2       CMP   $D2,X
1506-   D2 C5       CMP   ($C5)
1508-   CE D4 20    DEC   $20D4
150B-   D2 CF       CMP   ($CF)
150D-   D7          ???
150E-   20 D0 CC    JSR   $CCD0
1511-   D5 D3       CMP   $D3,X
1513-   8D A0 CC    STA   $CCA0
1516-   C4 C1       CPY   $C1
1518-   A0 D8       LDY   #$D8
151A-   D8          CLD
151B-   A0 BB       LDY   #$BB
151D-   20 CF CE    JSR   $CECF
1520-   C5 AC       CMP   $AC
1522-   20 D4 C8    JSR   $C8D4
1525-   C5 CE       CMP   $CE
1527-   20 C4 CF    JSR   $CFC4
152A-   20 D4 C8    JSR   $C8D4
152D-   C5 20       CMP   $20
152F-   D3          ???
1530-   C1 CD       CMP   ($CD,X)
1532-   C5 8D       CMP   $8D
1534-   A0 D3       LDY   #$D3
1536-   D4          ???
1537-   C1 A0       CMP   ($A0,X)
1539-   D8          CLD
153A-   D0 B1       BNE   $14ED
153C-   A0 BB       LDY   #$BB
153E-   20 C6 CF    JSR   $CFC6
1541-   D2 20       CMP   ($20)
1543-   C3          ???
1544-   CF          ???
1545-   CC D5 CD    CPY   $CDD5
1548-   CE D3 8D    DEC   $8DD3
154B-   A0 D3       LDY   #$D3
154D-   D4          ???
154E-   C1 A0       CMP   ($A0,X)
1550-   D8          CLD
1551-   CD B1 8D    CMP   $8DB1
1554-   AA          TAX
1555-   8D A0 C9    STA   $C9A0
1558-   CE C3 A0    DEC   $A0C3
155B-   D9 D0 B1    CMP   $B1D0,Y
155E-   8D A0 C9    STA   $C9A0
1561-   CE C3 A0    DEC   $A0C3
1564-   D8          CLD
1565-   D0 B1       BNE   $1518
1567-   8D A0 C4    STA   $C4A0
156A-   C5 C3       CMP   $C3
156C-   A0 D8       LDY   #$D8
156E-   CD B1 8D    CMP   $8DB1
1571-   A0 C4       LDY   #$C4
1573-   C5 C3       CMP   $C3
1575-   A0 D9       LDY   #$D9
1577-   CD B1 8D    CMP   $8DB1
157A-   AA          TAX
157B-   8D BA DF    STA   $DFBA
157E-   C9 C6       CMP   #$C6
1580-   B1 A0       LDA   ($A0),Y
1582-   BB          ???
1583-   20 C9 C6    JSR   $C6C9
1586-   20 D6 C9    JSR   $C9D6
1589-   D3          ???
158A-   C9 D4       CMP   #$D4
158C-   C5 C4       CMP   $C4
158E-   A8          TAY
158F-   D8          CLD
1590-   D8          CLD
1591-   AC D9 AB    LDY   $ABD9
1594-   B1 A9       LDA   ($A9),Y
1596-   20 BD BD    JSR   $BDBD
1599-   20 B1 8D    JSR   $8DB1
159C-   A0 C7       LDY   #$C7
159E-   C5 D4       CMP   $D4
15A0-   B8          CLV
15A1-   B2 A0       LDA   ($A0)
15A3-   D6 C9       DEC   $C9,X
15A5-   D3          ???
15A6-   C9 D4       CMP   #$D4
15A8-   C5 C4       CMP   $C4
15AA-   BB          ???
15AB-   D8          CLD
15AC-   D8          CLD
15AD-   BB          ???
15AE-   D9 D0 B1    CMP   $B1D0,Y
15B1-   8D A0 CC    STA   $CCA0
15B4-   C4 C1       CPY   $C1
15B6-   A0 D2       LDY   #$D2
15B8-   C5 D4       CMP   $D4
15BA-   D5 D2       CMP   $D2,X
15BC-   CE 8D A0    DEC   $A08D
15BF-   C3          ???
15C0-   CD D0 A0    CMP   $A0D0
15C3-   A3          ???
15C4-   B1 8D       LDA   ($8D),Y
15C6-   A0 C2       LDY   #$C2
15C8-   C5 D1       CMP   $D1
15CA-   A0 BA       LDY   #$BA
15CC-   DF          ???
15CD-   C9 C6       CMP   #$C6
15CF-   B2 A0       LDA   ($A0)
15D1-   BB          ???
15D2-   20 C9 C6    JSR   $C6C9
15D5-   20 C3 C5    JSR   $C5C3
15D8-   CC CC 20    CPY   $20CC
15DB-   C2          ???
15DC-   C5 CC       CMP   $CC
15DE-   CF          ???
15DF-   D7          ???
15E0-   20 C9 D3    JSR   $D3C9
15E3-   20 C1 20    JSR   $20C1
15E6-   D7          ???
15E7-   C1 CC       CMP   ($CC,X)
15E9-   CC 8D BB    CPY   $BB8D
15EC-   20 C3 CF    JSR   $CFC3
15EF-   CE D4 C9    DEC   $C9D4
15F2-   CE D5 C5    DEC   $C5D5
15F5-   20 D4 C5    JSR   $C5D4
15F8-   D3          ???
15F9-   D4          ???
15FA-   C9 CE       CMP   #$CE
15FC-   C7          ???
15FD-   20 CF D4    JSR   $D4CF
1600-   C8          INY
1601-   C5 D2       CMP   $D2
1603-   8D A0 BB    STA   $BBA0
1606-   20 C1 C4    JSR   $C4C1
1609-   CA          DEX
160A-   C1 C3       CMP   ($C3,X)
160C-   C5 CE       CMP   $CE
160E-   D4          ???
160F-   20 C3 C5    JSR   $C5C3
1612-   CC CC D3    CPY   $D3CC
1615-   8D A0 CA    STA   $CAA0
1618-   CD D0 A0    CMP   $A0D0
161B-   C4 CF       CPY   $CF
161D-   CD CF D6    CMP   $D6CF
1620-   C5 A0       CMP   $A0
1622-   BB          ???
1623-   20 CF D4    JSR   $D4CF
1626-   C8          INY
1627-   C5 D2       CMP   $D2
1629-   D7          ???
162A-   C9 D3       CMP   #$D3
162C-   C5 AC       CMP   $AC
162E-   20 C5 D8    JSR   $D8C5
1631-   C9 D4       CMP   #$D4
1633-   20 C3 CF    JSR   $CFC3
1636-   CE C4 C9    DEC   $C9C4
1639-   D4          ???
163A-   C9 CF       CMP   #$CF
163C-   CE C1 CC    DEC   $CCC1
163F-   8D BA DF    STA   $DFBA
1642-   C9 C6       CMP   #$C6
1644-   B2 A0       LDA   ($A0)
1646-   BB          ???
1647-   20 C1 CE    JSR   $CEC1
164A-   C4 20       CPY   $20
164C-   D6 C9       DEC   $C9,X
164E-   D3          ???
164F-   C9 D4       CMP   #$D4
1651-   C5 C4       CMP   $C4
1653-   A8          TAY
1654-   D8          CLD
1655-   AB          ???
1656-   B1 AC       LDA   ($AC),Y
1658-   D9 A9 20    CMP   $20A9,Y
165B-   BD BD 20    LDA   $20BD,X
165E-   B1 8D       LDA   ($8D),Y
1660-   AA          TAX
1661-   8D A0 C7    STA   $C7A0
1664-   C5 D4       CMP   $D4
1666-   B8          CLV
1667-   B2 A0       LDA   ($A0)
1669-   D6 C9       DEC   $C9,X
166B-   D3          ???
166C-   C9 D4       CMP   #$D4
166E-   C5 C4       CMP   $C4
1670-   BB          ???
1671-   D8          CLD
1672-   D0 B1       BNE   $1625
1674-   BB          ???
1675-   D9 D9 8D    CMP   $8DD9,Y
1678-   A0 CC       LDY   #$CC
167A-   C4 C1       CPY   $C1
167C-   A0 D2       LDY   #$D2
167E-   C5 D4       CMP   $D4
1680-   D5 D2       CMP   $D2,X
1682-   CE 8D A0    DEC   $A08D
1685-   C3          ???
1686-   CD D0 A0    CMP   $A0D0
1689-   A3          ???
168A-   B1 A0       LDA   ($A0),Y
168C-   BB          ???
168D-   20 D4 C5    JSR   $C5D4
1690-   D3          ???
1691-   D4          ???
1692-   20 D2 C9    JSR   $C9D2
1695-   C7          ???
1696-   C8          INY
1697-   D4          ???
1698-   20 C3 C5    JSR   $C5C3
169B-   CC CC 8D    CPY   $8DCC
169E-   A0 C2       LDY   #$C2
16A0-   C5 D1       CMP   $D1
16A2-   A0 BA       LDY   #$BA
16A4-   DF          ???
16A5-   C9 C6       CMP   #$C6
16A7-   B3          ???
16A8-   8D A0 CA    STA   $CAA0
16AB-   CD D0 A0    CMP   $A0D0
16AE-   C4 CF       CPY   $CF
16B0-   CD CF D6    CMP   $D6CF
16B3-   C5 8D       CMP   $8D
16B5-   AA          TAX
16B6-   8D BA DF    STA   $DFBA
16B9-   C9 C6       CMP   #$C6
16BB-   B3          ???
16BC-   A0 BB       LDY   #$BB
16BE-   20 C1 CE    JSR   $CEC1
16C1-   C4 20       CPY   $20
16C3-   C9 C6       CMP   #$C6
16C5-   20 D6 C9    JSR   $C9D6
16C8-   D3          ???
16C9-   C9 D4       CMP   #$D4
16CB-   C5 C4       CMP   $C4
16CD-   A8          TAY
16CE-   D8          CLD
16CF-   AC D9 AD    LDY   $ADD9
16D2-   B1 A9       LDA   ($A9),Y
16D4-   20 BD BD    JSR   $BDBD
16D7-   20 B1 8D    JSR   $8DB1
16DA-   A0 CC       LDY   #$CC
16DC-   C4 C1       CPY   $C1
16DE-   A0 D9       LDY   #$D9
16E0-   CD B1 8D    CMP   $8DB1
16E3-   A0 C3       LDY   #$C3
16E5-   CD D0 A0    CMP   $A0D0
16E8-   A3          ???
16E9-   B0 A0       BCS   $168B
16EB-   BB          ???
16EC-   20 D4 C5    JSR   $C5D4
16EF-   D3          ???
16F0-   D4          ???
16F1-   20 C6 CF    JSR   $CFC6
16F4-   D2 20       CMP   ($20)
16F6-   D9 BD B0    CMP   $B0BD,Y
16F9-   20 D4 CF    JSR   $CFD4
16FC-   20 CF D6    JSR   $D6CF
16FF-   CF          ???
1700-   C9 C4       CMP   #$C4
1702-   8D A0 C2    STA   $C2A0
1705-   CE C5 A0    DEC   $A0C5
1708-   BA          TSX
1709-   C9 C6       CMP   #$C6
170B-   B3          ???
170C-   C3          ???
170D-   A0 BB       LDY   #$BB
170F-   20 CF D5    JSR   $D5CF
1712-   D4          ???
1713-   20 CF C6    JSR   $C6CF
1716-   20 C2 CF    JSR   $CFC2
1719-   D5 CE       CMP   $CE,X
171B-   C4 D3       CPY   $D3
171D-   20 C5 D2    JSR   $D2C5
1720-   D2 CF       CMP   ($CF)
1722-   D2 8D       CMP   ($8D)
1724-   A0 CA       LDY   #$CA
1726-   CD D0 A0    CMP   $A0D0
1729-   BA          TSX
172A-   DF          ???
172B-   C9 C6       CMP   #$C6
172D-   B4 8D       LDY   $8D,X
172F-   BA          TSX
1730-   C9 C6       CMP   #$C6
1732-   B3          ???
1733-   C3          ???
1734-   8D A0 C7    STA   $C7A0
1737-   C5 D4       CMP   $D4
1739-   B8          CLV
173A-   B2 A0       LDA   ($A0)
173C-   D6 C9       DEC   $C9,X
173E-   D3          ???
173F-   C9 D4       CMP   #$D4
1741-   C5 C4       CMP   $C4
1743-   BB          ???
1744-   D8          CLD
1745-   D8          CLD
1746-   BB          ???
1747-   D9 CD B1    CMP   $B1CD,Y
174A-   8D A0 CC    STA   $CCA0
174D-   C4 C1       CPY   $C1
174F-   A0 D2       LDY   #$D2
1751-   C5 D4       CMP   $D4
1753-   D5 D2       CMP   $D2,X
1755-   CE 8D A0    DEC   $A08D
1758-   C3          ???
1759-   CD D0 A0    CMP   $A0D0
175C-   A3          ???
175D-   B1 A0       LDA   ($A0),Y
175F-   BB          ???
1760-   20 D4 C5    JSR   $C5D4
1763-   D3          ???
1764-   D4          ???
1765-   20 C3 C5    JSR   $C5C3
1768-   CC CC 20    CPY   $20CC
176B-   C1 C2       CMP   ($C2,X)
176D-   CF          ???
176E-   D6 C5       DEC   $C5,X
1770-   8D A0 C2    STA   $C2A0
1773-   C5 D1       CMP   $D1
1775-   A0 BA       LDY   #$BA
1777-   DF          ???
1778-   C9 C6       CMP   #$C6
177A-   B4 8D       LDY   $8D,X
177C-   A0 CA       LDY   #$CA
177E-   CD D0 A0    CMP   $A0D0
1781-   C4 CF       CPY   $CF
1783-   CD CF D6    CMP   $D6CF
1786-   C5 8D       CMP   $8D
1788-   AA          TAX
1789-   8D BA DF    STA   $DFBA
178C-   C9 C6       CMP   #$C6
178E-   B4 A0       LDY   $A0,X
1790-   A0 BB       LDY   #$BB
1792-   20 C1 CE    JSR   $CEC1
1795-   C4 20       CPY   $20
1797-   C9 C6       CMP   #$C6
1799-   20 D6 C9    JSR   $C9D6
179C-   D3          ???
179D-   C9 D4       CMP   #$D4
179F-   C5 C4       CMP   $C4
17A1-   A8          TAY
17A2-   D8          CLD
17A3-   AD B1 AC    LDA   $ACB1
17A6-   D9 A9 20    CMP   $20A9,Y
17A9-   BD BD 20    LDA   $20BD,X
17AC-   B1 8D       LDA   ($8D),Y
17AE-   A0 C7       LDY   #$C7
17B0-   C5 D4       CMP   $D4
17B2-   B8          CLV
17B3-   B2 A0       LDA   ($A0)
17B5-   D6 C9       DEC   $C9,X
17B7-   D3          ???
17B8-   C9 D4       CMP   #$D4
17BA-   C5 C4       CMP   $C4
17BC-   BB          ???
17BD-   D8          CLD
17BE-   CD B1 BB    CMP   $BBB1
17C1-   D9 D9 8D    CMP   $8DD9,Y
17C4-   A0 CC       LDY   #$CC
17C6-   C4 C1       CPY   $C1
17C8-   A0 D2       LDY   #$D2
17CA-   C5 D4       CMP   $D4
17CC-   D5 D2       CMP   $D2,X
17CE-   CE 8D A0    DEC   $A08D
17D1-   C3          ???
17D2-   CD D0 A0    CMP   $A0D0
17D5-   A3          ???
17D6-   B1 A0       LDA   ($A0),Y
17D8-   BB          ???
17D9-   20 D4 C8    JSR   $C8D4
17DC-   C5 CE       CMP   $CE
17DE-   20 D0 CF    JSR   $CFD0
17E1-   D0 20       BNE   $1803
17E3-   D3          ???
17E4-   D4          ???
17E5-   C1 C3       CMP   ($C3,X)
17E7-   CB          ???
17E8-   D3          ???
17E9-   20 D5 CE    JSR   $CED5
17EC-   D4          ???
17ED-   C9 CC       CMP   #$CC
17EF-   20 C4 CF    JSR   $CFC4
17F2-   CE C5 8D    DEC   $8DC5
17F5-   A0 C2       LDY   #$C2
17F7-   C5 D1       CMP   $D1
17F9-   A0 BA       LDY   #$BA
17FB-   D0 CF       BNE   $17CC
17FD-   D0 8D       BNE   $178C
17FF-   AA          TAX
1800-   8D A0 CA    STA   $CAA0
1803-   CD D0 A0    CMP   $A0D0
1806-   C4 CF       CPY   $CF
1808-   CD CF D6    CMP   $D6CF
180B-   C5 A0       CMP   $A0
180D-   BB          ???
180E-   20 CF D4    JSR   $D4CF
1811-   C8          INY
1812-   C5 D2       CMP   $D2
1814-   D7          ???
1815-   C9 D3       CMP   #$D3
1817-   C5 AC       CMP   $AC
1819-   20 C5 D8    JSR   $D8C5
181C-   C9 D4       CMP   #$D4
181E-   20 D2 CF    JSR   $CFD2
1821-   D5 D4       CMP   $D4,X
1823-   C9 CE       CMP   #$CE
1825-   C5 8D       CMP   $8D
1827-   AA          TAX
1828-   8D AA AA    STA   $AAAA
182B-   AA          TAX
182C-   AA          TAX
182D-   AA          TAX
182E-   AA          TAX
182F-   AA          TAX
1830-   AA          TAX
1831-   AA          TAX
1832-   AA          TAX
1833-   AA          TAX
1834-   AA          TAX
1835-   AA          TAX
1836-   AA          TAX
1837-   AA          TAX
1838-   AA          TAX
1839-   AA          TAX
183A-   AA          TAX
183B-   AA          TAX
183C-   AA          TAX
183D-   AA          TAX
183E-   AA          TAX
183F-   AA          TAX
1840-   AA          TAX
1841-   AA          TAX
1842-   AA          TAX
1843-   AA          TAX
1844-   AA          TAX
1845-   AA          TAX
1846-   AA          TAX
1847-   AA          TAX
1848-   AA          TAX
1849-   8D AA 8D    STA   $8DAA
184C-   BA          TSX
184D-   D0 CF       BNE   $181E
184F-   D0 8D       BNE   $17DE
1851-   AA          TAX
1852-   8D A0 C7    STA   $C7A0
1855-   C5 D4       CMP   $D4
1857-   B8          CLV
1858-   B1 A0       LDA   ($A0),Y
185A-   D8          CLD
185B-   D3          ???
185C-   D4          ???
185D-   C1 C3       CMP   ($C3,X)
185F-   CB          ???
1860-   BB          ???
1861-   D3          ???
1862-   D0 D4       BNE   $1838
1864-   D2 8D       CMP   ($8D)
1866-   A0 CC       LDY   #$CC
1868-   C4 C1       CPY   $C1
186A-   A0 D2       LDY   #$D2
186C-   C5 D4       CMP   $D4
186E-   D5 D2       CMP   $D2,X
1870-   CE 8D A0    DEC   $A08D
1873-   D3          ???
1874-   D4          ???
1875-   C1 A0       CMP   ($A0,X)
1877-   D8          CLD
1878-   D8          CLD
1879-   8D A0 C7    STA   $C7A0
187C-   C5 D4       CMP   $D4
187E-   B8          CLV
187F-   B1 A0       LDA   ($A0),Y
1881-   D9 D3 D4    CMP   $D4D3,Y
1884-   C1 C3       CMP   ($C3,X)
1886-   CB          ???
1887-   BB          ???
1888-   D3          ???
1889-   D0 D4       BNE   $185F
188B-   D2 8D       CMP   ($8D)
188D-   A0 CC       LDY   #$CC
188F-   C4 C1       CPY   $C1
1891-   A0 D2       LDY   #$D2
1893-   C5 D4       CMP   $D4
1895-   D5 D2       CMP   $D2,X
1897-   CE 8D A0    DEC   $A08D
189A-   D3          ???
189B-   D4          ???
189C-   C1 A0       CMP   ($A0,X)
189E-   D9 D9 8D    CMP   $8DD9,Y
18A1-   A0 C4       LDY   #$C4
18A3-   C5 C3       CMP   $C3
18A5-   A0 D3       LDY   #$D3
18A7-   D0 D4       BNE   $187D
18A9-   D2 A0       CMP   ($A0)
18AB-   BB          ???
18AC-   20 D0 CF    JSR   $CFD0
18AF-   D0 8D       BNE   $183E
18B1-   A0 CC       LDY   #$CC
18B3-   C4 C1       CPY   $C1
18B5-   A0 D3       LDY   #$D3
18B7-   D0 D4       BNE   $188D
18B9-   D2 8D       CMP   ($8D)
18BB-   A0 C3       LDY   #$C3
18BD-   CD D0 A0    CMP   $A0D0
18C0-   A3          ???
18C1-   B1 A0       LDA   ($A0),Y
18C3-   BB          ???
18C4-   20 C9 C6    JSR   $C6C9
18C7-   20 D3 D4    JSR   $D4D3
18CA-   C9 CC       CMP   #$CC
18CC-   CC 20 CD    CPY   $CD20
18CF-   CF          ???
18D0-   D2 C5       CMP   ($C5)
18D2-   20 CF CE    JSR   $CECF
18D5-   20 D3 D4    JSR   $D4D3
18D8-   C1 C3       CMP   ($C3,X)
18DA-   CB          ???
18DB-   8D A0 C2    STA   $C2A0
18DE-   C3          ???
18DF-   D3          ???
18E0-   A0 BA       LDY   #$BA
18E2-   C4 CF       CPY   $CF
18E4-   D2 C5       CMP   ($C5)
18E6-   D0 C5       BNE   $18AD
18E8-   C1 D4       CMP   ($D4,X)
18EA-   8D A0 CA    STA   $CAA0
18ED-   CD D0 A0    CMP   $A0D0
18F0-   C4 C9       CPY   $C9
18F2-   D3          ???
18F3-   D0 CD       BNE   $18C2
18F5-   C1 DA       CMP   ($DA,X)
18F7-   C5 A0       CMP   $A0
18F9-   BB          ???
18FA-   20 CF D4    JSR   $D4CF
18FD-   C8          INY
18FE-   C5 D2       CMP   $D2
1900-   D7          ???
1901-   C9 D3       CMP   #$D3
1903-   C5 AC       CMP   $AC
1905-   20 C6 C9    JSR   $C9C6
1908-   CE C9 D3    DEC   $D3C9
190B-   C8          INY
190C-   C5 C4       CMP   $C4
190E-   A1 8D       LDA   ($8D,X)
1910-   AA          TAX
1911-   8D BA C4    STA   $C4BA
1914-   CF          ???
1915-   D2 C5       CMP   ($C5)
1917-   D0 C5       BNE   $18DE
1919-   C1 D4       CMP   ($D4,X)
191B-   8D A0 CA    STA   $CAA0
191E-   CD D0 A0    CMP   $A0D0
1921-   C3          ???
1922-   C8          INY
1923-   C5 C3       CMP   $C3
1925-   CB          ???
1926-   C1 CC       CMP   ($CC,X)
1928-   CC 8D AA    CPY   $AA8D
192B-   8D AA AA    STA   $AAAA
192E-   AA          TAX
192F-   AA          TAX
1930-   AA          TAX
1931-   AA          TAX
1932-   AA          TAX
1933-   AA          TAX
1934-   AA          TAX
1935-   AA          TAX
1936-   AA          TAX
1937-   AA          TAX
1938-   AA          TAX
1939-   AA          TAX
193A-   AA          TAX
193B-   AA          TAX
193C-   AA          TAX
193D-   AA          TAX
193E-   AA          TAX
193F-   AA          TAX
1940-   AA          TAX
1941-   AA          TAX
1942-   AA          TAX
1943-   AA          TAX
1944-   AA          TAX
1945-   AA          TAX
1946-   AA          TAX
1947-   AA          TAX
1948-   AA          TAX
1949-   AA          TAX
194A-   AA          TAX
194B-   AA          TAX
194C-   8D AA 8D    STA   $8DAA
194F-   C4 CF       CPY   $CF
1951-   CD CF D6    CMP   $D6CF
1954-   C5 8D       CMP   $8D
1956-   AA          TAX
1957-   8D AA AA    STA   $AAAA
195A-   20 CD CF    JSR   $CFCD
195D-   D6 C5       DEC   $C5,X
195F-   20 C9 CE    JSR   $CEC9
1962-   20 C1 20    JSR   $20C1
1965-   D2 C1       CMP   ($C1)
1967-   CE C4 CF    DEC   $CFC4
196A-   CD 20 C4    CMP   $C420
196D-   C9 D2       CMP   #$D2
196F-   C5 C3       CMP   $C3
1971-   D4          ???
1972-   C9 CF       CMP   #$CF
1974-   CE 8D AA    DEC   $AA8D
1977-   8D A0 CA    STA   $CAA0
197A-   D3          ???
197B-   D2 A0       CMP   ($A0)
197D-   D2 C1       CMP   ($C1)
197F-   CE C4 B8    DEC   $B8C4
1982-   8D A0 C3    STA   $C3A0
1985-   CD D0 A0    CMP   $A0D0
1988-   A3          ???
1989-   B6 B4       LDX   $B4,Y
198B-   A0 BB       LDY   #$BB
198D-   20 C9 C6    JSR   $C6C9
1990-   20 D2 CE    JSR   $CED2
1993-   C4 20       CPY   $20
1995-   BC 20 B6    LDY   $B620,X
1998-   B4 8D       LDY   $8D,X
199A-   A0 C2       LDY   #$C2
199C-   C3          ???
199D-   C3          ???
199E-   A0 BA       LDY   #$BA
19A0-   CD D6 C4    CMP   $C4D6
19A3-   CF          ???
19A4-   D7          ???
19A5-   CE 8D A0    DEC   $A08D
19A8-   C3          ???
19A9-   CD D0 A0    CMP   $A0D0
19AC-   A3          ???
19AD-   B1 B2       LDA   ($B2),Y
19AF-   B8          CLV
19B0-   A0 BB       LDY   #$BB
19B2-   20 C5 CC    JSR   $CCC5
19B5-   D3          ???
19B6-   C5 20       CMP   $20
19B8-   C9 C6       CMP   #$C6
19BA-   20 D2 CE    JSR   $CED2
19BD-   C4 20       CPY   $20
19BF-   BC 20 B1    LDY   $B120,X
19C2-   B2 B8       LDA   ($B8)
19C4-   8D A0 C2    STA   $C2A0
19C7-   C3          ???
19C8-   C3          ???
19C9-   A0 BA       LDY   #$BA
19CB-   CD D6 D2    CMP   $D2D6
19CE-   C9 C7       CMP   #$C7
19D0-   C8          INY
19D1-   D4          ???
19D2-   8D A0 C3    STA   $C3A0
19D5-   CD D0 A0    CMP   $A0D0
19D8-   A3          ???
19D9-   B1 B9       LDA   ($B9),Y
19DB-   B2 A0       LDA   ($A0)
19DD-   BB          ???
19DE-   20 C5 CC    JSR   $CCC5
19E1-   D3          ???
19E2-   C5 20       CMP   $20
19E4-   C9 C6       CMP   #$C6
19E6-   20 D2 CE    JSR   $CED2
19E9-   C4 20       CPY   $20
19EB-   BC 20 B1    LDY   $B120,X
19EE-   B9 B2 8D    LDA   $8DB2,Y
19F1-   A0 C2       LDY   #$C2
19F3-   C3          ???
19F4-   C3          ???
19F5-   A0 BA       LDY   #$BA
19F7-   CD D6 D5    CMP   $D5D6
19FA-   D0 8D       BNE   $1989
19FC-   A0 CA       LDY   #$CA
19FE-   CD D0 A0    CMP   $A0D0
1A01-   BA          TSX
1A02-   CD D6 CC    CMP   $CCD6
1A05-   C5 C6       CMP   $C6
1A07-   D4          ???
1A08-   A0 BB       LDY   #$BB
1A0A-   20 C5 CC    JSR   $CCC5
1A0D-   D3          ???
1A0E-   C5 20       CMP   $20
1A10-   D2 CE       CMP   ($CE)
1A12-   C4 20       CPY   $20
1A14-   C9 D3       CMP   #$D3
1A16-   20 BE 20    JSR   $20BE
1A19-   B1 B9       LDA   ($B9),Y
1A1B-   B1 8D       LDA   ($8D),Y
1A1D-   AA          TAX
1A1E-   8D BA CD    STA   $CDBA
1A21-   D6 C4       DEC   $C4,X
1A23-   CF          ???
1A24-   D7          ???
1A25-   CE 8D A0    DEC   $A08D
1A28-   C7          ???
1A29-   C5 D4       CMP   $D4
1A2B-   B8          CLV
1A2C-   B2 A0       LDA   ($A0)
1A2E-   D6 C9       DEC   $C9,X
1A30-   D3          ???
1A31-   C9 D4       CMP   #$D4
1A33-   C5 C4       CMP   $C4
1A35-   BB          ???
1A36-   D8          CLD
1A37-   D8          CLD
1A38-   BB          ???
1A39-   D9 D0 B1    CMP   $B1D0,Y
1A3C-   8D A0 CC    STA   $CCA0
1A3F-   C4 C1       CPY   $C1
1A41-   A0 D2       LDY   #$D2
1A43-   C5 D4       CMP   $D4
1A45-   D5 D2       CMP   $D2,X
1A47-   CE 8D A0    DEC   $A08D
1A4A-   C3          ???
1A4B-   CD D0 A0    CMP   $A0D0
1A4E-   A3          ???
1A4F-   B0 A0       BCS   $19F1
1A51-   BB          ???
1A52-   20 C9 C6    JSR   $C6C9
1A55-   20 CE CF    JSR   $CFCE
1A58-   D4          ???
1A59-   20 C1 20    JSR   $20C1
1A5C-   D7          ???
1A5D-   C1 CC       CMP   ($CC,X)
1A5F-   CC 8D A0    CPY   $A08D
1A62-   C2          ???
1A63-   C5 D1       CMP   $D1
1A65-   A0 BA       LDY   #$BA
1A67-   C4 CF       CPY   $CF
1A69-   D7          ???
1A6A-   CE C7 CF    DEC   $CFC7
1A6D-   8D A0 CA    STA   $CAA0
1A70-   CD D0 A0    CMP   $A0D0
1A73-   C4 CF       CPY   $CF
1A75-   CD CF D6    CMP   $D6CF
1A78-   C5 8D       CMP   $8D
1A7A-   BA          TSX
1A7B-   C4 CF       CPY   $CF
1A7D-   D7          ???
1A7E-   CE C7 CF    DEC   $CFC7
1A81-   A0 BB       LDY   #$BB
1A83-   20 D4 C8    JSR   $C8D4
1A86-   C5 CE       CMP   $CE
1A88-   20 CD CF    JSR   $CFCD
1A8B-   D6 C5       DEC   $C5,X
1A8D-   20 D4 C8    JSR   $C8D4
1A90-   C5 D2       CMP   $D2
1A92-   C5 8D       CMP   $8D
1A94-   A0 D0       LDY   #$D0
1A96-   D5 D4       CMP   $D4,X
1A98-   B8          CLV
1A99-   B2 A0       LDA   ($A0)
1A9B-   D6 B0       DEC   $B0,X
1A9D-   BB          ???
1A9E-   D3          ???
1A9F-   CF          ???
1AA0-   D5 D4       CMP   $D4,X
1AA2-   C8          INY
1AA3-   D7          ???
1AA4-   BB          ???
1AA5-   D8          CLD
1AA6-   D8          CLD
1AA7-   BB          ???
1AA8-   D9 D9 8D    CMP   $8DD9,Y
1AAB-   A0 C9       LDY   #$C9
1AAD-   CE C3 A0    DEC   $A0C3
1AB0-   D9 D9 8D    CMP   $8DD9,Y
1AB3-   A0 CA       LDY   #$CA
1AB5-   CD D0 A0    CMP   $A0D0
1AB8-   D3          ???
1AB9-   D4          ???
1ABA-   C1 CB       CMP   ($CB,X)
1ABC-   D0 D5       BNE   $1A93
1ABE-   D3          ???
1ABF-   C8          INY
1AC0-   8D BA CD    STA   $CDBA
1AC3-   D6 D2       DEC   $D2,X
1AC5-   C9 C7       CMP   #$C7
1AC7-   C8          INY
1AC8-   D4          ???
1AC9-   8D A0 C7    STA   $C7A0
1ACC-   C5 D4       CMP   $D4
1ACE-   B8          CLV
1ACF-   B2 A0       LDA   ($A0)
1AD1-   D6 C9       DEC   $C9,X
1AD3-   D3          ???
1AD4-   C9 D4       CMP   #$D4
1AD6-   C5 C4       CMP   $C4
1AD8-   BB          ???
1AD9-   D8          CLD
1ADA-   D0 B1       BNE   $1A8D
1ADC-   BB          ???
1ADD-   D9 D9 8D    CMP   $8DD9,Y
1AE0-   A0 CC       LDY   #$CC
1AE2-   C4 C1       CPY   $C1
1AE4-   A0 D2       LDY   #$D2
1AE6-   C5 D4       CMP   $D4
1AE8-   D5 D2       CMP   $D2,X
1AEA-   CE 8D A0    DEC   $A08D
1AED-   C3          ???
1AEE-   CD D0 A0    CMP   $A0D0
1AF1-   A3          ???
1AF2-   B0 8D       BCS   $1A81
1AF4-   A0 C2       LDY   #$C2
1AF6-   C5 D1       CMP   $D1
1AF8-   A0 BA       LDY   #$BA
1AFA-   D2 C9       CMP   ($C9)
1AFC-   C7          ???
1AFD-   C8          INY
1AFE-   D4          ???
1AFF-   C7          ???
1B00-   CF          ???
1B01-   8D A0 CA    STA   $CAA0
1B04-   CD D0 A0    CMP   $A0D0
1B07-   C4 CF       CPY   $CF
1B09-   CD CF D6    CMP   $D6CF
1B0C-   C5 8D       CMP   $8D
1B0E-   BA          TSX
1B0F-   D2 C9       CMP   ($C9)
1B11-   C7          ???
1B12-   C8          INY
1B13-   D4          ???
1B14-   C7          ???
1B15-   CF          ???
1B16-   8D A0 D0    STA   $D0A0
1B19-   D5 D4       CMP   $D4,X
1B1B-   B8          CLV
1B1C-   B2 A0       LDA   ($A0)
1B1E-   D6 B0       DEC   $B0,X
1B20-   BB          ???
1B21-   D7          ???
1B22-   C5 D3       CMP   $D3
1B24-   D4          ???
1B25-   D7          ???
1B26-   BB          ???
1B27-   D8          CLD
1B28-   D0 B1       BNE   $1ADB
1B2A-   BB          ???
1B2B-   D9 D9 8D    CMP   $8DD9,Y
1B2E-   A0 C9       LDY   #$C9
1B30-   CE C3 A0    DEC   $A0C3
1B33-   D8          CLD
1B34-   D8          CLD
1B35-   8D A0 CA    STA   $CAA0
1B38-   CD D0 A0    CMP   $A0D0
1B3B-   D3          ???
1B3C-   D4          ???
1B3D-   C1 CB       CMP   ($CB,X)
1B3F-   D0 D5       BNE   $1B16
1B41-   D3          ???
1B42-   C8          INY
1B43-   8D AA 8D    STA   $8DAA
1B46-   BA          TSX
1B47-   CD D6 D5    CMP   $D5D6
1B4A-   D0 8D       BNE   $1AD9
1B4C-   A0 CC       LDY   #$CC
1B4E-   C4 C1       CPY   $C1
1B50-   A0 D9       LDY   #$D9
1B52-   CD B1 8D    CMP   $8DB1
1B55-   A0 C3       LDY   #$C3
1B57-   CD D0 A0    CMP   $A0D0
1B5A-   A3          ???
1B5B-   B0 8D       BCS   $1AEA
1B5D-   A0 C2       LDY   #$C2
1B5F-   C5 D1       CMP   $D1
1B61-   A0 BA       LDY   #$BA
1B63-   D5 D0       CMP   $D0,X
1B65-   CE CF 8D    DEC   $8DCF
1B68-   A0 C7       LDY   #$C7
1B6A-   C5 D4       CMP   $D4
1B6C-   B8          CLV
1B6D-   B2 A0       LDA   ($A0)
1B6F-   D6 C9       DEC   $C9,X
1B71-   D3          ???
1B72-   C9 D4       CMP   #$D4
1B74-   C5 C4       CMP   $C4
1B76-   BB          ???
1B77-   D8          CLD
1B78-   D8          CLD
1B79-   BB          ???
1B7A-   D9 CD B1    CMP   $B1CD,Y
1B7D-   8D A0 CC    STA   $CCA0
1B80-   C4 C1       CPY   $C1
1B82-   A0 D2       LDY   #$D2
1B84-   C5 D4       CMP   $D4
1B86-   D5 D2       CMP   $D2,X
1B88-   CE 8D A0    DEC   $A08D
1B8B-   C3          ???
1B8C-   CD D0 A0    CMP   $A0D0
1B8F-   A3          ???
1B90-   B0 8D       BCS   $1B1F
1B92-   A0 C2       LDY   #$C2
1B94-   C5 D1       CMP   $D1
1B96-   A0 BA       LDY   #$BA
1B98-   D5 D0       CMP   $D0,X
1B9A-   C7          ???
1B9B-   CF          ???
1B9C-   8D BA D5    STA   $D5BA
1B9F-   D0 CE       BNE   $1B6F
1BA1-   CF          ???
1BA2-   8D A0 CA    STA   $CAA0
1BA5-   CD D0 A0    CMP   $A0D0
1BA8-   C4 CF       CPY   $CF
1BAA-   CD CF D6    CMP   $D6CF
1BAD-   C5 8D       CMP   $8D
1BAF-   BA          TSX
1BB0-   D5 D0       CMP   $D0,X
1BB2-   C7          ???
1BB3-   CF          ???
1BB4-   8D A0 D0    STA   $D0A0
1BB7-   D5 D4       CMP   $D4,X
1BB9-   B8          CLV
1BBA-   B2 A0       LDA   ($A0)
1BBC-   D6 B0       DEC   $B0,X
1BBE-   BB          ???
1BBF-   D3          ???
1BC0-   CF          ???
1BC1-   D5 D4       CMP   $D4,X
1BC3-   C8          INY
1BC4-   D7          ???
1BC5-   BB          ???
1BC6-   D8          CLD
1BC7-   D8          CLD
1BC8-   BB          ???
1BC9-   D9 CD B1    CMP   $B1CD,Y
1BCC-   8D A0 C4    STA   $C4A0
1BCF-   C5 C3       CMP   $C3
1BD1-   A0 D9       LDY   #$D9
1BD3-   D9 8D A0    CMP   $A08D,Y
1BD6-   CA          DEX
1BD7-   CD D0 A0    CMP   $A0D0
1BDA-   D3          ???
1BDB-   D4          ???
1BDC-   C1 CB       CMP   ($CB,X)
1BDE-   D0 D5       BNE   $1BB5
1BE0-   D3          ???
1BE1-   C8          INY
1BE2-   8D AA 8D    STA   $8DAA
1BE5-   BA          TSX
1BE6-   CD D6 CC    CMP   $CCD6
1BE9-   C5 C6       CMP   $C6
1BEB-   D4          ???
1BEC-   8D A0 C7    STA   $C7A0
1BEF-   C5 D4       CMP   $D4
1BF1-   B8          CLV
1BF2-   B2 A0       LDA   ($A0)
1BF4-   D6 C9       DEC   $C9,X
1BF6-   D3          ???
1BF7-   C9 D4       CMP   #$D4
1BF9-   C5 C4       CMP   $C4
1BFB-   BB          ???
1BFC-   D8          CLD
1BFD-   CD B1 BB    CMP   $BBB1
1C00-   D9 D9 8D    CMP   $8DD9,Y
1C03-   A0 CC       LDY   #$CC
1C05-   C4 C1       CPY   $C1
1C07-   A0 D2       LDY   #$D2
1C09-   C5 D4       CMP   $D4
1C0B-   D5 D2       CMP   $D2,X
1C0D-   CE 8D A0    DEC   $A08D
1C10-   C3          ???
1C11-   CD D0 A0    CMP   $A0D0
1C14-   A3          ???
1C15-   B0 8D       BCS   $1BA4
1C17-   A0 C2       LDY   #$C2
1C19-   C5 D1       CMP   $D1
1C1B-   A0 BA       LDY   #$BA
1C1D-   CC C5 C6    CPY   $C6C5
1C20-   D4          ???
1C21-   C7          ???
1C22-   CF          ???
1C23-   8D A0 CA    STA   $CAA0
1C26-   CD D0 A0    CMP   $A0D0
1C29-   C4 CF       CPY   $CF
1C2B-   CD CF D6    CMP   $D6CF
1C2E-   C5 8D       CMP   $8D
1C30-   BA          TSX
1C31-   CC C5 C6    CPY   $C6C5
1C34-   D4          ???
1C35-   C7          ???
1C36-   CF          ???
1C37-   8D A0 D0    STA   $D0A0
1C3A-   D5 D4       CMP   $D4,X
1C3C-   B8          CLV
1C3D-   B2 A0       LDA   ($A0)
1C3F-   D6 B0       DEC   $B0,X
1C41-   BB          ???
1C42-   D7          ???
1C43-   C5 D3       CMP   $D3
1C45-   D4          ???
1C46-   D7          ???
1C47-   BB          ???
1C48-   D8          CLD
1C49-   D8          CLD
1C4A-   BB          ???
1C4B-   D9 D9 8D    CMP   $8DD9,Y
1C4E-   A0 C4       LDY   #$C4
1C50-   C5 C3       CMP   $C3
1C52-   A0 D8       LDY   #$D8
1C54-   D8          CLD
1C55-   8D A0 CA    STA   $CAA0
1C58-   CD D0 A0    CMP   $A0D0
1C5B-   D3          ???
1C5C-   D4          ???
1C5D-   C1 CB       CMP   ($CB,X)
1C5F-   D0 D5       BNE   $1C36
1C61-   D3          ???
1C62-   C8          INY
1C63-   8D AA 8D    STA   $8DAA
1C66-   AA          TAX
1C67-   AA          TAX
1C68-   AA          TAX
1C69-   AA          TAX
1C6A-   AA          TAX
1C6B-   AA          TAX
1C6C-   AA          TAX
1C6D-   AA          TAX
1C6E-   AA          TAX
1C6F-   AA          TAX
1C70-   AA          TAX
1C71-   AA          TAX
1C72-   AA          TAX
1C73-   AA          TAX
1C74-   AA          TAX
1C75-   AA          TAX
1C76-   AA          TAX
1C77-   AA          TAX
1C78-   AA          TAX
1C79-   AA          TAX
1C7A-   AA          TAX
1C7B-   AA          TAX
1C7C-   AA          TAX
1C7D-   AA          TAX
1C7E-   AA          TAX
1C7F-   AA          TAX
1C80-   AA          TAX
1C81-   AA          TAX
1C82-   AA          TAX
1C83-   AA          TAX
1C84-   AA          TAX
1C85-   AA          TAX
1C86-   8D AA 20    STA   $20AA
1C89-   20 20 20    JSR   $2020
1C8C-   20 20 20    JSR   $2020
1C8F-   20 20 20    JSR   $2020
1C92-   20 20 20    JSR   $2020
1C95-   20 20 20    JSR   $2020
1C98-   20 20 20    JSR   $2020
1C9B-   20 20 20    JSR   $2020
1C9E-   20 20 20    JSR   $2020
1CA1-   20 20 20    JSR   $2020
1CA4-   20 20 AA    JSR   $AA20
1CA7-   8D AA 20    STA   $20AA
1CAA-   C4 C9       CPY   $C9
1CAC-   D3          ???
1CAD-   D0 CC       BNE   $1C7B
1CAF-   C1 D9       CMP   ($D9,X)
1CB1-   20 D4 C8    JSR   $C8D4
1CB4-   C5 20       CMP   $20
1CB6-   CD C1 DA    CMP   $DAC1
1CB9-   C5 20       CMP   $20
1CBB-   20 20 20    JSR   $2020
1CBE-   20 20 20    JSR   $2020
1CC1-   20 20 20    JSR   $2020
1CC4-   20 20 20    JSR   $2020
1CC7-   AA          TAX
1CC8-   8D AA 20    STA   $20AA
1CCB-   20 20 20    JSR   $2020
1CCE-   20 20 20    JSR   $2020
1CD1-   20 20 20    JSR   $2020
1CD4-   20 20 20    JSR   $2020
1CD7-   20 20 20    JSR   $2020
1CDA-   20 20 20    JSR   $2020
1CDD-   20 20 20    JSR   $2020
1CE0-   20 20 20    JSR   $2020
1CE3-   20 20 20    JSR   $2020
1CE6-   20 20 AA    JSR   $AA20
1CE9-   8D AA AA    STA   $AAAA
1CEC-   AA          TAX
1CED-   AA          TAX
1CEE-   AA          TAX
1CEF-   AA          TAX
1CF0-   AA          TAX
1CF1-   AA          TAX
1CF2-   AA          TAX
1CF3-   AA          TAX
1CF4-   AA          TAX
1CF5-   AA          TAX
1CF6-   AA          TAX
1CF7-   AA          TAX
1CF8-   AA          TAX
1CF9-   AA          TAX
1CFA-   AA          TAX
1CFB-   AA          TAX
1CFC-   AA          TAX
1CFD-   AA          TAX
1CFE-   AA          TAX
1CFF-   AA          TAX
1D00-   AA          TAX
1D01-   AA          TAX
1D02-   AA          TAX
1D03-   AA          TAX
1D04-   AA          TAX
1D05-   AA          TAX
1D06-   AA          TAX
1D07-   AA          TAX
1D08-   AA          TAX
1D09-   AA          TAX
1D0A-   8D AA 8D    STA   $8DAA
1D0D-   C4 C9       CPY   $C9
1D0F-   D3          ???
1D10-   D0 CD       BNE   $1CDF
1D12-   C1 DA       CMP   ($DA,X)
1D14-   C5 8D       CMP   $8D
1D16-   AA          TAX
1D17-   8D AA AA    STA   $AAAA
1D1A-   20 D3 C5    JSR   $C5D3
1D1D-   CE C4 20    DEC   $20C4
1D20-   CD C1 DA    CMP   $DAC1
1D23-   C5 20       CMP   $20
1D25-   D4          ???
1D26-   CF          ???
1D27-   20 C4 C9    JSR   $C9C4
1D2A-   D3          ???
1D2B-   D0 CC       BNE   $1CF9
1D2D-   C1 D9       CMP   ($D9,X)
1D2F-   20 CF D5    JSR   $D5CF
1D32-   D4          ???
1D33-   D0 D5       BNE   $1D0A
1D35-   D4          ???
1D36-   AC 20 C6    LDY   $C620
1D39-   CF          ???
1D3A-   D2 CD       CMP   ($CD)
1D3C-   C1 D4       CMP   ($D4,X)
1D3E-   D4          ???
1D3F-   C5 C4       CMP   $C4
1D41-   8D AA 8D    STA   $8DAA
1D44-   A0 D0       LDY   #$D0
1D46-   D2 CE       CMP   ($CE)
1D48-   A0 A2       LDY   #$A2
1D4A-   D0 D2       BNE   $1D1E
1D4C-   C9 CE       CMP   #$CE
1D4E-   D4          ???
1D4F-   C9 CE       CMP   #$CE
1D51-   C7          ???
1D52-   AE AE AE    LDX   $AEAE
1D55-   A2 AC       LDX   #$AC
1D57-   B8          CLV
1D58-   C4 8D       CPY   $8D
1D5A-   A0 D0       LDY   #$D0
1D5C-   D2 CE       CMP   ($CE)
1D5E-   A0 A2       LDY   #$A2
1D60-   20 A2 AC    JSR   $ACA2
1D63-   B8          CLV
1D64-   C4 8D       CPY   $8D
1D66-   A0 CC       LDY   #$CC
1D68-   C4 C1       CPY   $C1
1D6A-   A0 A3       LDY   #$A3
1D6C-   B1 8D       LDA   ($8D),Y
1D6E-   A0 D3       LDY   #$D3
1D70-   D4          ???
1D71-   C1 A0       CMP   ($A0,X)
1D73-   D8          CLD
1D74-   D8          CLD
1D75-   8D BA D8    STA   $D8BA
1D78-   CC CF CF    CPY   $CFCF
1D7B-   D0 8D       BNE   $1D0A
1D7D-   A0 C9       LDY   #$C9
1D7F-   CE C3 A0    DEC   $A0C3
1D82-   D8          CLD
1D83-   D8          CLD
1D84-   8D A0 D0    STA   $D0A0
1D87-   D2 CE       CMP   ($CE)
1D89-   A0 A2       LDY   #$A2
1D8B-   D8          CLD
1D8C-   A2 8D       LDX   #$8D
1D8E-   A0 CC       LDY   #$CC
1D90-   C4 C1       CPY   $C1
1D92-   A0 D8       LDY   #$D8
1D94-   D8          CLD
1D95-   8D A0 C3    STA   $C3A0
1D98-   CD D0 A0    CMP   $A0D0
1D9B-   A3          ???
1D9C-   D8          CLD
1D9D-   CE D5 CD    DEC   $CDD5
1DA0-   8D A0 C2    STA   $C2A0
1DA3-   CE C5 A0    DEC   $A0C5
1DA6-   BA          TSX
1DA7-   D8          CLD
1DA8-   CC CF CF    CPY   $CFCF
1DAB-   D0 8D       BNE   $1D3A
1DAD-   A0 D0       LDY   #$D0
1DAF-   D2 CE       CMP   ($CE)
1DB1-   A0 A2       LDY   #$A2
1DB3-   20 A2 AC    JSR   $ACA2
1DB6-   B8          CLV
1DB7-   C4 8D       CPY   $8D
1DB9-   AA          TAX
1DBA-   8D A0 CC    STA   $CCA0
1DBD-   C4 C1       CPY   $C1
1DBF-   A0 A3       LDY   #$A3
1DC1-   B2 8D       LDA   ($8D)
1DC3-   A0 D3       LDY   #$D3
1DC5-   D4          ???
1DC6-   C1 A0       CMP   ($A0,X)
1DC8-   D8          CLD
1DC9-   D8          CLD
1DCA-   8D A0 D3    STA   $D3A0
1DCD-   D4          ???
1DCE-   C1 A0       CMP   ($A0,X)
1DD0-   D9 D9 8D    CMP   $8DD9,Y
1DD3-   D7          ???
1DD4-   CC D0 8D    CPY   $8DD0
1DD7-   AA          TAX
1DD8-   8D AA AA    STA   $AAAA
1DDB-   20 C9 C6    JSR   $C6C9
1DDE-   20 D7 C5    JSR   $C5D7
1DE1-   D3          ???
1DE2-   D4          ???
1DE3-   D7          ???
1DE4-   A8          TAY
1DE5-   D8          CLD
1DE6-   AC D9 A9    LDY   $A9D9
1DE9-   20 BD BD    JSR   $BDBD
1DEC-   20 B0 8D    JSR   $8DB0
1DEF-   AA          TAX
1DF0-   8D A0 C7    STA   $C7A0
1DF3-   C5 D4       CMP   $D4
1DF5-   B8          CLV
1DF6-   B2 A0       LDA   ($A0)
1DF8-   D7          ???
1DF9-   C5 D3       CMP   $D3
1DFB-   D4          ???
1DFC-   D7          ???
1DFD-   BB          ???
1DFE-   D8          CLD
1DFF-   D8          CLD
1E00-   BB          ???
1E01-   D9 D9 8D    CMP   $8DD9,Y
1E04-   A0 CC       LDY   #$CC
1E06-   C4 C1       CPY   $C1
1E08-   A0 D2       LDY   #$D2
1E0A-   C5 D4       CMP   $D4
1E0C-   D5 D2       CMP   $D2,X
1E0E-   CE 8D A0    DEC   $A08D
1E11-   C3          ???
1E12-   CD D0 A0    CMP   $A0D0
1E15-   A3          ???
1E16-   B0 8D       BCS   $1DA5
1E18-   A0 C2       LDY   #$C2
1E1A-   C5 D1       CMP   $D1
1E1C-   A0 CE       LDY   #$CE
1E1E-   CF          ???
1E1F-   D7          ???
1E20-   C1 CC       CMP   ($CC,X)
1E22-   CC D7 A0    CPY   $A0D7
1E25-   BB          ???
1E26-   20 D4 C8    JSR   $C8D4
1E29-   C5 CE       CMP   $CE
1E2B-   20 D0 D2    JSR   $D2D0
1E2E-   C9 CE       CMP   #$CE
1E30-   D4          ???
1E31-   20 AE AE    JSR   $AEAE
1E34-   AE 8D D9    LDX   $D98D
1E37-   C5 D3       CMP   $D3
1E39-   D7          ???
1E3A-   C1 CC       CMP   ($CC,X)
1E3C-   CC D7 A0    CPY   $A0D7
1E3F-   BB          ???
1E40-   20 C5 CC    JSR   $CCC5
1E43-   D3          ???
1E44-   C5 20       CMP   $20
1E46-   D0 D2       BNE   $1E1A
1E48-   C9 CE       CMP   #$CE
1E4A-   D4          ???
1E4B-   20 D8 AE    JSR   $AED8
1E4E-   AE 8D A0    LDX   $A08D
1E51-   D0 D2       BNE   $1E25
1E53-   CE A0 A2    DEC   $A2A0
1E56-   D8          CLD
1E57-   20 A2 8D    JSR   $8DA2
1E5A-   A0 CA       LDY   #$CA
1E5C-   CD D0 A0    CMP   $A0D0
1E5F-   C3          ???
1E60-   CF          ???
1E61-   CE D4 D7    DEC   $D7D4
1E64-   CC D0 8D    CPY   $8DD0
1E67-   CE CF D7    DEC   $D7CF
1E6A-   C1 CC       CMP   ($CC,X)
1E6C-   CC D7 8D    CPY   $8DD7
1E6F-   A0 D0       LDY   #$D0
1E71-   D2 CE       CMP   ($CE)
1E73-   A0 A2       LDY   #$A2
1E75-   20 20 A2    JSR   $A220
1E78-   8D AA 8D    STA   $8DAA
1E7B-   C3          ???
1E7C-   CF          ???
1E7D-   CE D4 D7    DEC   $D7D4
1E80-   CC D0 8D    CPY   $8DD0
1E83-   A0 C9       LDY   #$C9
1E85-   CE C3 A0    DEC   $A0C3
1E88-   D8          CLD
1E89-   D8          CLD
1E8A-   8D A0 CC    STA   $CCA0
1E8D-   C4 C1       CPY   $C1
1E8F-   A0 D8       LDY   #$D8
1E91-   D8          CLD
1E92-   8D A0 C3    STA   $C3A0
1E95-   CD D0 A0    CMP   $A0D0
1E98-   A3          ???
1E99-   D8          CLD
1E9A-   CD C1 D8    CMP   $D8C1
1E9D-   8D A0 C2    STA   $C2A0
1EA0-   C5 D1       CMP   $D1
1EA2-   A0 BA       LDY   #$BA
1EA4-   C5 CE       CMP   $CE
1EA6-   C4 D7       CPY   $D7
1EA8-   CC D0 8D    CPY   $8DD0
1EAB-   A0 CA       LDY   #$CA
1EAD-   CD D0 A0    CMP   $A0D0
1EB0-   D7          ???
1EB1-   CC D0 8D    CPY   $8DD0
1EB4-   AA          TAX
1EB5-   8D BA C5    STA   $C5BA
1EB8-   CE C4 D7    DEC   $D7C4
1EBB-   CC D0 8D    CPY   $8DD0
1EBE-   A0 D0       LDY   #$D0
1EC0-   D2 CE       CMP   ($CE)
1EC2-   A0 A2       LDY   #$A2
1EC4-   D8          CLD
1EC5-   A2 AC       LDX   #$AC
1EC7-   B8          CLV
1EC8-   C4 20       CPY   $20
1ECA-   BB          ???
1ECB-   20 CE C5    JSR   $C5CE
1ECE-   D8          CLD
1ECF-   D4          ???
1ED0-   20 CC C9    JSR   $C9CC
1ED3-   CE C5 8D    DEC   $8DC5
1ED6-   AA          TAX
1ED7-   8D A0 CC    STA   $CCA0
1EDA-   C4 C1       CPY   $C1
1EDC-   A0 A3       LDY   #$A3
1EDE-   B2 8D       LDA   ($8D)
1EE0-   A0 D3       LDY   #$D3
1EE2-   D4          ???
1EE3-   C1 A0       CMP   ($A0,X)
1EE5-   D8          CLD
1EE6-   D8          CLD
1EE7-   A0 BB       LDY   #$BB
1EE9-   20 D2 C5    JSR   $C5D2
1EEC-   C3          ???
1EED-   D9 C3 CC    CMP   $CCC3,Y
1EF0-   C9 CE       CMP   #$CE
1EF2-   C7          ???
1EF3-   8D AA 8D    STA   $8DAA
1EF6-   AA          TAX
1EF7-   AA          TAX
1EF8-   20 C9 C6    JSR   $C6C9
1EFB-   20 D3 CF    JSR   $CFD3
1EFE-   D5 D4       CMP   $D4,X
1F00-   C8          INY
1F01-   D7          ???
1F02-   A8          TAY
1F03-   D8          CLD
1F04-   AC D9 A9    LDY   $A9D9
1F07-   20 BD BD    JSR   $BDBD
1F0A-   20 B0 8D    JSR   $8DB0
1F0D-   AA          TAX
1F0E-   8D D3 CC    STA   $CCD3
1F11-   D0 8D       BNE   $1EA0
1F13-   A0 C7       LDY   #$C7
1F15-   C5 D4       CMP   $D4
1F17-   B8          CLV
1F18-   B2 A0       LDA   ($A0)
1F1A-   D3          ???
1F1B-   CF          ???
1F1C-   D5 D4       CMP   $D4,X
1F1E-   C8          INY
1F1F-   D7          ???
1F20-   BB          ???
1F21-   D8          CLD
1F22-   D8          CLD
1F23-   BB          ???
1F24-   D9 D9 8D    CMP   $8DD9,Y
1F27-   A0 CC       LDY   #$CC
1F29-   C4 C1       CPY   $C1
1F2B-   A0 D2       LDY   #$D2
1F2D-   C5 D4       CMP   $D4
1F2F-   D5 D2       CMP   $D2,X
1F31-   CE 8D A0    DEC   $A08D
1F34-   C3          ???
1F35-   CD D0 A0    CMP   $A0D0
1F38-   A3          ???
1F39-   B0 8D       BCS   $1EC8
1F3B-   A0 C2       LDY   #$C2
1F3D-   C5 D1       CMP   $D1
1F3F-   A0 CE       LDY   #$CE
1F41-   CF          ???
1F42-   D3          ???
1F43-   CF          ???
1F44-   D5 D4       CMP   $D4,X
1F46-   C8          INY
1F47-   A0 BB       LDY   #$BB
1F49-   20 D4 C8    JSR   $C8D4
1F4C-   C5 CE       CMP   $CE
1F4E-   20 D0 D2    JSR   $D2D0
1F51-   C9 CE       CMP   #$CE
1F53-   D4          ???
1F54-   20 D8 AE    JSR   $AED8
1F57-   AE 8D D9    LDX   $D98D
1F5A-   D3          ???
1F5B-   CF          ???
1F5C-   D5 D4       CMP   $D4,X
1F5E-   C8          INY
1F5F-   A0 BB       LDY   #$BB
1F61-   20 C5 CC    JSR   $CCC5
1F64-   D3          ???
1F65-   C5 20       CMP   $20
1F67-   D0 D2       BNE   $1F3B
1F69-   C9 CE       CMP   #$CE
1F6B-   D4          ???
1F6C-   20 D8 D8    JSR   $D8D8
1F6F-   D8          CLD
1F70-   8D A0 D0    STA   $D0A0
1F73-   D2 CE       CMP   ($CE)
1F75-   A0 A2       LDY   #$A2
1F77-   D8          CLD
1F78-   D8          CLD
1F79-   A2 8D       LDX   #$8D
1F7B-   A0 CA       LDY   #$CA
1F7D-   CD D0 A0    CMP   $A0D0
1F80-   C3          ???
1F81-   CF          ???
1F82-   CE D4 D3    DEC   $D3D4
1F85-   CC D0 8D    CPY   $8DD0
1F88-   CE CF D3    DEC   $D3CF
1F8B-   CF          ???
1F8C-   D5 D4       CMP   $D4,X
1F8E-   C8          INY
1F8F-   8D A0 D0    STA   $D0A0
1F92-   D2 CE       CMP   ($CE)
1F94-   A0 A2       LDY   #$A2
1F96-   D8          CLD
1F97-   20 A2 8D    JSR   $8DA2
1F9A-   C3          ???
1F9B-   CF          ???
1F9C-   CE D4 D3    DEC   $D3D4
1F9F-   CC D0 8D    CPY   $8DD0
1FA2-   A0 C9       LDY   #$C9
1FA4-   CE C3 A0    DEC   $A0C3
1FA7-   D8          CLD
1FA8-   D8          CLD
1FA9-   8D A0 CC    STA   $CCA0
1FAC-   C4 C1       CPY   $C1
1FAE-   A0 D8       LDY   #$D8
1FB0-   D8          CLD
1FB1-   8D A0 C3    STA   $C3A0
1FB4-   CD D0 A0    CMP   $A0D0
1FB7-   A3          ???
1FB8-   D8          CLD
1FB9-   CD C1 D8    CMP   $D8C1
1FBC-   8D A0 C2    STA   $C2A0
1FBF-   C5 D1       CMP   $D1
1FC1-   A0 BA       LDY   #$BA
1FC3-   C5 CE       CMP   $CE
1FC5-   C4 D3       CPY   $D3
1FC7-   CC D0 8D    CPY   $8DD0
1FCA-   A0 CA       LDY   #$CA
1FCC-   CD D0 A0    CMP   $A0D0
1FCF-   D3          ???
1FD0-   CC D0 8D    CPY   $8DD0
1FD3-   BA          TSX
1FD4-   C5 CE       CMP   $CE
1FD6-   C4 D3       CPY   $D3
1FD8-   CC D0 8D    CPY   $8DD0
1FDB-   AA          TAX
1FDC-   8D A0 D0    STA   $D0A0
1FDF-   D2 CE       CMP   ($CE)
1FE1-   A0 A2       LDY   #$A2
1FE3-   D8          CLD
1FE4-   A2 AC       LDX   #$AC
1FE6-   B8          CLV
1FE7-   C4 8D       CPY   $8D
1FE9-   AA          TAX
1FEA-   8D A0 CC    STA   $CCA0
1FED-   C4 C1       CPY   $C1
1FEF-   A0 A3       LDY   #$A3
1FF1-   B2 8D       LDA   ($8D)
1FF3-   A0 D3       LDY   #$D3
1FF5-   D4          ???
1FF6-   C1 A0       CMP   ($A0,X)
1FF8-   D8          CLD
1FF9-   D8          CLD
1FFA-   8D A0 C9    STA   $C9A0
1FFD-   CE C3 A0    DEC   $A0C3
2000-   D9 D9 8D    CMP   $8DD9,Y
2003-   A0 CC       LDY   #$CC
2005-   C4 C1       CPY   $C1
2007-   A0 D9       LDY   #$D9
2009-   D9 8D A0    CMP   $A08D,Y
200C-   C3          ???
200D-   CD D0 A0    CMP   $A0D0
2010-   A3          ???
2011-   D9 CD C1    CMP   $C1CD,Y
2014-   D8          CLD
2015-   8D A0 C2    STA   $C2A0
2018-   C5 D1       CMP   $D1
201A-   A0 C4       LDY   #$C4
201C-   C9 D3       CMP   #$D3
201E-   D0 C5       BNE   $1FE5
2020-   D8          CLD
2021-   C9 D4       CMP   #$D4
2023-   8D A0 CA    STA   $CAA0
2026-   CD D0 A0    CMP   $A0D0
2029-   D7          ???
202A-   CC D0 8D    CPY   $8DD0
202D-   AA          TAX
202E-   8D C4 C9    STA   $C9C4
2031-   D3          ???
2032-   D0 C5       BNE   $1FF9
2034-   D8          CLD
2035-   C9 D4       CMP   #$D4
2037-   8D AA 8D    STA   $8DAA
203A-   A0 DF       LDY   #$DF
203C-   D7          ???
203D-   C1 C9       CMP   ($C9,X)
203F-   D4          ???
2040-   8D A0 CA    STA   $CAA0
2043-   CD D0 A0    CMP   $A0D0
2046-   D2 C5       CMP   ($C5)
2048-   C5 CE       CMP   $CE
204A-   D4          ???
204B-   D2 D9       CMP   ($D9)
204D-   8D AA 8D    STA   $8DAA
2050-   AA          TAX
2051-   AA          TAX
2052-   AA          TAX
2053-   AA          TAX
2054-   AA          TAX
2055-   AA          TAX
2056-   AA          TAX
2057-   AA          TAX
2058-   AA          TAX
2059-   AA          TAX
205A-   AA          TAX
205B-   AA          TAX
205C-   AA          TAX
205D-   AA          TAX
205E-   AA          TAX
205F-   AA          TAX
2060-   AA          TAX
2061-   AA          TAX
2062-   AA          TAX
2063-   AA          TAX
2064-   AA          TAX
2065-   AA          TAX
2066-   AA          TAX
2067-   AA          TAX
2068-   AA          TAX
2069-   AA          TAX
206A-   AA          TAX
206B-   AA          TAX
206C-   AA          TAX
206D-   AA          TAX
206E-   AA          TAX
206F-   AA          TAX
2070-   8D AA 20    STA   $20AA
2073-   20 20 20    JSR   $2020
2076-   20 20 20    JSR   $2020
2079-   20 20 20    JSR   $2020
207C-   20 20 20    JSR   $2020
207F-   20 20 20    JSR   $2020
2082-   20 20 20    JSR   $2020
2085-   20 20 20    JSR   $2020
2088-   20 20 20    JSR   $2020
208B-   20 20 20    JSR   $2020
208E-   20 20 AA    JSR   $AA20
2091-   8D AA 20    STA   $20AA
2094-   D6 C1       DEC   $C1,X
2096-   D2 C9       CMP   ($C9)
2098-   C1 C2       CMP   ($C2,X)
209A-   CC C5 D3    CPY   $D3C5
209D-   20 20 20    JSR   $2020
20A0-   20 20 20    JSR   $2020
20A3-   20 20 20    JSR   $2020
20A6-   20 20 20    JSR   $2020
20A9-   20 20 20    JSR   $2020
20AC-   20 20 20    JSR   $2020
20AF-   20 20 AA    JSR   $AA20
20B2-   8D AA 20    STA   $20AA
20B5-   20 20 20    JSR   $2020
20B8-   20 20 20    JSR   $2020
20BB-   20 20 20    JSR   $2020
20BE-   20 20 20    JSR   $2020
20C1-   20 20 20    JSR   $2020
20C4-   20 20 20    JSR   $2020
20C7-   20 20 20    JSR   $2020
20CA-   20 20 20    JSR   $2020
20CD-   20 20 20    JSR   $2020
20D0-   20 20 AA    JSR   $AA20
20D3-   8D AA AA    STA   $AAAA
20D6-   AA          TAX
20D7-   AA          TAX
20D8-   AA          TAX
20D9-   AA          TAX
20DA-   AA          TAX
20DB-   AA          TAX
20DC-   AA          TAX
20DD-   AA          TAX
20DE-   AA          TAX
20DF-   AA          TAX
20E0-   AA          TAX
20E1-   AA          TAX
20E2-   AA          TAX
20E3-   AA          TAX
20E4-   AA          TAX
20E5-   AA          TAX
20E6-   AA          TAX
20E7-   AA          TAX
20E8-   AA          TAX
20E9-   AA          TAX
20EA-   AA          TAX
20EB-   AA          TAX
20EC-   AA          TAX
20ED-   AA          TAX
20EE-   AA          TAX
20EF-   AA          TAX
20F0-   AA          TAX
20F1-   AA          TAX
20F2-   AA          TAX
20F3-   AA          TAX
20F4-   8D AA 8D    STA   $8DAA
20F7-   D6 B0       DEC   $B0,X
20F9-   A0 C4       LDY   #$C4
20FB-   D3          ???
20FC-   A0 B1       LDY   #$B1
20FE-   A0 BB       LDY   #$BB
2100-   20 D5 D3    JSR   $D3D5
2103-   C5 C4       CMP   $C4
2105-   20 C2 C5    JSR   $C5C2
2108-   C3          ???
2109-   C1 D5       CMP   ($D5,X)
210B-   D3          ???
210C-   C5 20       CMP   $20
210E-   CF          ???
210F-   C6 20       DEC   $20
2111-   C3          ???
2112-   D5 D2       CMP   $D2,X
2114-   D2 C5       CMP   ($C5)
2116-   CE D4 8D    DEC   $8DD4
2119-   D6 B1       DEC   $B1,X
211B-   A0 C4       LDY   #$C4
211D-   D3          ???
211E-   A0 B1       LDY   #$B1
2120-   A0 BB       LDY   #$BB
2122-   20 C1 D2    JSR   $D2C1
2125-   D2 C1       CMP   ($C1)
2127-   D9 20 C4    CMP   $C420,Y
212A-   C9 CD       CMP   #$CD
212C-   20 CC C9    JSR   $C9CC
212F-   CD C9 D4    CMP   $D4C9
2132-   C1 D4       CMP   ($D4,X)
2134-   C9 CF       CMP   #$CF
2136-   CE D3 8D    DEC   $8DD3
2139-   AA          TAX
213A-   8D D8 D8    STA   $D8D8
213D-   A0 C4       LDY   #$C4
213F-   D3          ???
2140-   A0 B1       LDY   #$B1
2142-   A0 BB       LDY   #$BB
2144-   20 C3 D5    JSR   $D5C3
2147-   D2 D2       CMP   ($D2)
2149-   C5 CE       CMP   $CE
214B-   D4          ???
214C-   20 C3 CF    JSR   $CFC3
214F-   CC D5 CD    CPY   $CDD5
2152-   CE 8D D9    DEC   $D98D
2155-   D9 A0 C4    CMP   $C4A0,Y
2158-   D3          ???
2159-   A0 B1       LDY   #$B1
215B-   A0 BB       LDY   #$BB
215D-   20 C3 D5    JSR   $D5C3
2160-   D2 D2       CMP   ($D2)
2162-   C5 CE       CMP   $CE
2164-   D4          ???
2165-   20 D2 CF    JSR   $CFD2
2168-   D7          ???
2169-   8D D3 D0    STA   $D0D3
216C-   D4          ???
216D-   D2 A0       CMP   ($A0)
216F-   C4 D3       CPY   $D3
2171-   A0 B1       LDY   #$B1
2173-   A0 BB       LDY   #$BB
2175-   20 C1 D2    JSR   $D2C1
2178-   D2 C1       CMP   ($C1)
217A-   D9 20 D3    CMP   $D320,Y
217D-   D4          ???
217E-   C1 C3       CMP   ($C3,X)
2180-   CB          ???
2181-   20 D0 CF    JSR   $CFD0
2184-   C9 CE       CMP   #$CE
2186-   D4          ???
2187-   C5 D2       CMP   $D2
2189-   8D D8 D0    STA   $D0D8
218C-   B1 A0       LDA   ($A0),Y
218E-   C4 D3       CPY   $D3
2190-   A0 B1       LDY   #$B1
2192-   A0 BB       LDY   #$BB
2194-   20 D8 20    JSR   $20D8
2197-   D0 CC       BNE   $2165
2199-   D5 D3       CMP   $D3,X
219B-   20 CF CE    JSR   $CECF
219E-   C5 8D       CMP   $8D
21A0-   D8          CLD
21A1-   CD B1 A0    CMP   $A0B1
21A4-   C4 D3       CPY   $D3
21A6-   A0 B1       LDY   #$B1
21A8-   A0 BB       LDY   #$BB
21AA-   20 D8 20    JSR   $20D8
21AD-   CD C9 CE    CMP   $CEC9
21B0-   D5 D3       CMP   $D3,X
21B2-   20 CF CE    JSR   $CECF
21B5-   C5 8D       CMP   $8D
21B7-   D9 D0 B1    CMP   $B1D0,Y
21BA-   A0 C4       LDY   #$C4
21BC-   D3          ???
21BD-   A0 B1       LDY   #$B1
21BF-   A0 BB       LDY   #$BB
21C1-   20 D9 20    JSR   $20D9
21C4-   D0 CC       BNE   $2192
21C6-   D5 D3       CMP   $D3,X
21C8-   20 CF CE    JSR   $CECF
21CB-   C5 8D       CMP   $8D
21CD-   D9 CD B1    CMP   $B1CD,Y
21D0-   A0 C4       LDY   #$C4
21D2-   D3          ???
21D3-   A0 B1       LDY   #$B1
21D5-   A0 BB       LDY   #$BB
21D7-   20 D9 20    JSR   $20D9
21DA-   CD C9 CE    CMP   $CEC9
21DD-   D5 D3       CMP   $D3,X
21DF-   20 CF CE    JSR   $CECF
21E2-   C5 8D       CMP   $8D
21E4-   AA          TAX
21E5-   8D AA AA    STA   $AAAA
21E8-   AA          TAX
21E9-   AA          TAX
21EA-   AA          TAX
21EB-   AA          TAX
21EC-   AA          TAX
21ED-   AA          TAX
21EE-   AA          TAX
21EF-   AA          TAX
21F0-   AA          TAX
21F1-   AA          TAX
21F2-   AA          TAX
21F3-   AA          TAX
21F4-   AA          TAX
21F5-   AA          TAX
21F6-   AA          TAX
21F7-   AA          TAX
21F8-   AA          TAX
21F9-   AA          TAX
21FA-   AA          TAX
21FB-   AA          TAX
21FC-   AA          TAX
21FD-   AA          TAX
21FE-   AA          TAX
21FF-   AA          TAX
2200-   AA          TAX
2201-   AA          TAX
2202-   AA          TAX
2203-   AA          TAX
2204-   AA          TAX
2205-   AA          TAX
2206-   8D AA 20    STA   $20AA
2209-   20 20 20    JSR   $2020
220C-   20 20 20    JSR   $2020
220F-   20 20 20    JSR   $2020
2212-   20 20 20    JSR   $2020
2215-   20 20 20    JSR   $2020
2218-   20 20 20    JSR   $2020
221B-   20 20 20    JSR   $2020
221E-   20 20 20    JSR   $2020
2221-   20 20 20    JSR   $2020
2224-   20 20 AA    JSR   $AA20
2227-   8D AA 20    STA   $20AA
222A-   20 CC CF    JSR   $CFCC
222D-   D7          ???
222E-   AD CC C5    LDA   $C5CC
2231-   D6 C5       DEC   $C5,X
2233-   CC 20 D2    CPY   $D220
2236-   CF          ???
2237-   D5 D4       CMP   $D4,X
2239-   C9 CE       CMP   #$CE
223B-   C5 D3       CMP   $D3
223D-   20 20 20    JSR   $2020
2240-   20 20 20    JSR   $2020
2243-   20 20 20    JSR   $2020
2246-   20 AA 8D    JSR   $8DAA
2249-   AA          TAX
224A-   20 20 20    JSR   $2020
224D-   20 20 20    JSR   $2020
2250-   20 20 20    JSR   $2020
2253-   20 20 20    JSR   $2020
2256-   20 20 20    JSR   $2020
2259-   20 20 20    JSR   $2020
225C-   20 20 20    JSR   $2020
225F-   20 20 20    JSR   $2020
2262-   20 20 20    JSR   $2020
2265-   20 20 20    JSR   $2020
2268-   AA          TAX
2269-   8D AA AA    STA   $AAAA
226C-   AA          TAX
226D-   AA          TAX
226E-   AA          TAX
226F-   AA          TAX
2270-   AA          TAX
2271-   AA          TAX
2272-   AA          TAX
2273-   AA          TAX
2274-   AA          TAX
2275-   AA          TAX
2276-   AA          TAX
2277-   AA          TAX
2278-   AA          TAX
2279-   AA          TAX
227A-   AA          TAX
227B-   AA          TAX
227C-   AA          TAX
227D-   AA          TAX
227E-   AA          TAX
227F-   AA          TAX
2280-   AA          TAX
2281-   AA          TAX
2282-   AA          TAX
2283-   AA          TAX
2284-   AA          TAX
2285-   AA          TAX
2286-   AA          TAX
2287-   AA          TAX
2288-   AA          TAX
2289-   AA          TAX
228A-   8D AA 8D    STA   $8DAA
228D-   A0 D0       LDY   #$D0
228F-   D5 D4       CMP   $D4,X
2291-   A0 D2       LDY   #$D2
2293-   C5 D1       CMP   $D1
2295-   D5 C9       CMP   $C9,X
2297-   D2 C5       CMP   ($C5)
2299-   C4 AE       CPY   $AE
229B-   CC C9 C2    CPY   $C2C9
229E-   AE CD C9    LDX   $C9CD
22A1-   CE 8D AA    DEC   $AA8D
22A4-   8D AA AA    STA   $AAAA
22A7-   20 C9 CE    JSR   $CEC9
22AA-   C4 C9       CPY   $C9
22AC-   D6 C9       DEC   $C9,X
22AE-   C4 D5       CPY   $D5
22B0-   C1 CC       CMP   ($CC,X)
22B2-   20 D3 D5    JSR   $D5D3
22B5-   C2          ???
22B6-   D2 CF       CMP   ($CF)
22B8-   D5 D4       CMP   $D4,X
22BA-   C9 CE       CMP   #$CE
22BC-   C5 D3       CMP   $D3
22BE-   8D AA 8D    STA   $8DAA
22C1-   AA          TAX
22C2-   AA          TAX
22C3-   20 C1 D2    JSR   $D2C1
22C6-   D2 C1       CMP   ($C1)
22C8-   D9 D3 8D    CMP   $8DD3,Y
22CB-   AA          TAX
22CC-   8D A0 D0    STA   $D0A0
22CF-   D5 D4       CMP   $D4,X
22D1-   A0 C1       LDY   #$C1
22D3-   C4 C9       CPY   $C9
22D5-   CD B8 B1    CMP   $B1B8
22D8-   AE D3 D5    LDX   $D5D3
22DB-   C2          ???
22DC-   AE CD C9    LDX   $C9CD
22DF-   CE 8D A0    DEC   $A08D
22E2-   D0 D5       BNE   $22B9
22E4-   D4          ???
22E5-   A0 C1       LDY   #$C1
22E7-   C4 C9       CPY   $C9
22E9-   CD B8 B2    CMP   $B2B8
22EC-   AE D3 D5    LDX   $D5D3
22EF-   C2          ???
22F0-   AE CD C9    LDX   $C9CD
22F3-   CE 8D A0    DEC   $A08D
22F6-   D0 D5       BNE   $22CD
22F8-   D4          ???
22F9-   A0 C1       LDY   #$C1
22FB-   C7          ???
22FC-   C5 D4       CMP   $D4
22FE-   B8          CLV
22FF-   B1 AE       LDA   ($AE),Y
2301-   D3          ???
2302-   D5 C2       CMP   $C2,X
2304-   AE CD C9    LDX   $C9CD
2307-   CE 8D A0    DEC   $A08D
230A-   D0 D5       BNE   $22E1
230C-   D4          ???
230D-   A0 C1       LDY   #$C1
230F-   C7          ???
2310-   C5 D4       CMP   $D4
2312-   B8          CLV
2313-   B2 AE       LDA   ($AE)
2315-   D3          ???
2316-   D5 C2       CMP   $C2,X
2318-   AE CD C9    LDX   $C9CD
231B-   CE 8D A0    DEC   $A08D
231E-   D0 D5       BNE   $22F5
2320-   D4          ???
2321-   A0 C1       LDY   #$C1
2323-   D0 D5       BNE   $22FA
2325-   D4          ???
2326-   B8          CLV
2327-   B1 AE       LDA   ($AE),Y
2329-   D3          ???
232A-   D5 C2       CMP   $C2,X
232C-   AE CD C9    LDX   $C9CD
232F-   CE 8D A0    DEC   $A08D
2332-   D0 D5       BNE   $2309
2334-   D4          ???
2335-   A0 C1       LDY   #$C1
2337-   D0 D5       BNE   $230E
2339-   D4          ???
233A-   B8          CLV
233B-   B2 AE       LDA   ($AE)
233D-   D3          ???
233E-   D5 C2       CMP   $C2,X
2340-   AE CD C9    LDX   $C9CD
2343-   CE 8D AA    DEC   $AA8D
2346-   8D AA AA    STA   $AAAA
2349-   20 CD C1    JSR   $C1CD
234C-   D4          ???
234D-   C8          INY
234E-   8D AA 8D    STA   $8DAA
2351-   A0 D0       LDY   #$D0
2353-   D5 D4       CMP   $D4,X
2355-   A0 D2       LDY   #$D2
2357-   C1 CE       CMP   ($CE,X)
2359-   C4 B8       CPY   $B8
235B-   AE D3 D5    LDX   $D5D3
235E-   C2          ???
235F-   AE CD C9    LDX   $C9CD
2362-   CE 8D A0    DEC   $A08D
2365-   D0 D5       BNE   $233C
2367-   D4          ???
2368-   A0 D2       LDY   #$D2
236A-   C1 CE       CMP   ($CE,X)
236C-   C4 C2       CPY   $C2
236E-   AE D3 D5    LDX   $D5D3
2371-   C2          ???
2372-   AE CD C9    LDX   $C9CD
2375-   CE 8D AA    DEC   $AA8D
2378-   8D AA AA    STA   $AAAA
237B-   20 D3 D4    JSR   $D4D3
237E-   C4 C9       CPY   $C9
2380-   CF          ???
2381-   8D AA 8D    STA   $8DAA
2384-   A0 D0       LDY   #$D0
2386-   D5 D4       CMP   $D4,X
2388-   A0 C4       LDY   #$C4
238A-   D0 D2       BNE   $235E
238C-   C9 CE       CMP   #$CE
238E-   D4          ???
238F-   AE D3 D5    LDX   $D5D3
2392-   C2          ???
2393-   AE CD C9    LDX   $C9CD
2396-   CE 8D A0    DEC   $A08D
2399-   D0 D5       BNE   $2370
239B-   D4          ???
239C-   A0 D8       LDY   #$D8
239E-   D0 D2       BNE   $2372
23A0-   C9 CE       CMP   #$CE
23A2-   D4          ???
23A3-   AE D3 D5    LDX   $D5D3
23A6-   C2          ???
23A7-   AE CD C9    LDX   $C9CD
23AA-   CE 8D AA    DEC   $AA8D
23AD-   8D 00 00    STA   $0000
