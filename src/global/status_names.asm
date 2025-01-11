.ifdef VER_JP

;status
STATUS_FAINTD:
kanafix "いしきふめい"
.byte   stopText
STATUS_STONE:
kanafix "いしになった"
.byte   stopText
STATUS_PARLZD:
kanafix "まひしている"
.byte   stopText
STATUS_ASLEEP:
kanafix "ねむっている"
.byte   stopText
STATUS_CONFSD:
kanafix "こんらんした"
.byte   stopText
STATUS_PUZZLD:
kanafix "まどわされた"
.byte   stopText
STATUS_POISON:
kanafix "どくをうけた"
.byte   stopText
STATUS_COLD:
kanafix "かぜをひいた"
.byte   stopText

.else

;status
STATUS_FAINTD:
.byte   "Faintd",stopText
STATUS_STONE:
.byte   " Stone",stopText
STATUS_PARLZD:
.byte   "Parlzd",stopText
STATUS_ASLEEP:
.byte   "Asleep",stopText
STATUS_CONFSD:
.byte   "Confsd",stopText
STATUS_PUZZLD:
.byte   "Puzzld",stopText
STATUS_POISON:
.byte   "Poison",stopText
STATUS_COLD:
.byte   "  Cold",stopText

.endif