.setcpu "6502"

.include "header.asm"

;prg
.include "prg/bank0.asm"
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
.include "prg/bankd.asm"
.include "prg/banke.asm"
.include "prg/bankf.asm"

;chr
.include "chr/bank10.asm"
.include "chr/bank11.asm"
.include "chr/bank12.asm"
.include "chr/bank13.asm"
.include "chr/bank14.asm"
.include "chr/bank15.asm"
.include "chr/bank16.asm"
.include "chr/bank17.asm"
.include "chr/bank18.asm"
.include "chr/bank19.asm"
.include "chr/bank1a.asm"
.include "chr/bank1b.asm"
.include "chr/bank1c.asm"
.include "chr/bank1d.asm"
.include "chr/bank1e.asm"
.include "chr/bank1f.asm"
.include "chr/bank20.asm"
.include "chr/bank21.asm"
.include "chr/bank22.asm"
.include "chr/bank23.asm"
.include "chr/bank24.asm"
.include "chr/bank25.asm"
.include "chr/bank26.asm"
.include "chr/bank27.asm"
.include "chr/bank28.asm"
.include "chr/bank29.asm"
.include "chr/bank2a.asm"
.include "chr/bank2b.asm"

;padding
.segment        "CHR1C": absolute
.segment        "CHR1D": absolute
.segment        "CHR1E": absolute
.segment        "CHR1F": absolute
    