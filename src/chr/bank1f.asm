.segment        "CHRF": absolute

.ifndef VER_JP
        .incbin "../split/chr/bank1f.bin"
.else

.include "../fontmap.asm"

.incbin "../split/chr/bank1f.bin", 0, $c51

kanjifix "あいうえお"
.byte 0
kanjifix "アイウエオ"
.byte 0
kanjifix "がぎぐげご"
.byte 0
.byte "ABCDEF"
.byte 0

kanjifix "かきくけこ"
.byte 0
kanjifix "カキクケコ"
.byte 0
kanjifix "ざじずぜぞ"
.byte 0
.byte "GHIJKL"
.byte 0

kanjifix "さしすせそ"
.byte 0
kanjifix "サシスセソ"
.byte 0
kanjifix "だぢづでど"
.byte 0
.byte "MNOPQR"
.byte 0

kanjifix "たちつてと"
.byte 0
kanjifix "タチツテト"
.byte 0
kanjifix "ばびぶべぼ"
.byte 0
.byte "STUVWX"
.byte 0

kanjifix "なにぬねの"
.byte 0
kanjifix "ナニヌネノ"
.byte 0
kanjifix "ぱぴぷぺぽ"
.byte 0
.byte "YZ.-, "
.byte 0

kanjifix "はひふへほ"
.byte 0
kanjifix "ハヒフヘホ"
.byte 0
kanjifix "ガギグゲゴ"
.byte 0
kanjifix "ぁぃぅぇぉっ"
.byte 0

kanjifix "まみむめも"
.byte 0
kanjifix "マミムメモ"
.byte 0
kanjifix "ザジズゼゾ"
.byte 0
kanjifix "ゃゅょャュョ"
.byte 0

kanjifix "や ゆ よ"
.byte 0
kanjifix "ヤ ユ ヨ"
.byte 0
kanjifix "ダヂヅデド"
.byte 0
kanjifix "ァィゥェォッ"
.byte 0

kanjifix "らりるれろ"
.byte 0
kanjifix "ラリルレロ"
.byte 0
kanjifix "バビブベボ"
.byte 0
.byte 0,$C1,0,0,0,0 ;choicer
.byte 0

kanjifix "わ を ん"
.byte 0
kanjifix "ワ ヲ ン"
.byte 0
kanjifix "パピプペポ"
.byte 0
.byte 0,$C2,0,0,0,0 ;choicer
.byte 0


.incbin "../split/chr/bank1f.bin", $D4B, $12B5


.endif
.code

