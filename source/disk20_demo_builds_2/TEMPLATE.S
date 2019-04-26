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
0945-   CD C1 C9    CMP   $C9C1
0948-   CE 20 D0    DEC   $D020
094B-   D2 CF       CMP   ($CF)
094D-   C7          ???
094E-   D2 C1       CMP   ($C1)
0950-   CD 20 D3    CMP   $D320
0953-   CF          ???
0954-   D5 D2       CMP   $D2,X
0956-   C3          ???
0957-   C5 20       CMP   $20
0959-   D4          ???
095A-   C5 CD       CMP   $CD
095C-   D0 CC       BNE   $092A
095E-   C1 D4       CMP   ($D4,X)
0960-   C5 20       CMP   $20
0962-   AA          TAX
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
09D1-   CE CC D9    DEC   $D9CC
09D4-   A0 BB       LDY   #$BB
09D6-   20 D4 D5    JSR   $D5D4
09D9-   D2 CE       CMP   ($CE)
09DB-   20 CF C6    JSR   $C6CF
09DE-   C6 20       DEC   $20
09E0-   CC C1 D4    CPY   $D4C1
09E3-   C5 D2       CMP   $D2
09E5-   8D A0 C4    STA   $C4A0
09E8-   D3          ???
09E9-   CB          ???
09EA-   A0 D4       LDY   #$D4
09EC-   C5 CD       CMP   $CD
09EE-   D0 CC       BNE   $09BC
09F0-   C1 D4       CMP   ($D4,X)
09F2-   C5 8D       CMP   $8D
09F4-   A0 D4       LDY   #$D4
09F6-   D2 A0       CMP   ($A0)
09F8-   CF          ???
09F9-   CE 8D A0    DEC   $A08D
09FC-   CF          ???
09FD-   C2          ???
09FE-   CA          DEX
09FF-   A0 A4       LDY   #$A4
0A01-   C2          ???
0A02-   C6 C5       DEC   $C5
0A04-   B0 8D       BCS   $0993
0A06-   A0 CF       LDY   #$CF
0A08-   D2 C7       CMP   ($C7)
0A0A-   A0 A4       LDY   #$A4
0A0C-   B6 B0       LDX   $B0,Y
0A0E-   B0 B0       BCS   $09C0
0A10-   8D AA 8D    STA   $8DAA
0A13-   AA          TAX
0A14-   AA          TAX
0A15-   AA          TAX
0A16-   AA          TAX
0A17-   AA          TAX
0A18-   AA          TAX
0A19-   AA          TAX
0A1A-   AA          TAX
0A1B-   AA          TAX
0A1C-   AA          TAX
0A1D-   AA          TAX
0A1E-   AA          TAX
0A1F-   AA          TAX
0A20-   AA          TAX
0A21-   AA          TAX
0A22-   AA          TAX
0A23-   AA          TAX
0A24-   AA          TAX
0A25-   AA          TAX
0A26-   AA          TAX
0A27-   AA          TAX
0A28-   AA          TAX
0A29-   AA          TAX
0A2A-   AA          TAX
0A2B-   AA          TAX
0A2C-   AA          TAX
0A2D-   AA          TAX
0A2E-   AA          TAX
0A2F-   AA          TAX
0A30-   AA          TAX
0A31-   AA          TAX
0A32-   AA          TAX
0A33-   8D AA 20    STA   $20AA
0A36-   20 20 20    JSR   $2020
0A39-   20 20 20    JSR   $2020
0A3C-   20 20 20    JSR   $2020
0A3F-   20 20 20    JSR   $2020
0A42-   20 20 20    JSR   $2020
0A45-   20 20 20    JSR   $2020
0A48-   20 20 20    JSR   $2020
0A4B-   20 20 20    JSR   $2020
0A4E-   20 20 20    JSR   $2020
0A51-   20 20 AA    JSR   $AA20
0A54-   8D AA 20    STA   $20AA
0A57-   C8          INY
0A58-   C5 C1       CMP   $C1
0A5A-   C4 C5       CPY   $C5
0A5C-   D2 AC       CMP   ($AC)
0A5E-   20 C8 CF    JSR   $CFC8
0A61-   CF          ???
0A62-   CB          ???
0A63-   D3          ???
0A64-   20 C1 CE    JSR   $CEC1
0A67-   C4 20       CPY   $20
0A69-   CD C1 C3    CMP   $C3C1
0A6C-   D2 CF       CMP   ($CF)
0A6E-   D3          ???
0A6F-   20 20 20    JSR   $2020
0A72-   20 20 AA    JSR   $AA20
0A75-   8D AA 20    STA   $20AA
0A78-   20 20 20    JSR   $2020
0A7B-   20 20 20    JSR   $2020
0A7E-   20 20 20    JSR   $2020
0A81-   20 20 20    JSR   $2020
0A84-   20 20 20    JSR   $2020
0A87-   20 20 20    JSR   $2020
0A8A-   20 20 20    JSR   $2020
0A8D-   20 20 20    JSR   $2020
0A90-   20 20 20    JSR   $2020
0A93-   20 20 AA    JSR   $AA20
0A96-   8D AA AA    STA   $AAAA
0A99-   AA          TAX
0A9A-   AA          TAX
0A9B-   AA          TAX
0A9C-   AA          TAX
0A9D-   AA          TAX
0A9E-   AA          TAX
0A9F-   AA          TAX
0AA0-   AA          TAX
0AA1-   AA          TAX
0AA2-   AA          TAX
0AA3-   AA          TAX
0AA4-   AA          TAX
0AA5-   AA          TAX
0AA6-   AA          TAX
0AA7-   AA          TAX
0AA8-   AA          TAX
0AA9-   AA          TAX
0AAA-   AA          TAX
0AAB-   AA          TAX
0AAC-   AA          TAX
0AAD-   AA          TAX
0AAE-   AA          TAX
0AAF-   AA          TAX
0AB0-   AA          TAX
0AB1-   AA          TAX
0AB2-   AA          TAX
0AB3-   AA          TAX
0AB4-   AA          TAX
0AB5-   AA          TAX
0AB6-   AA          TAX
0AB7-   8D AA 8D    STA   $8DAA
0ABA-   A0 D0       LDY   #$D0
0ABC-   D5 D4       CMP   $D4,X
0ABE-   A0 D6       LDY   #$D6
0AC0-   C1 D2       CMP   ($D2,X)
0AC2-   D3          ???
0AC3-   AE D2 C5    LDX   $C5D2
0AC6-   D1 D5       CMP   ($D5),Y
0AC8-   C9 D2       CMP   #$D2
0ACA-   C5 C4       CMP   $C4
0ACC-   8D A0 D5    STA   $D5A0
0ACF-   D3          ???
0AD0-   C5 A0       CMP   $A0
0AD2-   CD C9 CE    CMP   $CEC9
0AD5-   AE CD C1    LDX   $C1CD
0AD8-   C3          ???
0AD9-   AE D2 C5    LDX   $C5D2
0ADC-   D1 D5       CMP   ($D5),Y
0ADE-   C9 D2       CMP   #$D2
0AE0-   C5 C4       CMP   $C4
0AE2-   8D A0 D0    STA   $D0A0
0AE5-   D5 D4       CMP   $D4,X
0AE7-   A0 CD       LDY   #$CD
0AE9-   C9 CE       CMP   #$CE
0AEB-   AE C8 CF    LDX   $CFC8
0AEE-   CF          ???
0AEF-   CB          ???
0AF0-   D3          ???
0AF1-   AE D2 C5    LDX   $C5D2
0AF4-   D1 D5       CMP   ($D5),Y
0AF6-   C9 D2       CMP   #$D2
0AF8-   C5 C4       CMP   $C4
0AFA-   8D 8D AA    STA   $AA8D
0AFD-   8D AA AA    STA   $AAAA
0B00-   AA          TAX
0B01-   AA          TAX
0B02-   AA          TAX
0B03-   AA          TAX
0B04-   AA          TAX
0B05-   AA          TAX
0B06-   AA          TAX
0B07-   AA          TAX
0B08-   AA          TAX
0B09-   AA          TAX
0B0A-   AA          TAX
0B0B-   AA          TAX
0B0C-   AA          TAX
0B0D-   AA          TAX
0B0E-   AA          TAX
0B0F-   AA          TAX
0B10-   AA          TAX
0B11-   AA          TAX
0B12-   AA          TAX
0B13-   AA          TAX
0B14-   AA          TAX
0B15-   AA          TAX
0B16-   AA          TAX
0B17-   AA          TAX
0B18-   AA          TAX
0B19-   AA          TAX
0B1A-   AA          TAX
0B1B-   AA          TAX
0B1C-   AA          TAX
0B1D-   AA          TAX
0B1E-   8D AA 20    STA   $20AA
0B21-   20 20 20    JSR   $2020
0B24-   20 20 20    JSR   $2020
0B27-   20 20 20    JSR   $2020
0B2A-   20 20 20    JSR   $2020
0B2D-   20 20 20    JSR   $2020
0B30-   20 20 20    JSR   $2020
0B33-   20 20 20    JSR   $2020
0B36-   20 20 20    JSR   $2020
0B39-   20 20 20    JSR   $2020
0B3C-   20 20 AA    JSR   $AA20
0B3F-   8D AA 20    STA   $20AA
0B42-   C3          ???
0B43-   CF          ???
0B44-   CE D3 D4    DEC   $D4D3
0B47-   C1 CE       CMP   ($CE,X)
0B49-   D4          ???
0B4A-   20 C4 C5    JSR   $C5C4
0B4D-   C3          ???
0B4E-   CC C1 D2    CPY   $D2C1
0B51-   C1 D4       CMP   ($D4,X)
0B53-   C9 CF       CMP   #$CF
0B55-   CE D3 20    DEC   $20D3
0B58-   20 20 20    JSR   $2020
0B5B-   20 20 20    JSR   $2020
0B5E-   20 AA 8D    JSR   $8DAA
0B61-   AA          TAX
0B62-   20 20 20    JSR   $2020
0B65-   20 20 20    JSR   $2020
0B68-   20 20 20    JSR   $2020
0B6B-   20 20 20    JSR   $2020
0B6E-   20 20 20    JSR   $2020
0B71-   20 20 20    JSR   $2020
0B74-   20 20 20    JSR   $2020
0B77-   20 20 20    JSR   $2020
0B7A-   20 20 20    JSR   $2020
0B7D-   20 20 20    JSR   $2020
0B80-   AA          TAX
0B81-   8D AA AA    STA   $AAAA
0B84-   AA          TAX
0B85-   AA          TAX
0B86-   AA          TAX
0B87-   AA          TAX
0B88-   AA          TAX
0B89-   AA          TAX
0B8A-   AA          TAX
0B8B-   AA          TAX
0B8C-   AA          TAX
0B8D-   AA          TAX
0B8E-   AA          TAX
0B8F-   AA          TAX
0B90-   AA          TAX
0B91-   AA          TAX
0B92-   AA          TAX
0B93-   AA          TAX
0B94-   AA          TAX
0B95-   AA          TAX
0B96-   AA          TAX
0B97-   AA          TAX
0B98-   AA          TAX
0B99-   AA          TAX
0B9A-   AA          TAX
0B9B-   AA          TAX
0B9C-   AA          TAX
0B9D-   AA          TAX
0B9E-   AA          TAX
0B9F-   AA          TAX
0BA0-   AA          TAX
0BA1-   AA          TAX
0BA2-   8D AA 8D    STA   $8DAA
0BA5-   AA          TAX
0BA6-   8D AA AA    STA   $AAAA
0BA9-   AA          TAX
0BAA-   AA          TAX
0BAB-   AA          TAX
0BAC-   AA          TAX
0BAD-   AA          TAX
0BAE-   AA          TAX
0BAF-   AA          TAX
0BB0-   AA          TAX
0BB1-   AA          TAX
0BB2-   AA          TAX
0BB3-   AA          TAX
0BB4-   AA          TAX
0BB5-   AA          TAX
0BB6-   AA          TAX
0BB7-   AA          TAX
0BB8-   AA          TAX
0BB9-   AA          TAX
0BBA-   AA          TAX
0BBB-   AA          TAX
0BBC-   AA          TAX
0BBD-   AA          TAX
0BBE-   AA          TAX
0BBF-   AA          TAX
0BC0-   AA          TAX
0BC1-   AA          TAX
0BC2-   AA          TAX
0BC3-   AA          TAX
0BC4-   AA          TAX
0BC5-   AA          TAX
0BC6-   AA          TAX
0BC7-   8D AA 20    STA   $20AA
0BCA-   20 20 20    JSR   $2020
0BCD-   20 20 20    JSR   $2020
0BD0-   20 20 20    JSR   $2020
0BD3-   20 20 20    JSR   $2020
0BD6-   20 20 20    JSR   $2020
0BD9-   20 20 20    JSR   $2020
0BDC-   20 20 20    JSR   $2020
0BDF-   20 20 20    JSR   $2020
0BE2-   20 20 20    JSR   $2020
0BE5-   20 20 AA    JSR   $AA20
0BE8-   8D AA 20    STA   $20AA
0BEB-   CD C1 C9    CMP   $C9C1
0BEE-   CE 20 D0    DEC   $D020
0BF1-   D2 CF       CMP   ($CF)
0BF3-   C7          ???
0BF4-   D2 C1       CMP   ($C1)
0BF6-   CD 20 CC    CMP   $CC20
0BF9-   CF          ???
0BFA-   CF          ???
0BFB-   D0 20       BNE   $0C1D
0BFD-   20 20 20    JSR   $2020
0C00-   20 20 20    JSR   $2020
0C03-   20 20 20    JSR   $2020
0C06-   20 20 AA    JSR   $AA20
0C09-   8D AA 20    STA   $20AA
0C0C-   20 20 20    JSR   $2020
0C0F-   20 20 20    JSR   $2020
0C12-   20 20 20    JSR   $2020
0C15-   20 20 20    JSR   $2020
0C18-   20 20 20    JSR   $2020
0C1B-   20 20 20    JSR   $2020
0C1E-   20 20 20    JSR   $2020
0C21-   20 20 20    JSR   $2020
0C24-   20 20 20    JSR   $2020
0C27-   20 20 AA    JSR   $AA20
0C2A-   8D AA AA    STA   $AAAA
0C2D-   AA          TAX
0C2E-   AA          TAX
0C2F-   AA          TAX
0C30-   AA          TAX
0C31-   AA          TAX
0C32-   AA          TAX
0C33-   AA          TAX
0C34-   AA          TAX
0C35-   AA          TAX
0C36-   AA          TAX
0C37-   AA          TAX
0C38-   AA          TAX
0C39-   AA          TAX
0C3A-   AA          TAX
0C3B-   AA          TAX
0C3C-   AA          TAX
0C3D-   AA          TAX
0C3E-   AA          TAX
0C3F-   AA          TAX
0C40-   AA          TAX
0C41-   AA          TAX
0C42-   AA          TAX
0C43-   AA          TAX
0C44-   AA          TAX
0C45-   AA          TAX
0C46-   AA          TAX
0C47-   AA          TAX
0C48-   AA          TAX
0C49-   AA          TAX
0C4A-   AA          TAX
0C4B-   8D AA 8D    STA   $8DAA
0C4E-   AA          TAX
0C4F-   8D AA AA    STA   $AAAA
0C52-   AA          TAX
0C53-   AA          TAX
0C54-   AA          TAX
0C55-   AA          TAX
0C56-   AA          TAX
0C57-   AA          TAX
0C58-   AA          TAX
0C59-   AA          TAX
0C5A-   AA          TAX
0C5B-   AA          TAX
0C5C-   AA          TAX
0C5D-   AA          TAX
0C5E-   AA          TAX
0C5F-   AA          TAX
0C60-   AA          TAX
0C61-   AA          TAX
0C62-   AA          TAX
0C63-   AA          TAX
0C64-   AA          TAX
0C65-   AA          TAX
0C66-   AA          TAX
0C67-   AA          TAX
0C68-   AA          TAX
0C69-   AA          TAX
0C6A-   AA          TAX
0C6B-   AA          TAX
0C6C-   AA          TAX
0C6D-   AA          TAX
0C6E-   AA          TAX
0C6F-   AA          TAX
0C70-   8D AA 20    STA   $20AA
0C73-   20 20 20    JSR   $2020
0C76-   20 20 20    JSR   $2020
0C79-   20 20 20    JSR   $2020
0C7C-   20 20 20    JSR   $2020
0C7F-   20 20 20    JSR   $2020
0C82-   20 20 20    JSR   $2020
0C85-   20 20 20    JSR   $2020
0C88-   20 20 20    JSR   $2020
0C8B-   20 20 20    JSR   $2020
0C8E-   20 20 AA    JSR   $AA20
0C91-   8D AA 20    STA   $20AA
0C94-   D6 C1       DEC   $C1,X
0C96-   D2 C9       CMP   ($C9)
0C98-   C1 C2       CMP   ($C2,X)
0C9A-   CC C5 D3    CPY   $D3C5
0C9D-   20 20 20    JSR   $2020
0CA0-   20 20 20    JSR   $2020
0CA3-   20 20 20    JSR   $2020
0CA6-   20 20 20    JSR   $2020
0CA9-   20 20 20    JSR   $2020
0CAC-   20 20 20    JSR   $2020
0CAF-   20 20 AA    JSR   $AA20
0CB2-   8D AA 20    STA   $20AA
0CB5-   20 20 20    JSR   $2020
0CB8-   20 20 20    JSR   $2020
0CBB-   20 20 20    JSR   $2020
0CBE-   20 20 20    JSR   $2020
0CC1-   20 20 20    JSR   $2020
0CC4-   20 20 20    JSR   $2020
0CC7-   20 20 20    JSR   $2020
0CCA-   20 20 20    JSR   $2020
0CCD-   20 20 20    JSR   $2020
0CD0-   20 20 AA    JSR   $AA20
0CD3-   8D AA AA    STA   $AAAA
0CD6-   AA          TAX
0CD7-   AA          TAX
0CD8-   AA          TAX
0CD9-   AA          TAX
0CDA-   AA          TAX
0CDB-   AA          TAX
0CDC-   AA          TAX
0CDD-   AA          TAX
0CDE-   AA          TAX
0CDF-   AA          TAX
0CE0-   AA          TAX
0CE1-   AA          TAX
0CE2-   AA          TAX
0CE3-   AA          TAX
0CE4-   AA          TAX
0CE5-   AA          TAX
0CE6-   AA          TAX
0CE7-   AA          TAX
0CE8-   AA          TAX
0CE9-   AA          TAX
0CEA-   AA          TAX
0CEB-   AA          TAX
0CEC-   AA          TAX
0CED-   AA          TAX
0CEE-   AA          TAX
0CEF-   AA          TAX
0CF0-   AA          TAX
0CF1-   AA          TAX
0CF2-   AA          TAX
0CF3-   AA          TAX
0CF4-   8D AA 8D    STA   $8DAA
0CF7-   AA          TAX
0CF8-   8D AA AA    STA   $AAAA
0CFB-   AA          TAX
0CFC-   AA          TAX
0CFD-   AA          TAX
0CFE-   AA          TAX
0CFF-   AA          TAX
0D00-   AA          TAX
0D01-   AA          TAX
0D02-   AA          TAX
0D03-   AA          TAX
0D04-   AA          TAX
0D05-   AA          TAX
0D06-   AA          TAX
0D07-   AA          TAX
0D08-   AA          TAX
0D09-   AA          TAX
0D0A-   AA          TAX
0D0B-   AA          TAX
0D0C-   AA          TAX
0D0D-   AA          TAX
0D0E-   AA          TAX
0D0F-   AA          TAX
0D10-   AA          TAX
0D11-   AA          TAX
0D12-   AA          TAX
0D13-   AA          TAX
0D14-   AA          TAX
0D15-   AA          TAX
0D16-   AA          TAX
0D17-   AA          TAX
0D18-   AA          TAX
0D19-   8D AA 20    STA   $20AA
0D1C-   20 20 20    JSR   $2020
0D1F-   20 20 20    JSR   $2020
0D22-   20 20 20    JSR   $2020
0D25-   20 20 20    JSR   $2020
0D28-   20 20 20    JSR   $2020
0D2B-   20 20 20    JSR   $2020
0D2E-   20 20 20    JSR   $2020
0D31-   20 20 20    JSR   $2020
0D34-   20 20 20    JSR   $2020
0D37-   20 20 AA    JSR   $AA20
0D3A-   8D AA 20    STA   $20AA
0D3D-   20 CC CF    JSR   $CFCC
0D40-   D7          ???
0D41-   AD CC C5    LDA   $C5CC
0D44-   D6 C5       DEC   $C5,X
0D46-   CC 20 D2    CPY   $D220
0D49-   CF          ???
0D4A-   D5 D4       CMP   $D4,X
0D4C-   C9 CE       CMP   #$CE
0D4E-   C5 D3       CMP   $D3
0D50-   20 20 20    JSR   $2020
0D53-   20 20 20    JSR   $2020
0D56-   20 20 20    JSR   $2020
0D59-   20 AA 8D    JSR   $8DAA
0D5C-   AA          TAX
0D5D-   20 20 20    JSR   $2020
0D60-   20 20 20    JSR   $2020
0D63-   20 20 20    JSR   $2020
0D66-   20 20 20    JSR   $2020
0D69-   20 20 20    JSR   $2020
0D6C-   20 20 20    JSR   $2020
0D6F-   20 20 20    JSR   $2020
0D72-   20 20 20    JSR   $2020
0D75-   20 20 20    JSR   $2020
0D78-   20 20 20    JSR   $2020
0D7B-   AA          TAX
0D7C-   8D AA AA    STA   $AAAA
0D7F-   AA          TAX
0D80-   AA          TAX
0D81-   AA          TAX
0D82-   AA          TAX
0D83-   AA          TAX
0D84-   AA          TAX
0D85-   AA          TAX
0D86-   AA          TAX
0D87-   AA          TAX
0D88-   AA          TAX
0D89-   AA          TAX
0D8A-   AA          TAX
0D8B-   AA          TAX
0D8C-   AA          TAX
0D8D-   AA          TAX
0D8E-   AA          TAX
0D8F-   AA          TAX
0D90-   AA          TAX
0D91-   AA          TAX
0D92-   AA          TAX
0D93-   AA          TAX
0D94-   AA          TAX
0D95-   AA          TAX
0D96-   AA          TAX
0D97-   AA          TAX
0D98-   AA          TAX
0D99-   AA          TAX
0D9A-   AA          TAX
0D9B-   AA          TAX
0D9C-   AA          TAX
0D9D-   8D AA 8D    STA   $8DAA
0DA0-   A0 D0       LDY   #$D0
0DA2-   D5 D4       CMP   $D4,X
0DA4-   A0 CD       LDY   #$CD
0DA6-   C9 CE       CMP   #$CE
0DA8-   AE CC C9    LDX   $C9CC
0DAB-   C2          ???
0DAC-   AE D2 C5    LDX   $C5D2
0DAF-   D1 D5       CMP   ($D5),Y
0DB1-   C9 D2       CMP   #$D2
0DB3-   C5 C4       CMP   $C4
0DB5-   8D AA 8D    STA   $8DAA
0DB8-   AA          TAX
0DB9-   AA          TAX
0DBA-   20 C9 CE    JSR   $CEC9
0DBD-   C4 C9       CPY   $C9
0DBF-   D6 C9       DEC   $C9,X
0DC1-   C4 D5       CPY   $D5
0DC3-   C1 CC       CMP   ($CC,X)
0DC5-   20 D3 D5    JSR   $D5D3
0DC8-   C2          ???
0DC9-   D2 CF       CMP   ($CF)
0DCB-   D5 D4       CMP   $D4,X
0DCD-   C9 CE       CMP   #$CE
0DCF-   C5 D3       CMP   $D3
0DD1-   8D AA 8D    STA   $8DAA
0DD4-   AA          TAX
0DD5-   8D 00 00    STA   $0000
