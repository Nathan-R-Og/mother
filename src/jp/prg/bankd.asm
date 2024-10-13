.segment        "PRGD": absolute

.byte 0

.include "../fontmap.asm"
kanjifix "*おまえのつれてた おんなのこ"
.byte   newLine
kanjifix "かわいかったなぁ。"
.byte   newLine
.byte   stopText

        .incbin "../../split/jp/prg/bankd.bin", $1c

.code

