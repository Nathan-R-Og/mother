.segment        "PRG0": absolute

.include "../../global/item_names.asm"
.include "../../global/choicer_names.asm"
.include "../../global/psi_names.asm"
.include "../../global/status_names.asm"
.include "../../global/enemy_names.asm"


;???????
.res $82, 0
.byte   $48, $59
.res $FD, 0
.byte   $48, $59
.res $b1, 0

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

ui_battlelog:
;yspacing, xoffset, yoffset, draw mode
.byte 1, 0, 1
.byte $FE
.byte 1 ;amount?
.addr ui_battlelog_top
.byte $FD
.byte 3 ;amount?
.addr ui_battlelog_middle
.byte $FE
.byte 1 ;amount?
.addr ui_battlelog_bottom
.byte $FF
ui_thing_2:
.byte $FF,0,9
.byte $FD
.byte 4
.addr ui_nothing
.byte $FF
ui_partybox:
.byte 1,0,19
.byte $FE
.byte 1
.addr ui_partybox_top
.byte $FD
.byte 3
.addr ui_partybox_middle
.byte $FE
.byte 1
.addr ui_partybox_bottom
.byte $FF
ui_actionbox:
.byte $01,11,17
.byte $FE
.byte 1
.addr ui_actionbox_top
.byte $FD
.byte 1
.addr ui_actionbox_line1
.byte 1
.addr ui_actionbox_line2
.byte 1
.addr ui_actionbox_line3
.byte 1
.addr ui_actionbox_line4
.byte $FE
.byte 1
.addr ui_actionbox_bottom
.byte $FF
ui_actionbox_melodies:
.byte $01,$0B,$11
.byte $FE
.byte 1
.addr ui_actionbox_top
.byte $FD
.byte 1
.addr ui_actionbox_line1
.byte 1
.addr ui_actionbox_line2
.byte 1
.addr ui_actionbox_line3
.byte 1
.addr ui_actionbox_line4_melodies
.byte $FE
.byte 1
.addr ui_actionbox_bottom
.byte $FF
ui_thing_6:
.byte $FF,0,27
.byte $FD
.byte 5
.addr ui_nothing
.byte $FF
ui_thing_7:
.byte $01,1,17
.byte $FE
.byte 1
.addr ui_thing_top
.byte $FD
.byte 1
.addr ui_thing_middle
.byte $FE
.byte 1
.addr ui_thing_bottom
.byte $FD
.byte 3
.addr ui_thing_bottom_padding
.byte $FF
ui_thing_8:
.byte $01,15,17
.byte $FE
.byte 1
.addr ui_thing_tiles1
.byte $FD
.byte 4
.addr ui_thing_tiles2
.byte $FE
.byte 1
.addr ui_thing_tiles3
.byte $FF
ui_thing_9:
.byte $01,5,17
.byte $FE
.byte 1
.addr ui_thing_tiles4
.byte $FD
.byte 4
.addr ui_thing_tiles5
.byte $FE
.byte 1
.addr ui_thing_tiles6
.byte $FF
ui_thing_10:
.byte $01,7,17
.byte $FE
.byte 1
.addr ui_thing_tiles7
.byte $FF
ui_thing_11:
.byte $01,7,6
.byte $FE
.byte 1
.addr ui_thing_tilesA
.byte $FF
ui_thing_12:
.byte $01,7,7
.byte $FE
.byte 1
.addr ui_thing_tilesA
.byte $FF
ui_thing_13:
.byte $01,17,$FF
.byte $FD
.byte 1
.addr ui_thing_tiles8
.byte $FF
ui_thing_14:
.byte $01,3,$FF
.byte $FD
.byte 1
.addr ui_thing_tiles8
.byte $FF
ui_thing_15:
.byte $01,$FF,$FF
.byte $FD
.byte 1
.addr ui_thing_tiles8
.byte $FF
ui_thing_16:
.byte $01,$FF,$FF
.byte $FE
.byte 1
.addr ui_thing_tiles9
.byte $FF
ui_thing_17:
.byte $01,11,23
.byte $FE
.byte 1
.addr ui_thing_tilesB
.byte $FD
.byte 1
.addr ui_thing_tilesC
.byte $FE
.byte 1
.addr ui_thing_tilesD
.byte $FC
.byte 1
.addr ui_thing_tilesE
.byte $FF
ui_thing_18:
.byte $01,11,23
.byte $FE
.byte 1
.addr ui_thing_tilesB
.byte $FD
.byte 1
.addr ui_thing_tilesC
.byte $FE
.byte 1
.addr ui_thing_tilesD
.byte $FC
.byte 1
.addr ui_thing_tilesF
.byte $FF
ui_thing_19:
.byte $01,11,23
.byte $FE
.byte 1
.addr ui_thing_tilesB
.byte $FD
.byte 1
.addr ui_thing_tilesC
.byte $FE
.byte 1
.addr ui_thing_tilesD
.byte $FC
.byte 1
.addr ui_thing_tiles10
.byte $FF

ui_thing_20:
.byte repeatTile 0, 32
.byte 0

ui_nothing:
.byte repeatTile " ", 32
.byte $00

ui_battlelog_top:
.byte repeatTile " ", 4
.byte uibox_tl
.byte repeatTile uibox_t, 22
.byte uibox_tr
.byte repeatTile " ", 4
.byte 0
ui_battlelog_middle:
.byte repeatTile " ", 4
.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte repeatTile " ", 4
.byte 0
ui_battlelog_bottom:
.byte repeatTile " ", 4
.byte uibox_bl
.byte repeatTile uibox_b, 22
.byte uibox_br
.byte repeatTile " ", 4
.byte 0

;jp leftovers?
ui_partybox_top:
.byte " ",uibox_tl,uibox_t,"NAME"
.byte repeatTile uibox_t, 4
.byte "HP",uibox_t,uibox_t,"PP",uibox_t,uibox_t,"LV"
.byte repeatTile uibox_t, 6
.byte "EX",uibox_t,uibox_tr," "
.byte 0
ui_partybox_middle:
.byte " ",uibox_l
.byte repeatTile " ", 28
.byte uibox_r," "
.byte 0
ui_partybox_bottom:
.byte " ",uibox_bl
.byte repeatTile uibox_b, 28
.byte uibox_br," "
.byte 0

ui_actionbox_top:
.byte uibox_tl
.byte repeatTile uibox_t, 18
.byte uibox_tr
.byte 0
ui_actionbox_line1:
.byte uibox_l," Fight"
.byte repeatTile " ", 4
.byte "Auto"
.byte repeatTile " ", 4
.byte uibox_r
.byte 0
ui_actionbox_line2:
.byte uibox_l," PSI"
.byte repeatTile " ", 6
.byte "Guard"
.byte repeatTile " ", 3
.byte uibox_r
.byte 0
ui_actionbox_line3:
.byte uibox_l," Goods"
.byte repeatTile " ", 4
.byte "Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte 0
ui_actionbox_line4:
.byte uibox_l," Check"
.byte repeatTile " ", 12
.byte uibox_r
.byte 0
ui_actionbox_bottom:
.byte uibox_bl
.byte repeatTile uibox_b, 18
.byte uibox_br
.byte 0
ui_actionbox_line4_melodies:
.byte uibox_l," Check"
.byte repeatTile " ", 4
.byte "Sing"
.byte repeatTile " ", 4
.byte uibox_r
.byte 0
;namebox?
ui_thing_top:
.byte uibox_tl
.byte repeatTile uibox_t, 8
.byte uibox_tr
.byte 0
ui_thing_middle:
.byte uibox_l
.byte repeatTile " ", 8
.byte uibox_r
.byte 0
ui_thing_bottom:
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte 0
ui_thing_bottom_padding:
.byte repeatTile " ", 10
.byte 0

ui_thing_tiles1:
.byte uibox_tl
.byte repeatTile uibox_t, 14
.byte uibox_tr
.byte 0
ui_thing_tiles2:
.byte uibox_l
.byte repeatTile " ", 14
.byte uibox_r
.byte 0
ui_thing_tiles3:
.byte uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br
.byte 0
ui_thing_tiles4:
.byte uibox_tl
.byte repeatTile uibox_t, 24
.byte uibox_tr
.byte 0
ui_thing_tiles5:
.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 0
ui_thing_tiles6:
.byte uibox_bl
.byte repeatTile uibox_b, 24
.byte uibox_br
.byte 0
ui_thing_tiles7:
.byte " ",arrow
.byte 0
ui_thing_tiles8:
.byte beingAttacked
.byte 0
ui_thing_tiles9:
.byte ">"
.byte 0
ui_thing_tilesA:
.byte repeatTile " ", 22
.byte 0
ui_thing_tilesB:
.byte uibox_tl
.byte repeatTile uibox_t, 18
.byte uibox_tr
.byte 0
ui_thing_tilesC:
.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte 0
ui_thing_tilesD:
.byte uibox_bl
.byte repeatTile uibox_b, 18
.byte uibox_br
.byte 0
ui_thing_tilesE:
.byte set_pos 13, 25
.byte "You can't now."
.byte 0
ui_thing_tilesF:
.byte set_pos 13, 25
.byte "You can't now."
.byte 0
ui_thing_tiles10:
.byte set_pos 13, 25
.byte attacker
.byte "cannot."
.byte 0
ui_thing_tiles11:
.byte set_pos 3, 19
.byte attacker
.byte 0


Battle_Palettes:
.byte $0F,$10,$30,$00
.byte $0F,$16,$30,$00
.byte $0F,$28,$30,$18
.byte $0F,$2B,$30,$1A
.byte $0F,$11,$30,$16
.byte $0F,$00,$16,$30
.byte $0F,$2A,$00,$00
.byte $0F,$00,$30,$0F

.byte $0F,$12,$30,$00
.byte $0F,$16,$30,$06
.byte $0F,$2A,$30,$1A
.byte $0F,$30,$30,$21
.byte $0F,$11,$30,$16
.byte $0F,$1A,$30,$0F
.byte $0F,$00,$30,$11
.byte $0F,$10,$30,$20

.byte $0F,$00,$10,$02
.byte $0F,$12,$30,$16
.byte $0F,$28,$30,$18
.byte $0F,$16,$30,$07
.byte $0F,$11,$30,$16
.byte $0F,$0F,$30,$07
.byte $0F,$0F,$30,$16
.byte $0F,$10,$30,$20

.byte $0F,$00,$10,$02
.byte $0F,$12,$30,$16
.byte $0F,$34,$30,$16
.byte $0F,$18,$30,$16
.byte $0F,$11,$30,$16
.byte $0F,$10,$12,$0F
.byte $0F,$10,$16,$0F
.byte $0F,$10,$30,$20

.byte $0F,$10,$30,$00
.byte $0F,$24,$30,$13
.byte $0F,$3B,$1A,$15
.byte $0F,$0F,$30,$12
.byte $0F,$11,$30,$16
.byte $0F,$18,$30,$06
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$1A,$30,$2A
.byte $0F,$38,$30,$18
.byte $0F,$28,$30,$18
.byte $0F,$0F,$30,$12
.byte $0F,$11,$30,$16
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$18,$30,$06
.byte $0F,$21,$30,$11
.byte $0F,$10,$37,$00
.byte $0F,$16,$30,$38
.byte $0F,$11,$30,$16
.byte $0F,$11,$30,$0F
.byte $0F,$17,$2A,$0F
.byte $0F,$28,$30,$0F

.byte $0F,$16,$30,$28
.byte $0F,$12,$30,$2A
.byte $0F,$18,$38,$06
.byte $0F,$04,$30,$14
.byte $0F,$11,$30,$16
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$10,$30,$00
.byte $0F,$28,$35,$16
.byte $0F,$34,$30,$16
.byte $0F,$1C,$30,$16
.byte $0F,$11,$30,$16
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$27,$30,$18
.byte $0F,$29,$30,$1A
.byte $0F,$21,$30,$12
.byte $0F,$02,$30,$00
.byte $0F,$11,$30,$16
.byte $0F,$16,$34,$07
.byte $0F,$21,$30,$12
.byte $0F,$10,$30,$20

.byte $0F,$2B,$30,$1A
.byte $0F,$18,$30,$17
.byte $0F,$18,$35,$12
.byte $0F,$18,$30,$08
.byte $0F,$11,$30,$16
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$12,$35,$16
.byte $0F,$28,$30,$16
.byte $0F,$03,$39,$16
.byte $0F,$03,$30,$16
.byte $0F,$11,$30,$16
.byte $0F,$13,$30,$0F
.byte $0F,$1A,$30,$0F
.byte $0F,$1A,$30,$0F

.byte $0F,$25,$30,$05
.byte $0F,$18,$36,$16
.byte $0F,$06,$30,$00
.byte $0F,$28,$30,$17
.byte $0F,$11,$30,$16
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$18,$30,$07
.byte $0F,$30,$36,$00
.byte $0F,$00,$30,$08
.byte $0F,$28,$30,$12
.byte $0F,$11,$30,$16
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20
.byte $0F,$10,$30,$20

.byte $0F,$24,$35,$16
.byte $0F,$00,$30,$07
.byte $0F,$30,$36,$00
.byte $0F,$17,$30,$07
.byte $0F,$11,$30,$16
.byte $0F,$10,$12,$0F
.byte $0F,$17,$0F,$07
.byte $0F,$10,$30,$20

.byte $0F,$0C,$38,$0A
.byte $0F,$30,$37,$16
.byte $0F,$2B,$30,$16
.byte $0F,$34,$30,$16
.byte $0F,$11,$30,$16
.byte $0F,$16,$30,$0F
.byte $0F,$1A,$30,$0F
.byte $0F,$13,$30,$30

;battle text list
;text indexed from battle actions
;disptext(0)
Battle_Text:
.word UMSG::B_NULL
.word UMSG::GIEGUE_CHECK_REAL
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
.word UMSG::CHECK_R7038
.word UMSG::CHECK_R7038XX
.word UMSG::CHECK_R7037
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

command_box_top:
.byte set_pos 1, 1
.byte uibox_tl,uibox_tc,"Command"
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex
;command box middle
.byte uibox_l," Talk  Check",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex
.byte uibox_l," Goods State",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 4 ;irqValue, irqIndex
.byte uibox_l," PSI   Setup",uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 6 ;irqValue, irqIndex
;command box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte newLine

cash_box_top:
.byte set_pos 21, 1
.byte uibox_tl,uibox_t,uibox_t,uibox_tc,"Cash",uibox_t,uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex
;cash box middle
.byte uibox_l,"$"
.byte print_number $7410, 2, 5
.byte c00," ",uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex
;cash box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte newLine
window_unk:
.byte goto $6700

;stat bar top
battle_statbar_top:
.byte uibox_tl,uibox_tc
.byte "Name"
.byte uibox_t,uibox_t,uibox_tc
.byte "Lvl"
.byte uibox_t,uibox_tc
.byte "HP"
.byte uibox_t,uibox_tc
.byte "PP"
.byte uibox_t,uibox_t,uibox_t,uibox_t,uibox_tc
.byte "Exp"
.byte uibox_t,uibox_tr
.byte stopText


window_unk_2:
.byte set_pos 7, 17
.byte uibox_tl
.byte repeatTile uibox_t, 22
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 16 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 18 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 20 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 22 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 24 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 22
.byte uibox_br
.byte stopText

window_unk_3:
.byte set_pos 5, 3
.byte uibox_tl,uibox_t," ",arrow
.byte repeatTile uibox_t, 21
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 4 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 6 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 8 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 10 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 24
.byte uibox_br
.byte stopText


window_unk_4:
.byte set_pos 1, 1
.byte uibox_tl
.byte repeatTile uibox_t, 20
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 4 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 6 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 8 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 20
.byte uibox_br
.byte stopText


window_unk_5:
.byte uibox_tl
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 14 ;irqValue, irqIndex

.byte uibox_l,"Who?",uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 16 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 4
.byte uibox_br
.byte stopText


item_action_menu:
.byte set_pos 23, 5
.byte uibox_tl
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1),4 ;irqValue, irqIndex

.byte uibox_l," Use  ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1),6 ;irqValue, irqIndex

.byte uibox_l," Eat  ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1),8 ;irqValue, irqIndex

.byte uibox_l," Give ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1),10 ;irqValue, irqIndex

.byte uibox_l," Drop ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1),12 ;irqValue, irqIndex

.byte uibox_l," Look ",uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 14 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 6
.byte uibox_br
.byte stopText

cash_box_menu:
.byte set_pos 5, 3
.byte uibox_tl
.byte repeatTile uibox_t, 24
.byte uibox_tr
.byte goto $92A6

cash_box_top_2:
.byte set_pos 21, 1
.byte uibox_tl,uibox_t,uibox_t,uibox_tc
.byte "Cash"
.byte uibox_t,uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex

.byte uibox_l,"$"
.byte print_number $7410, 2, 5
.byte c00," "
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte stopText

cash_box_middle:
.byte set_pos 9, 1
.byte uibox_tl
.byte repeatTile uibox_t, 8
.byte uibox_tr
.byte stopText
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 8
.byte uibox_r
.byte newLine


state_menu:
.byte set_pos 1, 3
.byte uibox_tl,uibox_tc,"State",uibox_t,uibox_l
.byte repeatTile " ", 8
.byte uibox_r," ",arrow,"PSI"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte stopText
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 7
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte repeatTile " ", 11
.byte uibox_r
.byte newLine

.byte set_pos 1, 5
.byte uibox_l," Lvl"
.byte print_number $0610, 1, 3
.byte repeatTile " ", 7
.byte uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 4 ;irqValue, irqIndex

.byte uibox_l," HP"
.byte print_number $0614, 2, 6
.byte "/"
.byte print_number $0603, 2, 3
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 6 ;irqValue, irqIndex

.byte uibox_l," PP"
.byte print_number $0616, 2, 6
.byte "/"
.byte print_number $0605, 2, 3
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 8 ;irqValue, irqIndex

.byte uibox_l," Offense"
.byte print_number $0607, 2, 5
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 10 ;irqValue, irqIndex

.byte uibox_l_r,"  "
.byte repeatTile " ", 11
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte newLine

.byte set_pos 1, 13
.byte uibox_l," Defense"
.byte print_number $0609, 2, 5
.byte " ",uibox_r

.byte uibox_tl,uibox_tc,"Equip"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1),12 ;irqValue, irqIndex

.byte uibox_l," Fight "
.byte print_number $060B, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0680, 0, 11
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 14 ;irqValue, irqIndex

.byte uibox_l," Speed "
.byte print_number $060C, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0690, 0, 11
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 16 ;irqValue, irqIndex

.byte uibox_l," Wisdom"
.byte print_number $060D, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06A0, 0, 11
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 18 ;irqValue, irqIndex

.byte uibox_l," Strength"
.byte print_number $060E, 1, 4
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06B0, 0, 11
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 20 ;irqValue, irqIndex


.byte uibox_l_r," "
.byte repeatTile " ", 12
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 1

.byte set_pos 1, 23
.byte uibox_l," Force "
.byte print_number $060F, 1, 6
.byte " ",uibox_r

.byte uibox_tl,uibox_tc,"Melody"
.byte repeatTile uibox_t, 5
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 22 ;irqValue, irqIndex

.byte uibox_l," Exp "
.byte print_number $0611, 3, 8
.byte " ",uibox_r

.byte uibox_l,"  "
.byte print_number $06F0, 0, 10
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 24 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte stopText


setup_menu:
.byte set_pos 1, 1
.byte uibox_tl,uibox_tc,"Setup"
.byte repeatTile uibox_t, 22
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex

.byte uibox_l," To change button function: ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 2 ;irqValue, irqIndex

.byte uibox_l,"  Move Cursor with CROSS,   ",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 4 ;irqValue, irqIndex

.byte uibox_l,"   press A button to change.",uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 6 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 28
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 8 ;irqValue, irqIndex

.byte uibox_l," B button assignment"
.byte repeatTile " ", 8
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 10 ;irqValue, irqIndex

.byte uibox_l,"   ",radial_empty,"State  ",radial_empty,"Map    ",radial_empty,"Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1),12 ;irqValue, irqIndex

.byte uibox_l," START button assignment"
.byte repeatTile " ", 4
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 14 ;irqValue, irqIndex

.byte uibox_l,"   ",radial_empty,"State  ",radial_empty,"Map    ",radial_empty,"Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 16 ;irqValue, irqIndex


.byte uibox_l," SELECT button assignment"
.byte repeatTile " ", 3
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 18 ;irqValue, irqIndex

.byte uibox_l,"   ",radial_empty,"State  ",radial_empty,"Map    ",radial_empty,"Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 20 ;irqValue, irqIndex

.byte uibox_l," Fight message speed"
.byte repeatTile " ", 8
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 22 ;irqValue, irqIndex

.byte uibox_l,"   ",radial_empty,"1  ",radial_empty,"2  ",radial_empty,"3  ",radial_empty,"4  ",radial_empty,"5"
.byte repeatTile " ", 7
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 24

.byte uibox_bl
.byte repeatTile uibox_b, 28
.byte uibox_br
.byte stopText

.res $BF, 0
.byte $48,$59
.res 4, 0
.res 4, 2
.res $a4, 0

.include "../../global/items.asm"
.include "../../global/choicers.asm"
.include "../../global/character_rates.asm"
.include "../../global/psi_data.asm"
