;BATTLEID is a conscious decision to make id's dependant on offset
;(since it's basically an array, anyways)
;specifically to aid in shifting and general reordering.
.define BATTLEID(ta) .LOBYTE((ta-BATTLES_START)/$A)
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
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
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
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
    .endrepeat
SPAWNS_1D:
    .repeat $10
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
    .endrepeat
SPAWNS_1E:
    .repeat $10
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
    .endrepeat
SPAWNS_1F:
    .repeat $10
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
    .endrepeat

intro:
    ;use bank $13 as lower half
    jsr BANKSET_H13

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
    jsr BANKSET_H13

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
    jsr WriteTilesIn74
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
    jmp WriteTilesIn74

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

    @Saveram_Encounter:
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

    ;get areaEncounterDef from savemeta
    ;specifically, used for the zoo so that encounters can be disabled after the fact
    jsr GetMetaSaveA
    jmp @Saveram_Encounter

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
    .define areaEncounterDef(frequency, id) .byte (id << 3) | frequency

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

    jsr GetPartyMemberPtr

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
    sta nmi_flags+1
    lda #1
    sta nmi_flags
    jsr PpuSync

    lda #0
    sta nmi_queue+1
    @not_14:
    ;UNK_77 and UNK_76 get sent to UNK_78 and UNK_79 respectively
    jsr CalculateNTAddr

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
GiegueIntro:
    lda #$38
    jsr B31_0e21

    lda #$05
    jsr GiegueGeneric

    lda #.LOBYTE(GiegueCommandIntro1)
    ldx #.HIBYTE(GiegueCommandIntro1)
    jsr GiegueCommandInterpreter

    ;mute music
    lda #$ff
    jsr PlayMusic

    ;wait 180 frames
    ldx #180
    jsr WaitXFrames_Min1

    ;backup & fill palette with black
    lda #$0f
    jsr BackupAndFillPalette

    ;irq_count = 0
    lda #0
    sta irq_count

    ;???
    jsr LoadNamingScreen2
    jmp InitPartyObjects

GiegueOutro:
    lda #$0e
    jsr GiegueGeneric

    ;3... 2... 1...
    lda #.LOBYTE(GiegueCommandOutro1)
    ldx #.HIBYTE(GiegueCommandOutro1)
    jsr GiegueCommandInterpreter

    ;clear music
    lda #$ff
    jsr PlayMusic

    ;rumble rumble rumble
    lda #.LOBYTE(GiegueCommandOutro2)
    ldx #.HIBYTE(GiegueCommandOutro2)
    jsr GiegueCommandInterpreter

    ;rocket sound
    lda #Noise_Rocket
    sta soundqueue_noise

    ;dimslip sound
    lda #PulseG1_DimensionSlip
    sta soundqueue_pulseg1

    ;blasting off again!
    lda #.LOBYTE(GiegueCommandOutro3)
    ldx #.HIBYTE(GiegueCommandOutro3)
    jsr GiegueCommandInterpreter

    ;swap to credits
    lda #.BANK(Credits_Entry)
    ldx #BANK::PRGA000
    jsr BANK_SWAP
    jmp Credits_Entry

GiegueCommandInterpreter:
    ;UNK_68 = pointer to giegue command
    sta UNK_68
    stx UNK_68+1

    ;UNK_6A+1 = 0
    ldy #0
    sty UNK_6A+1

    @mainloop:
    ;get byte from pointer
    lda (UNK_68), y
    ;break if 0
    beq @break

    ;UNK_6C = word
    sta UNK_6C
    iny
    lda (UNK_68), y
    sta UNK_6C+1

    iny

    ;if !word.hi & 0x20, skip
    and #%00100000
    beq @no_shift
    ;else,
    ;UNK_6A+1 << 1 << c
    sec
    rol UNK_6A+1
    @no_shift:

    ;store y
    tya
    pha

    ;if !word.hi & 3, skip
    lda UNK_6C+1
    and #%00000011
    beq @no_flash
    ;;do flash

    ;a = GiegueCliff_BGFlash[a]
    tax
    lda GiegueCliff_BGFlash, x
    ;fill bg with a
    jsr FillBackgroundColor
    ;wait a frame
    jsr WaitNMI
    ;set bg to black again
    lda #$0f
    jsr FillBackgroundColor

    @no_flash:

    ;wait a frame
    jsr WaitNMI

    ;if UNK_6A+1 != 0, jump
    lda UNK_6A+1
    bne @isnt_zero

    ;if UNK_6C & 3, jump
    lda UNK_6C
    and #%00000011
    bne @do_no_loop_probably
    @isnt_zero:

    ;????
    lsr a
    @loop:
    pha
    jsr B20_183d
    pla
    sec
    sbc #1
    bpl @loop

    @do_no_loop_probably:

    ;if !(((UNK_6C << 2) & UNK_6C+1) & 4), jump
    ;because UNK_6C is the length
    ;shift left twice gets lsb in bit 3
    ;and UNK_6C+1 checks if should shake (bit 3)
    ;and 4 checks if true
    ;;;if bit 0 of UNK_6C and UNK_6C+1 & shake, shake.
    lda UNK_6C
    asl a
    asl a
    and UNK_6C+1
    and #%00000100
    beq @no_shake
    ;shake

    ;by this point, a will always be 4
    ;scroll_y.2 = !scroll_y.2
    lsr a
    eor scroll_y
    sta scroll_y

    ;play rocket noise
    lda #Noise_RocketLand
    sta soundqueue_noise

    @no_shake:

    dec UNK_6C
    bne @no_flash

    pla
    tay
    bne @mainloop

    @break:
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
    ;x -> UNK_62
    stx UNK_62

    ldx #0
    @B20_1893:
    cmp #$0f
    bcc @B20_189c
    sbc #$0f
    inx
    bcs @B20_1893
    @B20_189c:
    asl a
    asl a
    sta UNK_6E
    txa
    lsr a
    ror a
    ror a
    and #$c0
    ora UNK_6E
    sta UNK_60
    lda #6
    asl UNK_60
    rol a
    asl UNK_60
    rol a
    asl UNK_60
    rol a
    asl UNK_60
    rol a
    sta UNK_60+1
    ora #$03
    sta UNK_64+1
    lda UNK_6E
    and #$38
    ora #$c0
    sta UNK_64
    jsr PpuSync
    lda #5 ; TODO: UNKNOWN NMI COMMAND
    ldy #$40
    sta nmi_queue
    sty nmi_queue+1
    ldy #$08
    sta nmi_queue+$44
    sty nmi_queue+$45
    lda UNK_60+1
    ldy UNK_60
    and #$03
    ora UNK_62
    sta nmi_queue+2
    sty nmi_queue+3
    lda UNK_64+1
    ldy UNK_64
    and #$03
    ora UNK_62
    sta nmi_queue+$46
    sty nmi_queue+$47
    ldy #$3f
    B20_18f9:
    lda (UNK_60), y
    jsr B20_1919
    sta nmi_queue+4, y
    dey
    bpl B20_18f9
    ldy #7
    B20_1906:
    lda (UNK_64), y
    jsr B20_1919
    sta nmi_queue+$48, y
    dey
    bpl B20_1906

    lda #0
    sta nmi_queue+$50
    sta nmi_data_offset

    rts

B20_1919:
    cpx #$04
    bcc @exit
    lda #0
    @exit:
    rts

GiegueGeneric:
    sta UNK_6A

    lda #$0b
    jsr PlayMusic

    jsr B20_19a3

    jsr SetScroll

    jsr B31_1d5e

    jsr PpuSync

    ;copy sprite data
    ldx #(8*2)-1
    @copy:
    lda GiegueCliff_Sprites, x
    sta shadow_something+$40, x
    dex
    bpl @copy

    ;orient party
    lda #.LOBYTE(GiegueCliff_PartyPos)
    ldx #.HIBYTE(GiegueCliff_PartyPos)
    sta UNK_60
    stx UNK_60+1
    jsr B31_0087

    ;load tiles
    ;loads the second half of chrA into saveram $6000-$7000
    lda #$54
    jsr LoadGiegueCliffTiles

    ;load chr banks
    BankswitchCHR_Address GiegueCliff_CHR

    ;nmi_flags = 1
    ;draws the (rock) sprites
    lda #1
    sta nmi_flags

    ;draws the cliff
    ldy #4
    @tile1loop:
    tya
    pha
    ldx #$20
    jsr B20_188f
    lda #$80
    sta nmi_flags
    pla
    tay
    dey
    bpl @tile1loop

    jsr B20_198b ;???

    ;these draw the cliff over the ship?
    ldx #(GiegueCliff_BGPal-B20_1a09)-1
    @pointercopy:
    lda B20_1a09, x
    sta irq_pointers, x
    dex
    bpl @pointercopy

    lda #$9f
    sta irq_count

    ldx #$1f
    @palcopy:
    lda GiegueCliff_BGPal, x
    sta palette_backup, x
    dex
    bpl @palcopy

    ;transition (light)
    jmp B31_0e30

B20_198b:
    clc
    lda UNK_6A
    adc #$0b
    @B20_1990:
    pha
    jsr B20_188d
    lda #$80
    sta nmi_flags
    pla
    sec
    sbc #$01
    bcc @B20_19a2
    cmp UNK_6A
    bcs @B20_1990
    @B20_19a2:
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

LoadGiegueCliffTiles:
    pha
    tay
    lda #.LOBYTE($6000)
    ldx #.HIBYTE($6000)
    jsr B30_0e08

    pla
    clc
    adc #2
    tay
    lda #.LOBYTE($6800)
    ldx #.HIBYTE($6800)
    jmp B30_0e08

.macro giegue_command length, arg2, no_roll, arg3, shake, flash
    .byte length << 3
    .byte (arg2 << 6) | (no_roll << 5) | (arg3 << 3) | (shake << 2) | flash
.endmacro

;rise + flash
GiegueCommandIntro1:
giegue_command 16,   0, 0, 0, 0, 0
giegue_command 16, %10, 0, 0, 0, 0
giegue_command 16, %10, 0, 0, 0, 2
giegue_command  4, %10, 0, 0, 0, 3
giegue_command  4, %10, 0, 0, 0, 2
giegue_command 24, %10, 0, 0, 0, 1
giegue_command 16, %10, 0, 0, 0, 2
giegue_command  4, %10, 0, 0, 0, 3
giegue_command  4, %10, 0, 0, 0, 2
.byte 0

;go back down? + flashes
GiegueCommandOutro1:
giegue_command 16, %11, 0, 0, 0, 0
giegue_command  4, %11, 0, 0, 0, 3
giegue_command  4, %11, 0, 0, 0, 2
giegue_command 16, %11, 0, 0, 0, 1
giegue_command 16, %11, 0, 0, 0, 3
.byte 0

;shake
GiegueCommandOutro2:
giegue_command  8, 0, 0, 0, 0, 2
giegue_command  2, 0, 0, 0, 1, 3
giegue_command  4, 0, 0, 0, 1, 2
giegue_command 10, 0, 0, 0, 1, 1
.byte 0

;blast off
GiegueCommandOutro3:
giegue_command  1,   0, 1, 0, 0, 3
giegue_command  1,   0, 1, 0, 0, 2
giegue_command 30, %10, 1, 0, 0, 1
giegue_command 30,   0, 0, 0, 0, 0
.byte 0

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

; $9A09 - Unknown pointers
B20_1a09:
    .addr B31_0dcb-1
    .addr 0

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
GiegueCliff_PartyPos:
    .byte $68, $78, $00, $00
    .byte $58, $88, $00, $00
    .byte $78, $88, $00, $00
    .byte $68, $98, $00, $00

; $9A3D - Unknown
GiegueCliff_Sprites:
;shadow_something data
.byte (%10 << 6) | 6 ;6 tiles
.byte 0 ;oam slot (gets written over)
.byte $f4, $76 ;x, y
.addr 0 ;? pointer
.addr SPRITEDEF_GIEGUECLIFF1 ;spritedef pointer

.byte 6 ;6 tiles
.byte 0 ;oam slot (gets written over)
.byte $e4, $76 ;x, y
.addr 0 ;? pointer
.addr SPRITEDEF_GIEGUECLIFF2 ;spritedef pointer

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

;x:a -> tilepack_ptr
;loads tile data (pointer) to tilepack_ptr??
NS_LoadTiles:
    sta tilepack_ptr
    stx tilepack_ptr+1
    jmp WriteTilesIn74

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

    stx tilepack_ptr
    sty tilepack_ptr+1

    @loop:
    jsr PRINT_STRING
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
    jsr DrawTilepackClear
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
    ;load to tilepack_ptr
    lda Current_Name_Addr
    sta tilepack_ptr
    lda Current_Name_Addr+1
    sta tilepack_ptr+1

    ;x,y
    lda #9
    sta UNK_76
    lda #3
    sta UNK_76+1

    @wait:
    jsr DrawTilepackClear
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
    jsr DrawTilepackClear
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
    sta tilepack_ptr
    lda #.HIBYTE(CurrentName)
    sta tilepack_ptr+1

    jsr DrawTilepackClear

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
    sta nmi_flags
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
    lda nmi_flags
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

;load tilepointer to tilepack_ptr
load_tilemap_into_queue:
    sta tilepack_ptr ;store lo
    stx tilepack_ptr+1 ;store hi

    @loop:
    jsr DrawTilepack
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
