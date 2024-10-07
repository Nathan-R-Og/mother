.segment        "CHR6": absolute
.macro incbinRange path, start, end
        .incbin path, start, end-start
.endmacro

        ;might have to end up changing this should i ever do png shenanigans
        ;but this is a good enough example of ifdefing each binary
        incbinRange "../../split/global/chr/bank16.bin", 0, $917

        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $917, $930
        .else
        incbinRange "../../split/us/chr/bank16.bin", $917, $930
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $930, $a10
        
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank16.bin", $a10, $a2a
        .else
        incbinRange "../../split/us/chr/bank16.bin", $a10, $a2a
        .endif

        incbinRange "../../split/global/chr/bank16.bin", $a2a, $10d4
        
        ;i got lazy
        .ifdef VER_JP
        .incbin "../../split/jp/chr/bank16.bin", $10d4
        .else
        .incbin "../../split/us/chr/bank16.bin", $10d4
        .endif
.code

