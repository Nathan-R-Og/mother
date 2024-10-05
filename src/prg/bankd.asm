.segment        "PRGD": absolute
.ifndef VER_JP
        .incbin "../split/prg/bankd.bin"
.else

.include "../fontmap.asm"

.byte 0

kanjifix "*おまえのつれてた おんなのこ"
.byte   newLine
kanjifix "かわいかったなぁ。"
.byte   newLine
.byte   stopText

        .incbin "../split/prg/bankd.bin", $1c


.endif
.code

