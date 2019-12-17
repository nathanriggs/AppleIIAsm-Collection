# Quick Reference: Macros

 

## Disk 1: MAC.REQUIRED

| MACRO | DEPEND | PARAMETERS | RETURNS |
| --- | --- | --- | --- |
| `_AXLIT` | none | ]1 = memory address | .A = address low byte<br />.X = address high byte |
| `_AXSTR` | `_AXLIT` | ]1 = memory address | .A = address low byte<br />.X = address high byte |
| `_ISLIT` | none | ]1 = memory address | .A = address low byte<br />.X = address high byte |
| `_ISSTR` | `_ISLIT` | ]1 = memory address | .A = address low byte<br />.X = address high byte |
| `_MLIT` | none | ]1 = memory address<br />]2 = destination ZP address | .A = address low byte <br />.X = address high byte |
| `_MSTR` | `_ISLIT` | ]1 = memory address<br />]2 = destination ZP address | .A address low byte <br />.X = address high byte |
| `_PRN` | `__P` | ]1 = string to print | none |
| `_WAIT` | `__w` | ]1 = none | .A = keypress value |
| `BCCL` | x | x | x |
| `BCSL` | x | x | x |
| `BEQL` | x | x | x |
| `BMIL` | x | x | x |
| `BNEL` | x | x | x |
| `BPLL` | X | x | x |
| `BVCL` | x | x | x |
| `BVSL` | x | x | x |
| `CLRLO` | `__CLRLO` | ]1 = byte to clear high nibble of | .A = cleared byte |
| `CLRHI` | `__CLRHI` | ]1 = byte to clear the high nibble of | .A = cleared byte |
| `CPHX` | x | x | x |
| `CPHY` | x | x | x |
| `CPLX` | x | x | x |
| `CPLY` | x | x | x |
| `CSTZ` | x | x | x |
| `DUMP` | `_AXLIT`;<br />`__DUMP` | ]1 = memory address<br />]2 = number of bytes to dump | .A = number of bytes displayed |
| `ERRH` | `_AXLIT`;<br />`__ERRH` | ]1 = memory address | none |
| `GRET` | `_AXLIT`;<br />`__GETRET` | ]1 = destination address | .A = return value length |
| `PEEK` | x | x | x |
| `POKE` | x | x | x |
| `TXY`  | x | x | x |
| `TYX` | x | x | x |
| `ZPC` | x | x | x |




















