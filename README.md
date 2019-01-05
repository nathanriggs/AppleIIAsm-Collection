# AppleIIAsmLib

A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro.







---
## Table of Contents
* Introduction
* Disk Overviews
  * Disk 1: STDIO
  *
* Macro Subroutine Overlap Table
* Detailed Descriptions: Macros
* Detailed Descriptions: Subroutines

---
## Introduction
This is a general purpose library in 6502 Assembly for the Apple II. I am learning both Git and Assembly for the first time as I create, update and maintain this, so expect some mishaps: wasted CPU cycles, weird documentation, accidental catastrophes, and so on. I am using Merin 8 Pro (DOS 3.3) for this project, but this should be fairly easy to convert to other assemblers as well as other 6502-based systems.

Ultimately, my aim is to create a large enough collection of routines to address any domain of development for the Apple II family in Assembly. I will be heavily relying on texts like Roger Wagner and Chris Torrence's _Assembly Lines_ and Lance Leventhal's _6502 Assembly Language Routines_, as well as a plethora of online sources. I'll do my best to acknowledge when a routine is inspired by (or mostly copied from) another source, and will exclude them from the Appache License 2.0 when necessary. If you find your own source here, but would rather it not be here, please reach out to me and I'll remove it immediately.

---
## Disk Overviews
### Disk 1: STDIO
* stdio.mac: Standard Input/Output library.
  * PRN: Flexible (screen) Printing routine
  * PCR: Print Carraige Return
  * INP: String Input Macro
  * SCPOS: Set Cursor position at X,Y
  * SETCX: Set Cursor Horizontal Position
  * SETCY: Set Cursor Vertical Position
  * CURF: Move Cursor Forward by [n] spaces
  * CURD: Move Cursor Down by [n] spaces
  * CURU: Move Cursor Up by [n] spaces
  * CURB: Move Cursor Backward by [n] spaces
  * RCPOS: Read Cursor Position
  * PDL: Read Current Paddle State
  * PBX: Read State of Paddle Button [x]
  * THLIN: Text Horizontal Line Fill with Character [n]
  * TVLIN: Text Vertical Line Fill with Character [n]
  * TFILL: Text Fill square [x1],[x2],[y1],[y2] with Character [n]
  
### Disk 2: COMMON / REQUIRED
* common.mac: Common, useful subroutines: memory swaps, etc.
* required.mac: Set of Macros used across every disk in the library.
  
### Disk 3: MATH SUBROUTINES
* math8.mac: 8-bit and 16-bit Basic Math Macros.

### Disk 4: FILE IO DISK
* fileio.mac: Macros for file input/output and disk operations.

### Disk 5: ARRAYS DISK
* arrays.mac: library for managing 1-dimensional 8-bit arrays.

### Disk 6: STRINGS DISK
* strings.mac: library for managing strings.

---
## Future Disks

~~LORES DISK~~
* ~~lores.lib: Library for fast(er) graphics in low resolution mode.~~

~~HIRES DISK~~
* ~~hires.lib: Library for fast(er) graphics in high resolution mode.~~

~~HIRES DISK 2~~
* ~~hireschar.lib: High Resolution mode text character library.~~
* ~~hiresshapes.lib: Routines for creating lines, circles, etc.~~

~~MISC DISK~~
* ~~sound.lib: Music and sound effects library.~~
* ~~applesoft.lib: Library for interfacing ASM programs with Applesoft BASIC.~~

~~UTIL DISK~~
* ~~various useful utilities~~

~~FPMATH DISK 1 (and maybe a second one)~~
* ~~fpmath.lib: Floating-point math library~~

~~80COL DISK~~
* ~~stdio library and some routines for double lores and double hires~~

~~PRINTER IO~~
~~SERIAL IO~~

