.segment        "PRG0": absolute

.ifdef VER_JP
    .byte 0
    binclude "../global/enemy_names.asm"
    .res $1B, 0
    .byte $29,$29,$29,$29
    .res $3C, 0
.else
    .include "../../global/item_names.asm"
    .include "../../global/choicer_names.asm"
    .include "../../global/psi_names.asm"
    .include "../../global/status_names.asm"
    .include "../../global/enemy_names.asm"
    .res $82, 0
    .byte   $48, $59
    .res $FD, 0
    .byte   $48, $59
    .res $b1, 0
.endif

;battle ui stuff
ui_list:
.addr ui_battlelog
.addr ui_partybox
.addr ui_actionbox
.addr ui_thing_6
.addr ui_thing_20
.addr ui_thing_11
.addr ui_thing_12
.addr ui_thing_2
.addr ui_thing_14
.addr ui_thing_20
.addr ui_thing_7
.addr ui_thing_8
.addr ui_thing_13
.addr ui_thing_16
.addr ui_thing_9
.addr ui_thing_15
.addr ui_thing_17
.addr ui_thing_18
.addr ui_thing_10
.addr ui_actionbox_melodies
.addr ui_thing_19

;run PRINT_STRING
.define UIDCMD_PRINTSTRING $FC
;run DrawTilePackClear
.define UIDCMD_TPCLEAR $FD
;run DrawTilePack
.define UIDCMD_TP $FE
.define UIDRAW_SET(cmd) .byte cmd
.macro UIDRAW_ENTRY count, addr
    .byte count
    .addr addr
.endmacro
.define UIDRAW_END .byte $FF

ui_battlelog:
;yspacing, xoffset, yoffset
.byte 1, 0, 1
;draw instructions
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_battlelog_top
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 3, ui_battlelog_middle
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_battlelog_bottom
UIDRAW_END

ui_thing_2:
.byte -1, 0, 9
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 4, ui_nothing
UIDRAW_END

ui_partybox:
.byte 1, 0, 19
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_partybox_top
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 3, ui_partybox_middle
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_partybox_bottom
UIDRAW_END

ui_actionbox:
.byte 1, 11, 17
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_actionbox_top
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_actionbox_line1
UIDRAW_ENTRY 1, ui_actionbox_line2
UIDRAW_ENTRY 1, ui_actionbox_line3
UIDRAW_ENTRY 1, ui_actionbox_line4
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_actionbox_bottom
UIDRAW_END

ui_actionbox_melodies:
.byte 1, 11, 17
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_actionbox_top
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_actionbox_line1
UIDRAW_ENTRY 1, ui_actionbox_line2
UIDRAW_ENTRY 1, ui_actionbox_line3
UIDRAW_ENTRY 1, ui_actionbox_line4_melodies
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_actionbox_bottom
UIDRAW_END

ui_thing_6:
.byte -1, 0, 27
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 5, ui_nothing
UIDRAW_END

ui_thing_7:
.byte 1, 1, 17
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_top
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_middle
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_bottom
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 3, ui_thing_bottom_padding
UIDRAW_END

ui_thing_8:
.ifdef VER_JP
    .byte 1, 17, 17
.else
    .byte 1, 15, 17
.endif
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tiles1
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 4, ui_thing_tiles2
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tiles3
UIDRAW_END

ui_thing_9:
.byte 1, 5, 17
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tiles4
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 4, ui_thing_tiles5
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tiles6
UIDRAW_END

ui_thing_10:
.ifdef VER_JP
    .byte 1, 22, 17
.else
    .byte 1, 7, 17
.endif
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tiles7
UIDRAW_END

ui_thing_11:
.byte 1, 7, 6
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesA
UIDRAW_END

ui_thing_12:
.byte 1, 7, 7
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesA
UIDRAW_END

ui_thing_13:
.ifdef VER_JP
    .byte 1, 19, -1
.else
    .byte 1, 17, -1
.endif
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_tiles8
UIDRAW_END

ui_thing_14:
.byte 1, 3, -1
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_tiles8
UIDRAW_END

ui_thing_15:
.byte 1, -1, -1
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_tiles8
UIDRAW_END

ui_thing_16:
.byte 1, -1, -1
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tiles9
UIDRAW_END

ui_thing_17:
.byte 1, 11, 23
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesB
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_tilesC
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesD
UIDRAW_SET UIDCMD_PRINTSTRING
UIDRAW_ENTRY 1, ui_thing_tilesE
UIDRAW_END

ui_thing_18:
.byte 1, 11, 23
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesB
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_tilesC
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesD
UIDRAW_SET UIDCMD_PRINTSTRING
UIDRAW_ENTRY 1, ui_thing_tilesF
UIDRAW_END

ui_thing_19:
.byte 1, 11, 23
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesB
UIDRAW_SET UIDCMD_TPCLEAR
UIDRAW_ENTRY 1, ui_thing_tilesC
UIDRAW_SET UIDCMD_TP
UIDRAW_ENTRY 1, ui_thing_tilesD
UIDRAW_SET UIDCMD_PRINTSTRING
UIDRAW_ENTRY 1, ui_thing_tiles10
UIDRAW_END

ui_thing_20:
.byte repeatTile 0, 32
.byte stopText

ui_nothing:
.byte repeatTile " ", 32
.byte stopText

.ifdef VER_JP
    ui_battlelog_top:
    .byte repeatTile " ", 5
    .byte uibox_tl
    .byte repeatTile uibox_t, 20
    .byte uibox_tr
    .byte repeatTile " ", 5
    .byte stopText
    ui_battlelog_middle:
    .byte repeatTile " ", 5
    .byte uibox_l
    .byte repeatTile " ", 20
    .byte uibox_r
    .byte repeatTile " ", 5
    .byte stopText
    ui_battlelog_bottom:
    .byte repeatTile " ", 5
    .byte uibox_bl
    .byte repeatTile uibox_b, 20
    .byte uibox_br
    .byte repeatTile " ", 5
    .byte stopText
.else
    ui_battlelog_top:
    .byte repeatTile " ", 4
    .byte uibox_tl
    .byte repeatTile uibox_t, 22
    .byte uibox_tr
    .byte repeatTile " ", 4
    .byte stopText
    ui_battlelog_middle:
    .byte repeatTile " ", 4
    .byte uibox_l
    .byte repeatTile " ", 22
    .byte uibox_r
    .byte repeatTile " ", 4
    .byte stopText
    ui_battlelog_bottom:
    .byte repeatTile " ", 4
    .byte uibox_bl
    .byte repeatTile uibox_b, 22
    .byte uibox_br
    .byte repeatTile " ", 4
    .byte stopText
.endif

;jp leftovers
ui_partybox_top:
.byte " ",uibox_tl,uibox_t,"NAME"
.byte repeatTile uibox_t, 4
.byte "HP",uibox_t,uibox_t,"PP",uibox_t,uibox_t,"LV"
.byte repeatTile uibox_t, 6
.byte "EX",uibox_t,uibox_tr," "
.byte stopText
ui_partybox_middle:
.byte " ",uibox_l
.byte repeatTile " ", 28
.byte uibox_r," "
.byte stopText
ui_partybox_bottom:
.byte " ",uibox_bl
.byte repeatTile uibox_b, 28
.byte uibox_br," "
.byte stopText

.ifdef VER_JP
    ui_actionbox_top:
    .byte uibox_tl
    .byte repeatTile uibox_t, 18
    .byte uibox_tr
    .byte stopText
    ui_actionbox_line1:
    .byte uibox_l
    kanafix " たたかう"
    .byte repeatTile " ", 5
    kanafix "オ-ト"
    .byte repeatTile " ", 5
    .byte uibox_r
    .byte stopText
    ui_actionbox_line2:
    .byte uibox_l," PSI"
    .byte repeatTile " ", 6
    kanafix "ガ-ド"
    .byte repeatTile " ", 5
    .byte uibox_r
    .byte stopText
    ui_actionbox_line3:
    .byte uibox_l
    kanafix " グッズ"
    .byte repeatTile " ", 6
    kanafix "にげる"
    .byte repeatTile " ", 5
    .byte uibox_r
    .byte stopText
    ui_actionbox_line4:
    .byte uibox_l
    kanafix " チェック"
    .byte repeatTile " ", 13
    .byte uibox_r
    .byte stopText
    ui_actionbox_bottom:
    .byte uibox_bl
    .byte repeatTile uibox_b, 18
    .byte uibox_br
    .byte stopText
    ui_actionbox_line4_melodies:
    .byte uibox_l
    kanafix " チェック"
    .byte repeatTile " ", 5
    kanafix "うたう"
    .byte repeatTile " ", 5
    .byte uibox_r
    .byte stopText
.else
    ui_actionbox_top:
    .byte uibox_tl
    .byte repeatTile uibox_t, 18
    .byte uibox_tr
    .byte stopText
    ui_actionbox_line1:
    .byte uibox_l," Fight"
    .byte repeatTile " ", 4
    .byte "Auto"
    .byte repeatTile " ", 4
    .byte uibox_r
    .byte stopText
    ui_actionbox_line2:
    .byte uibox_l," PSI"
    .byte repeatTile " ", 6
    .byte "Guard"
    .byte repeatTile " ", 3
    .byte uibox_r
    .byte stopText
    ui_actionbox_line3:
    .byte uibox_l," Goods"
    .byte repeatTile " ", 4
    .byte "Run"
    .byte repeatTile " ", 5
    .byte uibox_r
    .byte stopText
    ui_actionbox_line4:
    .byte uibox_l," Check"
    .byte repeatTile " ", 12
    .byte uibox_r
    .byte stopText
    ui_actionbox_bottom:
    .byte uibox_bl
    .byte repeatTile uibox_b, 18
    .byte uibox_br
    .byte stopText
    ui_actionbox_line4_melodies:
    .byte uibox_l," Check"
    .byte repeatTile " ", 4
    .byte "Sing"
    .byte repeatTile " ", 4
    .byte uibox_r
    .byte stopText
.endif

;namebox?
ui_thing_top:
.byte uibox_tl
.byte repeatTile uibox_t, 8
.byte uibox_tr
.byte stopText
ui_thing_middle:
.byte uibox_l
.byte repeatTile " ", 8
.byte uibox_r
.byte stopText
ui_thing_bottom:
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte stopText
ui_thing_bottom_padding:
.byte repeatTile " ", 10
.byte stopText

.ifdef VER_JP
    ui_thing_tiles1:
    .byte uibox_tl
    .byte repeatTile uibox_t, 12
    .byte uibox_tr
    .byte stopText
    ui_thing_tiles2:
    .byte uibox_l
    .byte repeatTile " ", 12
    .byte uibox_r
    .byte stopText
    ui_thing_tiles3:
    .byte uibox_bl
    .byte repeatTile uibox_b, 12
    .byte uibox_br
    .byte stopText
.else
    ui_thing_tiles1:
    .byte uibox_tl
    .byte repeatTile uibox_t, 14
    .byte uibox_tr
    .byte stopText
    ui_thing_tiles2:
    .byte uibox_l
    .byte repeatTile " ", 14
    .byte uibox_r
    .byte stopText
    ui_thing_tiles3:
    .byte uibox_bl
    .byte repeatTile uibox_b, 14
    .byte uibox_br
    .byte stopText
.endif

ui_thing_tiles4:
.byte uibox_tl
.byte repeatTile uibox_t, 24
.byte uibox_tr
.byte stopText
ui_thing_tiles5:
.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte stopText
ui_thing_tiles6:
.byte uibox_bl
.byte repeatTile uibox_b, 24
.byte uibox_br
.byte stopText

ui_thing_tiles7:
.byte " ",arrow
.byte stopText

ui_thing_tiles8:
.byte beingAttacked
.byte stopText

ui_thing_tiles9:
.byte ">"
.byte stopText

ui_thing_tilesA:
.ifdef VER_JP
    .byte repeatTile " ", 18
.else
    .byte repeatTile " ", 22
.endif
.byte stopText

ui_thing_tilesB:
.byte uibox_tl
.byte repeatTile uibox_t, 18
.byte uibox_tr
.byte stopText
ui_thing_tilesC:
.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte stopText
ui_thing_tilesD:
.byte uibox_bl
.byte repeatTile uibox_b, 18
.byte uibox_br
.byte stopText

ui_thing_tilesE:
.byte set_pos 13, 25
.ifdef VER_JP
    kanafix "せんとうちゅうは つかえない"
.else
    .byte "You can't now."
.endif
.byte stopText

ui_thing_tilesF:
.byte set_pos 13, 25
.ifdef VER_JP
    kanafix "せんとうちゅうは そうびできない"
.else
    .byte "You can't now."
.endif
.byte stopText

ui_thing_tiles10:
.byte set_pos 13, 25
.byte attacker
.ifdef VER_JP
    kanafix "は つかえない"
.else
    .byte "cannot."
.endif
.byte stopText

ui_thing_tiles11:
.byte set_pos 3, 19
.byte attacker
.byte stopText

Battle_Palettes:
.incbin "../../split/global/battlePalettes.bin"

;battle text list
;text indexed from battle actions
;disptext(0)
Battle_Text:
.word UMSG::B_NULL
.ifdef VER_JP
    .word UMSG::B_NULL
.else
    .word UMSG::GIEGUE_CHECK_REAL
.endif
.word UMSG::B_UNK
.word UMSG::B_APPROACH
.word UMSG::B_ATTACK
.word UMSG::B_TANKGUN
.word UMSG::B_DODGED
.word UMSG::B_CONTINUOUS_ATTACK
.word UMSG::B_BITE
.word UMSG::B_SCRATCH
.word UMSG::B_CHARGE
.word UMSG::B_SMAAAAASH
.word UMSG::B_DAMAGED
.word UMSG::B_YOU_WIN
.word UMSG::B_YOU_LOST
.word UMSG::B_DEFEATED
.word UMSG::B_HURT_AND_BEATEN
.word UMSG::B_ALREADY_GONE
.word UMSG::B_NO_EFFECT
.word UMSG::B_OUT_OF_CONTROL
.word UMSG::B_EXHAUSTED
.word UMSG::B_FINAL_ATTACK
.word UMSG::B_GIEGUE_ATTACK
.word UMSG::B_BARRIER
.word UMSG::B_BULLHORN_1
.word UMSG::B_GOT_STONED
.word UMSG::B_SPIT
.word UMSG::B_GOT_BLINDED
.word UMSG::B_BIND
.word UMSG::B_STRANGE_CRY
.word UMSG::B_EXPLODED
.word UMSG::B_FLAMEBURST
.word UMSG::B_OFFENSE_INCREASE
.word UMSG::B_OFFENSE_DECREASE
.word UMSG::B_DEFENSE_INCREASE
.word UMSG::B_SPEED_INCREASE
.word UMSG::B_CHECK_OFEENSE
.word UMSG::B_CHECK_DEFENSE
.word UMSG::B_FIGHT_DECREASE
.word UMSG::B_DEFENSE_DECREASE
.word UMSG::B_SMILE
.word UMSG::B_FIGHT_INCREASE
.word UMSG::B_RAGE
.word UMSG::B_SPEED_DECREASE
.word UMSG::B_CONFUSE
.word UMSG::B_CALL
.word UMSG::B_SOW
.word UMSG::B_GROUCHOFUNNY2
.word UMSG::B_LAUGH
.word UMSG::B_BROKEN_TANK
.word UMSG::B_THREATEN
.word UMSG::B_DIRTYWORDS
.word UMSG::B_GRIN
.word UMSG::B_BULLHORN_SUCCEED
.word UMSG::B_BULLHORN_FAIL
.word UMSG::B_BULLHORN_BACKFIRE
.word UMSG::B_CRITICAL
.word UMSG::B_LOST_SENSES
.word UMSG::B_CONFUSED
.word UMSG::B_SLEEP
.word UMSG::B_ASLEEP
.word UMSG::B_PP_RECOVER
.word UMSG::B_HP_RECOVER
.word UMSG::B_FLOW_ENERGY
.word UMSG::B_CALL_FAIL
.word UMSG::B_CALL_FAIL2
.word UMSG::B_CALL_SUCCEED
.word UMSG::B_RUN_AWAY
.word UMSG::B_DIDNT_WORK
.word UMSG::B_TRIP
.word UMSG::B_CANT_MOVE
.word UMSG::B_SELF_STONE
.word UMSG::B_PP_STEAL
.word UMSG::B_PARALYZED
.word UMSG::B_PUFF
.word UMSG::B_POISONED
.word UMSG::B_DEHYDRATED
.word UMSG::B_PSI_BLOCK
.word UMSG::B_BOUND
.word UMSG::B_SHIELD
.word UMSG::B_MISS
.word UMSG::B_BUT_PSI_BLOCK
.word UMSG::B_FRANKLIN_BOUNCE
.word UMSG::B_BOUNCE
.word UMSG::B_NOT_ENOUGH_PP
.word UMSG::B_NO_EFFECT2
.word UMSG::B_ASTHMA_WHEEZE
.word UMSG::B_MEDITATE
.word UMSG::B_GROUCHOFUNNY
.word UMSG::B_READY
.word UMSG::B_GIEGUE_SING
.word UMSG::B_GUARD
.word UMSG::B_APPROACH_SLOWLY
.word UMSG::B_POISON_RECOVER
.word UMSG::B_PUZZLED_RECOVER
.word UMSG::B_ITCHY
.word UMSG::B_PARALYSIS_RECOVER
.word UMSG::B_ASLEEP_RECOVER
.word UMSG::B_REVIVE
.word UMSG::B_USED
.word UMSG::B_TRIED
.word UMSG::B_CANT_USE
.word UMSG::B_CIRCUMSTANCES
.word UMSG::B_DO_STRANGE
.word UMSG::B_DREAMING
.word UMSG::B_BREAK_SHIELD
.word UMSG::B_CHECK
.word UMSG::B_CHECK_STRONGFIRE
.word UMSG::B_CHECK_STRONGFREEZE
.word UMSG::B_CHECK_STRONGTHUNDER
.word UMSG::B_CHECK_STRONGBEAM
.word UMSG::B_CHECK_WEAKSPRAYS
.word UMSG::B_ASTHMA_RECOVER
.word UMSG::B_NOLONGER_STONED
.word UMSG::B_WORDS_O_LOVE
.word UMSG::B_SWEAR_WORDS
.word UMSG::B_ASTHMA
.word UMSG::B_BREAK_ITEM
.word UMSG::B_WICKED_SEED
.word UMSG::B_GAS
.word UMSG::B_STONED
.word UMSG::B_FULL_RECOVER
.word UMSG::B_BEATEN_1
.word UMSG::B_BEATEN_2
.word UMSG::B_BEATEN_3
.word UMSG::B_BEATEN_4
.word UMSG::B_BEATEN_5
.word UMSG::B_BEATEN_6
.word UMSG::B_BEATEN_7
.word UMSG::B_STEAL
.word UMSG::B_STATUP
.word UMSG::B_STATUP_NEW_PSI
.word UMSG::B_STATUP_HP
.word UMSG::B_STATUP_PP
.word UMSG::B_STATUP_FIGHT
.word UMSG::B_STATUP_SPEED
.word UMSG::B_STATUP_WISDOM
.word UMSG::B_STATUP_STRENGTH
.word UMSG::B_STATUP_FORCE
.word UMSG::B_ESCAPE_ROPE
.word UMSG::B_STATUP_GET_ITEM
.word UMSG::B_CONFUSE_RECOVER
.word UMSG::B_AWAKE
.word UMSG::B_ZAP
.word UMSG::B_BUT_NO_EFFECT
.word UMSG::B_BIG_BAG_EMPTY
.word UMSG::B_INDETERMINATE_BATTLE_END
.ifdef VER_JP
    .word UMSG::B_NULL
    .word UMSG::B_NULL
    .word UMSG::B_NULL
.else
    .word UMSG::CHECK_R7038
    .word UMSG::CHECK_R7038XX
    .word UMSG::CHECK_R7037
.endif
.word UMSG::B_GIEGUE_SPEECH
.word UMSG::B_GIEGUE_SPEECH2
.word UMSG::B_GIEGUE_SPEECH3
.word UMSG::B_GIEGUE_SPEECH4
.word UMSG::B_GIEGUE_SPEECH5
.word UMSG::B_GIEGUE_SPEECH6
.word UMSG::B_GIEGUE_SPEECH7
.word UMSG::B_GIEGUE_SPEECH8
.word UMSG::B_GIEGUE_SPEECH9
.word UMSG::B_GIEGUE_SPEECH10
.word UMSG::B_GIEGUE_SPEECH11
.word UMSG::B_GIEGUE_SPEECH12
.word UMSG::B_GIEGUE_SPEECH13
.word UMSG::B_GIEGUE_SPEECH14
.word UMSG::B_GIEGUE_SPEECH15
.word UMSG::B_GIEGUE_SPEECH16
.word UMSG::B_GIEGUE_SPEECH17
.word UMSG::B_GIEGUE_SPEECH18
.word UMSG::B_GIEGUE_SPEECH19
.word UMSG::B_GIEGUE_SPEECH20
.word UMSG::B_GIEGUE_SPEECH21
.word UMSG::B_GIEGUE_SPEECH22

.ifdef VER_JP
    binclude "text/battle_msg.asm"
    binclude "../global/window_tiles.asm"
    .res 19, 0
.else
    .include "../../global/window_tiles.asm"
    .res $BF, 0
    .byte $48,$59
    .res 4, 0
    .res 4, 2
    .res $a4, 0
.endif

.include "../../global/items.asm"
.include "../../global/choicers.asm"
.include "../../global/character_rates.asm"
.include "../../global/psi_data.asm"
