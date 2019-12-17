## Preface   

This is the first complete reference manual for the _AppleIIAsm_ macro and subroutine library collection. Currently, this collection is in the alpha stages of development: not all disks are complete, there may be some bugs here and there, and major workflow decisions might still be in flux. However, this version, 0.7.0, represents a major step forward in functionality, optimization and standardization, and at least for what is complete---the first eleven disks, the technical manual, AppleChop introduction  as well as some demos---the collection can be reasonably considered to be stable. That does not, of course, mean that there are any guarantees.

I started this project as research into how the Apple II works as a platform for another book I am writing, and eventually became interested in the cohesive technical documentation (or sometimes lack thereof) that was available to beginning coders in the heyday of the Apple II as well as those looking to learn Apple II (6502) Assembly today. Having no prior experience with Assembly language, I began coding these libraries as part of my own learning process while trying to write subroutines that provided much of the functionality afforded by Applesoft BASIC. Eventually, this became a beast of its own, and what you’re reading here is (part) of the result.

As the libraries grow and morph, so will this document. If nothing else, I hope that the collection and its accompanying documentation helps hobbyists, researchers, and otherwise self-hating hopeless nerds learn and accomplish what they want or need---at least as much as it has helped, and harmed, me.



Nathan Riggs

 

 

 

 

 

 

 

 

 

 

 

## Introduction

The AppleIIAsm Library Collection is an array of subroutines and macros for the Apple II line of computers, aimed at providing a stable set of assembly routines for most common tasks. Additionally, this library is meant to ease the transition between programming in Applesoft BASIC and 6502 Assembly by not only providing the basic data structures and functions found in higher-level languages but also by providing a set a macros—currently dubbed AppleChop—that simulates the design and workflow of BASIC. A companion booklet to this library, *From Applesoft to AppleChop and Assembly,* provides a framework for making that transition.

These subroutines and macros are written for the Merlin 8 Pro  assembler, which should run on any Apple II with 64k of memory (programs assembled with Merlin 8 Pro will run on machines with less than 64k, however). Since we are using 6502 Assembly here, however, it should not be too difficult to port the subroutines to other assemblers and even other systems like the Commodore 64, Nintendo Entertainment System, BBC Micro, and more. For a guide on using the Merlin Pro 8 Assembler, see the other companion booklet, *The New Merlin Pro 8 User Guide*.

It should be noted that the core libraries in this collection---those on disks one to eleven---should be compatible with every iteration of the Apple II family, from the original Apple II in 1977 to the Apple IIGS in 1986. Disks beyond that core collection are considered bonus disks, and are dedicated to either creating libraries for specialized hardware (such as much of the IIGS, or the Mockingboard) or are there to serve as more complicated and integrated demos for the user to peruse. 

**Who is this manual for?**

The primary audience for this manual is someone who is already familiar with 6502 Assembly or is at least trying to learn it; that is, novices. Like all manuals, this is primarily a reference: beyond this introduction and early sections of Part I, this manual is not meant to be read straight through. Feel free to flip back and forth as you wish!

**Who is this manual NOT for?**

This manual is definitely not for someone completely unexposed to Assembly language,, but nor is it really aimed at 6502 experts. The collection itself can be used by beginner and expert alike, but whereas this manual would likely confuse the absolute beginner, an expert interested in optimizing their work (and these subroutines) will not find much help here. For those well-versed in 6502 Assembly, this collection might better serve as a prototyping system that then gets torn apart and optimized; for those barely versed in 6502 Assembly, this collection, and especially the AppleChop library, this collection will best serve to ease the transition between a standard knowedge of BASIC and the quirks of Assembly language (commenting is excessive in the libraries for this very reason). Both extremes may find this collection useful, but for wildly different reasons.

As someone who spends a *lot* of time thinking about, writing about, and teaching different facets of technical writing (in its broadest sense), I can confirm the following: there are thousands of books written about the 6502 architecture and Assembly programming. I can also confirm that these books---as well as most websites---tend to approach the subject from a "writerly" position rather than a reader-centered one; that is, written for engineers and computer scientists who have already spent a lot of time and money understanding the theory, learning the jargon, and training themselves to be able to do things by muscle memory. That's great for established engineers, mathematicians, computer scientists and the like, as well as those who can afford to dedicate years of their lives (and again, gobs of $$$) to obtain a degree that qualifies them as entry level in the field. It is not so great, however, for beginners, hobbyists, or those trying to study it from a non-engineering theoretical perspective. That is, at least, part of the gap I am hoping to fill; after all, this book is part of my research for writing another book aimed at a non-technical audience.

That said, I myself would have failed quite readily without at least a few key texts and websites, and it would be remiss to not list them here. And if you're committed to learning this, know that there is no good replacement to sitting down, typing out a listing from a book, assembling it and then trying to figure out what the hell you just did---or what you did wrong! There is no doing without learning, and there is no learning without doing. At risk of pontificting, I believe many of us have forgotten this mantra, and the internet has not helped matters. 

**Why Merlin Pro 8? Why not something...modern?**

Understanding how coding for a specific platform and a specific era works is not merely a matter of knowledge, but a matter of practice. Much of the way development happens, in computer software or not, is predicated on the apparatus in place that allows for it. Changing that apparatus, whether it be adding modern components like multiple open files, faster assembly, easier access and legibility and so on changes your understanding of how everything worked (and works). Especially with an ancient (and largely obsolete) language like 6502 assembly, few people are learning it to accomplish a practical task. Instead, we are approaching the topic more like an archaeologist or historical reenactor: going through the same motions to understand the topic cohesively. This is explained more thoroughly in the Preface.

That said, there is nothing inherently wrong with using modern tools—it just does not fit the goals for writing this library. Brutal Deluxe software has rewritten a more modern version of Merlin 16, and the CC65 compiler/assembler makes contemporary 6502 development far more efficient and less frustrating overall. If Merlin 8 Pro feels too dated—and to many, it will feel hopelessly so—by all means use these modern software packages. Just be aware that some substantial effort may be involved in rewriting the code here for different assemblers. If you must, I would suggest using an Apple II emulator like _AppleWin_ with a high speed setting for compile time---though be careful if so, as it is easy to miss error interruptions.

**Further Resources**

While beginners are welcome to use this library, and it is partially aimed at those who are trying to learn 6502 Assembly on the Apple II, a cohesive and thorough guide to 6502 programming is beyond the scope of this manual. For a better understanding of the hardware, programming, and culture surrounding the Apple II, I would suggest consulting the following sources.

__*6502 Programming Books*__

- Roger Wagner, Chris Torrence. [*Assembly Lines: The Complete Book*](https://www.amazon.com/Assembly-Lines-Complete-Roger-Wagner/dp/1312089407/). May 10, 2017. <https://www.amazon.com/Assembly-Lines-Complete-Roger-Wagner/dp/1312089407/>
- Lance A. Leventhal, Winthrop Saville. *6502 Assembly Language Subroutines*. 1982.
- Don Lancaster. *Assembly Cookbook for the Apple II, IIe*. 1984, 2011.
- Mark Andrews. _Apple Roots: Assembly Language Programming for the Apple IIe and IIc_. 1986.
- CW Finley, Jr., Roy E. Meyers. *Assembly Language for the Applesoft Programmer*. 1984.
- Randy Hyde. *Using 6502 Assembly Language*. 1981.
- Glen Bredon. *Merlin Pro Instruction Manual*. 1984.
- JS Anderson. *Microprocessor Technology*. 1994. (also covers z80 architecture)

__*6502 Programming Websites*__

- [CodeBase64](http://codebase64.org/doku.php). <http://codebase64.org/doku.php>
- [6502.org](http://www.6502.org/). <http://www.6502.org/>
- [Easy6502](http://skilldrick.github.io/easy6502/). <http://skilldrick.github.io/easy6502/>

__*Apple II Books*__

- Bill Martens, Brian Wiser, William F. Luebbert, Phil  Daley. [*What's Where in the Apple, Enhanced Edition: A Complete Guide to the Apple \]\[      Computer*.](https://www.amazon.com/gp/product/136517364X/) October 11, 2016. <https://www.amazon.com/gp/product/136517364X/>
- David Flannigan. [*The New Apple II Users' Guide*](https://www.amazon.com/gp/product/0615639879/). June 6, 2012. https://www.amazon.com/gp/product/0615639879/
- David L. Craddock. [*Break Out: How the Apple II Launched the PC Gaming Revolution*](https://www.amazon.com/gp/product/0764353225/). September 28, 2017. https://www.amazon.com/gp/product/0764353225/
- Steven Weyhrich. [*Sophistication ;&amp; Simplicity: The Life and Times of the Apple II Computer*](https://www.amazon.com/gp/product/0986832278/). December 1, 2013. https://www.amazon.com/gp/product/0986832278/
- Ken Williams, Bob Kernagham, Lisa Kernagham. [*Apple II Computer Graphics*](https://www.amazon.com/gp/product/B01FIXG7ZK/). November 3, 1983. <https://www.amazon.com/gp/product/B01FIXG7ZK/>
- Lon Poole. [*Apple II Users' Guide*.](https://www.amazon.com/gp/product/0931988462/).     1981. <https://www.amazon.com/gp/product/0931988462/>
- Jeffrey Stanton. *Apple Graphics and Arcade Game Design*. 1982.
- Apple. *Apple Monitors Peeled*. 1981.
- Apple. _Apple II/IIe/IIc/IIgs Technical Reference Manual._

*__Apple II Websites__*

- [Apple II Text Files](http://textfiles.com/apple/.windex.html). <http://textfiles.com/apple/.windex.html>
- [Apple II Programming](http://apple2.org.za/gswv/a2zine/faqs/csa2pfaq.html). <http://apple2.org.za/gswv/a2zine/faqs/csa2pfaq.html>
- [The Asimov Software Archive](https://ftp.apple.asimov.net/). <https://ftp.apple.asimov.net/>
- [Apple II Online](https://apple2online.com/index.php). <https://apple2online.com/index.php>
- [Juiced.GS: A Quarterly Apple II Journal](https://juiced.gs/). <https://juiced.gs/>

_**Related GitHub Projects**_

A number of folk are doing work on 6502 or the Apple II on GitHub. While I cannot possibly list each and every one (that's what the search function is for!), these are projects I have found particularly useful, informative, entertaining, or inspiring.

- [Prince of Persia Apple II Source Code](https://github.com/fabiensanglard/Prince-of-Persia-Apple-II), by Jordan Mechner. <https://github.com/fabiensanglard/Prince-of-Persia-Apple-II>
- [WeeGUI, a small  gui for the Apple II](https://github.com/blondie7575/WeeGUI). <https://github.com/blondie7575/WeeGUI>
- [Two-lines or less Applesoft programs](https://github.com/thelbane/Apple-II-Programs) --- a lot can be accomplished! <https://github.com/thelbane/Apple-II-Programs>
- [Doss33FSProgs](https://github.com/deater/dos33fsprogs), programs for manipulating the DOS 3.3 filesystem. <https://github.com/deater/dos33fsprogs>
- [ADTPro](https://github.com/ADTPro/adtpro), a requirement for anyone working with real Apple II hardware today. <https://github.com/ADTPro/adtpro>
- [CC65](https://github.com/cc65), a modern cross-compiling C compiler and assembler for 6502 systems. <https://github.com/cc65>
- [PLASMA: The Proto-Language Assembler for All](https://github.com/dschmenk/PLASMA) --- this was originally written for the Apple II alone, but has recently expanded to other systems. <https://github.com/dschmenk/PLASMA>

