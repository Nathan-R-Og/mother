.setcpu "6502"

.include "../global/hardware.asm"
.include "../global/ram.asm"
.include "../global/header.asm"
.include "fontmap.asm"
.include "../global/objects/include.asm"
.include "../global/macros.asm"


.macro binclude Path
    .ifndef kanaMacro
        .include .concat("../../build_artifacts/jp/", Path)
    .else
        .include Path
    .endif
.endmacro

binclude "prg/bank0.asm"
.include "../global/map.asm"
.include "../global/objects/1.asm"
.include "prg/bank11.asm"
.include "prg/bank12.asm"

binclude "prg/bank13.asm"
.include "prg/bank14.asm"
.include "../global/sprites.asm"
.include "../global/battle_data.asm"
.include "../global/prg/battle.asm"

binclude "text/dialogue1.asm"
binclude "text/dialogue2.asm"
binclude "text/dialogue3.asm"
binclude "text/dialogue4.asm"

.include "../global/prg/music.asm"

.segment "SAVEFILE": absolute
.include "../global/starting_save.asm"
binclude "../global/starting_characters.asm"


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
.include "../global/chr/bankb.asm"
binclude "../global/prg/naming_screen.asm"
.include "../global/chr/bankc.asm"
.include "../global/chr/bankd.asm"
.include "../global/chr/banke.asm"
.include "../global/chr/bankf.asm"
