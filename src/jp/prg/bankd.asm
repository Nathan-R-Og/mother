.segment        "PRGD_1": absolute

.byte 0

.ifndef kanjiMacro
    binclude "dialogue3.asm"
.else
    .include "../dialogue3.asm"
.endif

.code

.segment        "PRGD_2": absolute
.ifndef kanjiMacro
    binclude "dialogue4.asm"
.else
    .include "../dialogue4.asm"
.endif

.code

