.setcpu "6502"

.include "../global/hardware.asm"
.include "../global/ram.asm"
.include "../global/header.asm"

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
.include "map.asm"
.include "../global/objects/1.asm"
.include "prg/bank11.asm"
.include "prg/bank12.asm"
.include "prg/bank13.asm"
.include "prg/bank14.asm"
.include "../global/sprites.asm"
.include "prg/bank16.asm"
.include "prg/bank17.asm"

.include "fontmap.asm"
binclude "text/dialogue1.asm"
binclude "text/dialogue2.asm"
binclude "text/dialogue3.asm"
binclude "text/dialogue4.asm"

.include "prg/bank1c.asm"
.include "prg/bank1d.asm"
.include "prg/constant.asm"

.include "../global/chr/bank0.asm"
.include "../global/chr/bank1.asm"
.include "../global/chr/bank2.asm"
.include "../global/chr/bank3.asm"
.include "../global/chr/bank4.asm"
.include "../global/chr/bank5.asm"
.include "../global/chr/bank6.asm"
.include "../global/chr/bank7.asm"
.include "../global/chr/bank8.asm"
.include "../global/chr/bank9.asm"
.include "../global/chr/banka.asm"
binclude "chr/bankb.asm"
.include "../global/chr/bankc.asm"
.include "../global/chr/bankd.asm"
.include "../global/chr/banke.asm"
binclude "chr/bankf.asm"
