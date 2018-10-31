# AppleIIAsmLib
A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro
---
##Introduction
This is a general purpose library in 6502 Assembly for the Apple II. I am learning both Git and Assembly for the first time as I create, update and maintain this, so expect some mishaps: wasted CPU cycles, weird documentation, accidental catastrophes, and so on. I am using Merin 8 Pro (DOS 3.3) for this project, but this should be fairly easy to convert to other assemblers as well as other 6502-based systems.

Ultimately, my aim is to create a large enough collection of routines to address any domain of development for the Apple II family in Assembly. I will be heavily relying on texts like Roger Wagner and Chris Torrence's /Assembly Lines/ and Lance Leventhal's /6502 Assembly Language Routines/, as well as a plethora of online sources. I'll do my best to acknowledge when a routine is inspired by (or mostly copied from) another source, and will exclude them from the Appache License 2.0 when necessary. If you find your own source here, but would rather it not be here, please reach out to me and I'll remove it immediately.

Planned libraries include, along with associated Macros:
* stdio.lib: Standard Input/Output library.
* math.lib: Integer Math Library.
* common.lib: Common, useful subroutines: memory swaps, etc.
* strings.lib: Library for managing strings.
* arrays.lib: library for managing arrays.
* fileio.lib: File Input/Output Library.
* lores.lib: Library for fast(er) graphics in low resolution mode.
* hires.lib: Library for fast(er) graphics in high resolution mode.
* dubres.lib: Library for handling graphics in double-resolution modes, low and high.
* sound.lib: Music and sound effects library.
* fpmath.lib: Floating-point math library.

