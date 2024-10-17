.segment        "PRGC_1": absolute

.byte 0

.ifndef kanjiMacro
    binclude "dialogue1.asm"
.else
    .include "../dialogue1.asm"
.endif

.code
.segment        "PRGC_2": absolute

.byte 0

.ifndef kanjiMacro
    binclude "dialogue2.asm"
.else
    .include "../dialogue2.asm"
.endif

.code