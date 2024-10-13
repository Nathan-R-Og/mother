
;BATTLEID is a conscious decision to make id's dependant on offset
;(since it's basically an array, anyways)
;specifically to aid in shifting and general reordering.
.define BATTLEID(ta) .LOBYTE((ta-BATTLES_START)/$A)
.enum BATTLES
        NULL = BATTLEID(BATTLE_NULL)
        MYHOUSE_RAT1 = BATTLEID(BATTLE_MYHOUSE_RAT1)
        B_BATTLE_2 = BATTLEID(BATTLE_2)
        B_BATTLE_3 = BATTLEID(BATTLE_3)
        B_BATTLE_4 = BATTLEID(BATTLE_4)
        B_BATTLE_5 = BATTLEID(BATTLE_5)
        B_BATTLE_6 = BATTLEID(BATTLE_6)
        B_BATTLE_7 = BATTLEID(BATTLE_7)
        B_BATTLE_8 = BATTLEID(BATTLE_8)
        B_BATTLE_9 = BATTLEID(BATTLE_9)
        B_BATTLE_A = BATTLEID(BATTLE_A)
        B_BATTLE_B = BATTLEID(BATTLE_B)
        B_BATTLE_C = BATTLEID(BATTLE_C)
        B_BATTLE_D = BATTLEID(BATTLE_D)
        B_BATTLE_E = BATTLEID(BATTLE_E)
        B_BATTLE_F = BATTLEID(BATTLE_F)
        B_BATTLE_10 = BATTLEID(BATTLE_10)
        B_BATTLE_11 = BATTLEID(BATTLE_11)
        B_BATTLE_12 = BATTLEID(BATTLE_12)
        B_BATTLE_13 = BATTLEID(BATTLE_13)
        B_BATTLE_14 = BATTLEID(BATTLE_14)
        B_BATTLE_15 = BATTLEID(BATTLE_15)
        B_BATTLE_16 = BATTLEID(BATTLE_16)
        B_BATTLE_17 = BATTLEID(BATTLE_17)
        B_BATTLE_18 = BATTLEID(BATTLE_18)
        B_BATTLE_19 = BATTLEID(BATTLE_19)
        B_BATTLE_1A = BATTLEID(BATTLE_1A)
        B_BATTLE_1B = BATTLEID(BATTLE_1B)
        B_BATTLE_1C = BATTLEID(BATTLE_1C)
        B_BATTLE_1D = BATTLEID(BATTLE_1D)
        B_BATTLE_1E = BATTLEID(BATTLE_1E)
        B_BATTLE_1F = BATTLEID(BATTLE_1F)
        B_BATTLE_20 = BATTLEID(BATTLE_20)
        B_BATTLE_21 = BATTLEID(BATTLE_21)
        B_BATTLE_22 = BATTLEID(BATTLE_22)
        B_BATTLE_23 = BATTLEID(BATTLE_23)
        B_BATTLE_24 = BATTLEID(BATTLE_MAGICANT_BIGWOODOH)
        B_BATTLE_25 = BATTLEID(BATTLE_MAGICANT_WOODOH)
        B_BATTLE_26 = BATTLEID(BATTLE_26)
        B_BATTLE_27 = BATTLEID(BATTLE_27)
        B_BATTLE_28 = BATTLEID(BATTLE_28)
        B_BATTLE_29 = BATTLEID(BATTLE_29)
        B_BATTLE_2A = BATTLEID(BATTLE_2A)
        B_BATTLE_2B = BATTLEID(BATTLE_2B)
        B_BATTLE_2C = BATTLEID(BATTLE_2C)
        B_BATTLE_2D = BATTLEID(BATTLE_2D)
        B_BATTLE_2E = BATTLEID(BATTLE_2E)
        B_BATTLE_2F = BATTLEID(BATTLE_2F)
        B_BATTLE_30 = BATTLEID(BATTLE_30)
        B_BATTLE_31 = BATTLEID(BATTLE_31)
        B_BATTLE_32 = BATTLEID(BATTLE_32)
        B_BATTLE_33 = BATTLEID(BATTLE_33)
        B_BATTLE_34 = BATTLEID(BATTLE_34)
        B_BATTLE_35 = BATTLEID(BATTLE_35)
        B_BATTLE_36 = BATTLEID(BATTLE_36)
        B_BATTLE_37 = BATTLEID(BATTLE_37)
        B_BATTLE_38 = BATTLEID(BATTLE_38)
        B_BATTLE_39 = BATTLEID(BATTLE_39)
        B_BATTLE_3A = BATTLEID(BATTLE_3A)
        B_BATTLE_3B = BATTLEID(BATTLE_3B)
        B_BATTLE_3C = BATTLEID(BATTLE_3C)
        B_BATTLE_3D = BATTLEID(BATTLE_3D)
        B_BATTLE_3E = BATTLEID(BATTLE_3E)
        B_BATTLE_3F = BATTLEID(BATTLE_3F)
        B_BATTLE_40 = BATTLEID(BATTLE_40)
        B_BATTLE_41 = BATTLEID(BATTLE_41)
        B_BATTLE_42 = BATTLEID(BATTLE_42)
        B_BATTLE_43 = BATTLEID(BATTLE_43)
        B_BATTLE_44 = BATTLEID(BATTLE_44)
        B_BATTLE_45 = BATTLEID(BATTLE_45)
        B_BATTLE_46 = BATTLEID(BATTLE_46)
        B_BATTLE_47 = BATTLEID(BATTLE_47)
        B_BATTLE_48 = BATTLEID(BATTLE_48)
        B_BATTLE_49 = BATTLEID(BATTLE_49)
        B_BATTLE_4A = BATTLEID(BATTLE_4A)
        B_BATTLE_4B = BATTLEID(BATTLE_4B)
        B_BATTLE_4C = BATTLEID(BATTLE_4C)
        B_BATTLE_4D = BATTLEID(BATTLE_4D)
        B_BATTLE_4E = BATTLEID(BATTLE_4E)
        B_BATTLE_4F = BATTLEID(BATTLE_4F)
        B_BATTLE_50 = BATTLEID(BATTLE_50)
        B_BATTLE_51 = BATTLEID(BATTLE_51)
        B_BATTLE_52 = BATTLEID(BATTLE_52)
        B_BATTLE_53 = BATTLEID(BATTLE_53)
        B_BATTLE_54 = BATTLEID(BATTLE_54)
        B_BATTLE_55 = BATTLEID(BATTLE_55)
        B_BATTLE_56 = BATTLEID(BATTLE_56)
        B_BATTLE_57 = BATTLEID(BATTLE_57)
        B_BATTLE_58 = BATTLEID(BATTLE_58)
        B_BATTLE_59 = BATTLEID(BATTLE_59)
        B_BATTLE_5A = BATTLEID(BATTLE_5A)
        B_BATTLE_5B = BATTLEID(BATTLE_5B)
        B_BATTLE_5C = BATTLEID(BATTLE_5C)
        B_BATTLE_5D = BATTLEID(BATTLE_5D)
        B_BATTLE_5E = BATTLEID(BATTLE_5E)
        B_BATTLE_5F = BATTLEID(BATTLE_5F)
        B_BATTLE_60 = BATTLEID(BATTLE_60)
        B_BATTLE_61 = BATTLEID(BATTLE_61)
        B_BATTLE_62 = BATTLEID(BATTLE_62)
        B_BATTLE_63 = BATTLEID(BATTLE_63)
        B_BATTLE_64 = BATTLEID(BATTLE_64)
        B_BATTLE_65 = BATTLEID(BATTLE_65)
        B_BATTLE_66 = BATTLEID(BATTLE_66)
        B_BATTLE_67 = BATTLEID(BATTLE_67)
        B_BATTLE_68 = BATTLEID(BATTLE_68)
        B_BATTLE_69 = BATTLEID(BATTLE_69)
        B_BATTLE_6A = BATTLEID(BATTLE_6A)
        B_BATTLE_6B = BATTLEID(BATTLE_6B)
        B_BATTLE_6C = BATTLEID(BATTLE_6C)
        B_BATTLE_6D = BATTLEID(BATTLE_6D)
        B_BATTLE_6E = BATTLEID(BATTLE_6E)
        B_BATTLE_6F = BATTLEID(BATTLE_6F)
        B_BATTLE_70 = BATTLEID(BATTLE_70)
        B_BATTLE_71 = BATTLEID(BATTLE_71)
        B_BATTLE_72 = BATTLEID(BATTLE_72)
        B_BATTLE_73 = BATTLEID(BATTLE_73)
        B_BATTLE_74 = BATTLEID(BATTLE_74)
        B_BATTLE_75 = BATTLEID(BATTLE_75)
        B_BATTLE_76 = BATTLEID(BATTLE_76)
        B_BATTLE_77 = BATTLEID(BATTLE_77)
        B_BATTLE_78 = BATTLEID(BATTLE_78)
        B_BATTLE_79 = BATTLEID(BATTLE_79)
        B_BATTLE_7A = BATTLEID(BATTLE_7A)
        B_BATTLE_7B = BATTLEID(BATTLE_7B)
        B_BATTLE_7C = BATTLEID(BATTLE_7C)
        B_BATTLE_7D = BATTLEID(BATTLE_7D)
        B_BATTLE_7E = BATTLEID(BATTLE_7E)
        B_BATTLE_7F = BATTLEID(BATTLE_7F)
        B_BATTLE_80 = BATTLEID(BATTLE_80)
        B_BATTLE_81 = BATTLEID(BATTLE_81)
        B_BATTLE_82 = BATTLEID(BATTLE_82)
        B_BATTLE_83 = BATTLEID(BATTLE_83)
        B_BATTLE_84 = BATTLEID(BATTLE_84)
        B_BATTLE_85 = BATTLEID(BATTLE_85)
        B_BATTLE_86 = BATTLEID(BATTLE_86)
        B_BATTLE_87 = BATTLEID(BATTLE_87)
        B_BATTLE_88 = BATTLEID(BATTLE_88)
        B_BATTLE_89 = BATTLEID(BATTLE_89)
        B_BATTLE_8A = BATTLEID(BATTLE_8A)
        B_BATTLE_8B = BATTLEID(BATTLE_8B)
        B_BATTLE_8C = BATTLEID(BATTLE_8C)
        B_BATTLE_8D = BATTLEID(BATTLE_8D)
        B_BATTLE_8E = BATTLEID(BATTLE_8E)
        B_BATTLE_8F = BATTLEID(BATTLE_8F)
        B_BATTLE_90 = BATTLEID(BATTLE_90)
        B_BATTLE_91 = BATTLEID(BATTLE_91)
        B_BATTLE_92 = BATTLEID(BATTLE_92)
        B_BATTLE_93 = BATTLEID(BATTLE_93)
        B_BATTLE_94 = BATTLEID(BATTLE_94)
        B_BATTLE_95 = BATTLEID(BATTLE_95)
        B_BATTLE_96 = BATTLEID(BATTLE_96)
        B_BATTLE_97 = BATTLEID(BATTLE_97)
        B_BATTLE_98 = BATTLEID(BATTLE_98)
        B_BATTLE_99 = BATTLEID(BATTLE_99)
        B_BATTLE_9A = BATTLEID(BATTLE_9A)
        B_BATTLE_9B = BATTLEID(BATTLE_9B)
        B_BATTLE_9C = BATTLEID(BATTLE_9C)
        B_BATTLE_9D = BATTLEID(BATTLE_9D)
        B_BATTLE_9E = BATTLEID(BATTLE_9E)
        B_BATTLE_9F = BATTLEID(BATTLE_9F)
        B_BATTLE_A0 = BATTLEID(BATTLE_A0)
        B_BATTLE_A1 = BATTLEID(BATTLE_A1)
        B_BATTLE_A2 = BATTLEID(BATTLE_A2)
        B_BATTLE_A3 = BATTLEID(BATTLE_A3)
        B_BATTLE_A4 = BATTLEID(BATTLE_A4)
.endenum

ramOffset := $5800
.segment        "PRGA": absolute



        .incbin "../../split/us/prg/banka.bin", 0, $1200

        ;format seems to be $10 per area, though why they sometimes pad with
        ;the same groups is questionable
        ;it SEEMS to use the duplicated parts??????? are they to 'increase'
        ;spawn rates????? i dont know man.
        .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

        SPAWNS_PODUNK:
        .byte $03,$05,$07,$08,$09,$0B,$00,$00
        .byte $03,$05,$07,$08,$09,$0B,$00,$00

        .byte $0C,$0D,$0E,$0F,$10,$11,$48,$00
        .byte $0C,$0D,$0E,$0F,$10,$11,$48,$00

        .byte $12,$13,$14,$15,$16,$17,$18,$19
        .byte $12,$13,$14,$15,$16,$17,$18,$19

        .byte $04,$05,$06,$07,$0B,$1B,$1C,$00
        .byte $04,$05,$06,$07,$0B,$1B,$1C,$00

        .byte $1C,$1D,$1E,$1F,$30,$31,$32,$34,$35,$36,$38,$3A,$3B,$00,$00,$00

        .byte $0A,$1C,$1D,$31,$32,$3C,$3D,$3E,$3F,$40,$9C,$00,$00,$00,$00,$00

        .byte $1C,$1E,$20,$21,$30,$32,$33,$36,$37,$47,$00,$00,$00,$00,$00,$00

        .byte $55,$56,$57,$58,$59,$00,$00,$00
        .byte $55,$56,$57,$58,$59,$00,$00,$00

        .byte $47,$5A,$5B,$5C,$5D,$61,$62,$63,$64,$66,$69,$00,$00,$00,$00,$00

        .byte $5C,$5E,$61,$64,$65,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$00,$00,$00

        .byte $5A,$5B,$70,$71,$72,$73,$75,$76,$77,$78,$79,$00,$00,$00,$00,$00

        .byte $5F,$60,$61,$66,$69,$73,$74,$7A,$7B,$7C,$7D,$00,$00,$00,$00,$00

        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$A3,$00,$00,$00
        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$A3,$00,$00,$00

        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$A3,$00,$00,$00,$00,$00,$00

        .byte $01,$02,$06,$1A
        .byte $01,$02,$06,$1A
        .byte $01,$02,$06,$1A
        .byte $01,$02,$06,$1A

        .byte $41,$42,$43,$44,$45,$46,$00,$00
        .byte $41,$42,$43,$44,$45,$46,$00,$00

        .byte $41,$42,$43,$44,$45,$46,$00,$00
        .byte $41,$42,$43,$44,$45,$46,$00,$00

        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$A3,$00,$00,$00

        SPAWNS_MYHOUSE_BASEMENT:
        .repeat $10
                .byte BATTLES::MYHOUSE_RAT1
        .endrepeat

        .byte $02,$1E,$02,$1E
        .byte $02,$1E,$02,$1E
        .byte $02,$1E,$02,$1E
        .byte $02,$1E,$02,$1E

        .byte $81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$00,$00,$00,$00,$00

        .byte $92,$93,$94,$95,$96,$97,$98,$99,$9A,$00,$00,$00,$00,$00,$00,$00

        .byte $7E,$7F,$80,$82
        .byte $7E,$7F,$80,$82
        .byte $7E,$7F,$80,$82
        .byte $7E,$7F,$80,$82

        .byte $8C,$8D,$8E,$00
        .byte $8C,$8D,$8E,$00
        .byte $8C,$8D,$8E,$00
        .byte $8C,$8D,$8E,$00

        SPAWNS_MAGICANT:
        .byte $22,$23,$24,$25,$26,$27,$28,$29,$2B,$2C,$2D,$00,$00,$00,$00,$00

        SPAWNS_MAGICANT_CAVES:
        .byte $2A,$2B,$2C,$2D,$A1,$00,$00,$00,$2A,$2B,$2C,$2D,$A1,$00,$00,$00

        .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

        .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

        .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

        .byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

        ;?????
        .incbin "../../split/us/prg/banka.bin", $1400, $158B-$1400

        .byte $20,$15,$10,$0D,$0A,$08,$06,$05

        .byte $00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$0C,$11,$E8,$26,$2D
        .byte $34,$3D,$43,$4D,$55,$5D,$65,$00
        .byte $00,$00,$00,$00,$6C,$74,$7C,$00
        .byte $00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$E0,$00,$00,$8D,$95,$9C,$A7
        .byte $00,$AD,$00,$00,$B5,$BD,$C5,$CD
        .byte $00,$00,$D6,$00,$00,$00,$DC,$00

        .incbin "../../split/us/prg/banka.bin", $15D3, $1ab5-$15D3
        ldx     #.LOBYTE(IntroText1-ramOffset)
        ldy     #.HIBYTE(IntroText1-ramOffset)
        .incbin "../../split/us/prg/banka.bin", $1ab9, $13
        ldx     #.LOBYTE(IntroText2-ramOffset)
        ldy     #.HIBYTE(IntroText2-ramOffset)
        .incbin "../../split/us/prg/banka.bin", $1ad0, $70
L9B40:  lda     #.LOBYTE(NameCharacters-ramOffset)
        sta     $64
        lda     #.HIBYTE(NameCharacters-ramOffset)
        sta     $65
        .incbin "../../split/us/prg/banka.bin", $1b48, $D7
        lda     #.LOBYTE(gridWidth-ramOffset)
        ldx     #.HIBYTE(gridWidth-ramOffset)
        sta     $80
        stx     $81
        lda     #.LOBYTE(NameCharacters-ramOffset)
        ldx     #.HIBYTE(NameCharacters-ramOffset)
        sta     $84
        stx     $85
        .incbin "../../split/us/prg/banka.bin", $1C2F, $1F
L9C4E:  ldx     $82 ; cursor (x*width)+y value
        lda     NameCharacters-ramOffset,x
        .incbin "../../split/us/prg/banka.bin", $1C53, $5C
L9CAF:  lda     ExistEntries-ramOffset,x
        .incbin "../../split/us/prg/banka.bin", $1CB2, $D
L9CBF:  lda     ExistEntries-ramOffset,x
        .incbin "../../split/us/prg/banka.bin", $1CC2, $233E

.code

