.segment        "CHRB": absolute

;big screen stuff (Tm)
;could probably ifdef this??? fix up the ui commands first then try it

;map gfx
incbinRange "../../split/us/chr/bank1b.bin", 0, $C00

;map tiles
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02,$88,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$13,$12,$13,$12,$98,$97,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$18,$17,$22,$13,$12,$13,$12,$13,$12
.byte $02,$02,$08,$02,$59,$5A,$5B,$5C,$03,$02,$03,$02,$03,$02,$89,$02,$03,$02,$3C,$02,$03,$02,$03,$20,$20,$28,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$34,$12,$13,$12,$13,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$13,$12,$13,$12,$13,$12,$13,$26,$24,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$10,$02,$8D,$07,$03,$02,$40,$41,$42,$68,$42,$68,$42,$68,$42,$43,$44,$02,$03,$02,$03,$29,$2A,$2B,$2C,$02,$03,$02,$7F,$02
.byte $12,$12,$13,$0B,$0C,$0D,$2D,$12,$50,$51,$13,$12,$13,$12,$13,$12,$13,$12,$54,$12,$13,$12,$13,$12,$13,$12,$13,$12,$7E,$12,$13,$12
.byte $02,$02,$03,$02,$14,$28,$03,$02,$03,$75,$76,$02,$03,$02,$03,$02,$03,$02,$9C,$80,$45,$67,$46,$02,$03,$02,$9B,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$15,$20,$13,$12,$13,$20,$52,$51,$13,$12,$13,$12,$13,$12,$13,$12,$17,$22,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$16,$26,$03,$02,$03,$20,$20,$75,$53,$82,$83,$82,$84,$02,$03,$02,$20,$20,$03,$02,$03,$02,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$11,$13,$12,$13,$12,$13,$26,$24,$12,$13,$12,$13,$12,$38,$12,$13,$12,$16,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$02,$03,$02,$03,$69,$6A,$6B,$6C,$6D,$6E,$02,$70,$02,$03,$02,$39,$3A,$3B,$09,$0A,$B0,$03,$02,$03,$02,$03,$02
.byte $12,$12,$13,$12,$78,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$38,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$01,$03,$01,$03,$0E,$9D,$01,$03,$01,$03,$01,$70,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$38,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$02,$03,$02,$03,$02,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$70,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$38,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$3D,$3E,$3E,$3E,$3E,$3E,$3E,$3F,$1E,$1F,$01,$8A,$01,$03,$01,$70,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$4D,$20,$20,$8E,$8F,$20,$20,$4F,$12,$13,$47,$48,$85,$86,$85,$87,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12
.byte $02,$4D,$20,$20,$9E,$9F,$20,$20,$4F,$01,$03,$57,$03,$01,$03,$01,$03,$01,$03,$19,$1A,$1B,$1C,$1D,$03,$01,$03,$01,$03,$01,$03,$01
.byte $12,$4D,$20,$20,$AE,$AF,$20,$20,$4F,$12,$13,$56,$58,$73,$74,$60,$74,$73,$74,$61,$63,$81,$2E,$72,$36,$37,$13,$12,$13,$12,$13,$12
.byte $02,$4D,$20,$20,$BE,$BF,$20,$20,$4F,$01,$03,$49,$4A,$4B,$4C,$01,$03,$01,$03,$27,$04,$01,$21,$01,$03,$71,$03,$01,$03,$02,$03,$01
.byte $12,$4D,$A8,$A9,$AA,$AB,$AC,$AD,$4F,$12,$13,$12,$20,$12,$13,$12,$13,$12,$13,$26,$24,$06,$20,$12,$13,$35,$13,$12,$13,$12,$13,$12
.byte $01,$4D,$B8,$B9,$BA,$BB,$BC,$BD,$4F,$01,$03,$B1,$20,$25,$B3,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$71,$03,$01,$03,$01,$03,$01
.byte $12,$4D,$20,$90,$91,$92,$93,$20,$4F,$12,$13,$12,$20,$20,$05,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$9A,$79,$7A,$7B,$7C,$7D,$12
.byte $01,$5D,$94,$95,$95,$95,$95,$96,$5F,$01,$03,$01,$B2,$26,$B4,$01,$03,$01,$03,$01,$03,$01,$03,$01,$64,$65,$66,$20,$03,$01,$03,$01
.byte $12,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$12,$13,$8B,$8C,$26,$13,$2F,$13,$12
.byte $01,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01

;map palette data????? something like that
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FD,$FF
.byte $5F,$5F,$DF,$FF,$FF,$FF,$FF,$FF,$55,$55,$DD,$FF,$FF,$FF,$FF,$FF
.byte $55,$55,$DD,$FF,$FF,$FF,$FF,$FF,$05,$05,$0D,$0F,$0F,$0F,$0F,$0F

;whirlpool gfx
incbinRange "../../split/us/chr/bank1b.bin", $1000, $1400

;whirlpool tiles
.byte $21,$22,$21,$22,$21,$22,$08,$09,$09,$0A,$08,$09,$09,$09,$0A,$0A,$09,$0A,$0B,$0A,$0A,$0B,$0A,$0B,$0E,$0E,$21,$22,$21,$22,$21,$22
.byte $31,$32,$31,$32,$31,$32,$18,$19,$19,$1A,$09,$0A,$09,$19,$1A,$0A,$0B,$1A,$1B,$1A,$1A,$0A,$1A,$0E,$1E,$1E,$31,$32,$31,$32,$31,$32
.byte $32,$31,$32,$31,$32,$31,$32,$08,$09,$0A,$19,$1A,$19,$09,$0A,$1A,$1B,$1A,$32,$0A,$0B,$1A,$1B,$1E,$0E,$0E,$32,$31,$32,$31,$32,$31
.byte $20,$20,$20,$20,$20,$20,$20,$18,$19,$1A,$18,$19,$08,$19,$09,$0A,$0B,$0A,$0B,$1A,$0A,$0B,$1A,$0E,$1E,$20,$20,$20,$20,$20,$20,$20
.byte $02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$09,$0A,$19,$19,$1A,$1B,$1A,$1B,$0A,$1A,$1B,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$19,$19,$1A,$09,$09,$09,$0A,$0A,$0A,$1A,$1B,$1A,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$18,$08,$09,$18,$09,$0A,$19,$0A,$0B,$0A,$1A,$1B,$0A,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$09,$19,$1A,$09,$1A,$0A,$0B,$0A,$0B,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$19,$09,$0A,$19,$1A,$1A,$1B,$1A,$1B,$1E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$09,$19,$1A,$1A,$09,$0A,$0B,$0A,$0B,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$09,$0A,$19,$1A,$1B,$1A,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$19,$19,$1A,$19,$1A,$1A,$1B,$1E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$0A,$0A,$0B,$1A,$0A,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$19,$1A,$1A,$1B,$0A,$0E,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$19,$1A,$19,$1A,$1A,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$08,$09,$09,$0A,$0A,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$18,$19,$09,$0A,$1A,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$09,$0A,$1A,$1B,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$1C,$19,$19,$1A,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$19,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$09,$0E,$0F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$19,$1E,$1F,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$0D,$1E,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$0F,$06,$07,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$04,$05,$16,$17,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$12,$13,$14,$15,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
.byte $23,$24,$25,$23,$24,$25,$23,$24,$25,$23,$23,$24,$25,$29,$2A,$2B,$29,$24,$25,$23,$24,$25,$23,$24,$25,$23,$24,$25,$23,$23,$24,$25
.byte $10,$29,$2A,$2B,$10,$10,$10,$10,$29,$2A,$2B,$10,$29,$2A,$2B,$10,$2A,$2B,$29,$2A,$2B,$29,$10,$10,$29,$2A,$2B,$10,$29,$2A,$2B,$10
.byte $10,$10,$10,$10,$29,$2A,$2B,$10,$10,$10,$29,$2A,$2B,$10,$10,$10,$10,$10,$10,$10,$10,$10,$29,$2A,$2B,$10,$29,$2A,$2B,$29,$2A,$2B
.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$29,$2A,$2B,$10,$10,$10,$10,$10,$10,$10,$10,$10,$29,$2A,$2B
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00,$50,$50,$50,$5A,$52,$50,$50,$50,$05,$05,$05,$05,$05,$05,$05,$05

;some weird ui tile commands???? not JUST a tiledef.
incbinRange "../../split/us/chr/bank1b.bin", $1800, $18FE

;SUPPOSED to be padding
.repeat $102
.byte $FF
.endrepeat

;????????????????????????????????????????????
.byte 0

.code

