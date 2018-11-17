# AppleIIAsmLib
A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro
---
## Introduction
This is a general purpose library in 6502 Assembly for the Apple II. I am learning both Git and Assembly for the first time as I create, update and maintain this, so expect some mishaps: wasted CPU cycles, weird documentation, accidental catastrophes, and so on. I am using Merin 8 Pro (DOS 3.3) for this project, but this should be fairly easy to convert to other assemblers as well as other 6502-based systems.

Ultimately, my aim is to create a large enough collection of routines to address any domain of development for the Apple II family in Assembly. I will be heavily relying on texts like Roger Wagner and Chris Torrence's _Assembly Lines_ and Lance Leventhal's _6502 Assembly Language Routines_, as well as a plethora of online sources. I'll do my best to acknowledge when a routine is inspired by (or mostly copied from) another source, and will exclude them from the Appache License 2.0 when necessary. If you find your own source here, but would rather it not be here, please reach out to me and I'll remove it immediately.

Planned libraries include, along with associated Macros:

CORE DISK
* stdio.lib: Standard Input/Output library.
..* XPRINT
..* DPRINT
..* THLIN
..* TVLIN
..* CURSFOR
..* CURSBAK
..* CURSDN
..* CURSUP
..* TFILLA
..* SINPUT
..* GPBX
* common.lib: Common, useful subroutines: memory swaps, etc.
..* MEMFILL
..* MEMMOVE
..* DELAYMS
..* ZSAVE
..* ZLOAD

MATH DISK
* math8.lib: 8-bit Integer Math Library.
..* RND8
..* RANDB
..* MUL8
..* DIV8
* math16.lib: 16-bit Integer Math Library.
..* ADD16
..* SUB16
..* MUL16
..* SDIV16
..* UDIV16
..* SREM16
..* UREM16
..* CMP16
..* RND16

IO DISK
* fileio.lib: File Input/Output Library.
..* BSAVE (may be deleted)
..* BLOAD (may be deleted)
..* TMODE
..* CMD
..* FPRINT
..* FPSTR
..* FINPUT
* in the future, serial routines will also reside here.

ARRAYS DISK
* arrays81.lib: library for managing 1-dimensional 8-bit arrays.
..* DIM81
..* AGET81
..* APUT81
* arrays82.lib: library for managing 2-dimensional 8-bit arrays.
..* DIM82
..* AGET82
..* APUT82
* 16-bit array libraries will also be on this disk in the future

STRINGS DISK
* strings.lib: Library for managing strings. 
..* STRCOMP
..* STRCAT
..* ASC2STR
..* STR2ASC
..* PRNSTR
..* NUM2STR
..* STR2NUM
* substrings.lib: Library for manipulating substrings.
..* SUBPOS
..* SUBCOPY
..* SUBDEL
..* SUBINS

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

