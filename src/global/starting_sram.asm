;intial sram
;jp has minor diffs
.include "../fontmap.asm"

;checksum
.byte $00,$00
;slot number
.byte $B0+0
;slot state
.byte $E9
;position
.word $852,$2F84
;party members
.byte $01,$00,$00,$00
;last save position
.word $852,$2F86
;cash
.word 0
;?
.byte $00,$00,$00,$00,$00,$00

.ifdef VER_JP
.byte $19
.else
.byte $21
.endif

.byte $00,$00,$6B,$84,$1C,$42,$1E
;player name. a whopping 17 characters!!!!! wow!!!

.ifdef VER_JP
.byte "NO NAME"
.else
.byte "......."
.endif

.byte 0,0,0,0,0,0,0,0,0,0
;?
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

.ifdef VER_JP
.byte 0,0,0,0
.else
.byte $08,$20,$80,$20
.endif