;BATTLEID is a conscious decision to make id's dependant on offset
;(since it's basically an array, anyways)
;specifically to aid in shifting and general reordering.
.define BATTLEID(ta) .LOBYTE((ta-BATTLES_START)/$A)

.segment        "PRG14": absolute
    .incbin "../../split/jp/map_tile_properties.bin"

;overworld palettes + map exclusive data
;1st and 3rd byte of last palette of each set contains map data
Map_Palettes:
    .incbin "../../split/jp/map_palettes.bin"

;format seems to be $10 per area, though why they sometimes pad with
;the same groups is questionable
;it SEEMS to use the duplicated parts??????? are they to 'increase'
;spawn rates????? i dont know man.
;addendum; area is the perfect term. it goes off of sector area param
SPAWN_SETS: ;use this symbol when the handler gets disasmd
SPAWNS_0:
    .repeat $10
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
    .endrepeat
SPAWNS_1:
    .repeat 2
        .byte BATTLEID BATTLE_3
        .byte BATTLEID BATTLE_5
        .byte BATTLEID BATTLE_7
        .byte BATTLEID BATTLE_8
        .byte BATTLEID BATTLE_9
        .byte BATTLEID BATTLE_B
        .byte 0,0
    .endrepeat
SPAWNS_2:
    .repeat 2
        .byte BATTLEID BATTLE_C
        .byte BATTLEID BATTLE_D
        .byte BATTLEID BATTLE_E
        .byte BATTLEID BATTLE_F
        .byte BATTLEID BATTLE_10
        .byte BATTLEID BATTLE_11
        .byte BATTLEID BATTLE_48
        .byte 0
    .endrepeat
SPAWNS_3:
    .repeat 2
        .byte BATTLEID BATTLE_12
        .byte BATTLEID BATTLE_13
        .byte BATTLEID BATTLE_14
        .byte BATTLEID BATTLE_15
        .byte BATTLEID BATTLE_16
        .byte BATTLEID BATTLE_17
        .byte BATTLEID BATTLE_18
        .byte BATTLEID BATTLE_19
    .endrepeat
SPAWNS_4:
    .repeat 2
        .byte BATTLEID BATTLE_4
        .byte BATTLEID BATTLE_5
        .byte BATTLEID BATTLE_6
        .byte BATTLEID BATTLE_7
        .byte BATTLEID BATTLE_B
        .byte BATTLEID BATTLE_1B
        .byte BATTLEID BATTLE_1C
        .byte 0
    .endrepeat
SPAWNS_5:
    .byte BATTLEID BATTLE_1C
    .byte BATTLEID BATTLE_1D
    .byte BATTLEID BATTLE_1E
    .byte BATTLEID BATTLE_1F
    .byte BATTLEID BATTLE_30
    .byte BATTLEID BATTLE_31
    .byte BATTLEID BATTLE_32
    .byte BATTLEID BATTLE_34
    .byte BATTLEID BATTLE_35
    .byte BATTLEID BATTLE_36
    .byte BATTLEID BATTLE_38
    .byte BATTLEID BATTLE_3A
    .byte BATTLEID BATTLE_3B
    .byte 0,0,0
SPAWNS_6:
    .byte BATTLEID BATTLE_A
    .byte BATTLEID BATTLE_1C
    .byte BATTLEID BATTLE_1D
    .byte BATTLEID BATTLE_31
    .byte BATTLEID BATTLE_32
    .byte BATTLEID BATTLE_3C
    .byte BATTLEID BATTLE_3D
    .byte BATTLEID BATTLE_3E
    .byte BATTLEID BATTLE_3F
    .byte BATTLEID BATTLE_40
    .byte BATTLEID BATTLE_9C
    .byte 0,0,0,0,0
SPAWNS_7:
    .byte BATTLEID BATTLE_1C
    .byte BATTLEID BATTLE_1E
    .byte BATTLEID BATTLE_20
    .byte BATTLEID BATTLE_21
    .byte BATTLEID BATTLE_30
    .byte BATTLEID BATTLE_32
    .byte BATTLEID BATTLE_33
    .byte BATTLEID BATTLE_36
    .byte BATTLEID BATTLE_37
    .byte BATTLEID BATTLE_47
    .byte 0,0,0,0,0,0
SPAWNS_8:
    .repeat 2
        .byte BATTLEID BATTLE_55
        .byte BATTLEID BATTLE_56
        .byte BATTLEID BATTLE_57
        .byte BATTLEID BATTLE_58
        .byte BATTLEID BATTLE_59
        .byte 0,0,0
    .endrepeat
SPAWNS_9:
    .byte BATTLEID BATTLE_47
    .byte BATTLEID BATTLE_5A
    .byte BATTLEID BATTLE_5B
    .byte BATTLEID BATTLE_5C
    .byte BATTLEID BATTLE_5D
    .byte BATTLEID BATTLE_61
    .byte BATTLEID BATTLE_62
    .byte BATTLEID BATTLE_63
    .byte BATTLEID BATTLE_64
    .byte BATTLEID BATTLE_66
    .byte BATTLEID BATTLE_69
    .byte 0,0,0,0,0
SPAWNS_A:
    .byte BATTLEID BATTLE_5C
    .byte BATTLEID BATTLE_5E
    .byte BATTLEID BATTLE_61
    .byte BATTLEID BATTLE_64
    .byte BATTLEID BATTLE_65
    .byte BATTLEID BATTLE_67
    .byte BATTLEID BATTLE_68
    .byte BATTLEID BATTLE_69
    .byte BATTLEID BATTLE_6A
    .byte BATTLEID BATTLE_6B
    .byte BATTLEID BATTLE_6C
    .byte BATTLEID BATTLE_6D
    .byte BATTLEID BATTLE_6E
    .byte 0,0,0
SPAWNS_B:
    .byte BATTLEID BATTLE_5A
    .byte BATTLEID BATTLE_5B
    .byte BATTLEID BATTLE_70
    .byte BATTLEID BATTLE_71
    .byte BATTLEID BATTLE_72
    .byte BATTLEID BATTLE_73
    .byte BATTLEID BATTLE_75
    .byte BATTLEID BATTLE_76
    .byte BATTLEID BATTLE_77
    .byte BATTLEID BATTLE_78
    .byte BATTLEID BATTLE_79
    .byte 0,0,0,0,0
SPAWNS_C:
    .byte BATTLEID BATTLE_5F
    .byte BATTLEID BATTLE_60
    .byte BATTLEID BATTLE_61
    .byte BATTLEID BATTLE_66
    .byte BATTLEID BATTLE_69
    .byte BATTLEID BATTLE_73
    .byte BATTLEID BATTLE_74
    .byte BATTLEID BATTLE_7A
    .byte BATTLEID BATTLE_7B
    .byte BATTLEID BATTLE_7C
    .byte BATTLEID BATTLE_7D
    .byte 0,0,0,0,0
SPAWNS_D:
    .byte BATTLEID BATTLE_49
    .byte BATTLEID BATTLE_4A
    .byte BATTLEID BATTLE_4B
    .byte BATTLEID BATTLE_4C
    .byte BATTLEID BATTLE_4D
    .byte BATTLEID BATTLE_4E
    .byte BATTLEID BATTLE_4F
    .byte BATTLEID BATTLE_50
    .byte BATTLEID BATTLE_51
    .byte BATTLEID BATTLE_52
    .byte BATTLEID BATTLE_53
    .byte BATTLEID BATTLE_54
    .byte BATTLEID BATTLE_A3
    .byte 0,0,0
SPAWNS_E:
    .byte BATTLEID BATTLE_49
    .byte BATTLEID BATTLE_4A
    .byte BATTLEID BATTLE_4B
    .byte BATTLEID BATTLE_4C
    .byte BATTLEID BATTLE_4D
    .byte BATTLEID BATTLE_4E
    .byte BATTLEID BATTLE_4F
    .byte BATTLEID BATTLE_50
    .byte BATTLEID BATTLE_51
    .byte BATTLEID BATTLE_52
    .byte BATTLEID BATTLE_53
    .byte BATTLEID BATTLE_54
    .byte BATTLEID BATTLE_A3
    .byte 0,0,0
SPAWNS_F:
    .byte BATTLEID BATTLE_49
    .byte BATTLEID BATTLE_4A
    .byte BATTLEID BATTLE_4B
    .byte BATTLEID BATTLE_4C
    .byte BATTLEID BATTLE_4D
    .byte BATTLEID BATTLE_4E
    .byte BATTLEID BATTLE_4F
    .byte BATTLEID BATTLE_50
    .byte BATTLEID BATTLE_51
    .byte BATTLEID BATTLE_A3
    .byte 0,0,0,0,0,0
SPAWNS_10:
    .repeat 4
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
        .byte BATTLEID BATTLE_2
        .byte BATTLEID BATTLE_6
        .byte BATTLEID BATTLE_1A
    .endrepeat
SPAWNS_11:
    .repeat 2
        .byte BATTLEID BATTLE_41
        .byte BATTLEID BATTLE_42
        .byte BATTLEID BATTLE_43
        .byte BATTLEID BATTLE_44
        .byte BATTLEID BATTLE_45
        .byte BATTLEID BATTLE_46
        .byte 0,0
    .endrepeat
SPAWNS_12:
    .repeat 2
        .byte BATTLEID BATTLE_41
        .byte BATTLEID BATTLE_42
        .byte BATTLEID BATTLE_43
        .byte BATTLEID BATTLE_44
        .byte BATTLEID BATTLE_45
        .byte BATTLEID BATTLE_46
        .byte 0,0
    .endrepeat
SPAWNS_13:
    .byte BATTLEID BATTLE_49
    .byte BATTLEID BATTLE_4A
    .byte BATTLEID BATTLE_4B
    .byte BATTLEID BATTLE_4C
    .byte BATTLEID BATTLE_4D
    .byte BATTLEID BATTLE_4E
    .byte BATTLEID BATTLE_4F
    .byte BATTLEID BATTLE_50
    .byte BATTLEID BATTLE_51
    .byte BATTLEID BATTLE_52
    .byte BATTLEID BATTLE_53
    .byte BATTLEID BATTLE_54
    .byte BATTLEID BATTLE_A3
    .byte 0,0,0
SPAWNS_14:
    .repeat $10
        .byte BATTLEID BATTLE_MYHOUSE_RAT1
    .endrepeat
SPAWNS_15:
    .repeat 4
        .byte BATTLEID BATTLE_2
        .byte BATTLEID BATTLE_1E
        .byte BATTLEID BATTLE_2
        .byte BATTLEID BATTLE_1E
    .endrepeat
SPAWNS_16:
    .byte BATTLEID BATTLE_81
    .byte BATTLEID BATTLE_82
    .byte BATTLEID BATTLE_83
    .byte BATTLEID BATTLE_84
    .byte BATTLEID BATTLE_85
    .byte BATTLEID BATTLE_86
    .byte BATTLEID BATTLE_87
    .byte BATTLEID BATTLE_88
    .byte BATTLEID BATTLE_89
    .byte BATTLEID BATTLE_8A
    .byte BATTLEID BATTLE_8B
    .byte 0,0,0,0,0
SPAWNS_17:
    .byte BATTLEID BATTLE_92
    .byte BATTLEID BATTLE_93
    .byte BATTLEID BATTLE_94
    .byte BATTLEID BATTLE_95
    .byte BATTLEID BATTLE_96
    .byte BATTLEID BATTLE_97
    .byte BATTLEID BATTLE_98
    .byte BATTLEID BATTLE_99
    .byte BATTLEID BATTLE_9A
    .byte 0,0,0,0,0,0,0
SPAWNS_18:
    .repeat 4
        .byte BATTLEID BATTLE_7E
        .byte BATTLEID BATTLE_7F
        .byte BATTLEID BATTLE_80
        .byte BATTLEID BATTLE_82
    .endrepeat
SPAWNS_19:
    .repeat 4
        .byte BATTLEID BATTLE_8C
        .byte BATTLEID BATTLE_8D
        .byte BATTLEID BATTLE_8E
        .byte 0
    .endrepeat
SPAWNS_1A:
    .byte BATTLEID BATTLE_22
    .byte BATTLEID BATTLE_23
    .byte BATTLEID BATTLE_MAGICANT_BIGWOODOH
    .byte BATTLEID BATTLE_MAGICANT_WOODOH
    .byte BATTLEID BATTLE_26
    .byte BATTLEID BATTLE_27
    .byte BATTLEID BATTLE_28
    .byte BATTLEID BATTLE_29
    .byte BATTLEID BATTLE_2B
    .byte BATTLEID BATTLE_2C
    .byte BATTLEID BATTLE_2D
    .byte 0,0,0,0,0
SPAWNS_1B:
    .repeat 2
        .byte BATTLEID BATTLE_2A
        .byte BATTLEID BATTLE_2B
        .byte BATTLEID BATTLE_2C
        .byte BATTLEID BATTLE_2D
        .byte BATTLEID BATTLE_A1
        .byte 0,0,0
    .endrepeat
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

Title_Screen := $9e23

intro:
    ;use bank $13 as lower half
    jsr BANKSET_H13

    ;title routine
    jsr Title_Screen
    ;here, you have gone to the save menu

    .ifndef VER_JP
    exited_naming_sequence:
    .endif
    jsr B31_1d5e ;clear sprites
    jsr B31_1d80 ;clear tilemap 0
    jsr LoadNamingScreen2 ;self explanatory

    jsr PpuSync

    ;load NAMING_SCREEN_1
    .ifdef VER_JP
    .import __NAMING_SCREEN_1_RUN__
    ldy #$7a
    lda #.LOBYTE(__NAMING_SCREEN_1_RUN__)
    ldx #.HIBYTE(__NAMING_SCREEN_1_RUN__)
    jsr B30_0e08
    .else
    lda #.BANK(LoadNamingScreen1)
    ldx #.LOBYTE(LoadNamingScreen1-1)
    ldy #.HIBYTE(LoadNamingScreen1-1)
    jsr TempUpperBankswitch
    .endif

    jsr ResetScroll

    ;load graphics
    BankswitchCHR_Address naming_screen_chr_table
    ;load palettes
    LoadPalette_Address naming_screen_palettes


    B20_1505 := $951a
    B20_14d7 := $94ec
    B20_150e := $9523


    B20_142C:
    ldx #(6*2)
    jsr B20_1505
    jsr B20_14d7
    jsr B20_150e ;wait for input

    lda #0
    sta UNK_D6

    ;get offset
    ldy menucursor_pos
    lda (UNK_84),y
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

    rts

B20X_14A1 := $94A1
B20_1472 := $9472
B20_148c := $948C
unk_pointers:
    .addr B19_1e88-1
    .ifdef VER_JP
    .addr B20X_14A1-1
    .addr B20_1472-1
    .addr B20_148c-1
    .endif
    .addr something_init-1

NS_NamingSequence := $9af6

something_init:
    pha
    jsr EnablePRGRam

    .ifdef VER_JP
    lda #.BANK(B28_0000)+1 ;sram
    .else
    lda #.BANK(MSG_pointerList) ;text pointers + sram
    .endif
    ldx #BANK::PRGA000
    jsr BANK_SWAP

    pla
    jsr SetupFreshSaveData
    jsr WriteProtectPRGRam
    jsr BANKSET_H13

    ;do naming sequence
    jsr NS_NamingSequence
    .ifndef VER_JP
    ;if sequence exited, jump back to title
    bcs exited_naming_sequence
    .endif
    ;else, play the videogame !!!!!!
    jmp Game_Begin

    .incbin "../../split/jp/prg/bank14/unk1400.bin", $72


    ;area based encounter sets
    .define areaEncounterDef(frequency, id) .byte (id << 3) | frequency