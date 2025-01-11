;only changes here is that in jp, there are unused choicers
;4 options all of which say "POISON"
;very ominous


;not JUST teleport defs, by the way!
;name, (posX << 6)| music, (posY << 6)| startDirection, msgPrice
.macro choicerDef name, music, posX, direction, posY, msgPrice
    .addr name
    .word (posX << 6) | music
    .word (posY << 6) | direction
    .word msgPrice
.endmacro

;ACTUAL teleport defs
choicerDef TELEPORT_MYHOME,6,$CE,6,$145,0
choicerDef TELEPORT_PODUNK,6,$AB,2,$1A7,0
choicerDef TELEPORT_MERRYSVILLE,6,$14B,2,$1CF,0
choicerDef TELEPORT_REINDEER,6,$1CA,6,$3BF,0
choicerDef TELEPORT_SPOOKANE,6,$2DD,2,$364,0
choicerDef TELEPORT_SNOWMAN,10,$398,4,$3BE,0
choicerDef TELEPORT_YOUNGTOWN,$30,$2E2,6,$1D3,0
choicerDef TELEPORT_ELLAY,6,$32A,6,$12E,0

.repeat 8
choicerDef INAME_NULL,0,0,0,0,0
.endrepeat

;trainstuff
;union station
choicerDef TELEPORT_REINDEER,$14,$13E,5,$14F,16
choicerDef TELEPORT_SPOOKANE,$14,$13E,5,$14F,25
choicerDef TELEPORT_SNOWMAN,$14,$13E,5,$14F,36
;reindeer station
choicerDef TELEPORT_UNION,$14,$205,6,$33F,16
;spookane station
choicerDef TELEPORT_UNION,$14,$2AD,6,$33F,25
;snowman station
choicerDef TELEPORT_UNION,$14,$35B,6,$3DF,36
;reindeer station 2
choicerDef TELEPORT_SPOOKANE,$14,$206,2,$33F,9
choicerDef TELEPORT_SNOWMAN,$14,$206,2,$33F,20
;spookane station 2
choicerDef TELEPORT_REINDEER,$14,$2AD,6,$33F,9
choicerDef TELEPORT_SNOWMAN,$14,$2AE,2,$33F,11
;snowman station 2
choicerDef TELEPORT_REINDEER,$14,$35B,6,$3DF,20
choicerDef TELEPORT_SPOOKANE,$14,$35B,6,$3DF,11

;flight plan choicers
choicerDef CHOICER_FLIGHTPLANSA,0,0,0,0,5
choicerDef CHOICER_FLIGHTPLANSB,0,0,0,0,10
choicerDef CHOICER_FLIGHTPLANSC,0,0,0,0,15

;hint choicers
choicerDef CHOICER_HINTS1,0,0,0,0,0
choicerDef CHOICER_HINTS2,0,0,0,0,0
choicerDef CHOICER_HINTS3,0,0,0,0,0

;somehow this is the only change? pleasantly surprised
.ifdef VER_JP
choicerDef CHOICER_UNK1,0,0,0,0,0
choicerDef CHOICER_UNK2,0,0,0,0,0
choicerDef CHOICER_UNK3,0,0,0,0,0
choicerDef CHOICER_UNK4,0,0,0,0,0
.else
.repeat 4
choicerDef CHOICER_SCIENTIST1,0,0,0,0,0
.endrepeat
.endif

;scientist gag choicers
choicerDef CHOICER_SCIENTIST1,0,0,0,0,3485
choicerDef CHOICER_SCIENTIST2,0,0,0,0,2775

.repeat $10
choicerDef INAME_NULL,0,0,0,0,0
.endrepeat