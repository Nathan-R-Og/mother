;initial character data
;us blanks out initial names but adds 4 new args
;jp has temp names but blanks out those args

party_data:

;ninten
Ninten_Data:
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
ninten_level:
.byte 1
;exp
.faraddr 0 ;far addrs are meant for segments but also i want a 3 byte keyword :)
;hp, pp
.word 30,8
;name pointer (why exactly?)
.addr ninten_name
;?
.byte $00,$00,$08,$64,$00,$80
;items
.byte $6E,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %01000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
ninten_name:
.ifdef VER_JP
;Boy A
kanafix "しょうねんA"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;ana
Ana_Data:
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
;name pointer (why exactly?)
.addr ana_name
;?
.byte $00,$00,$08,$64,$20,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %01000000, %01000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
ana_name:
.ifdef VER_JP
;Girl B
kanafix "しょうじょB"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;lloyd
Lloyd_Data:
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
;name pointer (why exactly?)
.addr lloyd_name
;?
.byte $00,$00,$08,$64,$40,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
lloyd_name:
.ifdef VER_JP
;Boy C
kanafix "しょうねんC"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;teddy
Teddy_Data:
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
;name pointer (why exactly?)
.addr teddy_name
;?
.byte $00,$00,$08,$64,$60,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
teddy_name:
.ifdef VER_JP
;Boy D
kanafix "しょうねんD"
.byte 0,stopText
.else
.byte 0,0,0,0,0,0,0,stopText
.endif

;pippi
Pippi_Data:
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
;name pointer (why exactly?)
.addr pippi_name
;?
.byte $00,$00,$08,$64,$80,$80
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
pippi_name:
.ifdef VER_JP
;Pippi
kanafix "ピッピ"
.byte 0,0,0,0,stopText
.else
.byte "Pippi",0,0,stopText
.endif

;eve
EVE_Data:
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
;name pointer (why exactly?)
.addr eve_name
;?
.byte $00,$00,$08,$3A,$60,$81
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
eve_name:
.ifdef VER_JP
;EVE
kanafix "イヴ"
.byte 0,0,0,0,0,stopText
.else
.byte "EVE",0,0,0,0,stopText
.endif

;flying man
FlyingMan_Data:
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
;name pointer (why exactly?)
.addr flyingman_name
;?
.byte $00,$00,$08,$64,$40,$81
;items
.byte $00,$00,$00,$00,$00,$00,$00,$00
;weapon, coin, ring, pendant
.byte $00,$00,$00,$00

;breadcrumb coords
.ifdef VER_JP
doorArgDef 0, 0, DIRECTIONS::UP, 0
.else
doorArgDef $12, $21, DIRECTIONS::LEFT, $BE
.endif

;psi table
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000
.byte %00000000, %00000000

;default name
flyingman_name:
.ifdef VER_JP
;Flying Man
kanafix "フライングマン"
.byte stopText
.else
.byte "FlynMan",stopText
.endif
