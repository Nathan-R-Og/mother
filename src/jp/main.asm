.setcpu "6502"

.include "../global/header.asm"

PAD_A := 1 << 7
PAD_B := 1 << 6
PAD_SELECT := 1 << 5
PAD_START := 1 << 4
PAD_UP := 1 << 3
PAD_DOWN := 1 << 2
PAD_LEFT := 1 << 1
PAD_RIGHT := 1 << 0

.macro binclude Path
    .ifndef kanjiMacro
        .include .concat("../../build_artifacts/jp/", Path)
    .else
        .include Path
    .endif
.endmacro

.macro incbinRange path, start, end
        .incbin path, start, end-start
.endmacro

binclude "prg/bank0.asm"
.include "prg/bank1.asm"
.include "prg/bank2.asm"
.include "prg/bank3.asm"
.include "prg/bank4.asm"
.include "prg/bank5.asm"
.include "prg/bank6.asm"
.include "prg/bank7.asm"
.include "prg/bank8.asm"
.include "prg/bank9.asm"
.include "prg/banka.asm"
.include "prg/bankb.asm"
.include "prg/bankc.asm"
binclude "prg/bankd.asm"
.include "prg/banke.asm"
.include "prg/bankf.asm"

.include "../global/chr/bank10.asm"
.include "../global/chr/bank11.asm"
.include "../global/chr/bank12.asm"
.include "../global/chr/bank13.asm"
.include "../global/chr/bank14.asm"
.include "../global/chr/bank15.asm"
.include "../global/chr/bank16.asm"
.include "../global/chr/bank17.asm"
.include "../global/chr/bank18.asm"
.include "../global/chr/bank19.asm"
.include "../global/chr/bank1a.asm"
binclude "chr/bank1b.asm"
.include "../global/chr/bank1c.asm"
.include "../global/chr/bank1d.asm"
.include "../global/chr/bank1e.asm"
binclude "chr/bank1f.asm"
