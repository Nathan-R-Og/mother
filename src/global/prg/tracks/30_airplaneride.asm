

B29_1992:
.addr B29_19B8
.addr -1
.addr B29_1992

B29_1998:
.addr B29_19F8
.addr -1
.addr B29_1998

B29_199E:
.addr B29_1A43
.addr B29_1A73
.addr B29_1A73
.addr B29_1AE3
.addr B29_1B00
.addr B29_1AE3
.addr B29_1B0A
.addr -1
.addr B29_199E

B29_19B0:
.addr B29_1A82
.ifndef VER_JP
.addr B29_1AA6
.endif
.addr -1
.addr B29_19B0

B29_19B8:
.byte $9F,$04,$13
.byte $C4,$B2,$02,$B5,$24
.byte $28,$20,$B1,$02,$20,$B5,$28,$B2,$02,$B5,$24,$28,$B3,$1E,$20,$FF
.byte $B4,$2C,$2C,$B1,$2C,$2C,$02,$02,$B3,$2C,$B1,$02,$2E,$28,$2A,$3C
.byte $3A,$38,$36,$B4,$2C,$2C,$B1,$2C,$2C,$02,$02,$B3,$2C,$B1,$38,$B5
.byte $38,$B1,$38,$B4,$38,$B5,$02
.byte $00

B29_19F8:
.byte $9F,$04,$13
.byte $C4,$B1,$0C,$0C,$2C
.byte $0C,$0C,$2E,$0C,$0C,$28,$0C,$0C,$0C,$28,$2E,$0C,$0C,$0C,$0C,$2C
.byte $0C,$0C,$2E,$0C,$0C,$B3,$2E,$2E,$FF,$B4,$24,$22,$B1,$1E,$1E,$02
.byte $02,$B3,$1E,$B1,$02,$16,$10,$12,$24,$22,$20,$B4,$1E,$B1,$24,$B4
.byte $22,$B1,$1E,$1E,$02,$02,$B3,$1E,$B1,$2E,$B5,$32,$B1,$28,$B4,$2A
.byte $B5,$02
.byte $00

B29_1A43:
.byte $9F,$A0,$00
.byte $B4,$24,$B3,$3C,$B1,$3C,$4A,$54,$4A

.ifdef VER_JP
.byte $B3,$24
.else
.byte $B4
.endif

.byte $24,$B3,$1E,$20,$B4,$24,$B3,$3C,$B1,$02,$4A,$54,$4A,$B4,$3C,$B3
.byte $1E,$BA,$46,$44,$42,$40,$3E,$3C,$3A,$38,$36,$34,$32,$30,$2E,$2C
.byte $2A,$26
.byte $00

B29_1A73:
.byte $9F,$00,$00
.byte $D8,$B1,$24,$FF,$B8,$1E,$24,$2E,$20,$24
.byte $2E
.byte $00

B29_1A82:
.byte $C6,$B2,$01,$04,$FF,$B1,$81,$41,$81,$81,$41,$81,$81,$41
.byte $41,$01,$04,$01,$C5,$B2,$01,$04,$FF,$C8,$B0,$81,$FF,$B1,$81,$41
.byte $B0,$81,$81,$B1,$41
.ifndef VER_JP
.byte $00
.endif

B29_1AA6:
.byte $C8,$44,$04,$84,$04,$44,$44,$84,$04,$FF
.byte $C5,$B1,$44,$44,$84,$44,$FF,$44,$44,$C4,$B0,$81,$FF,$B1,$81,$C2
.byte $84,$44,$44,$FF,$44,$C5,$44,$44,$84,$44,$FF,$44,$44,$C4,$B0,$81
.byte $FF,$C2,$B1,$84,$44,$01,$01,$FF,$04,$01,$04,$01,$81,$41,$C4,$B0
.byte $81,$FF
.byte $00

B29_1AE3:
.byte $9F,$00,$00
.byte $C5,$B1,$1E,$B0,$1E,$36,$FF,$B1,$1E,$32
.byte $32,$36,$32,$32,$32,$2E,$2E,$02,$C2,$B1,$2E,$B0,$2E,$2E,$FF
.byte $00

B29_1B00:
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $00

B29_1B0A:
.byte $9F,$A0,$00
.byte $B1,$28,$B5
.byte $2A,$B1,$2E,$B4,$32,$BA,$32,$30,$2E,$2C,$2A,$28,$26,$24,$22,$20
.byte $1E,$1C
.byte $00
