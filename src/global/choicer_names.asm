.ifdef VER_JP

;choicers
CHOICER_NULL:
.byte   stopText

CHOICER_FLIGHTPLANSA:
kanafix "Aコ-ス",stopText
CHOICER_FLIGHTPLANSB:
kanafix "Bコ-ス",stopText
CHOICER_FLIGHTPLANSC:
kanafix "Cコ-ス",stopText
CHOICER_HINTS1:
kanafix "ヒント1",stopText
CHOICER_HINTS2:
kanafix "ヒント2",stopText
CHOICER_HINTS3:
kanafix "ヒント3",stopText
CHOICER_UNK1:
kanafix "どくけし",stopText
CHOICER_UNK2:
kanafix "どくけし",stopText
CHOICER_UNK3:
kanafix "どくけし",stopText
CHOICER_UNK4:
kanafix "どくけし",stopText
CHOICER_SCIENTIST1:
kanafix "ロケット(ほんもの)",stopText
CHOICER_SCIENTIST2:
kanafix "タイムマシン",stopText

;teleport locales
TELEPORT_NULL:
.byte   stopText
TELEPORT_MYHOME:
kanafix "マイホ-ム",stopText
TELEPORT_PODUNK:
kanafix "マザ-ズデイ",stopText
TELEPORT_MERRYSVILLE:
kanafix "サンクスギビング",stopText
TELEPORT_REINDEER:
kanafix "レインディア",stopText
TELEPORT_SPOOKANE:
kanafix "ハロウィ-ン",stopText
TELEPORT_SNOWMAN:
kanafix "スノ-マン",stopText
TELEPORT_YOUNGTOWN:
kanafix "イ-スタ-",stopText
TELEPORT_ELLAY:
kanafix "バレンタイン",stopText
TELEPORT_UNION:
kanafix "サンタクロ-ス",stopText

.else

;choicers
CHOICER_NULL:
.byte 0
CHOICER_FLIGHTPLANSA:
.byte   "FlightplanA",stopText
CHOICER_FLIGHTPLANSB:
.byte   "FlightplanB",stopText
CHOICER_FLIGHTPLANSC:
.byte   "FlightplanC",stopText
CHOICER_HINTS1:
.byte   "Hint 1",stopText
CHOICER_HINTS2:
.byte   "Hint 2",stopText
CHOICER_HINTS3:
.byte   "Hint 3",stopText
CHOICER_SCIENTIST1:
.byte   "Real Rocket",stopText
CHOICER_SCIENTIST2:
.byte   "TimeMachine",stopText

;teleport locales
TELEPORT_NULL:
.byte 0
TELEPORT_MYHOME:
.byte   "MyHome",stopText
TELEPORT_PODUNK:
.byte   "Podunk",stopText
TELEPORT_MERRYSVILLE:
.byte   "Merrysville",stopText
TELEPORT_REINDEER:
.byte   "Reindeer",stopText
TELEPORT_SPOOKANE:
.byte   "Spookane",stopText
TELEPORT_SNOWMAN:
.byte   "Snowman",stopText
TELEPORT_YOUNGTOWN:
.byte   "Youngtown",stopText
TELEPORT_ELLAY:
.byte   "Ellay",stopText
TELEPORT_UNION:
.byte   "Union",stopText

.endif