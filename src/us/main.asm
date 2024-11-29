.setcpu "6502"

.include "../global/hardware.asm"
.include "../global/ram.asm"
.include "../global/header.asm"
.include "fontmap.asm"

.macro incbinRange path, start, end
        .incbin path, start, end-start
.endmacro


.include "prg/bank0.asm"
.include "map.asm"
.include "../global/objects/1.asm"
.include "prg/bank11.asm"
.include "prg/bank12.asm"
.include "prg/bank13.asm"
.include "prg/bank14.asm"
.include "sprites.asm"
.include "prg/bank16.asm"
.include "prg/bank17.asm"
.include "prg/bank18.asm"
.include "prg/bank19.asm"
.include "prg/bank1a.asm"
.include "prg/bank1b.asm"
.include "prg/bank1c.asm"
.include "prg/bank1d.asm"
.include "prg/bank1e.asm"
.include "prg/bank1f.asm"

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
.include "chr/bankb.asm"
.include "../global/chr/bankc.asm"
.include "../global/chr/bankd.asm"
.include "../global/chr/banke.asm"
.include "chr/bankf.asm"

.include "text/dialogue1.asm"
.include "text/dialogue2.asm"
.include "text/dialogue3.asm"
.include "text/dialogue4.asm"
.include "text/dialogue5.asm"
.include "text/dialogue6.asm"
.include "text/dialogue7.asm"
.include "text/dialogue8.asm"
.include "text/dialogue9.asm"
.include "text/dialogue10.asm"

.include "chr/bank1a.asm"
.include "chr/bank1b.asm"

.segment        "CHR1C": absolute
.segment        "CHR1D": absolute
.segment        "CHR1E": absolute
.segment        "CHR1F": absolute
