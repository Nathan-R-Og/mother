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

.segment        "PRG14": absolute


; Map tile properties
    .incbin "../../split/us/prg/bank14/unk0.bin"

;overworld palettes + map exclusive data
;1st and 3rd byte of last palette of each set contains map data
Map_Palettes:
    .byte $0F,$00,$10,$30
    .byte $0F,$00,$10,$30
    .byte $0F,$00,$10,$30
    .byte $00,$00,$40,$30

    .byte $0F,$3A,$18,$38
    .byte $0F,$3A,$10,$20
    .byte $0F,$3A,$25,$1A
    .byte $02,$3A,$4B,$12

    .byte $0F,$20,$20,$10
    .byte $0F,$20,$20,$10
    .byte $0F,$20,$20,$28
    .byte $09,$20,$40,$3B

    .byte $0F,$38,$18,$1C
    .byte $0F,$38,$10,$3B
    .byte $0F,$38,$25,$1A
    .byte $1A,$38,$40,$00

    .byte $0F,$38,$18,$16
    .byte $0F,$10,$30,$21
    .byte $0F,$3A,$28,$21
    .byte $17,$38,$40,$3C

    .byte $0F,$39,$00,$00
    .byte $0F,$39,$20,$10
    .byte $0F,$39,$30,$2B
    .byte $1B,$39,$40,$3B

    .byte $0F,$38,$18,$1C
    .byte $0F,$38,$10,$3B
    .byte $0F,$38,$25,$1A
    .byte $1A,$38,$40,$00

    .byte $0F,$38,$18,$21
    .byte $0F,$10,$30,$2A
    .byte $0F,$00,$10,$30
    .byte $14,$10,$40,$21

    .byte $0F,$38,$18,$00
    .byte $0F,$38,$24,$2B
    .byte $0F,$12,$31,$02
    .byte $1A,$21,$40,$00

    .byte $0F,$38,$18,$1C
    .byte $0F,$38,$10,$3B
    .byte $0F,$38,$25,$1A
    .byte $1A,$38,$40,$00

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$66,$30

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$41,$30

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$40,$30

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$40,$30

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$40,$30

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$40,$30

    .byte $0F,$10,$00,$08
    .byte $0F,$10,$00,$16
    .byte $0F,$10,$00,$12
    .byte $13,$00,$40,$30

    .byte $0F,$00,$10,$30
    .byte $0F,$00,$10,$30
    .byte $0F,$00,$10,$30
    .byte $00,$00,$40,$30

    .byte $0F,$38,$18,$17
    .byte $0F,$38,$18,$28
    .byte $0F,$38,$00,$27
    .byte $0A,$38,$76,$22

    .byte $0F,$3B,$18,$38
    .byte $0F,$28,$18,$38
    .byte $0F,$33,$25,$38
    .byte $16,$26,$40,$00

    .byte $0F,$0F,$17,$27
    .byte $0F,$0F,$17,$27
    .byte $0F,$0F,$17,$27
    .byte $0E,$18,$6E,$28

    .byte $0F,$04,$15,$25
    .byte $0F,$38,$18,$21
    .byte $0F,$38,$18,$28
    .byte $1D,$04,$4C,$34

    .byte $0F,$34,$30,$24
    .byte $0F,$34,$30,$35
    .byte $0F,$2B,$35,$15
    .byte $0F,$34,$00,$3B

    .byte $0F,$37,$35,$17
    .byte $0F,$37,$28,$17
    .byte $0F,$37,$3A,$17
    .byte $18,$37,$40,$17

    .byte $0F,$3B,$34,$2B
    .byte $0F,$3B,$28,$2B
    .byte $0F,$3B,$29,$2B
    .byte $18,$3B,$40,$2B

    .byte $0F,$3B,$15,$1B
    .byte $0F,$38,$15,$1B
    .byte $0F,$3B,$0B,$1B
    .byte $18,$3B,$40,$1B

    .byte $0F,$3A,$18,$38
    .byte $0F,$3A,$00,$20
    .byte $0F,$3A,$25,$1A
    .byte $0B,$3A,$42,$12

    .byte $0F,$04,$03,$23
    .byte $0F,$04,$27,$30
    .byte $0F,$04,$05,$30
    .byte $1A,$04,$40,$34

    .byte $0F,$0F,$21,$30
    .byte $0F,$12,$12,$21
    .byte $0F,$12,$21,$30
    .byte $0E,$17,$6E,$30

    .byte $0F,$10,$33,$22
    .byte $0F,$10,$03,$22
    .byte $0F,$00,$10,$30
    .byte $00,$00,$40,$30

    .byte $0F,$37,$18,$31
    .byte $0F,$37,$10,$3B
    .byte $0F,$37,$30,$24
    .byte $1A,$37,$40,$27

    .byte $0F,$00,$10,$30
    .byte $0F,$00,$10,$30
    .byte $0F,$00,$10,$30
    .byte $00,$00,$40,$30

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

intro:
    jsr BankswitchUpper_Bank19
    jsr $9D60
    bcs_1:
    jsr B31_1d5e
    jsr B31_1d80
    jsr B30_0e02
    jsr PpuSync
    lda #25
    ldx #$8A
    ldy #$A2
    jsr TempUpperBankswitch
    jsr ResetScroll
    lda #$35
    ldx #$62
    jsr BankswitchCHRFromTable
    lda #$3B
    ldx #$62
    jsr LoadPalette
    ldx #$0C
    jsr $9505
    jsr $94D7
    jsr $950E
    lda #$00
    sta $D6
    ldy $82
    lda ($84), y
    ;get offset
    asl A
    tax

    ;stash pointer into stack
    lda unk_pointers+1, x
    pha
    lda unk_pointers, x
    pha

    tya
    lsr A
    lsr A

    ;jump to last in stack (from list)
    rts

unk_pointers:
    .word B19_1e88-1
    .word B20_148c-1
    .word B20_1472-1
    .word something_init-1

something_init:
    pha
    jsr EnablePRGRam

    lda #$18
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    pla
    jsr rts_5
    jsr WriteProtectPRGRam
    jsr BankswitchUpper_Bank19
    jsr $9A4D
    bcs bcs_1
    jmp $BE57

B20_1472:
    jsr $94c0       ; 20 c0 94
	bne B20_1489 ; d0 12
	lda $7402       ; ad 02 74
	jsr $bebb       ; 20 bb be
	jsr EnablePRGRam    ; 20 e7 fd
	ldy #$03        ; a0 03
	lda #$00        ; a9 00
	sta ($68), y    ; 91 68
	jsr WriteProtectPRGRam  ; 20 ed fd
    B20_1489:
    jmp $942c       ; 4c 2c 94

B20_148c:
    sta $36         ; 85 36
	ldx #$10        ; a2 10
	jsr $9505       ; 20 05 95
	lda $36         ; a5 36
	sec             ; 38
	rol a           ; 2a
	asl a           ; 0a
	tax             ; aa
	jsr $950b       ; 20 0b 95
	bit $83         ; 24 83
	bvs B20_14bd ; 70 1d
	lda $82         ; a5 82
	sta $37         ; 85 37
	jsr $94c0       ; 20 c0 94
	bcs B20_14ab ; b0 02
	bne B20_14bd ; d0 12
    B20_14ab:
    lda $36         ; a5 36
	jsr $be88       ; 20 88 be
	jsr EnablePRGRam    ; 20 e7 fd
	lda $37         ; a5 37
	ora #$b0        ; 09 b0
	sta $7402       ; 8d 02 74
	jsr $be57       ; 20 57 be
    B20_14bd:
    jmp $942c       ; 4c 2c 94
	jsr $be88       ; 20 88 be
	sec             ; 38
	bne B20_14d6 ; d0 10
	ldx #$0e        ; a2 0e
	jsr $601e       ; 20 1e 60
	jsr B30_067a       ; 20 7a c6
	ldx #$0e        ; a2 0e
	jsr $950b       ; 20 0b 95
	clc             ; 18
	lda $82         ; a5 82
    B20_14d6:
    rts             ; 60

B20_14d7:
    lda #$00        ; a9 00
    B20_14d9:
    sta $37         ; 85 37
	lsr a           ; 4a
	lsr a           ; 4a
	jsr $be88       ; 20 88 be
	beq B20_14e4 ; f0 02
	lda #$04        ; a9 04
    B20_14e4:
    sta $36         ; 85 36
	ldx $37         ; a6 37
	jsr $6000       ; 20 00 60
	lda $36         ; a5 36
	lsr a           ; 4a
	adc $37         ; 65 37
	tax             ; aa
	jsr $9505       ; 20 05 95
	clc             ; 18
	lda $37         ; a5 37
	adc #$04        ; 69 04
	cmp #$0c        ; c9 0c
	bcc B20_14d9 ; 90 dc
	ldx #$0c        ; a2 0c
	jsr $6029       ; 20 29 60
	jmp $6034       ; 4c 34 60

B20_1505:
    jsr $601e       ; 20 1e 60 ; $74 = $607e[x]
    jmp B30_067a       ; 4c 7a c6

B20_150b:
    jsr $6029       ; 20 29 60 ; $80 = $6085[x]
	jsr B31_0f34       ; 20 34 ef
	lda #$ff        ; a9 ff
	jmp B31_10b0       ; 4c b0 f0

B20_1516:
    lda enemy_group         ; a5 48
	ora fade_flag           ; 05 20
	ora $21                 ; 05 21
	ora autowalk_direction  ; 05 22
	ora $23                 ; 05 23
	ora $25                 ; 05 25
	bne B20_1538            ; d0 14
	bit $a0                 ; 24 a0
	bmi B20_1538            ; 30 10
	jsr $95d3               ; 20 d3 95
	ldx $15                 ; a6 15
	lda AREA_ENCOUNTER_LIST, x         ; bd 93 95
	bne B20_1539            ; d0 07
	sta $24                 ; 85 24
    B20_1534:
    lda #$00                ; a9 00
	sta enemy_group         ; 85 48
    B20_1538:
    rts                     ; 60

B20_1539:
    tay             ; a8
	and #$07        ; 29 07
	bne B20_1548 ; d0 0a
	tya             ; 98
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
	jsr B31_00f2       ; 20 f2 e0
	jmp $9530       ; 4c 30 95

B25_04a7 := $a4a7
B20_1548:
    clc             ; 18
	adc $24         ; 65 24
	cmp #$09        ; c9 09
	bcc B20_1551 ; 90 02
	lda #$08        ; a9 08
    B20_1551:
    tax             ; aa
	jsr Rand            ; 20 ed f1
	cmp AREA_FREQ_TABLE-1, x   ; dd 8a 95
	bcs B20_1534 ; b0 da
	ldx $24         ; a6 24
	inx             ; e8
	cpx #$03        ; e0 03
	bcc B20_1563 ; 90 02
	ldx #$02        ; a2 02
    B20_1563:
    stx $24         ; 86 24
	tya             ; 98
	and #$f8        ; 29 f8
	sta $68         ; 85 68
	lda #$00        ; a9 00
	asl $68         ; 06 68
	rol a           ; 2a
	adc #$92        ; 69 92
	sta $69         ; 85 69
    B20_1573:
    jsr Rand            ; 20 ed f1
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
	lsr a           ; 4a
	tay             ; a8
	lda ($68), y    ; b1 68
	beq B20_1573 ; f0 f4
	sta enemy_group     ; 85 48
	lda #25         ; a9 19
	ldx #<(B25_04a7-1)    ; a2 a6
	ldy #>(B25_04a7-1)    ; a0 a4
	jsr TempUpperBankswitch ; 20 f3 fd
	rts             ; 60

    AREA_FREQ_TABLE:
    ;lookup table for frequencies
    .byte 32,21,16,13,10,8,6,5

    ;area based encounter sets
    .macro areaEncounterDef frequency, id
            .byte (id << 3) | frequency
    .endmacro

    AREA_ENCOUNTER_LIST:
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

; $95D3
; UNKNOWN
B20_15d3:
    ldx #$00        ; a2 00
    B20_15d5:
    lda party_members, x    ; bd 08 74
	beq B20_162a ; f0 50
	jsr GetPartyMemberData  ; 20 65 c6
	ldy #$01        ; a0 01
	lda ($60), y    ; b1 60
	lsr a           ; 4a
	bcc B20_15e8 ; 90 04
	lda #$07        ; a9 07
	bne B20_15ed ; d0 05
    B20_15e8:
    lsr a           ; 4a
	bcc B20_162a ; 90 3f
	lda #$07        ; a9 07
    B20_15ed:
    sta $64         ; 85 64
	clc             ; 18
	txa             ; 8a
	adc $d5         ; 65 d5
	and $64         ; 25 64
	bne B20_162a ; d0 33
	jsr EnablePRGRam    ; 20 e7 fd
	sec             ; 38
	ldy #$14        ; a0 14
	lda ($60), y    ; b1 60
	sbc #$01        ; e9 01
	sta $64         ; 85 64
	iny             ; c8
	lda ($60), y    ; b1 60
	sbc #$00        ; e9 00
	sta $65         ; 85 65
	bcc B20_161b ; 90 0f
	lda $64         ; a5 64
	ora $65         ; 05 65
	beq B20_161b ; f0 09
	lda $65         ; a5 65
	sta ($60), y    ; 91 60
	dey             ; 88
	lda $64         ; a5 64
	sta ($60), y    ; 91 60
    B20_161b:
    jsr WriteProtectPRGRam  ; 20 ed fd
	txa             ; 8a
	pha             ; 48
	lda #$16        ; a9 16
	jsr BackupAndFillPalette    ; 20 fe ed
	jsr RestoreAndUpdatePalette ; 20 b0 ee
	pla             ; 68
	tax             ; aa
    B20_162a:
    inx             ; e8
	cpx #$04        ; e0 04
	bcc B20_15d5 ; 90 a6
	rts             ; 60

B20_1630:
    lda enemy_group             ; a5 48
	cmp #$a2                    ; c9 a2
	beq B20_1684                ; f0 4e
	lda #$30                    ; a9 30
	jsr BackupAndFillPalette    ; 20 fe ed
	jsr RestoreAndUpdatePalette ; 20 b0 ee
	jsr B31_1dc0                   ; 20 c0 fd
	lda #$07                    ; a9 07    ; WRITE_PPU
	sta $0400                   ; 8d 00 04
	lda #$00                    ; a9 00
	sta $0401                   ; 8d 01 04
	sta $60                     ; 85 60
    B20_164d:
    ldx $60                     ; a6 60
	lda B20_16f1, x             ; bd f1 96
	cmp #$ff                    ; c9 ff
	beq B20_1675                ; f0 1f
	lsr a                       ; 4a
	lsr a                       ; 4a
	lsr a                       ; 4a
	lsr a                       ; 4a
	sta $61                     ; 85 61
	lda B20_16f1, x             ; bd f1 96
	and #$0f                    ; 29 0f
	sta $62                     ; 85 62
	jsr $9685                   ; 20 85 96
	ldx $61                     ; a6 61
	ldy $62                     ; a4 62
	sty $61                     ; 84 61
	stx $62                     ; 86 62
	jsr $9685                   ; 20 85 96
	inc $60                     ; e6 60
	bne B20_164d                ; d0 d8
    B20_1675:
    lda $0401                   ; ad 01 04
	cmp #$00                    ; c9 00
	beq B20_1684                ; f0 08
	lda #$00                    ; a9 00
	sta $e6                     ; 85 e6
	lda #$01                    ; a9 01
	sta $e5                     ; 85 e5
    B20_1684:
    rts                         ; 60

B20_1685:
    lda #$0e        ; a9 0e
	sec             ; 38
	sbc $62         ; e5 62
	bcs B20_168e ; b0 02
	lda #$00        ; a9 00
    B20_168e:
    sta $77         ; 85 77
	pha             ; 48
	lda #$0f        ; a9 0f
	sec             ; 38
	sbc $61         ; e5 61
	sta $76         ; 85 76
	jsr $96b8       ; 20 b8 96
	lda #$0f        ; a9 0f
	clc             ; 18
	adc $62         ; 65 62
	cmp #$1e        ; c9 1e
	bcc B20_16a6 ; 90 02
	lda #$1d        ; a9 1d
    B20_16a6:
    sta $77         ; 85 77
	jsr $96b8       ; 20 b8 96
	lda #$10        ; a9 10
	clc             ; 18
	adc $61         ; 65 61
	sta $76         ; 85 76
	jsr $96b8       ; 20 b8 96
	pla             ; 68
	sta $77         ; 85 77
	lda $0401       ; ad 01 04
	cmp #$14        ; c9 14
	bcc B20_16cf ; 90 10
	lda #$00        ; a9 00
	sta $e6         ; 85 e6
	lda #$01        ; a9 01
	sta $e5         ; 85 e5
	jsr PpuSync     ; 20 33 fd
	lda #$00        ; a9 00
	sta $0401       ; 8d 01 04
    B20_16cf:
    jsr B30_09d7       ; 20 d7 c9
	lda $0401       ; ad 01 04
	asl a           ; 0a
	clc             ; 18
	adc $0401       ; 6d 01 04
	tax             ; aa
	lda $78         ; a5 78
	sta $0402, x    ; 9d 02 04
	lda $79         ; a5 79
	sta $0403, x    ; 9d 03 04
	lda #$00        ; a9 00
	sta $0404, x    ; 9d 04 04
	sta $0405, x    ; 9d 05 04
	inc $0401       ; ee 01 04
	rts             ; 60

; $96F1 - Unknown
B20_16f1:
    .byte $00, $fe, $10, $fd, $ee, $11, $fb, $fc
    .byte $ed, $20, $21, $ec, $dd, $30, $31, $22
    .byte $f9, $fa, $eb, $dc, $40, $41, $32, $33
    .byte $f7, $f8, $e9, $ea, $db, $cc, $42, $da
    .byte $50, $51, $52, $43, $f4, $f5, $f6, $e7
    .byte $e8, $d9, $ca, $cb, $60, $61, $62, $53
    .byte $44, $bb, $f0, $f1, $f2, $f3, $54, $e4
    .byte $e5, $e6, $d7, $d8, $c9, $ba, $70, $71
    .byte $72, $63, $64, $55, $c8, $80, $e0, $81
    .byte $e1, $82, $e2, $73, $e3, $74, $d4, $65
    .byte $d5, $d6, $c7, $b8, $a9, $b9, $aa, $d0
    .byte $d1, $d2, $d3, $c4, $c5, $66, $c6, $b7
    .byte $a8, $99, $90, $91, $92, $83, $84, $75
    .byte $76, $b6, $c0, $c1, $c2, $93, $c3, $b4
    .byte $85, $b5, $a6, $a7, $88, $98, $a0, $a1
    .byte $a2, $a3, $94, $95, $86, $77, $97, $b0
    .byte $b1, $b2, $b3, $a4, $a5, $96, $87, $ff

; $9779 - TODO: Giegue battle intro?
B20_1779:
    lda #$38        ; a9 38
	jsr B31_0e21       ; 20 21 ee
	lda #$05        ; a9 05
	jsr $9920       ; 20 20 99
	lda #<B20_19c2  ; a9 c2
	ldx #>B20_19c2  ; a2 99
	jsr $97d6       ; 20 d6 97
	lda #$ff        ; a9 ff
	jsr PlayMusic   ; 20 28 fd
	ldx #180        ; a2 b4
	jsr WaitXFrames_Min1 ; 20 3a fd
	lda #$0f        ; a9 0f
	jsr BackupAndFillPalette    ; 20 fe ed
	lda #$00        ; a9 00
	sta $ec         ; 85 ec
	jsr B30_0e02       ; 20 02 ce
	jmp B30_1674       ; 4c 74 d6

B20_17a3:
    lda #$0e        ; a9 0e
	jsr $9920       ; 20 20 99
	lda #<B20_19d5  ; a9 d5
	ldx #>B20_19d5  ; a2 99
	jsr $97d6       ; 20 d6 97
	lda #$ff        ; a9 ff
	jsr PlayMusic   ; 20 28 fd
	lda #<B20_19e0  ; a9 e0
	ldx #>B20_19e0  ; a2 99
	jsr $97d6       ; 20 d6 97
	lda #$09        ; a9 09
	sta $07f0       ; 8d f0 07
	lda #$01        ; a9 01
	sta $07f4       ; 8d f4 07
	lda #<B20_19e9  ; a9 e9
	ldx #>B20_19e9  ; a2 99
	jsr $97d6       ; 20 d6 97
	lda #$1a        ; a9 1a
	ldx #$07        ; a2 07
	jsr BANK_SWAP    ; 20 d0 ff
	jmp $a000       ; 4c 00 a0

B20_17d6:
    sta $68         ; 85 68
	stx $69         ; 86 69
	ldy #$00        ; a0 00
	sty $6b         ; 84 6b
    B20_17de:
    lda ($68), y    ; b1 68
	beq B20_183c ; f0 5a
	sta $6c         ; 85 6c
	iny             ; c8
	lda ($68), y    ; b1 68
	sta $6d         ; 85 6d
	iny             ; c8
	and #$20        ; 29 20
	beq B20_17f1 ; f0 03
	sec             ; 38
	rol $6b         ; 26 6b
    B20_17f1:
    tya             ; 98
	pha             ; 48
	lda $6d         ; a5 6d
	and #$03        ; 29 03
	beq B20_1808 ; f0 0f
	tax             ; aa
	lda B20_1a05, x ; bd 05 9a
	jsr FillBackgroundColor ; 20 0e ee
	jsr WaitFrame   ; 20 41 fd
	lda #$0f        ; a9 0f
	jsr FillBackgroundColor ; 20 0e ee
    B20_1808:
    jsr WaitFrame   ; 20 41 fd
	lda $6b         ; a5 6b
	bne B20_1815 ; d0 06
	lda $6c         ; a5 6c
	and #$03        ; 29 03
	bne B20_1820 ; d0 0b
    B20_1815:
    lsr a           ; 4a
    B20_1816:
    pha             ; 48
	jsr $983d       ; 20 3d 98
	pla             ; 68
	sec             ; 38
	sbc #$01        ; e9 01
	bpl B20_1816 ; 10 f6
    B20_1820:
    lda $6c         ; a5 6c
	asl a           ; 0a
	asl a           ; 0a
	and $6d         ; 25 6d
	and #$04        ; 29 04
	beq B20_1834 ; f0 0a
	lsr a           ; 4a
	eor scroll_y    ; 45 fd
	sta scroll_y    ; 85 fd
	lda #$0a        ; a9 0a
	sta $07f0       ; 8d f0 07
    B20_1834:
    dec $6c         ; c6 6c
	bne B20_1808 ; d0 d0
	pla             ; 68
	tay             ; a8
	bne B20_17de ; d0 a2
    B20_183c:
    rts             ; 60

B20_183d:
    bit $6d         ; 24 6d
	bpl B20_1877 ; 10 36
	bvc B20_1859 ; 50 16
	jsr $9878       ; 20 78 98
	bne B20_1851 ; d0 09
	dex             ; ca
	cpx #$05        ; e0 05
	bcc B20_1877 ; 90 2a
	txa             ; 8a
	jsr $9883       ; 20 83 98
    B20_1851:
    sec             ; 38
	lda scroll_x    ; a5 fc
	sbc #$01        ; e9 01
	jmp $9871       ; 4c 71 98
    B20_1859:
    jsr $9878       ; 20 78 98
	eor #$0f        ; 49 0f
	bne B20_186c ; d0 0c
	inx             ; e8
	cpx #$3c        ; e0 3c
	bcs B20_1877 ; b0 12
	txa             ; 8a
	clc             ; 18
	adc #$0a        ; 69 0a
	jsr $9883       ; 20 83 98
    B20_186c:
    clc             ; 18
	lda scroll_x    ; a5 fc
	adc #$11        ; 69 11
	bcs B20_1875 ; b0 02
	sbc #$0f        ; e9 0f
    B20_1875:
    sta scroll_x    ; 85 fc
    B20_1877:
    rts             ; 60
	jsr PpuSync     ; 20 33 fd
	ldx $6a         ; a6 6a
	clc             ; 18
	lda scroll_x    ; a5 fc
	and #$0f        ; 29 0f
	rts             ; 60
	stx $6a         ; 86 6a
	jsr $988d       ; 20 8d 98
	lda #$80        ; a9 80
	sta $e5         ; 85 e5
	rts             ; 60
	ldx #$24        ; a2 24
	stx $62         ; 86 62
	ldx #$00        ; a2 00
    B20_1893:
    cmp #$0f        ; c9 0f
	bcc B20_189c ; 90 05
	sbc #$0f        ; e9 0f
	inx             ; e8
	bcs B20_1893 ; b0 f7
    B20_189c:
    asl a           ; 0a
	asl a           ; 0a
	sta $6e         ; 85 6e
	txa             ; 8a
	lsr a           ; 4a
	ror a           ; 6a
	ror a           ; 6a
	and #$c0        ; 29 c0
	ora $6e         ; 05 6e
	sta $60         ; 85 60
	lda #$06        ; a9 06
	asl $60         ; 06 60
	rol a           ; 2a
	asl $60         ; 06 60
	rol a           ; 2a
	asl $60         ; 06 60
	rol a           ; 2a
	asl $60         ; 06 60
	rol a           ; 2a
	sta $61         ; 85 61
	ora #$03        ; 09 03
	sta $65         ; 85 65
	lda $6e         ; a5 6e
	and #$38        ; 29 38
	ora #$c0        ; 09 c0
	sta $64         ; 85 64
	jsr PpuSync     ; 20 33 fd
	lda #$05        ; a9 05     ; TODO: UNKNOWN NMI COMMAND
	ldy #$40        ; a0 40
	sta $0400       ; 8d 00 04
	sty $0401       ; 8c 01 04
	ldy #$08        ; a0 08
	sta $0444       ; 8d 44 04
	sty $0445       ; 8c 45 04
	lda $61         ; a5 61
	ldy $60         ; a4 60
	and #$03        ; 29 03
	ora $62         ; 05 62
	sta $0402       ; 8d 02 04
	sty $0403       ; 8c 03 04
	lda $65         ; a5 65
	ldy $64         ; a4 64
	and #$03        ; 29 03
	ora $62         ; 05 62
	sta $0446       ; 8d 46 04
	sty $0447       ; 8c 47 04
	ldy #$3f        ; a0 3f
    B20_18f9:
    lda ($60), y    ; b1 60
	jsr $9919       ; 20 19 99
	sta $0404, y    ; 99 04 04
	dey             ; 88
	bpl B20_18f9 ; 10 f5
	ldy #$07        ; a0 07
    B20_1906:
    lda ($64), y    ; b1 64
	jsr $9919       ; 20 19 99
	sta $0448, y    ; 99 48 04
	dey             ; 88
	bpl B20_1906 ; 10 f5
	lda #$00        ; a9 00
	sta $0450       ; 8d 50 04
	sta $e6         ; 85 e6
	rts             ; 60
	cpx #$04        ; e0 04
	bcc B20_191f ; 90 02
	lda #$00        ; a9 00
    B20_191f:
    rts             ; 60

B20_1920:
    sta $6a         ; 85 6a
	lda #$0b        ; a9 0b
	jsr PlayMusic   ; 20 28 fd
	jsr $99a3       ; 20 a3 99
	jsr SetScroll   ; 20 cc ee
	jsr B31_1d5e       ; 20 5e fd
	jsr PpuSync     ; 20 33 fd
	ldx #$0f        ; a2 0f
    B20_1935:
    lda B20_1a3d, x ; bd 3d 9a
	sta $0340, x    ; 9d 40 03
	dex             ; ca
	bpl B20_1935 ; 10 f7
	lda #<B20_1a2d  ; a9 2d
	ldx #>B20_1a2d  ; a2 9a
	sta $60         ; 85 60
	stx $61         ; 86 61
	jsr B31_0087       ; 20 87 e0
	lda #$54        ; a9 54
	jsr $99ad       ; 20 ad 99
	lda #<B20_19f9  ; a9 f9
	ldx #>B20_19f9  ; a2 99
	jsr BankswitchCHRFromTable  ; 20 e8 ce
	lda #$01        ; a9 01
	sta $e5         ; 85 e5
	ldy #$04        ; a0 04
    B20_195b:
    tya             ; 98
	pha             ; 48
	ldx #$20        ; a2 20
	jsr $988f       ; 20 8f 98
	lda #$80        ; a9 80
	sta $e5         ; 85 e5
	pla             ; 68
	tay             ; a8
	dey             ; 88
	bpl B20_195b ; 10 f0
	jsr $998b       ; 20 8b 99
	ldx #$03        ; a2 03
    B20_1970:
    lda B20_1a09, x ; bd 09 9a
	sta $0540, x    ; 9d 40 05
	dex             ; ca
	bpl B20_1970 ; 10 f7
	lda #$9f        ; a9 9f
	sta $ec         ; 85 ec
	ldx #$1f        ; a2 1f
    B20_197f:
    lda B20_1a0d, x ; bd 0d 9a
	sta $0520, x    ; 9d 20 05
	dex             ; ca
	bpl B20_197f ; 10 f7
	jmp B31_0e30       ; 4c 30 ee
	clc             ; 18
	lda $6a         ; a5 6a
	adc #$0b        ; 69 0b
    B20_1990:
    pha             ; 48
	jsr $988d       ; 20 8d 98
	lda #$80        ; a9 80
	sta $e5         ; 85 e5
	pla             ; 68
	sec             ; 38
	sbc #$01        ; e9 01
	bcc B20_19a2 ; 90 04
	cmp $6a         ; c5 6a
	bcs B20_1990 ; b0 ee
    B20_19a2:
    rts             ; 60

B20_19a3:
    lda $6a         ; a5 6a
	asl a           ; 0a
	asl a           ; 0a
	asl a           ; 0a
	asl a           ; 0a
	tay             ; a8
	ldx #$fc        ; a2 fc
	rts             ; 60

B20_19ad:
    pha             ; 48
	tay             ; a8
	lda #$00        ; a9 00
	ldx #$60        ; a2 60
	jsr B30_0e08       ; 20 08 ce
	pla             ; 68
	clc             ; 18
	adc #$02        ; 69 02
	tay             ; a8
	lda #$00        ; a9 00
	ldx #$68        ; a2 68
	jmp B30_0e08       ; 4c 08 ce

B20_19c2:
    .byte $80, $00
    .byte $80, $80
    .byte $80, $82
    .byte $20, $83
    .byte $20, $82
    .byte $c0, $81
    .byte $80, $82
    .byte $20, $83
    .byte $20, $82
    .byte $00

B20_19d5:
    .byte $80, $c0
    .byte $20, $c3
    .byte $20, $c2
    .byte $80, $c1
    .byte $80, $c3
    .byte $00

B20_19e0:
    .byte $40, $02
    .byte $10, $07
    .byte $20, $06
    .byte $50, $05
    .byte $00

B20_19e9:
    .byte $08, $23
    .byte $08, $22
    .byte $f0, $a1
    .byte $f0, $00
    .byte $00

B20_19f2:
    .byte $04,$80,$00,$a9,$a9,$ab,$aa

; $99F9 - CHR bank table
B20_19f9:
    .byte $76, $70, $50, $51, $52, $53

; $99FF - CHR bank table
B20_19ff:
    .byte $76, $70, $48, $49, $4a, $4b

; $9A05 - Unknown background fill colors
B20_1a05:
    .byte $0f, $38, $21, $34

; $9A09 - Unknown
B20_1a09:
    .byte $ca, $ed, $00, $00

; $9A0D - Unknown palette
B20_1a0d:
    .byte $0f, $12, $30, $00
    .byte $0f, $10, $30, $00
    .byte $0f, $17, $37, $16
    .byte $0f, $38, $30, $00
    .byte $0f, $0f, $00, $30
    .byte $0f, $0f, $16, $37
    .byte $0f, $0f, $24, $37
    .byte $0f, $0f, $12, $37

; $9A2D - Unknown
B20_1a2d:
    .byte $68, $78, $00, $00
    .byte $58, $88, $00, $00
    .byte $78, $88, $00, $00
    .byte $68, $98, $00, $00

; $9A3D - Unknown
B20_1a3d:
    .byte $86, $00, $f4, $76
    .byte $00, $00, $c0, $99
    .byte $06, $00, $e4, $76
    .byte $00, $00, $c4, $99

B20_1a4d:
    jsr $9b2a       ; 20 2a 9b
    B20_1a50:
    lda #$06        ; a9 06
	sta $56         ; 85 56
	lda #$ca        ; a9 ca
	ldx #$62        ; a2 62
	jsr $9b7d       ; 20 7d 9b
	bcs B20_1ad4 ; b0 77
    B20_1a5d:
    lda #$06        ; a9 06
	sta $56         ; 85 56
	lda #$d0        ; a9 d0
	ldx #$62        ; a2 62
	jsr $9b7d       ; 20 7d 9b
	bcs B20_1a50 ; b0 e6
    B20_1a6a:
    lda #$06        ; a9 06
	sta $56         ; 85 56
	lda #$d6        ; a9 d6
	ldx #$62        ; a2 62
	jsr $9b7d       ; 20 7d 9b
	bcs B20_1a5d ; b0 e6
    B20_1a77:
    lda #$06        ; a9 06
	sta $56         ; 85 56
	lda #$dc        ; a9 dc
	ldx #$62        ; a2 62
	jsr $9b7d       ; 20 7d 9b
	bcs B20_1a6a ; b0 e6
	lda #$0a        ; a9 0a
	sta $56         ; 85 56
	lda #$e2        ; a9 e2
	ldx #$62        ; a2 62
	jsr $9b7d       ; 20 7d 9b
	bcs B20_1a77 ; b0 e6
	jsr $9d50       ; 20 50 9d
	jsr $9ad5       ; 20 d5 9a
	jsr B31_0e30       ; 20 30 ee
	jsr $9b00       ; 20 00 9b
	bcc B20_1aa2 ; 90 03
	jmp $9a4d       ; 4c 4d 9a
    B20_1aa2:
    jsr $9d50       ; 20 50 9d
	ldx #60         ; a2 3c
	jsr WaitXFrames ; 20 5e f2
	jsr B31_0e30       ; 20 30 ee
    lda #2
    sta $76
    lda #3
    sta $77
    ldx #.LOBYTE(IntroText1)
    ldy #.HIBYTE(IntroText1)
    jsr do_story_print ;prints each line
	lda #$ff        ; a9 ff
	sta new_music   ; 8d f5 07
	jsr B31_0e30       ; 20 30 ee
	lda #$06        ; a9 06
	sta $76         ; 85 76
	lda #$0a        ; a9 0a
	sta $77         ; 85 77
    ldx #.LOBYTE(IntroText2)
    ldy #.HIBYTE(IntroText2)

B20_1ad0:
    jsr $9b13       ; 20 13 9b
	clc             ; 18
    B20_1ad4:
    rts             ; 60
	lda #$8b        ; a9 8b
	ldx #$6c        ; a2 6c
	jsr $9af9       ; 20 f9 9a
	lda #$c0        ; a9 c0
	ldx #$6c        ; a2 6c
	jsr $9af9       ; 20 f9 9a
	jsr $6286       ; 20 86 62
	ldy #$00        ; a0 00
    B20_1ae8:
    jsr $9af3       ; 20 f3 9a
	jsr $629b       ; 20 9b 62
	cmp #$20        ; c9 20
	bne B20_1ae8 ; d0 f6
	rts             ; 60

B20_1af3:
    jsr PpuSync     ; 20 33 fd
    jmp $625b       ; 4c 5b 62

B20_1af9:
    sta $74         ; 85 74
    stx $75         ; 86 75
    jmp B30_067a       ; 4c 7a c6

B25_1af0 := $62f0
B20_1b00:
	lda #<B25_1af0  ; a9 f0
	ldx #>B25_1af0  ; a2 62
	sta $80         ; 85 80
	stx $81         ; 86 81
	jsr B31_0f34       ; 20 34 ef
	lda $82         ; a5 82
	beq B20_1b11 ; f0 02
	sec             ; 38
	rts             ; 60
    B20_1b11:
    clc             ; 18
	rts             ; 60

do_story_print:
    lda #0
    sta $70
    stx $74
    sty $75
    @loop:
    jsr B30_0707
    dec $77
    cmp #0
    bne @loop
    jsr WaitABPressed
    jmp $9D50

B20_1B2A:
    jsr $9d50       ; 20 50 9d
	jsr ResetScroll ; 20 c8 ee
	lda #$2d        ; a9 2d
	ldx #$6c        ; a2 6c
	jsr $9af9       ; 20 f9 9a
	jsr $9b40       ; 20 40 9b
	jsr $9b76       ; 20 76 9b
	jmp B31_0e30       ; 4c 30 ee

B20_1B40:
    lda #.LOBYTE(NameCharacters)
    sta $64
    lda #.HIBYTE(NameCharacters)
    sta $65
	lda #$0e        ; a9 0e
	sta $63         ; 85 63
	ldx #$04        ; a2 04
    B20_1b4e:
    txa             ; 8a
	pha             ; 48
	lda #$08        ; a9 08
	sta $62         ; 85 62
	lda $62         ; a5 62
	sta $76         ; 85 76
	lda $63         ; a5 63
	sta $77         ; 85 77
	lda $64         ; a5 64
	sta $74         ; 85 74
	lda $65         ; a5 65
	sta $75         ; 85 75
	jsr B30_06db       ; 20 db c6
	jsr $62b5       ; 20 b5 62
	pla             ; 68
	tax             ; aa
	dex             ; ca
	bne B20_1b4e ; d0 df
	lda #$66        ; a9 66
	ldx #$6c        ; a2 6c
	jmp $9af9       ; 4c f9 9a

B20_1B76:
	lda #$00        ; a9 00
	ldx #$6c        ; a2 6c
	jmp $9af9       ; 4c f9 9a

B20_1B7D:
	sta $5c         ; 85 5c
	stx $5d         ; 86 5d
	ldy #$00        ; a0 00
	jsr $9bed       ; 20 ed 9b
	ora $60         ; 05 60
	beq B20_1b9b ; f0 11
	lda #$22        ; a9 22
	sta $62         ; 85 62
	lda #$ff        ; a9 ff
	sta $63         ; 85 63
	lda #$80        ; a9 80
	sta $64         ; 85 64
	ldy #$00        ; a0 00
	jsr $9af3       ; 20 f3 9a
    B20_1b9b:
    jsr $9bf7       ; 20 f7 9b
	lda #$24        ; a9 24
	ldx #$6c        ; a2 6c
	jsr $9af9       ; 20 f9 9a
	ldy #$04        ; a0 04
	jsr $9bed       ; 20 ed 9b
	ldy $56         ; a4 56
	lda #$00        ; a9 00
	sta $70         ; 85 70
	sta $0581, y    ; 99 81 05
	sty $55         ; 84 55
    B20_1bb5:
    lda ($60), y    ; b1 60
	bne B20_1bbd ; d0 04
	sty $55         ; 84 55
	lda #$a2        ; a9 a2
    B20_1bbd:
    sta $0580, y    ; 99 80 05
	dey             ; 88
	bpl B20_1bb5 ; 10 f2
	jsr $9c1c       ; 20 1c 9c
	bcs B20_1be8 ; b0 20
	ldy #$04        ; a0 04
	jsr $9bed       ; 20 ed 9b
	jsr EnablePRGRam    ; 20 e7 fd
	ldy $56         ; a4 56
    B20_1bd2:
    lda $0580, y    ; b9 80 05
	cmp #$a2        ; c9 a2
	bne B20_1bdb ; d0 02
	lda #$00        ; a9 00
    B20_1bdb:
    sta ($60), y    ; 91 60
	dey             ; 88
	bpl B20_1bd2 ; 10 f2
	jsr WriteProtectPRGRam  ; 20 ed fd
	jsr B31_1d5e       ; 20 5e fd
	clc             ; 18
	rts             ; 60

B20_1be8:
    jsr B31_1d5e       ; 20 5e fd
	sec             ; 38
	rts             ; 60

B20_1bed:
	lda ($5c), y    ; b1 5c
	sta $60         ; 85 60
	iny             ; c8
	lda ($5c), y    ; b1 5c
	sta $61         ; 85 61
	rts             ; 60

B20_1bf7:
	jsr $9b76       ; 20 76 9b
	ldx #$08        ; a2 08
	jsr WaitXFrames ; 20 5e f2
	ldy #$02        ; a0 02
	jsr $9bed       ; 20 ed 9b
	lda $60         ; a5 60
	sta $74         ; 85 74
	lda $61         ; a5 61
	sta $75         ; 85 75
	lda #$09        ; a9 09
	sta $76         ; 85 76
	lda #$03        ; a9 03
	sta $77         ; 85 77
    B20_1c14:
    jsr B30_06db       ; 20 db c6
	cmp #$00        ; c9 00
	bne B20_1c14 ; d0 f9
	rts             ; 60

B20_1C1C:
	jsr $9d0a       ; 20 0a 9d
    lda #.LOBYTE(gridWidth)
    ldx #.HIBYTE(gridWidth)
    sta $80
    stx $81
    lda #.LOBYTE(NameCharacters)
    ldx #.HIBYTE(NameCharacters)
    sta $84
    stx $85
    lda #$01        ; a9 01
	sta $d6         ; 85 d6
	jsr B31_0f3f       ; 20 3f ef
	jmp $9c3f       ; 4c 3f 9c

B20_1C39:
	jsr $9d0a       ; 20 0a 9d
	jsr B31_0f7c       ; 20 7c ef
	bit $83         ; 24 83
	bvs B20_1c70 ; 70 2d
	bmi B20_1c4e ; 30 09
	lda $83         ; a5 83
	and #$10        ; 29 10
	bne NAME_CHECK ; d0 40
	jmp $9c33       ; 4c 33 9c

B20_1c4e:
    ldx $82 ; cursor (x*width)+y value
    lda NameCharacters, x
    cmp #$a1        ; c9 a1
	beq B20_1c70 ; f0 19
	cmp #$a2        ; c9 a2
	beq NAME_CHECK ; f0 30
	cmp #$a3        ; c9 a3
	beq B20_1c6e ; f0 0f
	ldx $55         ; a6 55
	sta $0580, x    ; 9d 80 05
	cpx $56         ; e4 56
	beq B20_1c6b ; f0 03
	inx             ; e8
	stx $55         ; 86 55
    B20_1c6b:
    jmp $9c39       ; 4c 39 9c

B20_1c6e:
    sec             ; 38
	rts             ; 60

B20_1c70:
    lda #$a2        ; a9 a2
	ldx $55         ; a6 55
	cpx $56         ; e4 56
	bne B20_1c7d ; d0 05
	cmp $0580, x    ; dd 80 05
	bne B20_1c85 ; d0 08
    B20_1c7d:
    sta $0580, x    ; 9d 80 05
	dex             ; ca
	bmi B20_1c88 ; 30 05
	stx $55         ; 86 55
    B20_1c85:
    sta $0580, x    ; 9d 80 05
    B20_1c88:
    jmp $9c39       ; 4c 39 9c

CurrentName := $0580
NAME_CHECK:
    ;ram - amount of characters/char index
	ldy $55
@UNKNOWN3:
	lda CurrentName,Y
    ;if char == ? (blank)
	cmp #$A2 ; ?
	beq @UNKNOWN4 ;if z set
    ;if char != " " (normal)
	cmp #$A0 ; " "
	bne @UNKNOWN5 ;if z not set
	lda #$A2 ; ?
	sta CurrentName,Y
@UNKNOWN4:
	dey
	bpl @UNKNOWN3
@UNKNOWN5:
	cpy $56
	beq @UNKNOWN6
	iny
@UNKNOWN6:
	sty $55
    ;if y == 0, branch
	cpy #0
	beq B20_1d07
	ldx #0
@EXIST_LOOP_AGAIN:
	ldy #0
@EXIST_LOOP:
    ;load existing name entries
	lda ExistEntries,X
    ;branch if end of line
	beq @UNKNOWN10 ;if this jumps, it was an unsuccessful check
    ;check if newLine
	cmp #newLine
    ;branch if newline
	beq B20_1ccf ;if this jumps, it was a successful check
    ;inc reg
	inx
	iny
    ;check against name(?)
	cmp CurrentName-1,Y
    ;loop if equal
	beq @EXIST_LOOP
    ;fall through if not equal
@EXIST_NEXTENTRY: ;skips to the next one
    ;load entry, check if at newline
	lda ExistEntries,X
	inx
	cmp #newLine
	bne @EXIST_NEXTENTRY ;loop if no
	beq @EXIST_LOOP_AGAIN ;loop back to main loop if yes
@UNKNOWN10:
	lda #0
	sta $D6
	clc
	rts

B20_1ccf:
    jsr B31_1465       ; 20 65 f4
	jsr $9b76       ; 20 76 9b
	lda #$7f        ; a9 7f
	ldx #$63        ; a2 63
	sta $60         ; 85 60
	stx $61         ; 86 61
	jsr $9c04       ; 20 04 9c
	lda $0580       ; ad 80 05
	cmp #$a0        ; c9 a0
	beq B20_1cfe ; f0 17
	lda #$98        ; a9 98
	ldx #$63        ; a2 63
	sta $74         ; 85 74
	stx $75         ; 86 75
	ldx #$08        ; a2 08
	ldy #$0e        ; a0 0e
	stx $76         ; 86 76
	sty $77         ; 84 77
    B20_1cf7:
    jsr B30_06db       ; 20 db c6
	cmp #$00        ; c9 00
	bne B20_1cf7 ; d0 f9
    B20_1cfe:
    jsr WaitABPressed   ; 20 9e f2
	jsr $9b40       ; 20 40 9b
	jsr $9bf7       ; 20 f7 9b
    B20_1d07:
    jmp $9c1c       ; 4c 1c 9c

B20_1d0a:
    lda $76         ; a5 76
	pha             ; 48
	lda $77         ; a5 77
	pha             ; 48
	jsr WaitFrame   ; 20 41 fd
	sec             ; 38
	lda #$00        ; a9 00
	sbc $56         ; e5 56
	sec             ; 38
	ror a           ; 6a
	clc             ; 18
	adc #$0f        ; 69 0f
	tay             ; a8
	lda #$59        ; a9 59
	sta $0204       ; 8d 04 02
	clc             ; 18
	tya             ; 98
	adc $55         ; 65 55
	asl a           ; 0a
	asl a           ; 0a
	asl a           ; 0a
	sta $0207       ; 8d 07 02
	lda #$01        ; a9 01
	sta $0205       ; 8d 05 02
	lda #$00        ; a9 00
	sta $0206       ; 8d 06 02
	tya             ; 98
	sta $76         ; 85 76
	lda #$0a        ; a9 0a
	sta $77         ; 85 77
	lda #$80        ; a9 80
	sta $74         ; 85 74
	lda #$05        ; a9 05
	sta $75         ; 85 75
	jsr B30_06db       ; 20 db c6
	pla             ; 68
	sta $77         ; 85 77
	pla             ; 68
	sta $76         ; 85 76
	rts             ; 60

B20_1d50:
    jsr B31_0ddc       ; 20 dc ed
	jsr B31_1d5e       ; 20 5e fd
	jsr B31_1d80       ; 20 80 fd
	ldx #$fd        ; a2 fd
	ldy #$62        ; a0 62
	jmp B31_1732       ; 4c 32 f7

B20_1d60:
    jsr B31_1d5e       ; 20 5e fd
	jsr B31_1d80       ; 20 80 fd
	lda ram_PPUCTRL ; a5 ff
	and #$fc        ; 29 fc
	ldx #$00        ; a2 00
	ldy #$00        ; a0 00
	sta ram_PPUCTRL ; 85 ff
	stx scroll_y    ; 86 fd
	sty scroll_x    ; 84 fc
	lda #<B20_1e63  ; a9 63
	ldx #>B20_1e63  ; a2 9e
	jsr BankswitchCHRFromTable  ; 20 e8 ce
	lda #<B20_1e6f  ; a9 6f
	sta $60         ; 85 60
	lda #>B20_1e6f  ; a9 9e
	sta $61         ; 85 61
	jsr LoadPaletteFrom ; 20 96 f4
	jsr B31_0ddc       ; 20 dc ed
	lda #$16        ; a9 16
	cmp current_music   ; cd 8c 07
    beq B20_1d93    ; f0 03
	sta new_music   ; 8d f5 07
    B20_1d93:
    ldx #<B20_1eaf  ; a2 af
	ldy #>B20_1eaf  ; a0 9e
	jsr B31_1732       ; 20 32 f7
	lda #<B20_1ec4  ; a9 c4
	ldx #>B20_1ec4  ; a2 9e
	jsr $9e2c       ; 20 2c 9e
	ldx #<B20_1eaf  ; a2 af
	ldy #>B20_1eaf  ; a0 9e
	jsr B31_1732       ; 20 32 f7
	lda #<B20_1eea  ; a9 ea
	ldx #>B20_1eea  ; a2 9e
	jsr $9e2c       ; 20 2c 9e
	lda #<B20_1e8f  ; a9 8f
	sta $60         ; 85 60
	lda #>B20_1e8f  ; a9 9e
	sta $61         ; 85 61
	jsr LoadPaletteFrom ; 20 96 f4
	jsr B31_0ddc       ; 20 dc ed
	lda #<B20_1e69  ; a9 69
	ldx #>B20_1e69  ; a2 9e
	jsr BankswitchCHRFromTable  ; 20 e8 ce
	lda #<B20_1f18  ; a9 18
	ldx #>B20_1f18  ; a2 9f
	jsr $9e44       ; 20 44 9e
	lda #$00        ; a9 00
	sta $60         ; 85 60
	lda #$10        ; a9 10
	sta $03e0       ; 8d e0 03
	lda #$00        ; a9 00
	sta $03e1       ; 8d e1 03
	sta $03e4       ; 8d e4 03
	sta $03e5       ; 8d e5 03
	lda #$58        ; a9 58
	sta $03e2       ; 8d e2 03
	lda #$57        ; a9 57
	sta $03e3       ; 8d e3 03
	lda #$00        ; a9 00
	sta pad1_forced ; 85 da
    B20_1ded:
    clc             ; 18
	lda $60         ; a5 60
	adc #$b0        ; 69 b0
	sta $03e6       ; 8d e6 03
	lda #$00        ; a9 00
	adc #$96        ; 69 96
	sta $03e7       ; 8d e7 03
	lda #$0a        ; a9 0a
	sta $e5         ; 85 e5
	clc             ; 18
	lda $60         ; a5 60
	adc #$04        ; 69 04
	cmp #$1c        ; c9 1c
	bne B20_1e0b ; d0 02
	lda #$00        ; a9 00
    B20_1e0b:
    sta $60         ; 85 60
    B20_1e0d:
    lda pad1_forced ; a5 da
	and #$10        ; 29 10
	bne B20_1e1b ; d0 08
	lda $e5         ; a5 e5
	ora $e0         ; 05 e0
	bne B20_1e0d ; d0 f4
	beq B20_1ded ; f0 d2
    B20_1e1b:
    ldx #$00        ; a2 00
	stx pad1_forced ; 86 da
	jsr B31_0ddc       ; 20 dc ed
	lda #25         ; a9 19
	ldx #<(ANTI_PIRACY-1)    ; a2 ff
	ldy #>(ANTI_PIRACY-1)    ; a0 9f
	jsr TempUpperBankswitch ; 20 f3 fd
	rts             ; 60

B20_1e2c:
    jsr $9e44       ; 20 44 9e
	ldx #$ff        ; a2 ff
	jsr $9e54       ; 20 54 9e
	ldx #$40        ; a2 40
	jsr $9e54       ; 20 54 9e
	jsr B31_0ddc       ; 20 dc ed
	ldx #$40        ; a2 40
	jsr $9e54       ; 20 54 9e
	jmp B31_1d80       ; 4c 80 fd

B20_1e44:
    sta $74         ; 85 74
	stx $75         ; 86 75
    B20_1e48:
    jsr B30_06d2       ; 20 d2 c6
	dec $77         ; c6 77
	cmp #$00        ; c9 00
	bne B20_1e48 ; d0 f7
	jmp B31_0e30       ; 4c 30 ee

B20_1e54:
    jsr WaitFrame   ; 20 41 fd
	lda pad1_hold   ; a5 de
	and #$10        ; 29 10
	eor #$10        ; 49 10
	beq B20_1e62 ; f0 03
	dex             ; ca
	bne B20_1e54 ; d0 f2
    B20_1e62:
    rts             ; 60

; $9E63 - CHR bankswitch table
B20_1e63:
    .byte $42, $72, $7c, $7c, $40, $41

; $9E69 - CHR bankswitch table
B20_1e69:
    .byte $42, $72, $7c, $41, $d8, $d9

; $9E6F - Unknown palette
B20_1e6f:
    .byte $0f, $28, $30, $18
    .byte $0f, $21, $30, $12
    .byte $0f, $16, $30, $12
    .byte $0f, $3a, $30, $12

    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12

; $9E8F - Unknown palette
B20_1e8f:
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12

; $9EAF - Unknown (transfered to $0400)
B20_1eaf:
    .byte $08    ; PPU_FILL
    .byte 64     ; Fill 64 bytes
    .word $c023  ; at $c023
    .byte $aa    ; with $AA

    .byte $00    ; END

    .byte $07, $04, $23, $d2, $40, $23
    .byte $d3, $10, $23, $da
    .byte $04, $23, $db, $01, $00

; $9EC4 - Unknown
B20_1ec4:
    .byte $20,$0D,$0B,$C8,$C9,$CA,$CB,$CD,$CE,$CF,$01,$20,$0D,$0C,$D8,$01
    .byte $20,$13,$0C,$DF,$01,$20,$0D,$0D,$22,$CC,$13,$01,$20,$0D,$0F,$E3
    .byte $E4,$E5,$E6,$E7,$E8,$00

; $9EEA - Unknown
B20_1eea:
    .byte $20,$0D,$0B,$D9,$DA,$DB,$DC,$DD,$DE,$CE,$CF,$01,$20,$0D,$0C,$D8
    .byte $01,$20,$14,$0C,$DF,$01,$20,$00,$0D,$22,$CC,$15,$01,$20,$08,$0F
    .byte $F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF,$00

; $9F18 - Unknown
B20_1f18:
    .byte $20,$08,$07,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C
    .byte $01,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$01,$B0
    .byte $B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$01
    .byte $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF
    .byte $01,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE
    .byte $01,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE
    .byte $01,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE
    .byte $01,$20,$07,$17,$43,$44,$45,$46,$47,$70,$69,$6A,$6B,$6C,$6D,$6E
    .byte $6F,$53,$54,$55,$56,$57,$00
