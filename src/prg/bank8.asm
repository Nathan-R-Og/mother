.segment        "PRG8": absolute

.ifndef VER_JP
        .incbin "../split/prg/bank8.bin"

.else

        .incbin "../split/prg/bank8.bin", 0, $2322

MSG_pointerList:
.word MSG_MYHOME_MINNIE_INVASION-$8000
.byte 0
        .incbin "../split/prg/bank8.bin", $2325, $1CDB

.endif

.code

