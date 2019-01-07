# AppleIIAsmLib

A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro.







---
## Table of Contents
* [Introduction](#introduction)
* [FAQ](#faq)
* [Disk Overviews](#disk-overviews)
  * [Disk 1: STDIO](#disk-1-stdio)
  * [Disk 2: COMMON](#disk-2-common-required)
  * [Disk 3: ARRAYS](#disk-3-arrays)
  * [Disk 4: MATH](#disk-4-math)
  * [Disk 5: STRINGS](#disk-5-strings)
  * [Disk 6: FILEIO](#disk-6-fileio)
* [Future Disks](#future-disks)
* [Macro Subroutine Overlap Table](#macro-subroutine-calls-and-clobbers)
* [Macro Usage Cheat Sheet](#macro-usage-cheat-sheet)
* ~~Detailed Descriptions: Macros~~
* ~~Detailed Descriptions: Subroutines~~

---
## Introduction

This is a general purpose library in 6502 Assembly for the Apple II. I am learning both Git and Assembly for the first time as I create, update and maintain this, so expect some mishaps: wasted CPU cycles, weird documentation, accidental catastrophes, and so on. I am using Merlin 8 Pro (DOS 3.3) for this project, but this should be fairly easy to convert to other assemblers as well as other 6502-based systems.

Ultimately, my aim is to create a large enough collection of routines to address any domain of development for the Apple II family in Assembly. I will be heavily relying on texts like Roger Wagner and Chris Torrence's _Assembly Lines_ and Lance Leventhal's _6502 Assembly Language Routines_, as well as a plethora of online sources. I'll do my best to acknowledge when a routine is inspired by (or mostly copied from) another source, and will exclude them from the Apache License 2.0 when necessary. If you find your own source here, but would rather it not be here, please reach out to me and I'll remove it immediately.

---
## FAQ

* [Why 6502/the Apple II? Wouldn't something newer be more...relevant?](#the-reason-for-6502-assembly)
* [Okay, but why a native Assembler, Merlin 8 Pro, instead of something like CC65?](#the-reason-for-native-assembly)
* [Why is ______ such a mess?](#the-reason-for-some-messiness)
* [Which versions of the Apple II is this compatible with?](#compatible-apple-2-systems)
* [What should I use these for?](#what-these-libraries-are-for)
* [What if I have a better solution/algorithm/subroutine?](#i-have-an-improvement)

---
## Answers

### The Reason for 6502 Assembly

6502 Assembly is probably one of the most important and influential assembly language variants to have ever existed. Part of this is due to great timing: the 6502 CPU managed to become a processor cheap enough for the burgeoning minicomputer/home computer scene in the late 1970s and early 1980s while still providing a lot of elegance and power necessary for almost two decades of dominance. I have several personal reasons for deciding on 6502 assembly as a means to learn assembly in general: 

* There's a certain nostalgia factor in play, admittedly. I grew up typing BASIC and assembly programs from books and magazines into my Apple ][ computer at the age of 10 or so, and while I learned how BASIC worked pretty quickly through this process, Assembly was almost indecipherable for me at that age. Fast forward to 30 years later, and I'm the same kid entering in code found in books and magazines--or better yet, found in pdfs--but now I have the requisite knowledge to understand the assembly listings.

* 6502 had a limited number of commands, making it ideal to learn just how low-level code works. I started out wanting to do this in order to better read low-level code for my own work in technical communication, and even something as simple as a "MUL" command carries with it a ton of unseen work behind it. To be a little more blunt: although most Assembly variants are closely related to the CPU architecture, 6502 stands out as only executing 1-4 machine code operations per command, making it ideal for sussing out exactly what is happening when, say, you multiply two integer values. Of course I could have just went into RISC systems, but the nostalgia factor probably weighed in heavily here.

* The Apple ][ and its various incarnations constitute one of the most important developments in computing still today. While most of us are familiar with Apple today--even begrudgingly--it is hard to adequately describe the impact the Apple ][ had on the world, and on people personally, without somehow not doing it justice. It was monumental because it was simultaneously 1) cheap due to Wozniak's brilliant designs, and 2) approachable enough for a ten year-old to not have any problems getting used to, with many thanks to Steve Jobs. We are used to the latter now: anyone who has seen an infant interact with a smart phone knows how intuitive these things can be; but we've left a lot of the brilliant engineering behind. This isn't to say, of course, that the engineering behind a modern Mac isn't brilliant--it surely is!--it's simply that said brilliance isn't easily accessible to the end user, and it tends to make machines more expensive rather than less expensive.

* For a long time, I considered learning Assembly via ARM systems like the Raspberry Pi. The issue with newer products, however, is that Assembly is used for only niche projects, for the most part: low-level drivers, systems programming, and the like. Even then, C can usually be substituted for Assembly. Paradoxically then, at least for my purposes, learning 6502 Assembly actually has more use-value than learning modern variants, as I don't intend to become anything close to an expert on any particular architecture. I simply want to know _how things work_, and 6502 presents the best possibility to do so!

### The Reason for Native Assembly

I have been aware of projects like CC65 for some time now, and in no way do I suggest using a native assembler over these, especially if you plan on doing cross-platform development. After I finish a decent version of these libraries, in fact, I plan on moving straight to CC65 for ease of portability in my "retro" projects. For me, there are simple reasons for choosing a native compiler, and these reasons won't be important for everyone:

* Given my research specialties, I need to know what it was like for the programmer "on the ground," and there is no way to understand this other than to do things the way that programmer did. I *will* use emulators from time to time for the sake of convenience, but I generally try to stay at the same execution speed that developers of the time experienced.

* Again, there's the nostalgia factor. I delight in remembering strange magical numbers like $300,-151, and so on while still remembering what they are for. There's a simple pleasure in knowing that what I learned at the age of ten, without even understanding it, has become useful now. You can't say that about much more you learn at that age.

* I own at least one variant of the hardware that Merlin 8 Pro runs on: an Apple //c. This makes it possible to check whether something works in emulation versus whether it works on real hardware fairly easy. 

* There is a VAST network of Apple ][ enthusiasts still today--a community that has existed much longer than most of the same kind. If you haven't already, I would highly suggest reading the book _Sophistication and Simplicity_ by Dr. Steven Weyhrich, which chronicles the history of the Apple ][ and its fanbase. This, too, makes it fairly simple to test work on real hardware I do not own: it takes a quick facebook post, and someone will invariably be kind enough to test it for me. 
* Apple ][ forever! 'nuff said.

### The Reason for some Messiness

As I said in the introduction, I am literally learning Assembly as I create this library, so it's inevitable that code will not always be optimal. I've been iterating over each disk as I update, adding and deleting where I see fit, and optimizing after having learned more every time. Still, the reason for this project has nothing to do with absolute efficiency, and I opt for readability over efficiency when I see fit. In part, this is because I want to keep it helpful for others who are learning 6502 Assembly, but moreso it's because I myself am still something of a beginner with the language. Having used high-level languages for most of my life, there's been a bit of a jump to get here, and old habits die hard! 

### Compatible Apple 2 Systems

So far, I have been able to test these libraries on the actual hardware of an Apple //c alone. I have used emulators to test for other versions of the Apple ][, but I can make no guarantees yet concerning operability. For the most part, however, I am confident that these will also work on an Apple IIe and IIGS, as I have avoided anything I know to be particular to the //c. I suspect that these will also work well on an Apple II+, but there may be problems on the original version of the Apple ][. I have, of course, also avoided the use of the 65c02 opcode additions.

### What These Libraries Are For

Ultimately, this is a __general purpose library__, and should function well for most purposes. The caveat to this might be fast-paced video games, as those usually require special optimizations for that game and that game alone. Still, the code can be optimized after-the-fact for any special projects, and I do plan on having graphics routines that are much faster than the standard ones provided by Applesoft. I'll be heavily leaning on what I'm learning from [Andy McFadden's FDRAW routines](https://github.com/fadden/fdraw) for this at first, which means those libraries should be suitable still for most games.

### I Have an Improvement

That's great! Create a branch, I guess, and I'll merge if it makes sense! It should be noted that I'm also still figuring out git and GitHub as I go along here, which means I barely know what that even means, logistically. 


---
## Disk Overviews

Each disk contains a single Macro (.mac) file, one or more subroutine libraries related to the overarching theme of the disk, and a "minified" version of the required.mac and required.lib files that the entire library relies upon. Additionally, each library has a correlating .hooks file for declaring variables used in that library's operations, as well as individual copies of each subroutine for compiling custom libraries for any given project and a demo program. Currently, there are also "minified" versions of each library and subroutine that have no comments as well, but these may be transferred to their own disk(s) in the future if disk space becomes a major concern. 

In the following descriptions, we'll be listing the .mac contents that are relevant to the theme of the disk only, as many of the macros are calls to single subroutines and it would be redundant to list those as well. A table in section XXX lists the calls each macro makes to each subroutine, and the required.mac macros are listed in Disk 2 only.

### Disk 1: STDIO

This disk is dedicated to Standard Input/Output operations, and a couple non-standard ones. Note that this is for 40-column mode only in order to keep compatibility with earlier hardware, and focuses on screen output alone in order to help with execution speed. Additionally, this focuses on input from the most-used peripherals: the keyboard and game paddles. Libraries for 80-column mode, as well as input and output from and to other devices, will be added later on.

* stdio.mac
  * [`CURB`](#macro-curb): Move Cursor Backward by [n] spaces
  * [`CURD`](#macro-curd): Move Cursor Down by [n] spaces
  * [`CURF`](#macro-curf): Move Cursor Forward by [n] spaces
  * [`CURU`](#macro-curu): Move Cursor Up by [n] spaces
  * [`INP`](#macro-inp): String Input Macro
  * [`PBX`](#macro-pbx): Read State of Paddle Button [x]
  * [`PCR`](#macro-pcr): Print Carraige Return
  * [`PDL`](#macro-pdl): Read Current Paddle State
  * [`PRN`](#macro-prn): Flexible (screen) Printing routine
  * [`RCPOS`](#macro-rcpos): Read Cursor Position
  * [`SCPOS`](#macro-scpos): Set Cursor position at [x],[y]
  * [`SETCX`](#macro-setcx): Set Cursor Horizontal Position
  * [`SETCY`](#macro-setcy): Set Cursor Vertical Position
  * [`TFILL`](#macro-tfill): Text Fill square [x1],[x2],[y1],[y2] with Character [n]
  * [`THLIN`](#macro-thlin): Text Horizontal Line Fill with Character [n]
  * [`TVLIN`](#macro-tvlin): Text Vertical Line Fill with Character [n]

  
### Disk 2: COMMON / REQUIRED

This disk is dedicated to common and useful subroutines that don't necessarily fit neatly into another category worth dedicating an entire disk to, as well as the fully commented code for the required libraries and macros that exist on every disk in minified form.

* common.mac
  * `BEEP`: Beep for a given number of cycles.
  * `DELAY`: Delay for the given number of Milliseconds.
  * `MFILL`: Fill a block of memory with the passed value.
  * `MMOVE`: Move a block of memory to another block of memory.
  * `ZLOAD`: Retrieve previously save zero page values from a given address and restore them to the zero page. 
  * `ZSAVE`: Save the zero page memory locations not used by applesoft, dos, etc. to another memory location.
  * ~~`MSWAP`~~
    
* required.mac
  * `_DUMP`: Dump the contents of a block of memory. This displays hex values only, and is primarily useful for debugging.
  * `_GRET`: Get Return. Transfer the contents of the [RETURN] register to another memory location.
  * `_ISLIT`: Is Literal. Tests a parameter to see if it is a literal value or an address. 
  * `_ISSTR`: Is String. Tests a parameter to see if it is a literal string. 
  * `_PRNT`: A standard print routine that mirrors that found in STDIO. This, too, is used mostly for debugging.
  * `_SPAR`: Set Parameter. Transfer the contents of one memory location or a literal to the [PARAM] register.
  * `_WAIT`: A simple routine that waits for a keypress. Again, useful for debugging.
  * ~~`_RDMP`: Registry Dump.~~
  
### Disk 3: Arrays

This disk contains libraries and subroutines related to the management of one-dimensional and two-dimensional arrays. Since these arrays use a singly byte for indexing, they are referred to as 8-bit arrays, even though you could technically use 64k of memory by increasing element lengths or simply having a 2D array of 256x256. Support for 16-bit indexing will be added in the future.

* arrays.mac
  * `DIM81`: Create a 1D array at a given address with a given element size and number of elements.
  * `DIM82`: Create a 2D array at a given address with a given element size and number of elements in each dimension.
  * `GET81`: Get the element at the given index in a 1D array.
  * `GET82`: Get the element at the given index in a 2D array.
  * `PUT81`: Put a value (literal or memory address) into a 1D array at the given index.
  * `PUT82`: Put a value into a 2D array at the given index.

### Disk 4: Math

This disk hold routines related to standard mathematical calculations for signed and unsigned integer math as well as macros that use Applesoft's floating-point routines. Note that this only includes some rather basic math functions; more complicated problems should be addressed by the main program using the libraries.

* math.mac
  * `ADD16`: Add two 16-bit integers, signed or unsigned, and return a 16-bit result.
  * `CMP16`: Compare two 16-bit values, signed or unsigned, and set flags appropriately.
  * `DIV8`: Divide one unsigned 8-bit integer by another and return 8-bit result.
  * `DIV16`: Divide one 16-bit value by another, signed or unsigned, and return a 16-bit result.
  * `MUL8`: Multiply two unsigned 8-bit numbers and return 16-bit product.
  * `MUL16`: Multiply two 16-bit integers, signed or unsigned, and return 24-bit product(see long description for some caveats)
  * `REM16`: Divide one 16-bit integer by another, signed or unsigned, and return the 16-bit remainder.
  * `RND8`: Generate a pseudo-random 8-bit number between 0 and 255.
  * `RND16`: Generate a pseudo-random 16-bit number between 0 and 65025.
  * `RNDB`: Generate an 8-bit pseudo-random integer between a given min and max value.
  * `RNDW`: Generate a 16-bit pseudo-random integer between a given min and max value.
  * `SUB16`: Subtract one 16-bit integer, signed or unsigned, from another and return a 16-bit result.
  * ~~FPADD: Floating-point addition using Applesoft's floating-point routines.~~ (not working yet)~~
  * ~~FPMUL: Floating-point multiplication.~~
  * ~~FPSUB: Floating-point subtraction.~~
  * ~~FPDIV: Floating-point division.~~
  * ~~FPPWR: Floating-point exponent.~~
  * ~~FPSQR: Floating-point square-root.~~
  * ~~FPEXP: Floating-point power of e.~~
  * ~~FPLOG: Floating-point logarithm.~~
  * ~~FPSIN: Floating-point sine.~~
  * ~~FPCOS: Floating-point cosine.~~
  * ~~FPTAN: Floating-point tangent.~~
  * ~~FPATN: Floating-point atangent.~~
  * ~~FPABS: Floating-point absolute value.~~
  * ~~FPINT: floating point integer value.~~
  * ~~FPFLT: integer to Floating-point.~~
  * ~~FPSGN: Floating-point sign determination.~~
  * ~~FPCMP: Floating-point compare.~~
  * ~~FPD10: Floating-point divide by ten.~~
  * ~~FPM10: Floating-point multiply by ten.~~
  
### Disk 5: Strings

This disk holds routines and macros related to string and substring manipulation. In the future, certain tasks like "TONUM" and "TOSTR" may be relegated to their own disk for data type conversion routines.

* strings.mac
  * `SCAT`: String Concatenate. Concatenate two independent strings and return a new string.
  * `SCMP`: String Compare. Compare two strings and set flags accordingly.
  * `SCOP`: Substring Copy. Returns the substring of another string at the given index and length.
  * `SDEL`: Substring Delete. Deletes a given substring from another string and returns new string.
  * `SINS`: Substring Insert. Inserts a substring into another string at the given index.
  * `SPOS`: Substring Position. Find the position of a substring in another string and return the index.
  * `SPRN`: String Print. This is a printing macro for the string data format. May be transferred to STDIO.
  * `TONUM`: String to Number. Converts a string of number-characters to its integer equivalent and return a 16-bit result.
  * `TOSTR`: Number to String. Converts a given 16-bit integer, signed or unsigned, to its string character equivalent.

### Disk 6: FileIO

This disk is dedicated to routines and macros that involve file manipulation and low-level disk access.

* fileio.mac
  * `BLOAD`: Binary load a file from the disk into the given memory location.
  * `BSAVE`: Binary save a file from the given memory location to the given binary file.
  * `CMD`: Execute a DOS command.
  * `DBUFF`: Set RWTS Buffer Address.
  * `DRIVE`: Set RWTS Drive.
  * `DRWTS`: Call the RWTS routine for direct low-level access to the disk.
  * `FINP`: File Input. Read a line from a text file.
  * `FPRN`: File Print. Print a line to a text file.
  * `SECT`: Set RWTS sector.
  * `SETDR`: Set RWTS to the read command.
  * `SETDW`: Set RWTS to the write command.
  * `SLOT`: Set the RWTS slot.
  * `TMODE`: Ready system for text-file mode. This is necessary for reading and writing text files.
  * ~~FCOPY: Copy a source file to a destination file~~ (not implemented yet)
  * ~~FDEL: Delete a file from the disk~~ (not implemented yet)

---
## Future Disks

The following disks are in pre-production/planning, and will be part of future versions of the library. I am currently focusing on the six core disks to make sure everything works seamlessly and functions the same across different subroutine calls, which is taking time to sort out. Once production of each of these disks begins, I'll be moving them from this section to the actual disks section.

CONVERSIONS DISK
* convert.mac: Library for converting between different data types.

LORES DISK
* lores.mac: Library for fast(er) graphics in low resolution mode.
  * `LHLIN`: Low resolution horizontal line.
  * `LVLIN`: Low resolution vertical line.
  * `LLINE`: Low resolution line from x1,y1 to x2,y2.
  * `LCIRC`: Low resolution circle at position x,y with a radius of r.
  * `LSQR`: Low resolution square at position x,y with a width of w.
  * `LBLIT`: Low resolution sprite blitting macro.
  * `LCOLR`: Change low resolution color.
  * `LGET`: Get color of low-resolution screen at x,y.
  * `LPUT`: plot a low resolution block at x,y on the screen.
  * `LCHAR`: plot a text character on the low resolution screen at x,y.
  * `LPRN`: plot a string of characters on the low resolution screen at x,y.
  * `LINV`: Invert colors on the low resolution screen.

HIRES DISK
* hires.mac: Library for fast(er) graphics in high resolution mode.
  * `HHLIN`: High resolution horizontal line.
  * `HVLIN`: High resolution vertical line.
  * `HLINE`: High resolution line from x1,y1 to x2,y2.
  * `HCIRC`: High resolution circle at position x,y with a radius of r.
  * `HSQR`: High resolution square at position x,y with a width of w.
  * `HBLIT`: High resolution sprite blitting macro.
  * `HCOLR`: Change High resolution color.
  * `HGET`: Get color of high-resolution screen at x,y.
  * `HPUT`: plot a high resolution block at x,y on the screen.
  * `HCHAR`: plot a text character on the high resolution screen at x,y.
  * `HPRN`: plot a string of characters on the high resolution screen at x,y.

DOUBLE LORES DISK
* dlres.mac: library for double low resolution graphics. Only available on IIe (with 80col card), //c, and IIgs.
  * `DLHLN`: Double Low resolution horizontal line.
  * `DLVLN`: Double Low resolution vertical line.
  * `DLLNE`: Double Low resolution line from x1,y1 to x2,y2.
  * `DLCRC`: Double Low resolution circle at position x,y with a radius of r.
  * `DLSQR`: Double Low resolution square at position x,y with a width of w.
  * `DLBLT`: Double Low resolution sprite blitting macro.
  * `DLCLR`: Change Double low resolution color.
  * `DLGET`: Get color of Double low-resolution screen at x,y.
  * `DLPUT`: plot a Double low resolution block at x,y on the screen.
  * `DLCHR`: plot a text character on the Double low resolution screen at x,y.
  * `DLPRN`: plot a string of characters on the Double resolution screen at x,y.

DOUBLE HIRES DISK
* dhres.mac: library for double high resolution graphics. Note that this is only available on the IIe (with 80col card), //c, and IIgs.
  * `DHHLN`: Double high resolution horizontal line.
  * `DHVLN`: Double high resolution vertical line.
  * `DHLNE`: Double high resolution line from x1,y1 to x2,y2.
  * `DHCRC`: Double high resolution circle at position x,y with a radius of r.
  * `DHSQR`: Double high resolution square at position x,y with a width of w.
  * `DHBLT`: Double high resolution sprite blitting macro.
  * `DHCLR`: Change Double high resolution color.
  * `DHGET`: Get color of Double high-resolution screen at x,y.
  * `DHPUT`: plot a Double high resolution block at x,y on the screen.
  * `DHCHR`: plot a text character on the Double high resolution screen at x,y.
  * `DHPRN`: plot a string of characters on the Double high resolution screen at x,y.
  
SOUND DISK
* sound.mac: Music and sound effects library for the internal speaker (not add-on cards like Mockingboard).~~
  * `STONE`: Play a tone at the specified megahertz for a specified duration of milliseconds.
  * `SNOTE`: Play a specified musical note at the specified octave for a specified duration in milliseconds.
  * `SWAIT`: See the `DELAY` Macro, as this is simply a slightly modified version for music timing.
  * `SDRUM`: Send a sharp sound to the speaker that emulates the nois of a bass drum.
  * `SHATC`: Send a short click that emulates a closed hi hat.
  * `SHATO`: Send a long bout of noise to emulate an open hi hat.
  * `SSTAT`: Send static to the speaker for a specified number of milliseconds.
  * `SARPG`: Send a series of Arpeggio notes to the speaker to emulate multiple notes at once or chords.
  * `SASC`: Play a series of tones between a low and high mhz, ascending at a given rate.
  * `SDESC`: Play a series of tones between a high and low mhz, descending at a given rate.
  * `SENV`: Rudimentary envelope for notes achieved by manipulating octave frequencies.
  
80COL DISK
* stdio80.mac: stdio library for 80-column output. Most of these will be identical to the routines on the stdio disk.
  * `80CB`: Move Cursor Backward by [n] spaces
  * `80CD`: Move Cursor Down by [n] spaces
  * `80CF`: Move Cursor Forward by [n] spaces
  * `80CU`: Move Cursor Up by [n] spaces
  * `80INP`: String Input Macro
  * `80PBX`: Read State of Paddle Button [x]
  * `80PCR`: Print Carraige Return
  * `80PDL`: Read Current Paddle State
  * `80PRN`: Flexible (screen) Printing routine
  * `80RCP`: Read Cursor Position
  * `80SCP`: Set Cursor position at [x],[y]
  * `80SCX`: Set Cursor Horizontal Position
  * `80SCY`: Set Cursor Vertical Position
  * `80TFIL`: Text Fill square [x1],[x2],[y1],[y2] with Character [n]
  * `80THLN`: Text Horizontal Line Fill with Character [n]
  * `80TVLN`: Text Vertical Line Fill with Character [n]
* 80to40.mac: a simple set of macros that calls the 80-column macros when 40-column macros are invoked. Obviously, the 40-colum stdio.mac cannot be use simultaneously.

PRINTER IO
* library for interfacing with a printer.
  * `PINIT`: Printer Detect and Initialize.
  * `PPRNC`: Print a single Character on the Printer.
  * `PPRNL`: Print a line of text on the printer.
  * `PPUT`: Print a single dot on the printer.
  * `PLBLK`: Print a block of low-res graphics at a given memory location to the printer.
  * `PHBLK`: Print a block of high resolution graphics at a given memory location on the printer.
  
SERIAL IO
* library for sending and receiving data over the serial port
  * `SSEND`: Serial send bit/byte.
  * `SRECV`: Serial Receive bit/byte.
  * `SLSTN`: Listen to serial and wait for data for continuing.
  
CUSTOM LIBRARY BUILDER DISK
* builder.bas: A utility that automatically builds custom libraries by copying routines from the appropriate disks, commented or minified.


INTEGRATED DEMO DISK(S)
* disk(s) with demos that show more complicated usage of the libraries, integrating them as each demo needs. The first of these demos will be a roguelike text game, accompanied by all the development utilities.
  * Item Editor (bas)
  * Settings Editor (bas)
  * NPC Editor (bas)
  * Character Editor (bas)
  * Enemy Editor (bas)
  * Map Key Editor (bas)
  * Room contours editor (asm)
  * Rogue Game (asm)

---
## Macro Subroutine Calls and Clobbers

The following table shows which subroutines each Macro calls, along with the resulting registers, flags, and memory locations clobbered. This is up to date for version 0.3.0.


 MACRO  | SUBROUTINES                | FLAGS CLOBBED | REGS CLOBBED | MEMORY CLOBBERED  
 ------ | -------------------------- |:-------------:|:------------:| ----------------- 
 _DUMP  |                            |               |              |                   
 _GRET  |                            |               |              |                   
 _ISLIT |                            |               |              |                   
 _ISSTR |                            |               |              |                   
 _PRNT  |                            |               |              |                   
 _SPAR  |                            |               |              |                   
 _WAIT  |                            |               |              |                   
 ADD16  |                            |               |              |
 BEEP   |                            |               |              |
 BLOAD  |                            |               |              |
 BSAVE  |                            |               |              |
 CMD    |                            |               |              |
 CMP16  |                            |               |              |
 CURB   |                            |               |              |                   
 CURD   |                            |               |              |                   
 CURF   |                            |               |              |                   
 CURU   |                            |               |              |                   
 DBUFF  |                            |               |              |
 DELAY  |                            |               |              |
 DIM81  |                            |               |              |
 DIM82  |                            |               |              |
 DIV8   |                            |               |              |
 DIV16  |                            |               |              |
 DRIVE  |                            |               |              |
 DRWTS  |                            |               |              |
 FINP   |                            |               |              |
 FPRN   |                            |               |              |
 GET81  |                            |               |              |
 GET82  |                            |               |              |
 INP    |                            |               |              |                   
 MFILL  |                            |               |              |
 MMOVE  |                            |               |              |
 MUL8   |                            |               |              |
 MUL16  |                            |               |              |
 PBX    |                            |               |              |                   
 PCR    |                            |               |              |                   
 PDL    |                            |               |              |                   
 PRN    |                            |               |              |                   
 PUT81  |                            |               |              |
 PUT82  |                            |               |              |
 RCPOS  |                            |               |              |                   
 REM16  |                            |               |              |
 RND8   |                            |               |              |
 RND16  |                            |               |              |
 RNDB   |                            |               |              |
 RNDW   |                            |               |              |
 SCAT   |                            |               |              |                   
 SCMP   |                            |               |              |                   
 SCPOS  |                            |               |              |                   
 SCOP   |                            |               |              |                   
 SDEL   |                            |               |              |                   
 SECT   |                            |               |              |
 SETCX  |                            |               |              |                   
 SETCY  |                            |               |              |                   
 SETDR  |                            |               |              |
 SETDW  |                            |               |              |
 SINS   |                            |               |              |                   
 SLOT   |                            |               |              |
 SPOS   |                            |               |              |                   
 SPRN   |                            |               |              |                   
 TFILL  |                            |               |              |                   
 THLIN  |                            |               |              |                   
 TONUM  |                            |               |              |                   
 TOSTR  |                            |               |              |                   
 TVLIN  |                            |               |              |                   
 ZLOAD  |                            |               |              | 
 ZSAVE  |                            |               |              |
 
---

## Macro Usage Cheat Sheet

Once Macros are mostly finished in how they are called, you can find how to use them here. New versions, of course, always run the risk of changing something integral; This cheat sheet will be updated accordingly.


 MACRO  | USAGE                                                          | RETURNS
 ------ | -------------------------------------------------------------- | ----------------------------------- 
 _DUMP  | ```_DUMP [memory address];[# of bytes to dump]```              | Nothing
 _GRET  | ```_GRET [dest memory address]```                              | [return] stored in specified address
 _ISLIT |                           
 _ISSTR |                           
 _PRNT  |                           
 _SPAR  |                           
 _WAIT  |                           
 ADD16  |        
 BEEP   |        
 BLOAD  |        
 BSAVE  |        
 CMD    |        
 CMP16  |        
 CURB   |                           
 CURD   |                           
 CURF   |                           
 CURU   |                           
 DBUFF  |        
 DELAY  |        
 DIM81  |        
 DIM82  |        
 DIV8   |        
 DIV16  |        
 DRIVE  |        
 DRWTS  |        
 FINP   |        
 FPRN   |        
 GET81  |        
 GET82  |        
 INP    |                           
 MFILL  |        
 MMOVE  |        
 MUL8   |        
 MUL16  |        
 PBX    |                           
 PCR    |                           
 PDL    |                           
 PRN    |                           
 PUT81  |        
 PUT82  |        
 RCPOS  |                           
 REM16  |        
 RND8   |        
 RND16  |        
 RNDB   |        
 RNDW   |        
 SCAT   |                           
 SCMP   |                           
 SCPOS  |                           
 SCOP   |                           
 SDEL   |                           
 SECT   |        
 SETCX  |                           
 SETCY  |                           
 SETDR  |        
 SETDW  |        
 SINS   |                           
 SLOT   |        
 SPOS   |                           
 SPRN   |                           
 TFILL  |                           
 THLIN  |                           
 TONUM  |                           
 TOSTR  |                           
 TVLIN  |                           
 ZLOAD  |         
 ZSAVE  |        
 
---




