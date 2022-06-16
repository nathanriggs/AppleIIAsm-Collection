# AppleIIAsmLib

A general purpose ASM libriary for the Apple II. Assembled in Merlin 8 Pro. While this source is currently in constant flux, save for "stable" releases, [you may find the project's current technical documentation, v0.6.1 here](https://github.com/nathanriggs/AppleIIAsm-Collection/tree/master/documentation/AppleIIAsm%20Library%20Collection%20Technical%20Manual/0.6.1).

Since this is in flux, you may also find [the previous documentation,v0.5.0, here](https://github.com/nathanriggs/AppleIIAsm-Collection/blob/master/documentation/AppleIIAsm%20Library%20Collection%20Technical%20Manual/0.5.0/AppleIIAsm%20Manual%20v0.5.0.pdf). Note that this documentation is in .pdf format.

# Updates

__15-jun-2022__

Wow! It's been a year since any updates. Life happened. But I am currently working on v7.0.0 of the library. This will be incompatible with all past versions, but if you only used macros, and didn't call the subroutines yourself, the changes should be minimal. You should expect the first round of changes to update by the end of the month, which will mostly consist of rewritten required routines. Then, we'll resume the running TODO lists.

__05-jun-2021__

_TODO FOR NEXT REVISION (v6.1.0)_

- <s>add page flipping to stdio, which requires adding to each subroutine</s>
- fix 8-bit bresenham in <s>stdio and</s> lores
- <s>reorganize mac files on stdio</s>
- <s>delete pct,gcf,lcm in math collection</s>
- <s>add modulus subroutines/macros to math</s>
- add/fix memory catalog subroutine/macro in DOS
- change dos fmfil, etc. to be subroutines to decrease bytes
- fix 16bit bresenham in hires
- add bresenham circle routine to hires
- add rect, frect routines to hires
- <s>add signed macros to math collection</s>
- <s>add floating point examples to math collection, if room exists</s>
- revise all documentation to reflect changes (also previous changes)

__05-JUN-2021__

- Updated all required collection macros and subroutines on every disk
- Revised all subroutines and macros to fit with new zero page names

__03-JUN-2021__

- Updated all disks as part of a small reorganization of the REQUIRED library collection
- Added High Resolution Graphics Disk
- Added Apple II Internal Speaker Disk
- Rewrote all documentation in markdown

__19-JAN-2020__

- **Really** Finished all goals previously made on 17-DEC-2019, and then some
- Began reworking Disk 2: STDIO to conform to new software architecture and documentation
- next version will be 0.6.1, but no package will be created due to incompatibilities between libraries. From this point onward, releases will only be made if the entire collection is inter-compatible. The second digit will increase, and the third digit reset, in order to reflect compatible versus incomplatible current versions at this point. Later down the road, this version system will simply reflect major versus minor changes.
- updated base README.md to point toward documentation

__17-DEC-2019__

- Currently working on version 0.6.0, which includes:
  - an updated architecture
  - deliberate use of markdown for documentation
    - with the eventual goal of translating it to Madoko, a markdown variant that allows for more visual control on a printend page
  - Still transforming entire disk system to adhere to a singular software architecture. 
  - Added Alias macros for 8080 and z80 instruction sets.
  - Major changes to Disk 1, including merger of REQUIRED and COMMON libraries

__27-SEP-2019__

- As of version 0.5.0, updates will occur on a disk-by-disk basis (as well as appropriate changes to the documentation). 
- version 0.5.0 pretty much breaks any prior work that used the library. While future updates won't be so extreme, now that a stable system is in place, this is to be expected in any update prior to an official version 1.0.
- The main documentation has been moved to a .docx and pdf file, rather than here, due to the length of the document. In the future, this file will be changed to a more open format, as well as converted into a hard-copy friendly design.

## Documentation

- You can find documentation to the current version being revised, 0.6.0, [in the documentation section](https://github.com/nathanriggs/AppleIIAsmLib/blob/master/documentation/0.6.0/0_3_Table_of_Contents_GH.md) 
- You can find documentation for the current stable version, 0.5.0, [also in the appropriate documentation section](https://github.com/nathanriggs/AppleIIAsmLib/blob/master/documentation/0.5.0/) 

