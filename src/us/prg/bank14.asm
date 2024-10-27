
;BATTLEID is a conscious decision to make id's dependant on offset
;(since it's basically an array, anyways)
;specifically to aid in shifting and general reordering.
.define BATTLEID(ta) .LOBYTE((ta-BATTLES_START)/$A)
.scope BATTLES
        NULL = BATTLEID(BATTLE_NULL)
        MYHOUSE_RAT1 = BATTLEID(BATTLE_MYHOUSE_RAT1)
        B2 = BATTLEID(BATTLE_2)
        B3 = BATTLEID(BATTLE_3)
        B4 = BATTLEID(BATTLE_4)
        B5 = BATTLEID(BATTLE_5)
        B6 = BATTLEID(BATTLE_6)
        B7 = BATTLEID(BATTLE_7)
        B8 = BATTLEID(BATTLE_8)
        B9 = BATTLEID(BATTLE_9)
        BA = BATTLEID(BATTLE_A)
        BB = BATTLEID(BATTLE_B)
        BC = BATTLEID(BATTLE_C)
        BD = BATTLEID(BATTLE_D)
        BE = BATTLEID(BATTLE_E)
        BF = BATTLEID(BATTLE_F)
        B10 = BATTLEID(BATTLE_10)
        B11 = BATTLEID(BATTLE_11)
        B12 = BATTLEID(BATTLE_12)
        B13 = BATTLEID(BATTLE_13)
        B14 = BATTLEID(BATTLE_14)
        B15 = BATTLEID(BATTLE_15)
        B16 = BATTLEID(BATTLE_16)
        B17 = BATTLEID(BATTLE_17)
        B18 = BATTLEID(BATTLE_18)
        B19 = BATTLEID(BATTLE_19)
        B1A = BATTLEID(BATTLE_1A)
        B1B = BATTLEID(BATTLE_1B)
        B1C = BATTLEID(BATTLE_1C)
        B1D = BATTLEID(BATTLE_1D)
        B1E = BATTLEID(BATTLE_1E)
        B1F = BATTLEID(BATTLE_1F)
        B20 = BATTLEID(BATTLE_20)
        B21 = BATTLEID(BATTLE_21)
        B22 = BATTLEID(BATTLE_22)
        B23 = BATTLEID(BATTLE_23)
        B24 = BATTLEID(BATTLE_MAGICANT_BIGWOODOH)
        B25 = BATTLEID(BATTLE_MAGICANT_WOODOH)
        B26 = BATTLEID(BATTLE_26)
        B27 = BATTLEID(BATTLE_27)
        B28 = BATTLEID(BATTLE_28)
        B29 = BATTLEID(BATTLE_29)
        B2A = BATTLEID(BATTLE_2A)
        B2B = BATTLEID(BATTLE_2B)
        B2C = BATTLEID(BATTLE_2C)
        B2D = BATTLEID(BATTLE_2D)
        B2E = BATTLEID(BATTLE_2E)
        B2F = BATTLEID(BATTLE_2F)
        B30 = BATTLEID(BATTLE_30)
        B31 = BATTLEID(BATTLE_31)
        B32 = BATTLEID(BATTLE_32)
        B33 = BATTLEID(BATTLE_33)
        B34 = BATTLEID(BATTLE_34)
        B35 = BATTLEID(BATTLE_35)
        B36 = BATTLEID(BATTLE_36)
        B37 = BATTLEID(BATTLE_37)
        B38 = BATTLEID(BATTLE_38)
        B39 = BATTLEID(BATTLE_39)
        B3A = BATTLEID(BATTLE_3A)
        B3B = BATTLEID(BATTLE_3B)
        B3C = BATTLEID(BATTLE_3C)
        B3D = BATTLEID(BATTLE_3D)
        B3E = BATTLEID(BATTLE_3E)
        B3F = BATTLEID(BATTLE_3F)
        B40 = BATTLEID(BATTLE_40)
        B41 = BATTLEID(BATTLE_41)
        B42 = BATTLEID(BATTLE_42)
        B43 = BATTLEID(BATTLE_43)
        B44 = BATTLEID(BATTLE_44)
        B45 = BATTLEID(BATTLE_45)
        B46 = BATTLEID(BATTLE_46)
        B47 = BATTLEID(BATTLE_47)
        B48 = BATTLEID(BATTLE_48)
        B49 = BATTLEID(BATTLE_49)
        B4A = BATTLEID(BATTLE_4A)
        B4B = BATTLEID(BATTLE_4B)
        B4C = BATTLEID(BATTLE_4C)
        B4D = BATTLEID(BATTLE_4D)
        B4E = BATTLEID(BATTLE_4E)
        B4F = BATTLEID(BATTLE_4F)
        B50 = BATTLEID(BATTLE_50)
        B51 = BATTLEID(BATTLE_51)
        B52 = BATTLEID(BATTLE_52)
        B53 = BATTLEID(BATTLE_53)
        B54 = BATTLEID(BATTLE_54)
        B55 = BATTLEID(BATTLE_55)
        B56 = BATTLEID(BATTLE_56)
        B57 = BATTLEID(BATTLE_57)
        B58 = BATTLEID(BATTLE_58)
        B59 = BATTLEID(BATTLE_59)
        B5A = BATTLEID(BATTLE_5A)
        B5B = BATTLEID(BATTLE_5B)
        B5C = BATTLEID(BATTLE_5C)
        B5D = BATTLEID(BATTLE_5D)
        B5E = BATTLEID(BATTLE_5E)
        B5F = BATTLEID(BATTLE_5F)
        B60 = BATTLEID(BATTLE_60)
        B61 = BATTLEID(BATTLE_61)
        B62 = BATTLEID(BATTLE_62)
        B63 = BATTLEID(BATTLE_63)
        B64 = BATTLEID(BATTLE_64)
        B65 = BATTLEID(BATTLE_65)
        B66 = BATTLEID(BATTLE_66)
        B67 = BATTLEID(BATTLE_67)
        B68 = BATTLEID(BATTLE_68)
        B69 = BATTLEID(BATTLE_69)
        B6A = BATTLEID(BATTLE_6A)
        B6B = BATTLEID(BATTLE_6B)
        B6C = BATTLEID(BATTLE_6C)
        B6D = BATTLEID(BATTLE_6D)
        B6E = BATTLEID(BATTLE_6E)
        B6F = BATTLEID(BATTLE_6F)
        B70 = BATTLEID(BATTLE_70)
        B71 = BATTLEID(BATTLE_71)
        B72 = BATTLEID(BATTLE_72)
        B73 = BATTLEID(BATTLE_73)
        B74 = BATTLEID(BATTLE_74)
        B75 = BATTLEID(BATTLE_75)
        B76 = BATTLEID(BATTLE_76)
        B77 = BATTLEID(BATTLE_77)
        B78 = BATTLEID(BATTLE_78)
        B79 = BATTLEID(BATTLE_79)
        B7A = BATTLEID(BATTLE_7A)
        B7B = BATTLEID(BATTLE_7B)
        B7C = BATTLEID(BATTLE_7C)
        B7D = BATTLEID(BATTLE_7D)
        B7E = BATTLEID(BATTLE_7E)
        B7F = BATTLEID(BATTLE_7F)
        B80 = BATTLEID(BATTLE_80)
        B81 = BATTLEID(BATTLE_81)
        B82 = BATTLEID(BATTLE_82)
        B83 = BATTLEID(BATTLE_83)
        B84 = BATTLEID(BATTLE_84)
        B85 = BATTLEID(BATTLE_85)
        B86 = BATTLEID(BATTLE_86)
        B87 = BATTLEID(BATTLE_87)
        B88 = BATTLEID(BATTLE_88)
        B89 = BATTLEID(BATTLE_89)
        B8A = BATTLEID(BATTLE_8A)
        B8B = BATTLEID(BATTLE_8B)
        B8C = BATTLEID(BATTLE_8C)
        B8D = BATTLEID(BATTLE_8D)
        B8E = BATTLEID(BATTLE_8E)
        B8F = BATTLEID(BATTLE_8F)
        B90 = BATTLEID(BATTLE_90)
        B91 = BATTLEID(BATTLE_91)
        B92 = BATTLEID(BATTLE_92)
        B93 = BATTLEID(BATTLE_93)
        B94 = BATTLEID(BATTLE_94)
        B95 = BATTLEID(BATTLE_95)
        B96 = BATTLEID(BATTLE_96)
        B97 = BATTLEID(BATTLE_97)
        B98 = BATTLEID(BATTLE_98)
        B99 = BATTLEID(BATTLE_99)
        B9A = BATTLEID(BATTLE_9A)
        B9B = BATTLEID(BATTLE_9B)
        B9C = BATTLEID(BATTLE_9C)
        B9D = BATTLEID(BATTLE_9D)
        B9E = BATTLEID(BATTLE_9E)
        B9F = BATTLEID(BATTLE_9F)
        BA0 = BATTLEID(BATTLE_A0)
        BA1 = BATTLEID(BATTLE_A1)
        BA2 = BATTLEID(BATTLE_A2)
        BA3 = BATTLEID(BATTLE_A3)
        BA4 = BATTLEID(BATTLE_A4)
.endscope

ramOffset := $5800
.segment        "PRG14": absolute



        .incbin "../../split/us/prg/bank14.bin", 0, $1200

        ;format seems to be $10 per area, though why they sometimes pad with
        ;the same groups is questionable
        ;it SEEMS to use the duplicated parts??????? are they to 'increase'
        ;spawn rates????? i dont know man.
        ;addendum; area is the perfect term. it goes off of sector area param
        SPAWN_SETS: ;use this symbol when the handler gets disasmd
        SPAWNS_0:
        .repeat $10
                .byte $1
        .endrepeat
        SPAWNS_1:
        .repeat 2
                .byte $3,$05,$07,$08,$09,$0B,$00,$00
        .endrepeat
        SPAWNS_2:
        .repeat 2
                .byte $0C,$0D,$0E,$0F,$10,$11,$48,$00
        .endrepeat
        SPAWNS_3:
        .repeat 2
                .byte $12,$13,$14,$15,$16,$17,$18,$19
        .endrepeat
        SPAWNS_4:
        .repeat 2
                .byte $04,$05,$06,$07,$0B,$1B,$1C,$00
        .endrepeat
        SPAWNS_5:
        .byte $1C,$1D,$1E,$1F,$30,$31,$32,$34,$35,$36,$38,$3A,$3B,$00,$00,$00
        SPAWNS_6:
        .byte $0A,$1C,$1D,$31,$32,$3C,$3D,$3E,$3F,$40,$9C,$00,$00,$00,$00,$00
        SPAWNS_7:
        .byte $1C,$1E,$20,$21,$30,$32,$33,$36,$37,$47,$00,$00,$00,$00,$00,$00
        SPAWNS_8:
        .repeat 2
                .byte $55,$56,$57,$58,$59,$00,$00,$00
        .endrepeat
        SPAWNS_9:
        .byte $47,$5A,$5B,$5C,$5D,$61,$62,$63,$64,$66,$69,$00,$00,$00,$00,$00
        SPAWNS_A:
        .byte $5C,$5E,$61,$64,$65,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$00,$00,$00
        SPAWNS_B:
        .byte $5A,$5B,$70,$71,$72,$73,$75,$76,$77,$78,$79,$00,$00,$00,$00,$00
        SPAWNS_C:
        .byte $5F,$60,$61,$66,$69,$73,$74,$7A,$7B,$7C,$7D,$00,$00,$00,$00,$00
        SPAWNS_D:
        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$A3,$00,$00,$00
        SPAWNS_E:
        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$A3,$00,$00,$00
        SPAWNS_F:
        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$A3,$00,$00,$00,$00,$00,$00
        SPAWNS_10:
        .repeat 4
                .byte $01,$02,$06,$1A
        .endrepeat
        SPAWNS_11:
        .repeat 2
                .byte $41,$42,$43,$44,$45,$46,$00,$00
        .endrepeat
        SPAWNS_12:
        .repeat 2
                .byte $41,$42,$43,$44,$45,$46,$00,$00
        .endrepeat
        SPAWNS_13:
        .byte $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$A3,$00,$00,$00
        SPAWNS_14:
        .repeat $10
                .byte BATTLES::MYHOUSE_RAT1
        .endrepeat
        SPAWNS_15:
        .repeat 4
                .byte $02,$1E,$02,$1E
        .endrepeat
        SPAWNS_16:
        .byte $81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$00,$00,$00,$00,$00
        SPAWNS_17:
        .byte $92,$93,$94,$95,$96,$97,$98,$99,$9A,$00,$00,$00,$00,$00,$00,$00
        SPAWNS_18:
        .repeat 4
                .byte $7E,$7F,$80,$82
        .endrepeat
        SPAWNS_19:
        .repeat 4
                .byte $8C,$8D,$8E,$00
        .endrepeat
        SPAWNS_1A:
        .byte $22,$23,$24,$25,$26,$27,$28,$29,$2B,$2C,$2D,$00,$00,$00,$00,$00
        SPAWNS_1B:
        .byte $2A,$2B,$2C,$2D,$A1,$00,$00,$00,$2A,$2B,$2C,$2D,$A1,$00,$00,$00
        SPAWNS_1C:
        .repeat $10
                .byte BATTLES::MYHOUSE_RAT1
        .endrepeat
        SPAWNS_1D:
        .repeat $10
                .byte BATTLES::MYHOUSE_RAT1
        .endrepeat
        SPAWNS_1E:
        .repeat $10
                .byte BATTLES::MYHOUSE_RAT1
        .endrepeat
        SPAWNS_1F:
        .repeat $10
                .byte BATTLES::MYHOUSE_RAT1
        .endrepeat

        ;?????
        incbinRange "../../split/us/prg/bank14.bin", $1400, $158B

        ;lookup table for frequencies
        .byte 32,21,16,13,10,8,6,5

        ;area based encounter sets
        .macro areaEncounterDef frequency, id
                .byte (id << 3) | frequency
        .endmacro
        .byte 0 ; 0
        .byte 0 ; 1
        .byte 0 ; 2
        .byte 0 ; 3
        .byte 0 ; 4
        .byte 0 ; 5
        .byte 0 ; 6
        .byte 0 ; 7
        .byte 0 ; 8
        .byte 0 ; 9
        .byte 0 ; A
        areaEncounterDef 4, 1 ; B
        areaEncounterDef 1, 2 ; C
        areaEncounterDef 0, $1D ; D
        areaEncounterDef 6, 4 ; E
        areaEncounterDef 5, 5 ; F
        areaEncounterDef 4, 6 ; 10
        areaEncounterDef 5, 7 ; 11
        areaEncounterDef 3, 8 ; 12
        areaEncounterDef 5, 9 ; 13
        areaEncounterDef 5, $A ; 14
        areaEncounterDef 5, $B ; 15
        areaEncounterDef 5, $C ; 16
        .byte 0 ; 17
        .byte 0 ; 18
        .byte 0 ; 19
        .byte 0 ; 1A
        .byte 0 ; 1B
        areaEncounterDef 4, $D ; 1C
        areaEncounterDef 4, $E ; 1D
        areaEncounterDef 4, $F ; 1E
        .byte 0 ; 1F
        .byte 0 ; 20
        .byte 0 ; 21
        .byte 0 ; 22
        .byte 0 ; 23
        .byte 0 ; 24
        .byte 0 ; 25
        .byte 0 ; 26
        .byte 0 ; 27
        .byte 0 ; 28
        areaEncounterDef 0, $1C ; 29
        .byte 0 ; 2A
        .byte 0 ; 2B
        areaEncounterDef 5, $11 ; 2C
        areaEncounterDef 5, $12 ; 2D
        areaEncounterDef 4, $13 ; 2E
        areaEncounterDef 7, $14 ; 2F
        .byte 0 ; 30
        areaEncounterDef 5, $15 ; 31
        .byte 0 ; 32
        .byte 0 ; 33
        areaEncounterDef 5, $16 ; 34
        areaEncounterDef 5, $17 ; 35
        areaEncounterDef 5, $18 ; 36
        areaEncounterDef 5, $19 ; 37
        .byte 0 ; 38
        .byte 0 ; 39
        areaEncounterDef 6, $1A ; 3A
        .byte 0 ; 3B
        .byte 0 ; 3C
        .byte 0 ; 3D
        areaEncounterDef 4, $1B ; 3E
        .byte 0 ; 3F

        incbinRange "../../split/us/prg/bank14.bin", $15D3, $1ab5

        ldx     #.LOBYTE(IntroText1-ramOffset)
        ldy     #.HIBYTE(IntroText1-ramOffset)
        incbinRange "../../split/us/prg/bank14.bin", $1ab9, $1acc
        ldx     #.LOBYTE(IntroText2-ramOffset)
        ldy     #.HIBYTE(IntroText2-ramOffset)
        incbinRange "../../split/us/prg/bank14.bin", $1ad0, $1B40
L9B40:  lda     #.LOBYTE(NameCharacters-ramOffset)
        sta     $64
        lda     #.HIBYTE(NameCharacters-ramOffset)
        sta     $65
        incbinRange "../../split/us/prg/bank14.bin", $1b48, $1C1F
        lda     #.LOBYTE(gridWidth-ramOffset)
        ldx     #.HIBYTE(gridWidth-ramOffset)
        sta     $80
        stx     $81
        lda     #.LOBYTE(NameCharacters-ramOffset)
        ldx     #.HIBYTE(NameCharacters-ramOffset)
        sta     $84
        stx     $85
        incbinRange "../../split/us/prg/bank14.bin", $1C2F, $1C4E
L9C4E:  ldx     $82 ; cursor (x*width)+y value
        lda     NameCharacters-ramOffset,x
        incbinRange "../../split/us/prg/bank14.bin", $1C53, $1CAF
L9CAF:  lda     ExistEntries-ramOffset,x
        incbinRange "../../split/us/prg/bank14.bin", $1CB2, $1CBF
L9CBF:  lda     ExistEntries-ramOffset,x
        incbinRange "../../split/us/prg/bank14.bin", $1CC2, $1f9f