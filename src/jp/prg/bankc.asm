.segment        "PRGC": absolute

.ifndef kanjiMacro
    binclude "dialogue1.asm"
.else
    .include "../dialogue1.asm"
.endif

.incbin "../../split/jp/prg/bankc.bin", $2000, $4000-$2000

.code