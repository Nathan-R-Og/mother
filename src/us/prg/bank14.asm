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
Map_TileProperties:
    .incbin "../../split/us/map_tile_properties.bin"

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
    ;use bank $13 as lower half
    jsr BankswitchUpper_Bank19

    ;title routine
    jsr Title_Screen
    ;here, you have gone to the save menu

    exited_naming_sequence:
    jsr B31_1d5e ;clear sprites
    jsr B31_1d80 ;clear tilemap 0
    jsr LoadNamingScreen2 ;self explanatory

    jsr PpuSync

    ;load NAMING_SCREEN_1
    lda #$19
    ldx #.LOBYTE(LoadNamingScreen1-1)
    ldy #.HIBYTE(LoadNamingScreen1-1)
    jsr TempUpperBankswitch

    jsr ResetScroll

    ;load graphics
    BankswitchCHR_Address naming_screen_chr_table
    ;load palettes
    LoadPalette_Address naming_screen_palettes

    B20_142C:
    ldx #(6*2)
    jsr B20_1505
    jsr B20_14d7
    jsr B20_150e ;wait for input

    lda #0
    sta UNK_D6

    ;get offset
    ldy menucursor_pos
    lda (UNK_84), y
    asl a
    tax

    ;stash pointer into stack
    lda unk_pointers+1, x
    pha
    lda unk_pointers, x
    pha

    tya
    lsr a
    lsr a

    ;jump to last in stack (from list)
    rts

unk_pointers:
    .addr B19_1e88-1
    .addr B20_148c-1
    .addr B20_1472-1
    .addr something_init-1

;new save protocol???
something_init:
    pha
    jsr EnablePRGRam

    ;text pointers + sram?
    lda #$18
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    pla
    jsr SetupFreshSaveData
    jsr WriteProtectPRGRam
    jsr BankswitchUpper_Bank19

    ;do naming sequence
    jsr NS_NamingSequence
    ;if sequence exited, jump back to title
    bcs exited_naming_sequence
    ;else, play the videogame !!!!!!
    jmp Game_Begin

B20_1472:
    jsr B20_14c0
    bne B20_1489
    lda save_slot
    jsr B19_1ebb
    jsr EnablePRGRam
    ldy #$03
    lda #$00
    sta (UNK_68), y
    jsr WriteProtectPRGRam
    B20_1489:
    jmp B20_142C

B20_148c:
    sta $36
    ldx #$10
    jsr B20_1505
    lda $36
    sec
    rol a
    asl a
    tax
    jsr B20_150b
    bit menucursor_pos+1
    bvs B20_14bd
    lda menucursor_pos
    sta $37
    jsr B20_14c0
    bcs B20_14ab
    bne B20_14bd
    B20_14ab:
    lda $36
    jsr B19_1e88
    jsr EnablePRGRam
    lda $37
    ora #$b0
    sta save_slot
    jsr Game_Begin
    B20_14bd:
    jmp B20_142C
    B20_14c0:
    jsr B19_1e88
    sec
    bne B20_14d6
    ldx #$0e
    jsr ns_load_ui_element
    jsr B30_067a
    ldx #$0e
    jsr B20_150b
    clc
    lda menucursor_pos
    B20_14d6:
    rts

B20_14d7:
    lda #0
    B20_14d9:
    sta UNK_36+1
    lsr a
    lsr a
    jsr B19_1e88
    beq B20_14e4
    lda #4
    B20_14e4:
    sta UNK_36
    ldx UNK_36+1
    jsr rts_1
    lda UNK_36
    lsr a
    adc UNK_36+1
    tax
    jsr B20_1505
    clc
    lda UNK_36+1
    adc #4
    cmp #12
    bcc B20_14d9
    ldx #12
    jsr rts_3
    jmp rts_4

B20_1505:
    jsr ns_load_ui_element
    jmp B30_067a

B20_150b:
    jsr rts_3 ; $80 = $6085[x]
B20_150e:
    jsr B31_0f34
    lda #$ff
    jmp B31_10b0


DoWalkingStep:
    ;if any of these are true, exit
    lda enemy_group
    ora fade_flag
    ora is_scripted
    ora autowalk_direction
    ora is_tank
    ora UNK_24+1
    bne @quick_exit

    ;UNK_A0 is a kind of movement direction
    ;'if stepping' in other words
    ;if UNK_A0.7, exit
    bit UNK_A0
    bmi @quick_exit

    ;do onstepeffect
    jsr OnStepEffect

    ;get areaEncounterDef based on area
    ldx UNK_15
    lda AREA_ENCOUNTER_LIST, x

    @B20_1530:
    ;if has, jump
    bne @EncounterDefExists
    ;else, write 0
    sta UNK_24
    @FrequencyFail:
    lda #0
    sta enemy_group
    @quick_exit:
    rts

    @EncounterDefExists:
    ;store areaEncounterDef in y
    tay
    ;get 'frequency'
    and #%00000111
    ;if frequency != 0, jump
    bne @EncounterFrequencyExists
    ;else, get encounter id
    tya
    lsr a
    lsr a
    lsr a

    ;get sram value???
    jsr B31_00f2

    jmp @B20_1530

    @EncounterFrequencyExists:
    clc

    ;if frequency is >= 9, cap it to 8
    adc UNK_24
    cmp #9
    bcc @NoForceCap
    lda #8
    @NoForceCap:
    ;move frequency to x
    tax

    ;get a random value
    jsr Rand

    ;get the frequency value
    cmp AREA_FREQ_TABLE-1, x
    ;if random value >= area_freq_table[x], leave
    bcs @FrequencyFail
    ;else, pick an enemy
    ;;;FREQUENCY HAS PASSED

    ;UNK_24++
    ;if UNK_24 >= 3, set to 2
    ldx UNK_24
    inx
    cpx #3
    bcc @skip_x_set
    ldx #2
    @skip_x_set:
    stx UNK_24

    ;get areaEncounterDef.id
    ;;;get pointer into SPAWN_SETS with id
    ;;;id gets shifted one more time to match sizeof SPAWN
    ;UNK_68 = (id << 4) + $9200
    tya
    and #%11111000
    sta UNK_68
    lda #0
    asl UNK_68
    rol a
    adc #.HIBYTE(SPAWN_SETS)
    sta UNK_68+1

    @battle_roll:
    ;get random value
    jsr Rand
    ;only get top nybble
    lsr a
    lsr a
    lsr a
    lsr a
    ;get battle id from there
    tay
    lda (UNK_68), y
    ;if battle id == 0, keep rerolling
    beq @battle_roll
    ;store in ram
    sta enemy_group

    ;run repel ring to ward off that battle
    lda #$19
    ldx #.LOBYTE(RepelRing_Effect-1)
    ldy #.HIBYTE(RepelRing_Effect-1)
    jsr TempUpperBankswitch

    rts

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
OnStepEffect:
    ldx #0
    @per_party_member:
    lda party_members, x
    ;if party member empty, jump
    beq @finish_loop

    jsr GetPartyMemberData

    ;if not party member has cold, jump
    ldy #party_info::status
    lda (UNK_60), y
    lsr a
    bcc @not_unconcious

    lda #7
    bne @is_single_frame
    @not_unconcious:
    ;if not party member is poisoned, jump
    lsr a
    bcc @finish_loop
    lda #7
    @is_single_frame:
    sta UNK_64

    clc

    txa
    adc UNK_D5
    and UNK_64
    bne @finish_loop

    jsr EnablePRGRam

    sec

    ldy #party_info::curr_hp
    lda (UNK_60), y

    sbc #1
    sta UNK_64
    iny
    lda (UNK_60), y
    sbc #0
    sta UNK_64+1
    bcc @B20_161b

    lda UNK_64
    ora UNK_64+1
    beq @B20_161b
    lda UNK_64+1
    sta (UNK_60), y
    dey
    lda UNK_64
    sta (UNK_60), y

    @B20_161b:
    jsr WriteProtectPRGRam

    ;do Cold/Poison red flash
    txa
    pha
    lda #$16
    jsr BackupAndFillPalette
    jsr RestoreAndUpdatePalette
    pla
    tax

    @finish_loop:

    ;if all party members looped, exit
    inx
    cpx #4
    bcc @per_party_member

    rts

;battle start?
B20_1630:
    lda enemy_group
    cmp #$a2
    beq B20_1684
    ;white flash?
    lda #$30
    jsr BackupAndFillPalette
    jsr RestoreAndUpdatePalette
    jsr B31_1dc0
    B20_1641:
    ;07 00 "WRITE_PPU"
    lda #7
    sta nmi_queue
    lda #0
    sta nmi_queue+1
    sta UNK_60

    B20_164d:
    ;get battle_circle byte
    ldx UNK_60
    lda Battle_circle, x
    ;if $ff, escape
    cmp #$ff
    beq @B20_1675_escape_loop
    ;a >>= 4
    lsr a
    lsr a
    lsr a
    lsr a
    sta UNK_60+1 ;store high nybble in UNK_60+1 (could just be an and #%11110000???)

    ;get byte again
    lda Battle_circle, x
    and #%00001111
    sta UNK_62 ;store low nybble in $62

    jsr B20_1685

    ldx UNK_60+1
    ldy UNK_62
    sty UNK_60+1
    stx UNK_62

    jsr B20_1685

    inc UNK_60
    bne B20_164d
    @B20_1675_escape_loop:
    lda nmi_queue+1
    cmp #$00
    beq B20_1684
    lda #$00
    sta $e6
    lda #$01
    sta $e5
    B20_1684:
    rts

B20_1685:
    lda #$e
    sec
    sbc UNK_62
    bcs @no_carry
    lda #0
    @no_carry:
    sta UNK_77

    ;store result
    pha

    lda #$f
    sec
    sbc UNK_60+1
    sta UNK_76

    jsr B20_16b8

    lda #$f
    clc
    adc UNK_62
    cmp #$1e
    bcc @no_carry2
    lda #$1d
    @no_carry2:
    sta UNK_77

    jsr B20_16b8

    lda #$10
    clc
    adc UNK_60+1
    sta UNK_76

    jsr B20_16b8

    ;restore result
    pla
    sta UNK_77

    B20_16b8:
    ;if nmi_queue+1 < $14, jump
    lda nmi_queue+1
    cmp #$14
    bcc @not_14

    lda #0
    sta UNK_E5+1
    lda #1
    sta UNK_E5
    jsr PpuSync

    lda #0
    sta nmi_queue+1
    @not_14:
    ;UNK_77 and UNK_76 get sent to UNK_78 and UNK_79 respectively
    jsr CalculateNametableOffset

    ;x = (nmi_queue[1] << 1) + nmi_queue[1]
    lda nmi_queue+1
    asl a
    clc
    adc nmi_queue+1
    tax

    ;nmi_queue[2] = UNK_78
    lda UNK_78
    sta nmi_queue+2, x
    ;nmi_queue[3] = UNK_79
    lda UNK_79
    sta nmi_queue+3, x
    ; nmi_queue[4:5] = 0
    lda #0
    sta nmi_queue+4, x
    sta nmi_queue+5, x

    ;nmi_queue[1]++
    inc nmi_queue+1
    rts

; $96F1 - battle circle


Battle_circle:
    ;ringlayer high     ;ring layer????
    ;each nybble represents a layer
    ;hhhhllll
    ;h represents a ring from the center, 0 being nearest and f being farthest
    ;l represents the amount of fill of that ring?
    ;but specifically a 'line' of fill. think another ring inside THAT ring
    ;therefore, every permutation must be filled for the screen to be completely covered
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
    lda #$38
    jsr B31_0e21
    lda #$05
    jsr B20_1920
    lda #.LOBYTE(B20_19c2)
    ldx #.HIBYTE(B20_19c2)
    jsr B20_17d6
    lda #$ff
    jsr PlayMusic
    ldx #180
    jsr WaitXFrames_Min1
    lda #$0f
    jsr BackupAndFillPalette
    lda #$00
    sta $ec
    jsr LoadNamingScreen2
    jmp InitPartyObjects

B20_17a3:
    lda #$0e
    jsr B20_1920

    lda #.LOBYTE(B20_19d5)
    ldx #.HIBYTE(B20_19d5)
    jsr B20_17d6

    ;clear music?
    lda #$ff
    jsr PlayMusic

    lda #.LOBYTE(B20_19e0)
    ldx #.HIBYTE(B20_19e0)
    jsr B20_17d6

    lda #9
    sta $07f0

    lda #1
    sta $07f4

    lda #.LOBYTE(B20_19e9)
    ldx #.HIBYTE(B20_19e9)
    jsr B20_17d6

    ;swap to credits
    lda #$1a
    ldx #BANK::PRGA000
    jsr BANK_SWAP
    jmp Credits_Entry

B20_17d6:
    sta $68
    stx $69

    ldy #0
    sty $6b
    B20_17de:
    lda ($68), y
    ;break if 0
    beq B20_183c
    sta $6c
    iny
    lda ($68), y
    sta $6d
    iny
    and #$20
    beq B20_17f1
    sec
    rol $6b
    B20_17f1:
    tya
    pha
    lda $6d
    and #$03
    beq B20_1808
    tax
    lda GiegueCliff_BGFlash, x
    jsr FillBackgroundColor
    jsr WaitNMI
    lda #$0f
    jsr FillBackgroundColor
    B20_1808:
    jsr WaitNMI
    lda $6b
    bne B20_1815
    lda $6c
    and #$03
    bne B20_1820
    B20_1815:
    lsr a
    B20_1816:
    pha
    jsr B20_183d
    pla
    sec
    sbc #$01
    bpl B20_1816
    B20_1820:
    lda $6c
    asl a
    asl a
    and $6d
    and #$04
    beq B20_1834
    lsr a
    eor scroll_y
    sta scroll_y
    lda #$0a
    sta $07f0
    B20_1834:
    dec $6c
    bne B20_1808
    pla
    tay
    bne B20_17de
    B20_183c:
    rts

B20_183d:
    bit $6d
    bpl B20_1877
    bvc B20_1859
    jsr B20_1878
    bne B20_1851
    dex
    cpx #$05
    bcc B20_1877
    txa
    jsr B20_1883
    B20_1851:
    sec
    lda scroll_x
    sbc #$01
    jmp B20_1871
    B20_1859:
    jsr B20_1878
    eor #$0f
    bne B20_186c
    inx
    cpx #$3c
    bcs B20_1877
    txa
    clc
    adc #$0a
    jsr B20_1883
    B20_186c:
    clc
    lda scroll_x
    adc #$11
    B20_1871:
    bcs B20_1875
    sbc #$0f
    B20_1875:
    sta scroll_x
    B20_1877:
    rts

B20_1878:
    jsr PpuSync
    ldx $6a
    clc
    lda scroll_x
    and #$0f
    rts

B20_1883:
    stx $6a
    jsr B20_188d
    lda #$80
    sta $e5
    rts

B20_188d:
    ldx #$24
    B20_188f:
    stx $62
    ldx #$00
    B20_1893:
    cmp #$0f
    bcc B20_189c
    sbc #$0f
    inx
    bcs B20_1893
    B20_189c:
    asl a
    asl a
    sta $6e
    txa
    lsr a
    ror a
    ror a
    and #$c0
    ora $6e
    sta $60
    lda #$06
    asl $60
    rol a
    asl $60
    rol a
    asl $60
    rol a
    asl $60
    rol a
    sta $61
    ora #$03
    sta $65
    lda $6e
    and #$38
    ora #$c0
    sta $64
    jsr PpuSync
    lda #5 ; TODO: UNKNOWN NMI COMMAND
    ldy #$40
    sta nmi_queue
    sty nmi_queue+1
    ldy #$08
    sta $0444
    sty $0445
    lda $61
    ldy $60
    and #$03
    ora $62
    sta nmi_queue+2
    sty nmi_queue+3
    lda $65
    ldy $64
    and #$03
    ora $62
    sta $0446
    sty $0447
    ldy #$3f
    B20_18f9:
    lda ($60), y
    jsr B20_1919
    sta nmi_queue+4, y
    dey
    bpl B20_18f9
    ldy #$07
    B20_1906:
    lda ($64), y
    jsr B20_1919
    sta $0448, y
    dey
    bpl B20_1906
    lda #$00
    sta $0450
    sta $e6
    rts

B20_1919:
    cpx #$04
    bcc B20_191f
    lda #$00
    B20_191f:
    rts

B20_1920:
    sta $6a
    lda #$0b
    jsr PlayMusic
    jsr B20_19a3
    jsr SetScroll
    jsr B31_1d5e
    jsr PpuSync
    ldx #$0f
    B20_1935:
    lda B20_1a3d, x
    sta $0340, x
    dex
    bpl B20_1935
    lda #.LOBYTE(B20_1a2d)
    ldx #.HIBYTE(B20_1a2d)
    sta $60
    stx $61
    jsr B31_0087
    lda #$54
    jsr B20_19ad

    BankswitchCHR_Address GiegueCliff_CHR

    lda #$01
    sta $e5
    ldy #$04
    B20_195b:
    tya
    pha
    ldx #$20
    jsr B20_188f
    lda #$80
    sta $e5
    pla
    tay
    dey
    bpl B20_195b
    jsr B20_198b
    ldx #$03
    @B20_1970:
    lda B20_1a09, x
    sta $0540, x
    dex
    bpl @B20_1970
    lda #$9f
    sta $ec
    ldx #$1f
    @copy:
    lda GiegueCliff_BGPal, x
    sta $0520, x
    dex
    bpl @copy
    jmp B31_0e30;transition (light)

B20_198b:
    clc
    lda $6a
    adc #$0b
    B20_1990:
    pha
    jsr B20_188d
    lda #$80
    sta $e5
    pla
    sec
    sbc #$01
    bcc B20_19a2
    cmp $6a
    bcs B20_1990
    B20_19a2:
    rts

B20_19a3:
    lda $6a
    asl a
    asl a
    asl a
    asl a
    tay
    ldx #$fc
    rts

B20_19ad:
    pha
    tay
    lda #$00
    ldx #$60
    jsr B30_0e08
    pla
    clc
    adc #$02
    tay
    lda #$00
    ldx #$68
    jmp B30_0e08

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
;mainchar - evemisc - gieguecliff1 - gieguecliff2 - gieguecliff3 - gieguecliff4
GiegueCliff_CHR:
    .byte $76, $70, $50, $51, $52, $53

; $99FF - CHR bank table
;mainchar - evemisc - jpcred1 - jpcred2 - jpcred3 - jpcred4
Credits_CHR:
    .byte $76, $70, $48, $49, $4a, $4b

; $9A05 - Giegue background flash colors
;transparent - yellow - light blue - pink
GiegueCliff_BGFlash:
    .byte $0f, $38, $21, $34

; $9A09 - Unknown
B20_1a09:
    .byte $ca, $ed, $00, $00

; $9A0D
GiegueCliff_BGPal:
    .byte $0f, $12, $30, $00
    .byte $0f, $10, $30, $00
    .byte $0f, $17, $37, $16
    .byte $0f, $38, $30, $00
    ;this is just the generic sprite palette
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

NameLength := UNK_50+6
CurrentLetterIndex := UNK_50+5

ninten_question := NS_QuestionSetups+(0*6)
ana_question := NS_QuestionSetups+(1*6)
lloyd_question := NS_QuestionSetups+(2*6)
teddy_question := NS_QuestionSetups+(3*6)
food_question := NS_QuestionSetups+(4*6)

;;;This is the entirety of the Naming screen.
;;;This loads a question for each character, defines the name length,
;;;asks for confirmation, and shows the exposition.

;;;Returns carry flag clear to continue.
;;;Else, returns carry flag set to go back.
NS_NamingSequence:
    jsr B20_1B2A
    @naming_ninten:
    ;NameLength = 6
    lda #6
    sta NameLength

    lda #.LOBYTE(ninten_question)
    ldx #.HIBYTE(ninten_question)
    jsr NS_LoadQuestion

    bcs @exit
    @naming_ana:
    ;NameLength = 6
    lda #6
    sta NameLength

    lda #.LOBYTE(ana_question)
    ldx #.HIBYTE(ana_question)
    jsr NS_LoadQuestion

    bcs @naming_ninten
    @naming_lloyd:
    ;NameLength = 6
    lda #6
    sta NameLength

    lda #.LOBYTE(lloyd_question)
    ldx #.HIBYTE(lloyd_question)
    jsr NS_LoadQuestion

    bcs @naming_ana
    @naming_teddy:
    ;NameLength = 6
    lda #6
    sta NameLength

    lda #.LOBYTE(teddy_question)
    ldx #.HIBYTE(teddy_question)
    jsr NS_LoadQuestion

    bcs @naming_lloyd
    ;NameLength = 10
    lda #10
    sta NameLength

    lda #.LOBYTE(food_question)
    ldx #.HIBYTE(food_question)
    jsr NS_LoadQuestion

    bcs @naming_teddy
    jsr B20_1d50 ;transition (dark)
    jsr NS_ShowRecap
    jsr B31_0e30 ;transition (light)

    jsr NS_FinalChoicer

    ;if choicer == 0, continue
    bcc @continue
    ;else, go back to ninten
    jmp NS_NamingSequence
    @continue:

    jsr B20_1d50 ;transition (dark)

    ;wait 60 frames
    ldx #60
    jsr WaitXFrames

    jsr B31_0e30 ;transition (light)

    ;store 2,3 for x,y
    lda #2
    sta UNK_76
    lda #3
    sta UNK_76+1

    ;prints each line
    ldx #.LOBYTE(IntroText1)
    ldy #.HIBYTE(IntroText1)
    jsr do_story_print

    ;quit music next text
    lda #$ff
    sta soundqueue_track

    jsr B31_0e30;transition (light)

    ;store 6,10 for x,y
    lda #6
    sta UNK_76
    lda #10
    sta UNK_76+1

    ;prints each line
    ldx #.LOBYTE(IntroText2)
    ldy #.HIBYTE(IntroText2)
    jsr do_story_print

    clc
    @exit:
    rts

NS_ShowRecap:
    ;lists off all your answers
    lda #.LOBYTE(NS_Recap_Tiles)
    ldx #.HIBYTE(NS_Recap_Tiles)
    jsr NS_LoadTiles

    ;Is this OK?
    lda #.LOBYTE(NS_Recap_Confirmation_Tiles)
    ldx #.HIBYTE(NS_Recap_Confirmation_Tiles)
    jsr NS_LoadTiles

    ;show the characters
    jsr NS_PrepCharIcons

    ;set item to 0
    ldy #0
    @loop:
    jsr NS_DisplayCharacter

    jsr B25_1a9b
    cmp #$20
    bne @loop

    rts

;inherits NS_AddCharacterToOam's arguments
NS_DisplayCharacter:
    jsr PpuSync
    jmp NS_AddCharacterToOam

;x:a -> UNK_74
;loads tile data (pointer) to UNK_74??
NS_LoadTiles:
    sta UNK_74
    stx UNK_74+1
    jmp B30_067a

NS_FinalChoicer:
    ;process choicer
    lda #.LOBYTE(finalSetup)
    ldx #.HIBYTE(finalSetup)
    sta UNK_80
    stx UNK_80+1

    ;wait for input
    jsr B31_0f34

    ;if menucursor_pos == 0 (Yes), continue
    lda menucursor_pos
    beq @finalize
    ;else (No), return carry flag
    sec
    rts
    @finalize:
    clc
    rts

;y:x == string (tiles) pointer
do_story_print:
    lda #0
    sta UNK_70

    stx UNK_74
    sty UNK_74+1

    @loop:
    jsr B30_0707
    dec UNK_77
    cmp #0
    bne @loop

    ;wait for an a or b press
    jsr WaitABPressed

    jmp B20_1d50 ;transition (dark)

B20_1B2A:
    jsr B20_1d50 ;transition (dark)
    jsr ResetScroll

    ;the box surrounding the alphabet
    lda #.LOBYTE(NS_AlphabetBox)
    ldx #.HIBYTE(NS_AlphabetBox)
    jsr NS_LoadTiles

    jsr B20_1B40
    jsr NS_LoadQuestionBox
    jmp B31_0e30;transition (light)

B20_1B40:
    lda #.LOBYTE(NameCharacters)
    sta $64
    lda #.HIBYTE(NameCharacters)
    sta $65
    lda #$0e
    sta $63
    ldx #$04
    B20_1b4e:
    txa
    pha
    lda #$08
    sta $62
    lda $62
    sta $76
    lda $63
    sta $77
    lda $64
    sta $74
    lda $65
    sta $75
    jsr B30_06db
    jsr B25_1ab5
    pla
    tax
    dex
    bne B20_1b4e

    ;back end previous
    lda #.LOBYTE(NS_AlphabetOptions)
    ldx #.HIBYTE(NS_AlphabetOptions)
    jmp NS_LoadTiles

NS_LoadQuestionBox:
    ;self explanatory
    lda #.LOBYTE(NS_QuestionBox)
    ldx #.HIBYTE(NS_QuestionBox)
    jmp NS_LoadTiles

CurrentName := UNK_580
Menu_Question_Addr = UNK_50+$C ;2 bytes
Current_Name_Addr = UNK_60 ;2 bytes, taken from ^

;x:a == question pointer
NS_LoadQuestion:
    ;takes an address and assigns it to $5c
    sta Menu_Question_Addr
    stx Menu_Question_Addr+1

    ;Current_Name_Addr <- Menu_Question_Addr.SPRITEDEF
    ldy #0
    jsr NS_MQAToCNA

    ;if Current_Name_Addr == 0, jump
    ;(eg, last question)
    ora Current_Name_Addr
    beq @has_no_sprite
    ;else,

    ;set x,y to $22,$ff
    lda #$22
    sta UNK_62
    lda #$ff
    sta UNK_62+1
    ;set oam slot to $80
    lda #$80
    sta UNK_64
    ;set item to 0
    ldy #0
    ;UNK_60 is the currently loaded question pointer
    jsr NS_DisplayCharacter

    @has_no_sprite:
    ;show question?
    jsr B20_1bf7

    ;hide name entry for a second (does nothing functionally)
    lda #.LOBYTE(NS_NameEntry_Blankout)
    ldx #.HIBYTE(NS_NameEntry_Blankout)
    jsr NS_LoadTiles

    ;Current_Name_Addr <- Menu_Question_Addr.WRITEADDR
    ldy #4
    jsr NS_MQAToCNA

    ;y = name end
    ldy NameLength

    lda #0
    ; UNK_70 = 0
    sta UNK_70
    ;zero terminate CurrentName
    sta CurrentName+1, y

    ;CurrentLetterIndex = name end
    sty CurrentLetterIndex

    ;if Current_Name_Addr[y] == 0, replace with '?'
    @remove_whitespace:
    lda (Current_Name_Addr), y
    bne @dont_replace
    sty CurrentLetterIndex
    lda #'?'
    @dont_replace:
    sta CurrentName, y
    dey
    bpl @remove_whitespace

    jsr B20_1C1C
    bcs B20_1be8

    ;Current_Name_Addr <- Menu_Question_Addr.WRITEADDR
    ldy #4
    jsr NS_MQAToCNA

    jsr EnablePRGRam

    ;put current cursor to y
    ldy NameLength
    @loop:
    ;get stored character at y
    lda CurrentName, y
    ;check for "?" (blank)
    cmp #'?'
    bne @isnt_blank
    ;if blank, set to 0
    lda #0
    @isnt_blank:
    ;store in sram
    sta (Current_Name_Addr), y
    dey
    bpl @loop
    jsr WriteProtectPRGRam
    jsr B31_1d5e
    clc
    rts

B20_1be8:
    jsr B31_1d5e
    sec
    rts

;pointer transfer
NS_MQAToCNA:
    lda (Menu_Question_Addr), y
    sta Current_Name_Addr
    iny
    lda (Menu_Question_Addr), y
    sta Current_Name_Addr+1

    rts

B20_1bf7:
    ;load question box
    jsr NS_LoadQuestionBox

    ;wait 8 frames
    ldx #8
    jsr WaitXFrames

    ;Current_Name_Addr <- Menu_Question_Addr.QUESTION
    ldy #2
    jsr NS_MQAToCNA

    B20_1c04:
    ;load to UNK_74
    lda Current_Name_Addr
    sta UNK_74
    lda Current_Name_Addr+1
    sta UNK_74+1

    ;x,y
    lda #9
    sta UNK_76
    lda #3
    sta UNK_76+1

    @wait:
    jsr B30_06db
    cmp #0
    bne @wait

    rts

B20_1C1C:
    jsr NS_LoadCursor

    ;load setup pointer to UNK_80
    lda #.LOBYTE(letterSetup)
    ldx #.HIBYTE(letterSetup)
    sta UNK_80
    stx UNK_80+1

    ;load alphabet to UNK_84
    lda #.LOBYTE(NameCharacters)
    ldx #.HIBYTE(NameCharacters)
    sta UNK_84
    stx UNK_84+1

    ;UNK_D6 = 1
    lda #1
    sta UNK_D6

    B20_1C33:
    ;wait for input
    jsr B31_0f3f

    jmp B20_1C3f

B20_1C39:
    jsr NS_LoadCursor
    jsr B31_0f7c
    B20_1C3f:
    ;if PAD_B, backspace
    bit menucursor_pos+1
    bvs NS_Backspace
    ;if PAD_A, add character
    bmi NS_InputCharacter
    ;if PAD_START, confirm
    lda menucursor_pos+1
    and #PAD_START
    bne NAME_CHECK


    jmp B20_1C33

NS_InputCharacter:
    ldx menucursor_pos ; cursor (x*width)+y value
    lda NameCharacters, x
    ;if char == Back, backspace
    cmp #$a1
    beq NS_Backspace

    ;if char == End, confirm
    cmp #$a2
    beq NAME_CHECK

    ;if char == Previous, go back
    cmp #$a3
    beq B20_1c6e

    ;write
    ldx CurrentLetterIndex
    sta CurrentName, x

    ;if CurrentLetterIndex == NameLength, dont increment
    cpx NameLength
    beq @no_inc
    inx
    stx CurrentLetterIndex
    @no_inc:
    jmp B20_1C39

B20_1c6e:
    sec
    rts

NS_Backspace:
    ;load filler character
    lda #'?'

    ;CurrentLetterIndex - NameLength
    ldx CurrentLetterIndex
    cpx NameLength
    ;if result != 0, skip
    bne @skip
    cmp CurrentName, x
    bne @as_long
    @skip:
    ;fill at CurrentName[x] with '?'
    sta CurrentName, x
    ;x--
    dex
    ;if x < 0, jump
    bmi @go_negative
    stx CurrentLetterIndex
    @as_long:
    ;fill at CurrentName[x] with '?' (this is where it actually backspaces)
    sta CurrentName, x
    @go_negative:
    jmp B20_1C39

NAME_CHECK:
    ;ram - amount of characters/char index
    ldy CurrentLetterIndex
@UNKNOWN3:
    lda CurrentName,Y
    ;if char == ? (blank)
    cmp #'?'
    beq @UNKNOWN4 ;if z set
    ;if char != " " (normal)
    cmp #' '
    bne @UNKNOWN5 ;if z not set
    lda #'?'
    sta CurrentName,Y
@UNKNOWN4:
    dey
    bpl @UNKNOWN3
@UNKNOWN5:
    cpy NameLength
    beq @UNKNOWN6
    iny
@UNKNOWN6:
    sty CurrentLetterIndex
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
    jsr B31_1465
    jsr NS_LoadQuestionBox
    lda #$7f
    ldx #$63
    sta $60
    stx $61
    jsr B20_1c04
    lda CurrentName
    cmp #$a0
    beq B20_1cfe
    lda #$98
    ldx #$63
    sta $74
    stx $75
    ldx #$08
    ldy #$0e
    stx $76
    sty $77
    B20_1cf7:
    jsr B30_06db
    cmp #$00
    bne B20_1cf7
    B20_1cfe:
    jsr WaitABPressed
    jsr B20_1B40
    jsr B20_1bf7
    B20_1d07:
    jmp B20_1C1C

NS_LoadCursor:
    ;stash x,y
    lda UNK_76
    pha
    lda UNK_76+1
    pha

    jsr WaitNMI

    ;a = -NameLength
    sec
    lda #0
    sbc NameLength

    ;a = (a >> 1) | 0b10000000
    sec
    ror a

    ;a += 15
    clc
    adc #15

    ;y = a
    tay

    ;set sprite y to 89
    lda #89
    sta shadow_oam+(1*4)

    ;a = y
    clc
    tya

    ;a += CurrentLetterIndex
    adc CurrentLetterIndex

    ;a *= 8
    asl a
    asl a
    asl a

    ;set sprite x to a
    sta shadow_oam+(1*4)+3

    ;set tile index to 1
    lda #1
    sta shadow_oam+(1*4)+1

    ;set attr to 0
    lda #0
    sta shadow_oam+(1*4)+2

    ;a = y
    tya

    ;set x,y to a,10
    sta UNK_76
    lda #10
    sta UNK_76+1

    ;load tiles at CurrentName
    lda #.LOBYTE(CurrentName)
    sta UNK_74
    lda #.HIBYTE(CurrentName)
    sta UNK_74+1

    jsr B30_06db

    ;load stored x,y
    pla
    sta UNK_76+1
    pla
    sta UNK_76

    rts

;transition (dark)
B20_1d50:
    jsr OT0_DefaultTransition
    jsr B31_1d5e
    jsr B31_1d80

    ;clear attr
    ldx #.LOBYTE(B25_0afd)
    ldy #.HIBYTE(B25_0afd)
    jmp fill_nmi_with_pointer_data

;;; This contains the entire process of the Title Screen.
Title_Screen:
    jsr B31_1d5e ;clear sprites
    jsr B31_1d80 ;clear tilemap 0

    ;reset tilemap address back to $2000
    ;set scroll to (0,0)
    lda ram_PPUCTRL
    and #%11111100
    ldx #0
    ldy #0
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x

    ;load title chr pages (old)
    BankswitchCHR_Address Title_CHR_Old

    ;load title palette (old)
    lda #.LOBYTE(Title_Palette_Old)
    sta UNK_60
    lda #.HIBYTE(Title_Palette_Old)
    sta UNK_60+1
    jsr LoadPaletteFrom

    ;darken
    jsr OT0_DefaultTransition

    ;if mother earth playing, dont switch
    lda #music::mother_earth
    cmp current_music
    beq @skip_mus_update
    ;else switch
    sta soundqueue_track
    @skip_mus_update:

    ;set entire palette to 2
    ldx #.LOBYTE(nmi_fill_map_with_palette_2)
    ldy #.HIBYTE(nmi_fill_map_with_palette_2)
    jsr fill_nmi_with_pointer_data

    ;
    lda #.LOBYTE(produced_by_tiles)
    ldx #.HIBYTE(produced_by_tiles)
    jsr DoIntroTransition

    ldx #.LOBYTE(nmi_fill_map_with_palette_2)
    ldy #.HIBYTE(nmi_fill_map_with_palette_2)
    jsr fill_nmi_with_pointer_data

    lda #.LOBYTE(presented_by_tiles)
    ldx #.HIBYTE(presented_by_tiles)
    jsr DoIntroTransition

    lda #.LOBYTE(Title_Palette)
    sta UNK_60
    lda #.HIBYTE(Title_Palette)
    sta UNK_60+1
    jsr LoadPaletteFrom

    jsr OT0_DefaultTransition

    BankswitchCHR_Address Title_CHR

    lda #.LOBYTE(title_screen_tiles)
    ldx #.HIBYTE(title_screen_tiles)
    jsr load_tilemap_into_queue

    earth_oam = shadow_something+$e0
    ;get stuff set up for the earth animation
    lda #0
    sta UNK_60

    ;7 = ?
    ;6 = ?
    ;tiles = 16
    lda #16
    sta earth_oam+0

    ;blank out
    ;- oam
    ;- pointer 1
    lda #0
    sta earth_oam+1
    sta earth_oam+4
    sta earth_oam+5

    ;set x
    lda #88
    sta earth_oam+2

    ;set y
    lda #87
    sta earth_oam+3

    ;reset input?
    lda #0
    sta pad1_forced

    ;UNK_60 is used here to keep track of the current 'frame'.
    @anim_loop:
    clc

    ;get current frame
    lda UNK_60
    ;+= .LOBYTE(SPRITEDEF_EARTH)
    adc #.LOBYTE(SPRITEDEF_EARTH)
    sta earth_oam+6
    ;why isnt this just a lda #.HIBYTE(SPRITEDEF_EARTH)????
    lda #0
    adc #.HIBYTE(SPRITEDEF_EARTH)
    sta earth_oam+7

    lda #10
    sta UNK_E5
    clc

    ;tiles += 4
    lda UNK_60
    adc #4

    ;if UNK_60 is at 1c it should be 0. set accordingly
    cmp #$1c
    bne @skip_reset
    lda #0
    @skip_reset:
    sta UNK_60

    @wait_for_start:
    ;check if start pressed at title
    lda pad1_forced
    and #PAD_START
    bne @escape

    ;mini ppusync
    lda UNK_E5
    ora UNK_E0
    bne @wait_for_start

    beq @anim_loop
    @escape:
    ldx #0
    stx pad1_forced
    jsr OT0_DefaultTransition

    ;do antipiracy check
    lda #$19
    ldx #.LOBYTE(ANTI_PIRACY-1)
    ldy #.HIBYTE(ANTI_PIRACY-1)
    jsr TempUpperBankswitch

    rts

;B20_1e2c
DoIntroTransition:
    ;load tiles from x:a
    jsr load_tilemap_into_queue

    ;wait 1
    ldx #255
    jsr AdvanceIfPressStart

    ;wait 2
    ldx #64
    jsr AdvanceIfPressStart

    jsr OT0_DefaultTransition

    ;fade wait
    ldx #64
    jsr AdvanceIfPressStart

    jmp B31_1d80

;load tilepointer to UNK_74
load_tilemap_into_queue:
    sta UNK_74 ;store lo
    stx UNK_74+1 ;store hi

    @loop:
    jsr B30_06d2
    dec UNK_77
    cmp #0
    bne @loop

    jmp B31_0e30;transition (light)

;B20_1e54
;wait until start is pressed
;reg x == frames
AdvanceIfPressStart:
    jsr WaitNMI
    lda pad1_hold
    and #PAD_START
    eor #PAD_START
    beq @escape
    dex ;break anyways if frames run out
    bne AdvanceIfPressStart
    @escape:
    rts

; $9E63 - CHR bankswitch table
; spinning earth - evemisc - bold_font - bold_font - mother_title - rTospinning earth
Title_CHR_Old:
    .byte $42, $72, $7c, $7c, $40, $41

; $9E69 - CHR bankswitch table
; spinning earth - evemisc - bold_font - rTospinning earth - earthbound1 - earthbound2
Title_CHR:
    .byte $42, $72, $7c, $41, $d8, $d9

; $9E6F
Title_Palette_Old:
    .byte $0f, $28, $30, $18
    .byte $0f, $21, $30, $12
    .byte $0f, $16, $30, $12
    .byte $0f, $3a, $30, $12

    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12

; $9E8F
Title_Palette:
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $16
    .byte $0f, $21, $30, $16

    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12
    .byte $0f, $21, $30, $12

; $9EAF (transfered to nmi_queue)
nmi_fill_map_with_palette_2:
    .byte 8    ; PPU_FILL
    .byte $40     ; Fill 64 bytes
    .byte $23,$c0  ; at $23c0 (map 0 attr)
    .byte %10101010    ; with $AA (palette 2)
    .byte 0    ; END

;????
B20_1EB5:
    .byte 7 ; PPU_WRITE loop
    .byte 4 ; loop count
    .byte $23,$d2 ; at $23d2
    .byte %01000000 ; with $40
    .byte $23,$d3 ; at $23d3
    .byte %00010000 ; with $10
    .byte $23,$da ; at $23da
    .byte %00000100 ; with $04
    .byte $23,$db ; at $23db
    .byte %00000001 ; with $01
    .byte 0

; $9EC4 - produced by Nintendo
produced_by_tiles:
    ;produced by
    .byte set_pos 13, 11
    .byte $C8,$C9,$CA,$CB,$CD,$CE,$CF
    .byte 1
    ;tail of p
    .byte set_pos 13, 12
    .byte $D8
    .byte 1
    ;tail of y
    .byte set_pos 19, 12
    .byte $DF
    .byte 1

    ;line
    .byte set_pos 13, 13
    .byte repeatTile $CC, 19
    .byte 1

    ;Nintendo
    .byte set_pos 13, 15
    .byte $E3,$E4,$E5,$E6,$E7,$E8
    .byte 0

; $9EEA - presented by SHIGESATO ITOI
presented_by_tiles:
    ;presented by
    .byte set_pos 13, 11
    .byte $D9,$DA,$DB,$DC,$DD,$DE,$CE,$CF
    .byte 1
    ;tail of p
    .byte set_pos 13, 12
    .byte $D8
    .byte 1
    ;tail of y
    .byte set_pos 20, 12
    .byte $DF
    .byte 1

    ;line
    .byte set_pos 0, 13
    .byte repeatTile $CC, 21
    .byte 1

    ;SHIGESATO ITOI
    .byte set_pos 8, 15
    .byte $F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF
    .byte 0

; $9F18 - title screen
title_screen_tiles:
    ;EARTHBOUND logo
    .byte set_pos 8, 7
    .byte $90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C
    .byte 1
    .byte $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC
    .byte 1
    .byte $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF
    .byte 1
    .byte $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF
    .byte 1
    .byte $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE
    .byte 1
    .byte $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE
    .byte 1
    .byte $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE
    .byte 1

    ;c 1989/1990
    ;SHIGESATO ITOI / NINTENDO
    .byte set_pos 7, 23
    .byte $43,$44,$45,$46,$47,$70
    .byte $69,$6A,$6B,$6C,$6D,$6E,$6F,$53,$54,$55,$56,$57
    .byte 0
