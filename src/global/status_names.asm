.ifdef VER_JP

;status
STATUS_FAINTD:
kanafix "いしきふめい",stopText
STATUS_STONE:
kanafix "いしになった",stopText
STATUS_PARLZD:
kanafix "まひしている",stopText
STATUS_ASLEEP:
kanafix "ねむっている",stopText
STATUS_CONFSD:
kanafix "こんらんした",stopText
STATUS_PUZZLD:
kanafix "まどわされた",stopText
STATUS_POISON:
kanafix "どくをうけた",stopText
STATUS_COLD:
kanafix "かぜをひいた",stopText

.else

;status
STATUS_FAINTD:
.byte "Faintd",stopText
STATUS_STONE:
.byte " Stone",stopText
STATUS_PARLZD:
.byte "Parlzd",stopText
STATUS_ASLEEP:
.byte "Asleep",stopText
STATUS_CONFSD:
.byte "Confsd",stopText
STATUS_PUZZLD:
.byte "Puzzld",stopText
STATUS_POISON:
.byte "Poison",stopText
STATUS_COLD:
.byte "  Cold",stopText

.endif