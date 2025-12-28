# Mother

Disassembly of Mother/Earthbound Zero/Earthbound Beginnings for the Famicom/NES

Supports the English localization of Mother (Zero or Beginnings should work), and has compatability with the original release (Mother).

For WSL2 Ubuntu. Probably also works on actual Linux.

Also works natively on Windows.

## Supported Hashes

| Game Version                       | MD5                              |
|------------------------------------|----------------------------------|
| MOTHER (JP) (NES 2.0)                       |`218503a880999363ac83945096040492`|
| MOTHER (JP) (iNES)                          |`bf1e0bc9c390fdbb2b3ca22d784db7d2`|
| Earthbound Beginnings (Proto) (US) (NES 2.0)|`54387b6e68142d69083a38b437196450`|
| Earthbound Beginnings (Proto) (US) (iNES)   |`5bacf7ba94c539a1caf623dbe12059a3`|

Headers may be different, making hashes fail. Check your header in a hex viewer against `src/global/header.asm` to see if your ROM is good or not.

Automatically outputs ROM as NES 2.0.

## Instructions

Note that if you are running on Windows, when it asks you to run a script, run the `.ps1` script of the same name instead.

1. Install python
  - Chances are you already have it installed if you are bothering with this repo.
  - On Linux, `./install` will add python for you.
  - On Windows, install python and make sure it is added to your system `PATH` under `Environment Variables`.
2. Obtain cc65
  - If running on a supported Linux distribution, run `./install` to download and set up cc65.
  - If running on another platform (ex. Windows), it can be obtained from https://cc65.github.io/.
  - If cc65 was not built from source, add it to your system `PATH` under `Environment Variables`. (like python)
2. Drop MOTHER (J) and/or Earthbound Beginnings (U) ROMs into this directory.
3. Run `./configure` to split banks from supported roms
  - Each rom will be scanned for in the root of this repository, and will split their own unique assets.
4. Run `./build` to make a new Earthbound Beginnings (U) ROM from assembly
  - Note that the output path will be `mother_rebuilt.nes`
5. Run `./build -j` to make a new MOTHER (J) rom

The newly built rom will be compared to the destination version's checksum, to see if it is byte matching. Make sure both US and JP are byte matching before opening a PR!

If you wish to make your own ROM Hack, simply remove all calls to `tools/checksum.py` as well as the file itself. Fork and enjoy!

## About

```plain
Still incredibly wip, i do not have enough knowledge to know why parts do and dont work

I've started work on getting text building, though apart from that I have next to no idea of what I'm doing.
```

... yeah right!

That was back when all that was disassembled was `src/us/prg/bank19.asm`.... YEESH.

Let's try this again!

## About (for real this time)

This disassembly aims to expose multiple parts of this game to the public:

### Data types

- Items
- PSI
- Save Ram
- Battles
- Enemies
- Choicers
- Exp Growth Tables
- Music
- Objects
- Text
- UI bytecode
- Credits bytecode
- Overworld & Battle Actions
- ...and more that don't have their own files yet!

### Code

- Vectors (NMI, Reset, IRQ)
- Main Backend
- Music (again)
- Object Scripting
- Credits (US)
- ...and others I either forgot or don't know about!

All in one place!

There is still WAY more work to be done, mostly in terms of JP.
... and also naming a bunch of stuff, but that's what every disassembly's goal is anyways.

If you would like to contribute, please open a PR! I have put everything together myself so far. It gets kinda mindnumbing!

Of course, I definitely didn't FIGURE OUT everything myself. Many thanks to those in the PKHack Discord and various other resources online for letting this come about in any form. They are the glue holding this together!!! I am merely the catalyst.

### P.S.

Data Crystal helped a ton in the early stages... but my GOD is it terribly under-researched... lol...
[Someone please update this !!!](https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings)
