# AppleIIAsmLib

A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro.

---
## ATTENTION
This documentation is currently being updated to reflect massive changes between version 0.3 and the next release, 0.5. Generally, these updates are happening in the order of disks: STDIO, then COMMON, etc. Once this is finished, v0.5.0 will go live, and future updates will be piecemeal, by and large, rather than in large chunks.




---
## Table of Contents
* [Introduction](#introduction)
* [6502 Assembly Resources](#6502-assembly-resources)
* [Apple \]\[ Books and Resources](#apple-2-books-and-resources)
* [Library Standard Conventions](#library-standard-conventions)
* [Documentation Practices](#documentation-practices)
* [Disk Overviews](#disk-overviews)
  * [Disk 1: STDIO](#disk-1-stdio)
  * [Disk 2: COMMON](#disk-2-common-required)
  * [Disk 3: ARRAYS](#disk-3-arrays)
  * [Disk 4: MATH](#disk-4-math)
  * [Disk 5: STRINGS](#disk-5-strings)
  * [Disk 6: FILEIO](#disk-6-fileio)
  * [Disk 7: CONVERSION](#disk-7-convert)
  * [Disk 8: LORES](#disk-8-lores)
  * [Disk 9: SPEAKER](#disk-9-speaker)
  * [Disk 10: HIRES](#disk-10-hires)
  * [Disk 11: SERIALIO](#disk-11-serialio)
  * [Disk 12: SORTSEARCH](#disk-12-sortsearch)
  * [Disk 13: TMENUTWIN](#disk-13-tmenutwin)
  * [Disk 14: 80COL](#disk-14-80col)
  * [Disk 15: MOCKINGBOARD](#disk-15-mockingboard)
  * [Disk 16: DBLLORES](#disk-16-dbllores)
  * [Disk 17: DBLHIRES](#disk-17-dblhires)
  * [Disk 18: DEMOSUTILS](#disk-18-demosutils)
  * [Disk 19: OTHERCARDS](#disk-19-othercards)
  * [Disk 20: MINIFIED ROUTINES DISK A](#disk-20-minified)
  * [Disk 21: DEMOBUILDS 1](#disk-21-demobuilds1)
  * [Disk 22: DEMOBUILDS 2](#disk-22-demobuilds2)
* [Macro Subroutine Calls and Clobbers](#macro-subroutine-calls-and-clobbers)
* [Macro Usage Cheat Sheet](#macro-usage-cheat-sheet)
* [Detailed Descriptions: Macros](#macros)
* [Detailed Descriptions: Subroutines](#subroutiness)

---
## Introduction

This is a general purpose library in 6502 Assembly for the Apple II. Originally, I began this project as research for a platform study of the Apple \]\[ system, learning Assembly for the first time. However, after speaking to a number of folk who are still actively involved in a community of enthusiasts, I noticed that there was no cohesive place for a first-time learner to find well-documented code, basic data structures and control loops, or even a good and intuitive listing of hooks for the system. There are plenty of books--some very old, some very new--that detail these things somewhat cohesively and are fantastic resources for beginners, but very few of them adequately serve as an good basis for understanding the platform as a whole. There are also many webpages out there dedicated to this matter--but as is the nature of the Internet, they are fractured resources that come and go at the blink of an eye. Thus, Appl\]\[AsmLib began.

Ultimately, my aim is to create a large enough collection of routines to address any domain of development for the Apple II family in Assembly while maintaining an ease of access to beginners that is hard to come by.  I'll do my best to acknowledge when a routine is inspired by (or mostly copied from) another source, and will exclude them from the Apache License 2.0 when necessary; I hope to replace anything of this sort with original work as I revise. If you find your own source here, but would rather it not be here, please reach out to me and I'll remove it immediately.

---
## 6502 Assembly Resources

As someone who spends a _lot_ of time thinking about, writing about, and teaching different facets of technical writing (in its broadest sense), I can confirm the following: there are hundreds of thousands of books written about the 6502 architecture and Assembly programming. I can also confirm that these books--as well as most websites--tend to approach the subject from a "writerly" position rather than a reader-centered one; that is, it's written for engineers and computer scientists who have already spent a lot of time and money understanding the theory, learning the jargon, and training themselves to be able to do things by muscle memory. That's great for established engineers, mathemeticians, computer scientists and the like, as well as those who can afford to dedicate years of their lives (and again, gobs of $$$) to obtain a degree that qualifies them as entry level in the field. It is not so great, however, for beginners, hobbyists, or those trying to study it from a non-engineering theoretical perspective. That is, at least, part of the gap I am hoping to fill.

That said, I myself would have failed quite readily without at least a few key texts and websites, and it would be remiss to not list them here. And if you're committed to learning this, know that there is no good replacement to sitting down, typing out a listing from a book, compiling and then trying to figure out what the hell you just did--or what you did wrong! There is no doing without learning, and there is no learning without doing; but maybe these can help.




---
## Apple 2 Books and Resources

More books have been written over the past forty years than could be read within a reasonable timeframe. However, I have found some books more fruitful than others in understanding both the technical aspects of the Apple \]\[ as well as the cultural ones. If you know of any essential books or websites that are missing here, by all means get in touch or contribute it here yourself!

### Books

* Bill Martens, Brian Wiser, William F. Luebbert, Phil Daley. [_What's Where in the Apple, Enhanced Edition: A Complete Guide to the Apple \]\[ Computer_.](https://www.amazon.com/gp/product/136517364X/) October 11, 2016.
* David Flannigan. [_The New Apple II Users' Guide_](https://www.amazon.com/gp/product/0615639879/). June 6, 2012.
* David L. Craddock. [_Break Out: How the Apple II Launched the PC Gaming Revolution_](https://www.amazon.com/gp/product/0764353225/). September 28, 2017.
* Steven Weyhrich. [_Sophistication & Simplicity: The Life and Times of the Apple II Computer_](https://www.amazon.com/gp/product/0986832278/). December 1, 2013.
* Roger Wagner, Chris Torrence. [_Assembly Lines: The Complete Book_](https://www.amazon.com/Assembly-Lines-Complete-Roger-Wagner/dp/1312089407/). May 10, 2017.
* Ken Williams, Bob Kernagham, Lisa Kernagham. [_Apple II Computer Graphics_](https://www.amazon.com/gp/product/B01FIXG7ZK/). November 3, 1983.
* Lon Poole. [_Apple II Users' Guide_.](https://www.amazon.com/gp/product/0931988462/). 1981.
* And of course, the guides and documentation that came with every version of the Apple II (except the first!)



### Web Resources


---
## Library Standard Conventions


---
## Documentation Practices

---
## Disk Overviews

Each disk contains a single Macro (.mac) file, one or more subroutine files related to the overarching theme of the disk, and a "minified" version of the mac and subroutine files that the entire library relies upon. Additionally, each library has a correlating .hooks file for declaring useful hooks at the beginning of a program used in that library's operations, as well as a variable file that must be included with any subroutine's inclusion into the main listing.

In the following disk descriptions, we'll be listing the .mac contents that are relevant to the theme of the disk only, as many of the macros are calls to single subroutines. A table in section XXX lists the calls each macro makes to each subroutine, and the same information can be obtained from the detailed descriptions of macros and subroutines.

### Disk 1: STDIO

This disk is dedicated to Standard Input/Output operations, and a couple non-standard ones. Note that this is for 40-column mode only in order to keep compatibility with earlier hardware, and focuses on screen output alone in order to help with execution speed. However, most of these subroutines will work in 80col mode, with the exception of those that directly read or write the screen memory.

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
  * [`TPUT`](#macro-tput): Direct memory text plotting routine
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
  * `MSWAP`: Swap a memory range at one address with another.
    
* required.mac
  * `_DUMP`: Dump the contents of a block of memory. This displays hex values only, and is primarily useful for debugging.
  * `_ERR`: Error handling routine. Generally only called from routine libraries.
  * `_GRET`: Get Return. Transfer the contents of the [RETURN] register to another memory location.
  * `_ISLIT`: Is Literal. Tests a parameter to see if it is a literal value or an address. 
  * `_ISSTR`: Is String. Tests a parameter to see if it is a literal string. 
  * `_PRNT`: A standard print routine that mirrors that found in STDIO. This, too, is used mostly for debugging.
  * `_SPAR`: Set Parameter. Transfer the contents of one memory location or a literal to the [PARAM] register.
  * `_WAIT`: A simple routine that waits for a keypress. Again, useful for debugging.
  * `_RDMP`: Registry Dump without halting execution.
  
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
  * ~~FCOPY: Copy a source file to a destination file~~ (not implemented yet)~~
  * ~~FDEL: Delete a file from the disk~~ (not implemented yet)~~

---
## Future Disks

The following disks are in pre-production/planning, and will be part of future versions of the library. I am currently focusing on the six core disks to make sure everything works seamlessly and functions the same across different subroutine calls, which is taking time to sort out. Once production of each of these disks begins, I'll be moving them from this section to the actual disks section.

~~Disk 7: Conversion~~
* ~~convert.mac: Library for converting between different data types.~~
  * ~~`HX2CHR`: Hex value to character notation.~~
  * ~~`TOSTR`: Integer value to character equivalent.~~
  * ~~`TONUM`: Character string number to hexcode equivalent.~~
  * ~~`HX2DEC`: Hexadecimal value to decimal value string.~~
  * ~~`HX2BIN`: Hexademial value to binary string.~~
  * ~~`BIN2HX`: binary string to hex value.~~
  * ~~`DEC2HX`: decimal string to hex value. Not much different than `TONUM`~~
  * ~~`HR2LR`: Hi-resolution to low-resolution conversion.~~
  * ~~`LR2HR`: Low-resolution to high-resolution conversion.~~
  * ~~`LS2STR`: a string that ends in #$00 coverted to the string data type (length byte first, then string)~~  
  
~~Disk 8: LoRes~~  
  * ~~lores.mac: Library for fast(er) graphics in low resolution mode.~~
  * ~~`LHLIN`: Low resolution horizontal line.~~
  * ~~`LVLIN`: Low resolution vertical line.~~
  * ~~`LLINE`: Low resolution line from x1,y1 to x2,y2.~~
  * ~~`LCIRC`: Low resolution circle at position x,y with a radius of r.~~
  * ~~`LSQR`: Low resolution square at position x,y with a width of w.~~
  * ~~`LBLIT`: Low resolution sprite blitting macro.~~
  * ~~`LCOLR`: Change low resolution color.~~
  * ~~`LGET`: Get color of low-resolution screen at x,y.~~
  * ~~`LPUT`: plot a low resolution block at x,y on the screen.~~
  * ~~`LCHAR`: plot a text character on the low resolution screen at x,y.~~
  * ~~`LPRN`: plot a string of characters on the low resolution screen at x,y.~~
  * ~~`LINV`: Invert colors on the low resolution screen.~~

~~Disk 9: Sound~~
* ~~sound.mac: Music and sound effects library for the internal speaker (not add-on cards like Mockingboard). Note that this is not really for "real-time" music generation while doing something else, as that would involve counting the cycles in loops that a library would not necessarily have access to. In the future, I may try to create a library that does this, but it would still be pretty limited and the main execution would have to follow a very rigid format. I may also create a library that takes advantage of the Mockingboard.~~
  * ~~`STONE`: Play a tone at the specified megahertz for a specified duration of milliseconds.~~
  * ~~`SNOTE`: Play a specified musical note at the specified octave for a specified duration in milliseconds.~~
  * ~~`SWAIT`: See the `DELAY` Macro, as this is simply a slightly modified version for music timing.~~
  * ~~`SDRUM`: Send a sharp sound to the speaker that emulates the nois of a bass drum.~~
  * ~~`SHATC`: Send a short click that emulates a closed hi hat.~~
  * ~~`SHATO`: Send a long bout of noise to emulate an open hi hat.~~
  * ~~`SSTAT`: Send static to the speaker for a specified number of milliseconds.~~
  * ~~`SARPG`: Send a series of Arpeggio notes to the speaker to emulate multiple notes at once or chords.~~
  * ~~`SASC`: Play a series of tones between a low and high mhz, ascending at a given rate.~~
  * ~~`SDESC`: Play a series of tones between a high and low mhz, descending at a given rate.~~
  * ~~`SENV`: Rudimentary envelope for notes achieved by manipulating octave frequencies.~~
  * ~~`SQKEY`: Set the keypress to signal the library to halt playing a note.~~
  * ~~`SPLOD`: a sound effect resembling an explosion sound. Customizeable via parameters.~~
  * ~~`SPLAY`: play a sequence of given notes found at a given memory address. Follows same sequence as `SNOTE` parameters, ending with #00.~~
  * ~~`SALRM`: play an alarm sound.~~
  * ~~`SLAZE`: play a lazer sound at a specific frequency.~~
  
~~Disk 10: 80Col~~
* ~~stdio80.mac: stdio library for 80-column output. Most of these will be identical to the routines on the stdio disk.~~
  * ~~`80CB`: Move Cursor Backward by [n] spaces~~
  * ~~`80CD`: Move Cursor Down by [n] spaces~~
  * ~~`80CF`: Move Cursor Forward by [n] spaces~~
  * ~~`80CU`: Move Cursor Up by [n] spaces~~
  * ~~`80INP`: String Input Macro~~
  * ~~`80PBX`: Read State of Paddle Button [x]~~
  * ~~`80PCR`: Print Carraige Return~~
  * ~~`80PDL`: Read Current Paddle State~~
  * ~~`80PRN`: Flexible (screen) Printing routine~~
  * ~~`80RCP`: Read Cursor Position~~
  * ~~`80SCP`: Set Cursor position at [x],[y]~~
  * ~~`80SCX`: Set Cursor Horizontal Position~~
  * ~~`80SCY`: Set Cursor Vertical Position~~
  * ~~`80TFIL`: Text Fill square [x1],[x2],[y1],[y2] with Character [n]~~
  * ~~`80THLN`: Text Horizontal Line Fill with Character [n]~~
  * ~~`80TVLN`: Text Vertical Line Fill with Character [n]~~
* ~~80to40.mac: a simple set of macros that calls the 80-column macros when 40-column macros are invoked. Obviously, the 40-column stdio.mac cannot be used simultaneously.~~

~~Disk 11: HiRes~~
* ~~hires.mac: Library for fast(er) graphics in high resolution mode.~~
  * ~~`HHLIN`: High resolution horizontal line.~~
  * ~~`HVLIN`: High resolution vertical line.~~
  * ~~`HLINE`: High resolution line from x1,y1 to x2,y2.~~
  * ~~`HCIRC`: High resolution circle at position x,y with a radius of r.~~
  * ~~`HSQR`: High resolution square at position x,y with a width of w.~~
  * ~~`HBLIT`: High resolution sprite blitting macro.~~
  * ~~`HCOLR`: Change High resolution color.~~
  * ~~`HGET`: Get color of high-resolution screen at x,y.~~
  * ~~`HPUT`: plot a high resolution block at x,y on the screen.~~
  * ~~`HCHAR`: plot a text character on the high resolution screen at x,y.~~
  * ~~`HPRN`: plot a string of characters on the high resolution screen at x,y.~~

~~Disk 12: DblLoRes~~
* ~~dlres.mac: library for double low resolution graphics. Only available on IIe (with 80col card), //c, and IIgs.~~
  * ~~`DLHLN`: Double Low resolution horizontal line.~~
  * ~~`DLVLN`: Double Low resolution vertical line.~~
  * ~~`DLLNE`: Double Low resolution line from x1,y1 to x2,y2.~~
  * ~~`DLCRC`: Double Low resolution circle at position x,y with a radius of r.~~
  * ~~`DLSQR`: Double Low resolution square at position x,y with a width of w.~~
  * ~~`DLBLT`: Double Low resolution sprite blitting macro.~~
  * ~~`DLCLR`: Change Double low resolution color.~~
  * ~~`DLGET`: Get color of Double low-resolution screen at x,y.~~
  * ~~`DLPUT`: plot a Double low resolution block at x,y on the screen.~~
  * ~~`DLCHR`: plot a text character on the Double low resolution screen at x,y.~~
  * ~~`DLPRN`: plot a string of characters on the Double resolution screen at x,y.~~

~~Disk 13: DblHiRes~~
* ~~dhres.mac: library for double high resolution graphics. Note that this is only available on the IIe (with 80col card), //c, and IIgs.~~
  * ~~`DHHLN`: Double high resolution horizontal line.~~
  * ~~`DHVLN`: Double high resolution vertical line.~~
  * ~~`DHLNE`: Double high resolution line from x1,y1 to x2,y2.~~
  * ~~`DHCRC`: Double high resolution circle at position x,y with a radius of r.~~
  * ~~`DHSQR`: Double high resolution square at position x,y with a width of w.~~
  * ~~`DHBLT`: Double high resolution sprite blitting macro.~~
  * ~~`DHCLR`: Change Double high resolution color.~~
  * ~~`DHGET`: Get color of Double high-resolution screen at x,y.~~
  * ~~`DHPUT`: plot a Double high resolution block at x,y on the screen.~~
  * ~~`DHCHR`: plot a text character on the Double high resolution screen at x,y.~~
  * ~~`DHPRN`: plot a string of characters on the Double high resolution screen at x,y.~~
  
~~Disk 14: OtherIO~~
* ~~library for interfacing with a printer.~~
  * ~~`PINIT`: Printer Detect and Initialize.~~
  * ~~`PPRNC`: Print a single Character on the Printer.~~
  * ~~`PPRNL`: Print a line of text on the printer.~~
  * ~~`PPUT`: Print a single dot on the printer.~~
  * ~~`PLBLK`: Print a block of low-res graphics at a given memory location to the printer.~~
  * ~~`PHBLK`: Print a block of high resolution graphics at a given memory location on the printer.~~  
* ~~library for sending and receiving data over the serial port~~
  * ~~`SSEND`: Serial send bit/byte.~~
  * ~~`SRECV`: Serial Receive bit/byte.~~
  * ~~`SLSTN`: Listen to serial and wait for data for continuing.~~
  
~~Disk 15: Sort~~
  * ~~BSORT: Bubble Sort~~
  * ~~ISORT: Insertion Sort~~
  * ~~MSORT: Merge Sort~~
  * ~~QSORT: Quick Sort~~
  * ~~SSORT: Selection Sort~~
  
~~Disk 16: Search~~
  * ~~BSRCH: Binary Search~~
    
~~Disk 17: Lists_Trees~~
    
~~Disk 18: Utilities~~
* ~~builder.bas: A utility that automatically builds custom libraries by copying routines from the appropriate disks, commented or minified.~~
* makeexec.bas
* minify.bas
* ~~BUILDER~~
* ~~MAKEEXEC~~
* ~~MINIFY~~

Disk 19: Integrated_Demos
* disk(s) with demos that show more complicated usage of the libraries, integrating them as each demo needs. 
  * MAKEMAZE: A fairly simple maze creation demo. Can only create square mazes.
  * ~~READFILE~~
  * ~~SKIDOWN~~
  * ~~GAMEOFLIFE~~

Disk 20: MiniDisk A

A disk with minified versions of the source files of disks 1-7. This is primarily used by the library-building utility.


---
## Macro Subroutine Calls and Clobbers

The following table shows which subroutines each Macro calls, along with the resulting registers, flags, and memory locations clobbered. This is up to date for version 0.3.0. Note that by "clobbered" here, I don't mean that the register or memory location has trash in it; it's just been altered in some way. For list of what useful imformation is passed after a Macro is executed, see [the cheat sheet](#macro-usage-cheat-sheet).

If a memory alteration is indicated by a [PASS], it means that the memory area that was passed to the macro was altered.

 MACRO  | SUBROUTINES CALLED         | FLAGS ALTERED | REGS ALTERED | MEM ALTERED  
 ------ | -------------------------- |:-------------:|:------------:| ----------- 
 _DUMP  | __DUMP                     |               |              |                   
 _ERR   | __ERR                      |               |              |
 _GRET  | __GETRET                   |               |              |                   
 _ISLIT | None                       |               |              |                   
 _ISSTR | None                       |               |              |                   
 _PRNT  | __P                        |               |              |                   
 _RDUMP | __RDMP                     |               |              | 
 _SPAR  | __SETPARM                  |               |              |                   
 _WAIT  | __W                        |               |              |                   
 ADD16  | ADDIT16                    |               |              |
 AMODE  | None                       |               |              |
 BEEP   | None (BELL)                |               |              |
 BLOAD  | BINLOAD                    |               |              |
 BSAVE  | BINSAVE                    |               |              |
 CMD    | DOSCMD                     |               |              |
 CMP16  | COMP16                     |               |              |
 CURB   | CURSBAK                    |               |              |                   
 CURD   | CURSDN                     |               |              |                   
 CURF   | CURSFOR                    |               |              |                   
 CURU   | CURSUP                     |               |              |                   
 DBUFF  | None                       |               |              |
 DELAY  | DELAYMS                    |               |              |
 DIM81  | ADIM81                     |               |              |
 DIM82  | ADIM82                     |               |              |
 DIV8   | DIVD8                      |               |              |
 DIV16  | SDIV16,UDIV16              |               |              |
 DRIVE  | None                       |               |              |
 DRWTS  | DISKOP                     |               |              |
 FINP   | FINPUT                     |               |              |
 FPRN   | FPRINT,FPSTR               |               |              |
 GET81  | AGET81                     |               |              |
 GET82  | AGET82                     |               |              |
 GKEY   | None (GETKEY)              |               |              | 
 INP    | SINPUT                     |               |              |                   
 MFILL  | MEMFILL                    |               |              |
 MMOVE  | MEMMOVE                    |               |              |
 MSWAP  | MEMSWAP                    |               |              |
 MUL8   | MULT8                      |               |              |
 MUL16  | MULT16                     |               |              |
 PBX    | GPBX                       |               |              |                   
 PCR    | None (COUT1)               |               |              |                   
 PDL    | None (PREAD)               |               |              |                   
 PRN    | XPRINT,DPRINT              |               |              |                   
 PUT81  | APUT81                     |               |              |
 PUT82  | APUT82                     |               |              |
 RCPOS  | None (GBASCALC)            |               |              |                   
 REM16  | SREMD16,UREMD16            |               |              |
 RND16  | RAND16                     |               |              |
 RNDB   | RANDB                      |               |              |
 SCAT   | STRCAT                     |               |              |                   
 SCMP   | STRCMP                     |               |              |                   
 SCPOS  | None (VTAB)                |               |              |                   
 SCPY   | SUBCOPY                    |               |              |                   
 SDEL   | SUBDEL                     |               |              |                   
 SECT   | None                       |               |              |
 SETCX  | None (VTAB)                |               |              |                   
 SETCY  | None (VTAB)                |               |              |                   
 SETDR  | None                       |               |              |
 SETDW  | None                       |               |              |
 SINS   | SUBINS                     |               |              |                   
 SLOT   | None                       |               |              |
 SPOS   | SUBPOS                     |               |              |                   
 SPRN   | PRNSTR                     |               |              |                   
 SUB16  | SUBT16                     |               |              |
 TFILL  | TFILLA                     |               |              |                   
 THLIN  | THLINE                     |               |              |                   
 TPUT   | TXTPUT                     |               |              |
 TONUM  | STR2NUM                    |               |              |                   
 TOSTR  | NUM2STR                    |               |              |                   
 TRACK  | None                       |               |              |
 TVLIN  | TVLINE                     |               |              |                   
 ZLOAD  | ZMLOAD                     |               |              | 
 ZSAVE  | ZMSAVE                     |               |              |
 
---

## Macro Usage Cheat Sheet

Once Macros are mostly finished in how they are called, you can find how to use them here. New versions, of course, always run the risk of changing something integral; This cheat sheet will be updated accordingly.


 MACRO  | USAGE                                                               | RETURNS
 ------ | ------------------------------------------------------------------- | ----------------------------------- 
 _DUMP  | ```_DUMP [memory address];[# of bytes to dump]```                   | Nothing; dump to screen
 _ERR   | ```_ERR [calling rout];[err msg];[dump msg];[dump loc];[dmplen]```  | prints various error messages and information
 _GRET  | ```_GRET [dest memory address]```                                   | [return] stored in specified address
 _ISLIT | ```_ISLIT [data]```                                                 | inserts executable code at pointer                
 _ISSTR | ```_ISSTR [data]```                                                 | inserts executable code at pointer
 _PRNT  | ```_PRNT [string or address]```                                     | prints provided literal string                 
 _RDUMP | ```_RDUMP```                                                        | nothing; outputs registry values
 _SPAR  | ```_SPAR [src address];[length]```                                  | moves data at address to [param]                          
 _WAIT  | ```_WAIT```                                                         | Nothing; wait for keypress.
 ADD16  | ```ADD16 [word 1];[word 2] ```                                      | .Y = lobyte of sum
 .      | .                                                                   | .X = hibyte of sum
 .      | .                                                                   | [RETURN] = sum
 .      | .                                                                   | [RETLEN] = length of sum (2 bytes)
 BEEP   | ```BEEP [number of beep calls]```                                   | Nothing; just speaker output   
 BLOAD  | ```BLOAD [dos command parameters]```                                | Nothing; just disk input
 BSAVE  | ```BSAVE [dos command parameters]```                                | Nothing; just disk output
 CMD    | ```CMD [dos command with parameters]```                             | Nothing, save for changes done by command
 CMP16  | ```CMP16 [word 1];[word 2]```                                       | See full description for flag changes.
 CURB   | ```CURB [spaces to move back]```                                    | Nothing
 CURD   | ```CURD [spaces to move down]```                                    | Nothing
 CURF   | ```CURF [spaces to move forward]```                                 | Nothing
 CURU   | ```CURU [spaces to move up]```                                      | Nothing
 DBUFF  | ```DBUFF [buffer address]```                                        | Nothing
 DELAY  | ```DELAY [number of milliseconds to delay]```                       | Nothing; just execution delay  
 DIM81  | ```DIM81 [array address];[# of elements];[element byte length]```   | [RETURN] = total array size in bytes
 .      | .                                                                   | [RETLEN] = length of [RETURN] val
 DIM82  | ```DIM82 [array addr];[# of cols];[# of rows];[elem byte length]``` | [RETURN] = total array size in bytes
 .      | .                                                                   | [RETLEN] = length of [RETURN] val
 DIV8   | ```DIV8 [dividend byte];[divisor byte]```                           | .A = quotient (byte)
 .      |                                                                     | .X = remainder (byte)
 .      | .                                                                   | [RETURN] = quotient
 .      | .                                                                   | [RETLEN] = quotient length (1 byte)
 DIV16  | ```DIV16 [dividend word];[divisor word]```                          | .Y = lobyte of quotient
 .      | .                                                                   | .X = hibyte of quotient
 .      | .                                                                   | [RETURN] = quotient
 .      | .                                                                   | [RETLEN] = quotient length (2 bytes) 
 DRIVE  | ```DRIVE [drive number]```                                          | Nothing
 DRWTS  | ```DRWTS```                                                         | Nothing
 FINP   | ```FINP [adress to store string]```                                 | Nothing
 FPRN   | ```FPRN [literal string or address of string]```                    | Nothing 
 GET81  | ```GET81 [array address];[element index]```                         | .Y = lobyte of element addr
 .      | .                                                                   | .X = hibyte of element addr
 .      | .                                                                   | [RETURN] = value stored in element
 .      | .                                                                   | [RETLEN] = length of return value 
 GET82  | ```GET82 [array addr];[column index];[row index]```                 | .Y = lobyte of element addr
 .      | .                                                                   | .X = hibyte of element addr
 .      | .                                                                   | [RETURN] = value stored in element
 .      | .                                                                   | [RETLEN] = length of return value 
 GKEY   | ```GKEY```                                                          | .A = key pressed
 INP    | ```INP```                                                           | [RETURN] = string entered by user
 .      | .                                                                   | [RETLEN] = string length (same as first byte of [RETURN], +1)
 .      | .                                                                   | .X, .Y = length of string
 MFILL  | ```MFILL [address start];[length in bytes];[fill value]```          | Nothing useful       
 MMOVE  | ```MMOVE [src addr];[dest addr];[length in bytes]```                | Nothing useful
 MSWAP  | ```MSWAP [first address];[second address];[length]```               | Nothing 
 MUL8   | ```MUL8 [multiplicand byte];[multiplier byte]```                    | .Y = lobyte of product (word)
 .      | .                                                                   | .X = hibyte of product (word)
 .      | .                                                                   | [RETURN] = quotient
 .      | .                                                                   | [RETLEN] = quotient length (2 bytes)
 MUL16  | ```MUL16 [multiplicand word];[multiplier word]```                   | .Y = lobyte of product
 .      | .                                                                   | .X = hibyte of product
 .      | .                                                                   | [RETURN] = product (24-bit; see desc)
 .      | .                                                                   | [RETLEN] = product length (3 bytes)
 PBX    | ```PBX [button to read; PB0,PB1,PB2,PB3]```                         | .A = 1 if button pressed, else 0
 PCR    | ```PCR```                                                           | Nothing
 PDL    | ```PDL [paddle to read]```                                          | .Y = paddle state value, 0..256
 PRN    | ```PRN [literal string or address]```                               | .Y = length of string, if literal
 PUT81  | ```PUT81 [src addr or literal][array addr];[element index]```       | .Y = lobyte of element addr
 .      | .                                                                   | .X = hibyte of element addr
 .      | .                                                                   | .A = length of element in bytes
 PUT82  | ```PUT82 [src addr or lit];[array addr];[col index];[row index]```  | .Y = lobyte of element addr
 .      | .                                                                   | .X = hibyte of element addr
 .      | .                                                                   | .A = length of element in bytes    
 RCPOS  | ```RCPOS [col];[row]```                                             | .A = character at that position
 REM16  | ```REM16 [dividend word];[divisor word]```                          | .Y = lobyte of remainder
 .      | .                                                                   | .X = hibyte of remainder
 RNDB   | ```RNDB [low boundary byte];[high boundary byte]```                 | .A = pseudorandom number between
 .      | .                                                                   | [RETURN] = pseudorandom number between
 .      | .                                                                   | [RETLEN] = length of number (1 byte)
 SCAT   | ```SCAT [first string, lit or addr];[2nd string]```                 | .A = 1 if overflow err, else 0
 .      | .                                                                   | .X = lenth of concatenated string
 .      | .                                                                   | [RETURN] = concatenated string
 .      | .                                                                   | [RETLEN] = concatenated length 
 .      | .                                                                   | first string is replaced with concatenated!
 SCMP   | ```SCMP [first string, lit or addr];[2nd string]```                 | See full description for flag changes.    
 .      | .                                                                   | .Y = String 2 length
 .      | .                                                                   | .X = String 1 Length                      
 SCPOS  | ```SCPOS [col];[row]```                                             | Nothing
 SCPY   | ```SCPY [source string];[index];[length];[max length]```            | .CARRY will be 0 if no errors; else, 1
 .      |                                                                     | [RETURN] = copied substring
 .      | .                                                                   | [RETLEN] = return string length
 SDEL   | ```SDEL [string];[index];[length]```                                | .CARRY will be 0 if no errors; else, 1
 .      | .                                                                   | passed string will be altered!
 SECT   | ```SECT [sector number]```                                          | Nothing
 SETCX  | ```SETCX [col]```                                                   | Nothing
 SETCY  | ```SETCY [row]```                                                   | Nothing
 SETDR  | ```SETDR```                                                         | Nothing 
 SETDW  | ```SETDW```                                                         | Nothing 
 SINS   | ```SINS [parent string];[index];[max length];[substring to ins]```  | .CARRY = 0 if no errors; else, 1
 .      | .                                                                   | passed parent string will be altered!
 SLOT   | ```SLOT [slot number]```                                            | Nothing 
 SPOS   | ```SPOS [parent string];[substring]```                              | .A = index of substring if found; 0 if not
 .      | .                                                                   | [RETURN] = index of substring found; 0 if not
 .      | .                                                                   | [RETLEN] = byte length of [RETURN] (1)
 SPRN   | ```SPRN [string address]```                                         | .A = string length 
 SUB16  | ```SUB16 [minuend word];[subtrahend word]```                        | .Y = lobyte of result
 .      |                                                                     | .X = hibyte of result     
 .      | .                                                                   | [RETURN] = result
 .      | .                                                                   | [RETLEN] = result length (2 bytes)                
 TFILL  | ```TFILL [col start];[row start];[col end];[row end];[fill char]``` | Nothing Useful
 THLIN  | ```THLIN [col start];[col end];[row];[fill char]```                 | Nothing Useful
 TMODE  | ```TMODE```                                                         | Nothing
 TONUM  | ```TONUM [string to convert to number, addr or literal]```          | [RETURN] = number equivalent of string
 .      | .                                                                   | [RETLEN] = byte length of number (2)
 TPUT   | ```TPUT [xpos];[ypos];[fill character]```                           | Nothing 
 TRACK  | ```TRACK [track number]```                                          | Nothing 
 TOSTR  | ```TOSTR [number to convert to string]```                           | [RETURN] = string equivalent of number
 .      | .                                                                   | [RETLEN] = length of string returned (not yet)
 TVLIN  | ```TVLIN [row start];[row end];[column];[fill char]```              | Nothing Useful
 ZLOAD  | ```ZLOAD [address where backup is stored]```                        | Nothing
 ZSAVE  | ```ZSAVE [address to backup at]```                                  | Nothing  
 
---




