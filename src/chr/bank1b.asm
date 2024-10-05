.segment        "CHRB": absolute
.ifndef VER_JP
        .incbin "../split/chr/bank1b.bin"
.else

.include "../fontmap.asm"

.incbin "../split/chr/bank1b.bin", 0, $1913

kanjifix "1900ねんだいの はじめ"
.byte   newLine
kanjifix "アメリカのいなかまちに くろくものようなかげがおち"
.byte   newLine
kanjifix "ひとくみの ふうふが"
.byte   newLine
kanjifix "ゆくえふめいに なりました。"
.byte   newLine
kanjifix "おっとのなは ジョ-ジ。 つまのなは マリア。"
.byte   newLine
kanjifix "2ねんほどして ジョ-ジは いえにもどりましたが"
.byte   newLine
kanjifix "どこにいっていたのか なにをしていたのかについて"
.byte   newLine
kanjifix "だれに はなすこともなく"
.byte   newLine
kanjifix "ふしぎなけんきゅうにぼっとうするようになりました。"
.byte   newLine
kanjifix "つまの マリアのほうは"
.byte   newLine
kanjifix "とうとう かえっては きませんでした。"
.byte   stopText

kanjifix "1988ねん マザ-ズデイのまちはずれ"
.byte   stopText



.incbin "../split/chr/bank1b.bin", $19fa, $606


.endif
.code

