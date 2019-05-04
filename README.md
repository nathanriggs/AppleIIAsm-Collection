# AppleIIAsmLib

A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro.

---
## ATTENTION
This documentation is currently being updated to reflect massive changes between version 0.3 and the next release, 0.5. Generally, these updates are happening in the order of disks: STDIO, then COMMON, etc. Once this is finished, v0.5.0 will go live, and future updates will be piecemeal, by and large, rather than in large chunks. Until then, use the internal documentation (comments) for macro and subroutine usage.




---
## Table of Contents
* [Introduction](#introduction)
* [6502 Assembly Resources](#6502-assembly-resources)
* [Apple \]\[ Books and Resources](#apple-2-books-and-resources)
* [Related Github Projects](#related-github-projects)
* [Library Standard Conventions](#library-standard-conventions)
* [Documentation Practices](#documentation-practices)
* [Disk Overviews](#disk-overviews)
  * [Disk 1: STDIO](#disk-1-stdio)
  * [Disk 2: COMMON](#disk-2-common)
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
* [Detailed Descriptions: Macros](#detailed-macro-descriptions)
* [Detailed Descriptions: Subroutines](#detailed-subroutine-descriptions)

---
## Introduction

This is a general purpose library in 6502 Assembly for the Apple II. Originally, I began this project as research for a platform study of the Apple \]\[ system, learning Assembly for the first time. However, after speaking to a number of folk who are still actively involved in a community of enthusiasts, I noticed that there was no cohesive place for a first-time learner to find well-documented code, basic data structures and control loops, or even a good and intuitive listing of hooks for the system. There are plenty of books--some very old, some very new--that detail these things somewhat cohesively and are fantastic resources for beginners, but very few of them adequately serve as an good basis for understanding the platform as a whole. There are also many webpages out there dedicated to this matter--but as is the nature of the Internet, they are fractured resources that come and go at the blink of an eye. Thus, Apple\]\[AsmLib began.

Ultimately, my aim is to create a large enough collection of routines to address any domain of development for the Apple II family in Assembly while maintaining an ease of access to beginners that is hard to come by.  I'll do my best to acknowledge when a routine is inspired by (or mostly copied from) another source, and will exclude them from the Apache License 2.0 when necessary; I hope to replace anything of this sort with original work as I revise. If you find your own source here, but would rather it not be here, please reach out to me and I'll remove it immediately.

---
## 6502 Assembly Resources

As someone who spends a _lot_ of time thinking about, writing about, and teaching different facets of technical writing (in its broadest sense), I can confirm the following: there are thousands of books written about the 6502 architecture and Assembly programming. I can also confirm that these books--as well as most websites--tend to approach the subject from a "writerly" position rather than a reader-centered one; that is, it's written for engineers and computer scientists who have already spent a lot of time and money understanding the theory, learning the jargon, and training themselves to be able to do things by muscle memory. That's great for established engineers, mathemeticians, computer scientists and the like, as well as those who can afford to dedicate years of their lives (and again, gobs of $$$) to obtain a degree that qualifies them as entry level in the field. It is not so great, however, for beginners, hobbyists, or those trying to study it from a non-engineering theoretical perspective. That is, at least, part of the gap I am hoping to fill.

That said, I myself would have failed quite readily without at least a few key texts and websites, and it would be remiss to not list them here. And if you're committed to learning this, know that there is no good replacement to sitting down, typing out a listing from a book, compiling and then trying to figure out what the hell you just did--or what you did wrong! There is no doing without learning, and there is no learning without doing; but maybe these can help.

### Books

* Roger Wagner, Chris Torrence. [_Assembly Lines: The Complete Book_](https://www.amazon.com/Assembly-Lines-Complete-Roger-Wagner/dp/1312089407/). May 10, 2017.
* Lance A. Leventhal, Winthrop Saville. _6502 Assembly Language Subroutines_. 1982.
* Don Lancaster. _Assembly Cookbook for the Apple II, IIe_. 1984, 2011.
* Mark Andrews. _Apple Roots: Assembly Language Programming for the Apple IIe and IIc. 1986.
* CW Finley, Jr., Roy E. Meyers. _Assembly Language for the Applesoft Programmer_. 1984.
* Randy Hyde. _Using 6502 Assembly Language_. 1981.
* Glen Bredon. _Merlin Pro Instruction Manual_. 1984.
* JS Anderson. _Microprocessor Technology_. 1994. (also covers z80 architecture)

### Websites

* [CodeBase64](http://codebase64.org/doku.php)
* [6502.org](http://www.6502.org/)
* [Easy6502](http://skilldrick.github.io/easy6502/)

---
## Apple 2 Books and Resources

More books have been written over the past forty years than could be read within a reasonable timeframe. However, I have found some books more fruitful than others in understanding both the technical aspects of the Apple \]\[ as well as the cultural ones. If you know of any essential books or websites that are missing here, by all means get in touch or contribute it here yourself!

### Books

* Bill Martens, Brian Wiser, William F. Luebbert, Phil Daley. [_What's Where in the Apple, Enhanced Edition: A Complete Guide to the Apple \]\[ Computer_.](https://www.amazon.com/gp/product/136517364X/) October 11, 2016.
* David Flannigan. [_The New Apple II Users' Guide_](https://www.amazon.com/gp/product/0615639879/). June 6, 2012.
* David L. Craddock. [_Break Out: How the Apple II Launched the PC Gaming Revolution_](https://www.amazon.com/gp/product/0764353225/). September 28, 2017.
* Steven Weyhrich. [_Sophistication & Simplicity: The Life and Times of the Apple II Computer_](https://www.amazon.com/gp/product/0986832278/). December 1, 2013.
* Ken Williams, Bob Kernagham, Lisa Kernagham. [_Apple II Computer Graphics_](https://www.amazon.com/gp/product/B01FIXG7ZK/). November 3, 1983.
* Lon Poole. [_Apple II Users' Guide_.](https://www.amazon.com/gp/product/0931988462/). 1981.
* Jeffrey Stanton. _Apple Graphics and Arcade Game Design_. 1982.
* Apple. _Apple Monitors Peeled_. 1981.
* Apple. _Apple II/IIe/IIc/IIgs Technical Reference Manual. 

### Web Resources

* [Apple II Text Files](http://textfiles.com/apple/.windex.html)
* [Apple II Programming](http://apple2.org.za/gswv/a2zine/faqs/csa2pfaq.html)
* [The Asimov Software Archive](https://ftp.apple.asimov.net/)
* [Apple II Online](https://apple2online.com/index.php)
* [Juiced.GS: A Quarterly Apple II Journal](https://juiced.gs/)

---
### Related Github Projects

A number of folk are doing work on 6502 or the Apple II on GitHub. While I cannot possibly list each and every one (that's what the search function is for!), these are projects I have found particularly useful, informative, entertaining, or inspiring.

* [Prince of Persia Apple II Source Code](https://github.com/fabiensanglard/Prince-of-Persia-Apple-II), by Jordan Mechner
* [WeeGUI, a small gui for the Apple II](https://github.com/blondie7575/WeeGUI)
* [Two-lines or less Applesoft programs](https://github.com/thelbane/Apple-II-Programs) -- a lot can be accomplished!
* [Doss33FSProgs](https://github.com/deater/dos33fsprogs), programs for manipulating the DOS 3.3 filesystem
* [ADTPro](https://github.com/ADTPro/adtpro), a requirement for anyone working with real Apple II hardware today.
* [CC65](https://github.com/cc65), a modern cross-compiling C compiler and assembler for 6502 systems.
* [PLASMA: The Proto-Language Assembler for All](https://github.com/dschmenk/PLASMA) -- this was originally written for the Apple II alone, but has recently expanded to other systems.

---
## Library Standard Conventions

### Includes

Each sub-library will have a hooks file, a var file, and a mac file. All subroutines within that sub-library will require the hooks file to be included at the top of the main listing, and the var file included directly before including the subroutine (usually at the end of the main program). Additionally, every subroutine requires the use of the required header file, required library file, and required var file.

* HOOKS files: these include various hooks that are used by the sub-library's subroutines. Additional hooks that may be used by the end programmer are commented out.
* VAR files: these carry temporarily labeled variables and equates for the sub-library's operation. All subroutines use the variables defined here rather than create their own. Note that because the labels are temporary, it is necessary to include the var file directly before including the subroutines in question.
* MAC files: the macros for a given sub-library are included here, and are included by the "USE" pseudo-op rather than PUT.
* HEAD file: The required library uses a header file that all sub-libraries and subroutines rely on. This should be included directly after setting the memory address.
* LIB file: the required library comes in a single package rather than in separate subroutines. This must be included prior to the inclusion of other sub-libraries.

### Naming Conventions

#### Filenames

Given the lack of directory structures in DOS 3.3, we are using a filename precursed extension system. The extensions should be applied to a filename in this order:

* MIN: signifies that the code has been stripped of comments
* SUB: signifies that the file holds a subroutine
* MAC: signifies a collection of macros
* LIB: signifies a collection of subroutines
* \<FILENAME\>: the actual name of the subroutine, macro, our other file.
* DEMO: signifies that the program is a sub-library demo
 
 Additionally, Merlin Appends a ".S" to the end of a filename if it is saved as a source, and prepends the file with "T." to signify it being a text file. This prepended T. overrides our own naming conventions.
 
 *Sample Filenames*
 
 * T.MIN.MAC.STDIO
 * T.SUB.TFILLA
 * T.MIN.LIB.REQUIRED
 * STDIO.DEMO.S

#### Variables

In Merlin 8 Pro, assembler variables are preceded by a ] sign. These variables are temporarily assigned, and can be overwritten further down in the code. Unless highly impractical, constant hooks should use native assembly's system of assigning labels (just the label), as should hook entry points. The exception to this is within macro files, as these could easily lead to label conflicts.

#### Local Hooks

Local labels are preceded by a : sign in Merlin Pro 8. When at all possible, local subroutines should have local labels. This does not apply to Merlin variables.

#### Macros

Macros should named with regard to mneumonic function, when possible, and should not exceed five characters unless absolutely necessary. Additionally, macros may use the following prefixes to signify their classification:

* @: signifies a higher-level control structure, such as @IF,@ELSE,@IFX.
* \_: signifies a macro mostly meant to be used internally, though it may have limited use outside of that context.

### Subroutine Independence

Beyond needing the core required library files as well as the hook and variable files for the library category in question, a subroutine should be able to operate independently of other subroutines in the library. This will generally mean some wasted bytes here and there, but this can be remedied by the end programmer if code size is a major concern.

### Control Structures

While a number of helpful, higher-level control structures are included as part of the core required library, subroutines in the library itself should refrain from using this shorthand. Control Structure Macros are preceded with a '@' sign to signify their classification as such. Exceptions can be given to control structures that merely extend existing directives for better use, such as BEQL being used to branch beyond the normal byte limit; such macros forego the preceding @-sign. 

### Parameter Passing

As a rule of thump, if more than three bytes are being passed to a subroutine, it happens via pushing those parameters to the stack. Otherwise, the .A, .X, and .Y registers are used. When passing an address or other 16-bit value, the low byte should be put into register .A, and the high byte in register .X.

### Literal and Indirect Passing

All macros should accept either a literal value (\#) or an indirect reference via simply passing the address that holds another address. The required macro library sorts out which value will be passed to the subroutine at assembly-time.

---
## Documentation Practices

### Internal Documentation

Internal documentation is the documentation that resides within the code itself.

**Inline Comments**

For the sake of beginners, *at least* every other directive should have an inline comment that describes what that line, or two lines, is accomplishing. Inline comments are added at the end of a line with a semicolon to denote the comment.

**Subroutine Headers**

All subroutines require headers that document its input, output, register and memory destructions, minimum number of cycles used, and the size of the subroutine in bytes.

**Other Comments**

If a section of code needs more explanation than can be explained at the end of a line (a common issue, since there is limited space on the Apple II screen), these should be placed just above the code in question using asterisks to denote the line is a comment. Have a blank comment line before and after the comment with only one asterisk, while using two asterisks for the lines with actual comments.

### External Documentation

External documentation refers to this document.

Every Macro and subroutine should have an entry in the the table of contents, cheat sheet area, calls and clobbers list, and detailed descriptions. Detailed descriptions should include the information in the tables as well as a more abstract description of what the subroutine accomplishes, and how it does so. Indented copy of the code in question may also be presented for easier reference than supplied by Merin 8 Pro.

**ALL DOCUMENTATION SHOULD BE UPDATED WITH ANY REVISION, BOTH INTERNAL AND EXTERNAL, AFTER VERSION 0.5.0**

---
## Disk Overviews

Each disk contains a single Macro (.mac) file, one or more subroutine files related to the overarching theme of the disk, and a "minified" version of the mac and subroutine files that the entire library relies upon. Additionally, each library has a correlating .hooks file for declaring useful hooks at the beginning of a program used in that library's operations, as well as a variable file that must be included with any subroutine's inclusion into the main listing.

In the following disk descriptions, we'll be listing the .mac contents that are relevant to the theme of the disk only, as many of the macros are calls to single subroutines. A table in section XXX lists the calls each macro makes to each subroutine, and the same information can be obtained from the detailed descriptions of macros and subroutines.

### Disk 1: STDIO

This disk is dedicated to Standard Input/Output operations, and a couple non-standard ones. Note that this is for 40-column mode only in order to keep compatibility with earlier hardware, and focuses on screen output alone in order to help with execution speed. However, most of these subroutines will work in 80col mode, with the exception of those that directly read or write the screen memory.

* MAC.STDIO
  * [`COL40`](#col40): Force 40-column mode
  * [`COL80`](#col80): Force 80-column mode
  * [`CURB`](#curb): Move Cursor Backward by [n] spaces
  * [`CURD`](#curd): Move Cursor Down by [n] spaces
  * [`CURF`](#curf): Move Cursor Forward by [n] spaces
  * [`CURU`](#curu): Move Cursor Up by [n] spaces
  * [`GKEY`](#gkey): Monitor Getkey
  * [`INP`](#inp): String Input Macro
  * [`MTXT0`](#mtxt0): Turn off mouse text
  * [`MTXT1`](#mtxt1): Enable mouse text
  * [`PBX`](#pbx): Read State of Paddle Button [x]
  * [`PDL`](#pdl): Read Current Paddle State
  * [`PRN`](#prn): Flexible (screen) Printing routine
  * [`RCPOS`](#rcpos): Read Cursor Position
  * [`SCPOS`](#scpos): Set Cursor position at [x],[y]
  * [`SETCX`](#setcx): Set Cursor Horizontal Position
  * [`SETCY`](#setcy): Set Cursor Vertical Position
  * [`SPRN`](#sprn): Print String (with length byte)
  * [`TCIRC`](#tcirc): Text circle (Bressenham algo)
  * [`TFILL`](#tfill): Text Fill square [x1],[x2],[y1],[y2] with Character [n]
  * [`THLIN`](#thlin): Text Horizontal Line Fill with Character [n]
  * [`TLINE`](#tline): Text diagonal line with fill character (Bressenham algo)
  * [`TPUT`](#tput): Direct memory text plotting routine
  * [`TVLIN`](#tvlin): Text Vertical Line Fill with Character [n]
  * [`WAIT`](#wait): non-monitor getkey
  
### Disk 2: COMMON 

This disk is dedicated to common and useful subroutines that don't necessarily fit neatly into another category worth dedicating an entire disk to, as well as the fully commented code for the required libraries and macros that exist on every disk in minified form.

* MAC.COMMON
  * [`BEEP`](#beep): Beep for a given number of cycles.
  * [`DELAY`](#delay): Delay for the given number of Milliseconds.
  * [`MFILL`](#mfill): Fill a block of memory with the passed value.
  * [`MMOVE`](#mmove): Move a block of memory to another block of memory.
  * [`MSWAP`](#mswap): Swap a memory range at one address with another.
  * [`ZLOAD`](#zload): Retrieve previously save zero page values from a given address and restore them to the zero page. 
  * [`ZSAVE`](#zsave): Save the zero page memory locations not used by applesoft, dos, etc. to another memory location.
    
* MAC.REQUIRED
  * [`_AXLIT`](#_axlit): Check for literal. Pass data via .AX.
  * [`_AXSTR`](#_axstr): Check for String. Pass data via .AX registers.
  * [`BCCL`](#bccl): Branch Carry Clear Long Instruction
  * [`BCSL`](#bcsl): Branch Carry Set Long Instruction
  * [`BEQL`](#beql): Branch on Equal Long Instruction
  * [`BNEL`](#bnel): Branch on Not Equal Long Instruction
  * [`CLRHI`](#clrhi): Clear High Nibble of a Byte.
  * [`DUMP`](#dump): Dump the contents of a block of memory. This displays hex values only, and is primarily useful for debugging.
  * [`ERRH`](#errh): Set Error-handling hook
  * [`GRET`](#gret): Get Return. Transfer the contents of the [RETURN] register to another memory location.
  * [`_ISLIT`](#_islit): Is Literal. Tests a parameter to see if it is a literal value or an address. Passes via stack.
  * [`_ISSTR`](#_isstr): Is String. Tests a parameter to see if it is a literal string. Passes via stack.
  * [`_PRN`](#_prn): A standard print routine that mirrors that found in STDIO. This, too, is used mostly for debugging.
  * [`SPAR`](#spar): Set Parameter. Transfer the contents of one memory location or a literal to the [PARAM] register.
  * [`_WAIT`](#_wait): A simple routine that waits for a keypress. Again, useful for debugging.
  * [`@IF`](#if): A higher-level conditional control structure that tests memory locations
  * [`@ELSE`](#else): a typical higher-level else statement.
  * [`@IFX`](#ifx): typical "end if"
  * [`@RIF`](#rif): A higher-level conditional control structure that tests the registers.
  * [`@RELSE`](#relse): Higher level else statement that refers to the registers.
  * [`@RIFX`](#rifx): End If, but with registers now.
  * [`@WHILE`](#whil): Start a while loop.
  * [`@WHILEX`](#whilx): end a while loop.
  * [`@FORX`](#for): a for loop using the X register as the counter
  * [`@NEXTX`](#forx): end a .X register for loop
  * [`@FORY`](#fory): a for loop using the Y register as the counter
  * [`@NEXTY`](#nexty): end a .Y register loop
  * [`@FORM`](#form): a for loop using a memory location
  * [`@NEXTM`](#nextm): end a memloc for loop
  * [`@CASE`](#case): a typical higher-level case statement start
  * [`@OF`](#of): internal "case of" equivalent
  * [`@CASEX`](#casex): end case statement
  
### Disk 3: Arrays

This disk contains libraries and subroutines related to the management of 8-bit and 16-bit one-dimensional and two-dimensional arrays that hold n-length elements. "8-bit" and "16-bit" refers to the number of elements the arrays can hold.

* MAC.ARRAYS
  * `DIM81`: Create a 1D, 8-bit array at a given address with a given element size and number of elements.
  * `DIM82`: Create a 2D, 8-bit array at a given address with a given element size and number of elements in each dimension.
  * `DIM161`: Create a 1D, 16-bit array.
  * `DIM162`: Create a 2D, 16-bit array.
  * `GET81`: Get the element at the given index in a 1D, 8-bit array.
  * `GET82`: Get the element at the given index in a 2D, 8-bit array.
  * `GET161`: Get an element from a 1D, 16-bit array.
  * `GET162`: Get an element from a 2D, 16-bit array.
  * `PUT81`: Put a value (literal or memory address) into a 1D, 8-bit array at the given index.
  * `PUT82`: Put a value into a 2D,8-bit array at the given index.
  * `PUT161`: Put a value into a 1D, 16-bit array.
  * `PUT162`: Put a value into a 2D, 16-bit array.

### Disk 4: Math

This disk hold routines related to standard mathematical calculations for signed and unsigned integer math; macros for using Woz's floating-point math routines will be added in the future. Note that this only includes some rather basic math functions; more complicated problems should be addressed by the main program using the libraries.

* MAC.MATH
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
  
### Disk 5: Strings

This disk holds routines and macros related to string and substring manipulation. In the future, certain tasks like "TONUM" and "TOSTR" may be relegated to their own disk for data type conversion routines.

* MAC.STRINGS
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

* MAC.FILEIO
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

### Disk 7: Conversion

This sub-library is dedicated to converting between different number types and their string equivalents. 

* MAC.CONVERT
  * `ASCBIN`: Binary String to equivalent number.
  * `ASCHEX`: Binary Hexadecimal to equivalent number.
  * `ASCINT`: Binary Integer to equivalent number.
  * `BINASC`: Number to Binary String.
  * `HEXASC`: Number to Hexadecimal String.
  * `INTASC`: Number to Integer String.
  * `ZTRSTR`: Null terminated string to indexed string
  
---
  
### Disk 8: LoRes (not yet implemented)

This is a sub-library for using lower resolution graphics mode at a higher speed than is provided by Woz's routines.

* MAC.LORES
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

### Disk 9: SPEAKER (not yet implemented)

A library dedicated to sound manipulation on the system speaker.

* MAC.SPEAKER
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
  * `SQKEY`: Set the keypress to signal the library to halt playing a note.
  * `SPLOD`: a sound effect resembling an explosion sound. Customizeable via parameters.
  * `SPLAY`: play a sequence of given notes found at a given memory address. Follows same sequence as `SNOTE` parameters, ending with #00.
  * `SALRM`: play an alarm sound.
  * `SLAZE`: play a lazer sound at a specific frequency.

### Disk 10: HiRes (not yet implemented)

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

### Disk 11: OtherIO (not yet implemented)

* library for interfacing with a printer.~~
  * `PINIT`: Printer Detect and Initialize.~~
  * `PPRNC`: Print a single Character on the Printer.~~
  * `PPRNL`: Print a line of text on the printer.~~
  * `PPUT`: Print a single dot on the printer.~~
  * `PLBLK`: Print a block of low-res graphics at a given memory location to the printer.~~
  * `PHBLK`: Print a block of high resolution graphics at a given memory location on the printer.~~  
* library for sending and receiving data over the serial port~~
  * `SSEND`: Serial send bit/byte.~~
  * `SRECV`: Serial Receive bit/byte.~~
  * `SLSTN`: Listen to serial and wait for data for continuing.~~

### Disk 12: SortSearch (not yet implemented)

  * BSORT: Bubble Sort
  * ISORT: Insertion Sort
  * MSORT: Merge Sort
  * QSORT: Quick Sort
  * SSORT: Selection Sort
  * BSRCH: Binary Search
    
### Disk 13: TmenusTwindows (partially implemented)


### Disk 14: 80Col

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
* 80to40.mac: a simple set of macros that calls the 80-column macros when 40-column macros are invoked. Obviously, the 40-column stdio.mac cannot be used simultaneously.

### Disk 15: MOCKINGBOARD


### Disk 16: DblLoRes

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

### Disk 17: DblHiRes

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
    
### Disk 18: DemosUtilities1

* builder.bas: A utility that automatically builds custom libraries by copying routines from the appropriate disks, commented or minified.
* makeexec.bas
* minify.bas
* BUILDER
* MAKEEXEC
* MINIFY

### Disk 19: Demo Builds 1

* disk(s) with demos that show more complicated usage of the libraries, integrating them as each demo needs. 
  * MAKEMAZE: A fairly simple maze creation demo. Can only create square mazes.
  * READFILE
  * SKIDOWN
  * GAMEOFLIFE

### Disk 20: Demo Builds 2

* disk(s) with demos that show more complicated usage of the libraries, integrating them as each demo needs. 
  * MAKEMAZE: A fairly simple maze creation demo. Can only create square mazes.
  * READFILE
  * SKIDOWN
  * GAMEOFLIFE

### Disk 21: MiniDisk A

A disk with minified versions of the source files of disks 1-7. This is primarily used by the library-building utility.


---
## Macro Subroutine Calls and Clobbers

The following table shows which subroutines each Macro calls, along with the resulting registers, flags, and memory locations clobbered. This is up to date for version 0.3.0. Note that by "clobbered" here, I don't mean that the register or memory location has trash in it; it's just been altered in some way. For list of what useful imformation is passed after a Macro is executed, see [the cheat sheet](#macro-usage-cheat-sheet).

If a memory alteration is indicated by a [PASS], it means that the memory area that was passed to the macro was altered.

 MACRO  | SUBROUTINES CALLED         | FLAGS ALTERED | REGS ALTERED | MEM ALTERED  
 ------ | -------------------------- |:-------------:|:------------:| ----------- 
 @IF    |                            |               |              |
 @ELSE  |                            |               |              |
 @IFX   |                            |               |              |
 @RIF   |                            |               |              |
 @RELSE |                            |               |              |
 @RIFX  |                            |               |              |
 @WHILE |                            |               |              |
 @WHILEX|                            |               |              |
 @FORX  |                            |               |              |
 @NEXTX |                            |               |              |
 @FORY  |                            |               |              |
 @NEXTY |                            |               |              |
 @FORM  |                            |               |              |
 @NEXTM |                            |               |              |
 @CASE  |                            |               |              |
 @OF    |                            |               |              |
 @CASEX |                            |               |              |
 \_AXLIT |                            |               |              |
 \_AXSTR |                            |               |              |
 \_DUMP  | \_\_DUMP                     |               |              |                   
 \_ISLIT | None                       |               |              |                   
 \_ISSTR | None                       |               |              |                   
 \_PRNT  | \_\_P                        |               |              |                   
 \_WAIT  | \_\_W                        |               |              |                   
 ADD16  | ADDIT16                    |               |              |
 ASCBIN |                            |               |              |
 ASCHEX |                            |               |              | 
 ASCINT |                            |               |              |
 AMODE  | None                       |               |              |
 BEEP   | None (BELL)                |               |              |
 BINASC |                            |               |              |
 BLOAD  | BINLOAD                    |               |              |
 BSAVE  | BINSAVE                    |               |              |
 CLRHI  |                            |               |              |
 CMD    | DOSCMD                     |               |              |
 CMP16  | COMP16                     |               |              |
 COL40  |                            |               |              |
 COL80  |                            |               |              |
 CURB   | CURSBAK                    |               |              |                   
 CURD   | CURSDN                     |               |              |                   
 CURF   | CURSFOR                    |               |              |                   
 CURU   | CURSUP                     |               |              |                   
 DBUFF  | None                       |               |              |
 DELAY  | DELAYMS                    |               |              |
 DIE80  |                            |               |              |
 DIM81  | ADIM81                     |               |              |
 DIM82  | ADIM82                     |               |              |
 DIM161 |                            |               |              |
 DIM162 |                            |               |              |
 DIV8   | DIVD8                      |               |              |
 DIV16  | SDIV16,UDIV16              |               |              |
 DRIVE  | None                       |               |              |
 DRWTS  | DISKOP                     |               |              |
 ERRH   |                            |               |              |
 FINP   | FINPUT                     |               |              |
 FPRN   | FPRINT,FPSTR               |               |              |
 GET81  | AGET81                     |               |              |
 GET82  | AGET82                     |               |              |
 GET161 |                            |               |              |
 GET162 |                            |               |              |
 GKEY   | None (GETKEY)              |               |              | 
 GRET   | \_\_GETRET                   |               |              |                   
 HEXASC |                            |               |              |
 INP    | SINPUT                     |               |              |                   
 INTASC |                            |               |              |
 MFILL  | MEMFILL                    |               |              |
 MMOVE  | MEMMOVE                    |               |              |
 MSWAP  | MEMSWAP                    |               |              |
 MTXT0  |                            |               |              |
 MTXT1  |                            |               |              |
 MUL8   | MULT8                      |               |              |
 MUL16  | MULT16                     |               |              |
 PBX    | GPBX                       |               |              |                   
 PCR    | None (COUT1)               |               |              |                   
 PDL    | None (PREAD)               |               |              |                   
 PRN    | XPRINT,DPRINT              |               |              |                   
 PUT81  | APUT81                     |               |              |
 PUT82  | APUT82                     |               |              |
 PUT161 |                            |               |              |
 PUT162 |                            |               |              |
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
 SPAR   | \_\_SETPARM                  |               |              |                   
 SPOS   | SUBPOS                     |               |              |                   
 SPRN   | PRNSTR                     |               |              |                   
 SUB16  | SUBT16                     |               |              |
 TCIRC  |                            |               |              | 
 TFILL  | TFILLA                     |               |              |                   
 THLIN  | THLINE                     |               |              |
 TLINE  |                            |               |              |
 TPUT   | TXTPUT                     |               |              |
 TONUM  | STR2NUM                    |               |              |                   
 TOSTR  | NUM2STR                    |               |              |                   
 TRACK  | None                       |               |              |
 TVLIN  | TVLINE                     |               |              |           
 WAIT   |                            |               |              |
 ZLOAD  | ZMLOAD                     |               |              | 
 ZSAVE  | ZMSAVE                     |               |              |
 
---

## Macro Usage Cheat Sheet

Once Macros are mostly finished in how they are called, you can find how to use them here. New versions, of course, always run the risk of changing something integral; This cheat sheet will be updated accordingly.


 MACRO  | USAGE                                                               | OUTPUT
 ------ | ------------------------------------------------------------------- | ----------------------------------- 
 @IF    |                                                                     |
 @ELSE  |                                                                     |
 @IFX   |                                                                     |
 @RIF   |                                                                     |
 @RELSE |                                                                     |
 @RIFX  |                                                                     |
 @WHILE |                                                                     |
 @WHILEX|                                                                     |
 @FORX  |                                                                     |
 @NEXTX |                                                                     |
 @FORY  |                                                                     |
 @NEXTY |                                                                     |
 @FORM  |                                                                     |
 @NEXTM |                                                                     |
 @CASE  |                                                                     |
 @OF    |                                                                     |
 @CASEX |                                                                     |
 \_AXLIT |                                                                     |
 \_AXSTR |                                                                     |
 \_ISLIT | ```_ISLIT [data]```                                                 | inserts executable code at pointer                
 \_ISSTR | ```_ISSTR [data]```                                                 | inserts executable code at pointer
 \_PRNT  | ```_PRNT [string or address]```                                     | prints provided literal string                 
 \_WAIT  | ```_WAIT```                                                         | Nothing; wait for keypress.
 ADD16  | ```ADD16 [word 1];[word 2] ```                                      | .Y = lobyte of sum
 .      | .                                                                   | .X = hibyte of sum
 .      | .                                                                   | [RETURN] = sum
 .      | .                                                                   | [RETLEN] = length of sum (2 bytes)
 ASCBIN |                                                                     |
 ASCHEX |                                                                     |
 ASCINT |                                                                     |
 BEEP   | ```BEEP [number of beep calls]```                                   | Nothing; just speaker output   
 BINASC |                                                                     |
 BLOAD  | ```BLOAD [dos command parameters]```                                | Nothing; just disk input
 BSAVE  | ```BSAVE [dos command parameters]```                                | Nothing; just disk output
 CLRHI  |                                                                     |
 CMD    | ```CMD [dos command with parameters]```                             | Nothing, save for changes done by command
 CMP16  | ```CMP16 [word 1];[word 2]```                                       | See full description for flag changes.
 COL40  | ```COL40```                                                         | Set 40-Column mode.
 COL80  | ```COL80```                                                         | Set 80-Column mode.
 CURB   | ```CURB [spaces to move back]```                                    | Nothing
 CURD   | ```CURD [spaces to move down]```                                    | Nothing
 CURF   | ```CURF [spaces to move forward]```                                 | Nothing
 CURU   | ```CURU [spaces to move up]```                                      | Nothing
 DBUFF  | ```DBUFF [buffer address]```                                        | Nothing
 DELAY  | ```DELAY [number of milliseconds to delay]```                       | Nothing; just execution delay  
 DIE80  | ```DIE80```                                                         | Kill 80-column firmware
 DIM81  | ```DIM81 [array address];[# of elements];[element byte length]```   | [RETURN] = total array size in bytes
 .      | .                                                                   | [RETLEN] = length of [RETURN] val
 DIM82  | ```DIM82 [array addr];[# of cols];[# of rows];[elem byte length]``` | [RETURN] = total array size in bytes
 .      | .                                                                   | [RETLEN] = length of [RETURN] val
 DIM161 |                                                                     |
 DIM162 |                                                                     |
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
 DUMP  | ```_DUMP [memory address];[# of bytes to dump]```                   | Nothing; dump to screen
 ERRH   |                                                                     |
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
 GET161 |                                                                     | 
 GET162 |                                                                     | 
 GKEY   | ```GKEY```                                                          | .A = key pressed
 GRET  | ```_GRET [dest memory address]```                                   | [return] stored in specified address
 HEXASC |                                                                     |
 INASC  |                                                                     |
 INP    | ```INP```                                                           | [RETURN] = string entered by user
 .      | .                                                                   | [RETLEN] = string length (same as first byte of [RETURN], +1)
 .      | .                                                                   | .X, .Y = length of string
 MFILL  | ```MFILL [address start];[length in bytes];[fill value]```          | Nothing useful       
 MMOVE  | ```MMOVE [src addr];[dest addr];[length in bytes]```                | Nothing useful
 MSWAP  | ```MSWAP [first address];[second address];[length]```               | Nothing 
 MTXT0  | ```MTXT0```                                                         | Turn off MouseText
 MTXT1  | ```MTXT1```                                                         | Turn on MouseText
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
 PUT161 | ```PUT161 [src addr];[array addr];[16-bit element index]```         |
 PUT162 | ```PUT162 [src addr];[array addr];[16-bit col index];[16-bit row]```|
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
 SPAR  | ```_SPAR [src address];[length]```                                  | moves data at address to [param]                      
 SPOS   | ```SPOS [parent string];[substring]```                              | .A = index of substring if found; 0 if not
 .      | .                                                                   | [RETURN] = index of substring found; 0 if not
 .      | .                                                                   | [RETLEN] = byte length of [RETURN] (1)
 SPRN   | ```SPRN [string address]```                                         | .A = string length 
 SUB16  | ```SUB16 [minuend word];[subtrahend word]```                        | .Y = lobyte of result
 .      |                                                                     | .X = hibyte of result     
 .      | .                                                                   | [RETURN] = result
 .      | .                                                                   | [RETLEN] = result length (2 bytes)                
 TCIRC  |                                                                     |
 TFILL  | ```TFILL [col start];[row start];[col end];[row end];[fill char]``` | Nothing Useful
 THLIN  | ```THLIN [col start];[col end];[row];[fill char]```                 | Nothing Useful
 TLINE  |                                                                     |
 TMODE  | ```TMODE```                                                         | Nothing
 TONUM  | ```TONUM [string to convert to number, addr or literal]```          | [RETURN] = number equivalent of string
 .      | .                                                                   | [RETLEN] = byte length of number (2)
 TPUT   | ```TPUT [xpos];[ypos];[fill character]```                           | Nothing 
 TRACK  | ```TRACK [track number]```                                          | Nothing 
 TOSTR  | ```TOSTR [number to convert to string]```                           | [RETURN] = string equivalent of number
 .      | .                                                                   | [RETLEN] = length of string returned (not yet)
 TVLIN  | ```TVLIN [row start];[row end];[column];[fill char]```              | Nothing Useful
 WAIT   |                                                                     |
 ZLOAD  | ```ZLOAD [address where backup is stored]```                        | Nothing
 ZSAVE  | ```ZSAVE [address to backup at]```                                  | Nothing  
 
---
## Detailed Macro Descriptions




---
## Detailed Subroutine Description



