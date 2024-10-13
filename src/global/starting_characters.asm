;initial character data
;us blanks out initial names but adds 4 new args
;jp has temp names but blanks out those args

.include "../fontmap.asm"

;ninten
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 30,8,5,5
;fight, speed, wisdom, strength, force
.byte 5,5,5,5,5
;level
.byte 1
;exp
.faraddr 0 ;far addrs are meant for segments but also i want a 3 byte keyword :)
;hp, pp
.word 30,8
;?
.byte $78,$74,$00,$00,$08,$64,$00,$80
;items
.byte $6E,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $40,$00,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;Boy A
kanjifix "しょうねんA"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;ana
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 26,12,1,3
;fight, speed, wisdom, strength, force
.byte 1,3,7,3,8
;level
.byte 1
;exp
.faraddr 0
;hp, pp
.word 26,12
;?
.byte $B8,$74,$00,$00,$08,$64,$20,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $40,$40,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;Girl B
kanjifix "しょうじょB"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;lloyd
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 28,0,4,2
;fight, speed, wisdom, strength, force
.byte 4,2,8,4,3
;level
.byte 1
;exp
.faraddr 0
;hp, pp
.word 28,0
;?
.byte $F8,$74,$00,$00,$08,$64,$40,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $00,$00,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;Boy C
kanjifix "しょうねんC"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;teddy
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 134,0,86,86
;fight, speed, wisdom, strength, force
.byte 86,86,19,57,38
;level
.byte 18
;exp
.faraddr $e10
;hp, pp
.word 134,0
;?
.byte $38,$75,$00,$00,$08,$64,$60,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $00,$00,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;Boy D
kanjifix "しょうねんD"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;pippi
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 32,0,9,9
;fight, speed, wisdom, strength, force
.byte 9,9,2,6,4
;level
.byte 1
;exp
.faraddr 0
;hp, pp
.word 32,0
;?
.byte $78,$75,$00,$00,$08,$64,$80,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $00,$00,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;Pippi
kanjifix "ピッピ"
.byte 0,0,0,0,stopText
.else
.byte "Pippi",0,0,stopText
.endif

;eve
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 999,0,999,999
;fight, speed, wisdom, strength, force
.byte 255,255,255,255,255
;level
.byte 99
;exp
.faraddr 1000000
;hp, pp
.word 999,0
;?
.byte $B8,$75,$00,$00,$08,$3A,$60,$81
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $00,$00,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;EVE
kanjifix "イヴ"
.byte 0,0,0,0,0,stopText
.else
.byte "EVE",0,0,0,0,stopText
.endif

;flying man
;?
.byte $00
;status
.byte 0
;?
.byte $00
;max hp, max pp, offense, defense
.word 50,0,30,30
;fight, speed, wisdom, strength, force
.byte 30,30,30,30,30
;level
.byte 99
;exp
.faraddr 1000000
;hp, pp
.word 30,0
;?
.byte $F8,$75,$00,$00,$08,$64,$40,$81
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;?
.ifdef VER_JP
.byte $00,$00,$00,$00
.else
.byte $52,$08,$86,$2F
.endif

;psi table
.byte $00,$00,$00,$00,$00,$00,$00,$00

;default name
.ifdef VER_JP
;Flying Man
kanjifix "フライングマン"
.byte stopText
.else
.byte "FlynMan",stopText
.endif
