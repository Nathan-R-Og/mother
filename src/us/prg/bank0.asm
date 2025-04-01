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
.byte 1, 0, 1, $FE
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
.byte $FF,0,9,$FD
.byte 4
.addr ui_nothing
.byte $FF
ui_partybox:
.byte 1,0,19,$FE
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
.byte $01,11,17,$FE
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
.byte $01,$0B,$11,$FE
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
.byte $FF,0,27,$FD
.byte 5
.addr ui_nothing
.byte $FF
ui_thing_7:
.byte $01,1,17,$FE
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
.byte $01,15,17,$FE
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
.byte $01,5,17,$FE
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
.byte $01,7,17,$FE
.byte 1
.addr ui_thing_tiles7
.byte $FF
ui_thing_11:
.byte $01,7,6,$FE
.byte 1
.addr ui_thing_tilesA
.byte $FF
ui_thing_12:
.byte $01,7,7,$FE
.byte 1
.addr ui_thing_tilesA
.byte $FF
ui_thing_13:
.byte $01,17,$FF,$FD
.byte 1
.addr ui_thing_tiles8
.byte $FF
ui_thing_14:
.byte $01,3,$FF,$FD
.byte 1
.addr ui_thing_tiles8
.byte $FF
ui_thing_15:
.byte $01,$FF,$FF,$FD
.byte 1
.addr ui_thing_tiles8
.byte $FF
ui_thing_16:
.byte $01,$FF,$FF,$FE
.byte 1
.addr ui_thing_tiles9
.byte $FF
ui_thing_17:
.byte $01,11,23,$FE
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
.byte $01,11,23,$FE
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
.byte $01,11,23,$FE
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
;why does $24 and $25 make the side tiles???? that doesnt make sense unless there's some override
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
.word $05E2
.word $05E3
.word $05E4
.word $05E5
.word $05E6
.word $05E7
.word $05E8
.word $05E9
.word $05EA
.word $05EB
.word $05EC
.word $05ED
.word $05EE
.word $05EF
.word $05F0
.word $05F1
.word $05F2
.word $05F3
.word $05F4
.word $05F5
.word $05F6
.word $05F7
.word $05F8
.word $05F9
.word $05FA
.word $05FB
.word $05FC
.word $05FD
.word $05FE
.word $05FF
.word $0600
.word $0601
.word $0602
.word $0603
.word $0604
.word $0605
.word $0606
.word $0607
.word $0608
.word $0609
.word $060A
.word $060B
.word $060C
.word $060D
.word $060E
.word $060F
.word $0610
.word $0611
.word $0612
.word $0613
.word $0614
.word $0615
.word $0616
.word $0617
.word $0618
.word $0619
.word $061A
.word $061B
.word $061C
.word $061D
.word $061E
.word $061F
.word $0620
.word $0621
.word $0622
.word $0623
.word $0624
.word $0625
.word $0626
.word $0627
.word $0628
.word $0629
.word $062A
.word $062B
.word $062C
.word $062D
.word $062E
.word $062F
.word $0630
.word $0631
.word $0632
.word $0633
.word $0634
.word $0635
.word $0636
;guard
.word $0637
.word $0638
.word $0639
.word $063A
.word $063B
.word $063C
.word $063D
.word $063E
.word $063F
.word $0640
.word $0641
.word $0642
.word $0643
.word $0644
.word $0645
.word $0646
.word $0647
.word $0648
.word $0649
.word $064A
.word $064B
.word $064C
.word $064D
.word $064E
.word $064F
.word $0650
.word $0651
.word $0652
.word $0653
.word $0654
.word $0655
.word $0656
.word $0657
.word $0658
.word $0659
.word $065A
.word $065B
.word $065C
.word $065D
.word $065E
.word $065F
.word $0660
.word $0661
.word $0662
.word $0663
.word $0664
.word $0665
.word $0666
.word $0667
.word $0668
.word $0669
.word $066A
.word $066B
.word $066C
.word $066D
.word $066E
.word $0517
.word $058C
.word $058A
.word $0672
.word $0673
.word $0674
.word $0675
.word $0676
.word $0677
.word $0678
.word $0679
.word $067A
.word $067B
.word $067C
.word $067D
.word $067E
.word $067F
.word $0680
.word $0681
.word $0682
.word $0683
.word $0684
.word $0685
.word $0686
.word $0687

incrementor = $25

command_box_top:
.byte set_pos 1, 1
.byte uibox_tl,uibox_tc,"Command"
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte 1
.byte incrementor
.byte 0
;command box middle
.byte uibox_l," Talk  Check",uibox_r
.byte 1
.byte incrementor
.byte 2
.byte uibox_l," Goods State",uibox_r
.byte 1
.byte incrementor
.byte 4
.byte uibox_l," PSI   Setup",uibox_r
.byte 0
.byte incrementor
.byte 6
;command box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 1

cash_box_top:
.byte set_pos 21, 1
.byte uibox_tl,uibox_t,uibox_t,uibox_tc,"Cash",uibox_t,uibox_tr
.byte 1
.byte incrementor
.byte 0
;cash box middle
.byte uibox_l,"$"
.byte print_number $7410, 2, 5
.byte c00," ",uibox_r
.byte 0
.byte incrementor
.byte 2
;cash box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte 1
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
.byte 0



window_unk_2:
.byte set_pos 7, 17
.byte uibox_tl
.byte repeatTile uibox_t, 22
.byte uibox_tr
.byte 1
.byte incrementor
.byte 16

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte 1
.byte incrementor
.byte 18

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte 1
.byte incrementor
.byte 20

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte 1
.byte incrementor
.byte 22

.byte uibox_l
.byte repeatTile " ", 22
.byte uibox_r
.byte 0
.byte incrementor
.byte 24

.byte uibox_bl
.byte repeatTile uibox_b, 22
.byte uibox_br
.byte 0



window_unk_3:
.byte set_pos 5, 3
.byte uibox_tl,uibox_t," ",arrow
.byte repeatTile uibox_t, 21
.byte uibox_tr
.byte 1
.byte incrementor
.byte 2

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 1
.byte incrementor
.byte 4

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 1
.byte incrementor
.byte 6

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 1
.byte incrementor
.byte 8

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 0
.byte incrementor
.byte 10

.byte uibox_bl
.byte repeatTile uibox_b, 24
.byte uibox_br
.byte 0


window_unk_4:
.byte set_pos 1, 1
.byte uibox_tl
.byte repeatTile uibox_t, 20
.byte uibox_tr
.byte 1
.byte incrementor
.byte 0

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 1
.byte incrementor
.byte 2

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 1
.byte incrementor
.byte 4

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 1
.byte incrementor
.byte 6

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 0
.byte incrementor
.byte 8

.byte uibox_bl
.byte repeatTile uibox_b, 20
.byte uibox_br
.byte 0


window_unk_5:
.byte uibox_tl
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte 1
.byte incrementor
.byte 14

.byte uibox_l,"Who?",uibox_r
.byte 0
.byte incrementor
.byte 16

.byte uibox_bl
.byte repeatTile uibox_b, 4
.byte uibox_br
.byte 0


item_action_menu:
.byte set_pos 23, 5
.byte uibox_tl
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte 1
.byte incrementor
.byte 4

.byte uibox_l," Use  ",uibox_r
.byte 1
.byte incrementor
.byte 6

.byte uibox_l," Eat  ",uibox_r
.byte 1
.byte incrementor
.byte 8

.byte uibox_l," Give ",uibox_r
.byte 1
.byte incrementor
.byte 10

.byte uibox_l," Drop ",uibox_r
.byte 1
.byte incrementor
.byte 12

.byte uibox_l," Look ",uibox_r
.byte 0
.byte incrementor
.byte 14

.byte uibox_bl
.byte repeatTile uibox_b, 6
.byte uibox_br
.byte 0



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
.byte 1
.byte incrementor
.byte 0


.byte uibox_l,"$"
.byte print_number $7410, 2, 5
.byte c00," "
.byte uibox_r
.byte 0
.byte incrementor
.byte 2

.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte 0

cash_box_middle:
.byte set_pos 9, 1
.byte uibox_tl
.byte repeatTile uibox_t, 8
.byte uibox_tr
.byte 0
.byte incrementor
.byte 0

.byte uibox_l
.byte repeatTile " ", 8
.byte uibox_r
.byte 1


state_menu:
.byte set_pos 1, 3
.byte uibox_tl,uibox_tc,"State",uibox_t,uibox_l
.byte repeatTile " ", 8
.byte uibox_r," ",arrow,"PSI"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte 0
.byte incrementor
.byte 2

.byte uibox_l
.byte repeatTile " ", 7
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte repeatTile " ", 11
.byte uibox_r
.byte 1

.byte set_pos 1, 5
.byte uibox_l," Lvl"
.byte print_number $0610, 1, 3
.byte repeatTile " ", 7
.byte uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte 1
.byte incrementor
.byte 4

.byte uibox_l," HP"
.byte print_number $0614, 2, 6
.byte "/"
.byte print_number $0603, 2, 3
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte 1
.byte incrementor
.byte 6

.byte uibox_l," PP"
.byte print_number $0616, 2, 6
.byte "/"
.byte print_number $0605, 2, 3
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte 1
.byte incrementor
.byte 8

.byte uibox_l," Offense"
.byte print_number $0607, 2, 5
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte 0
.byte incrementor
.byte 10

.byte uibox_l_r,"  "
.byte repeatTile " ", 11
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 1

.byte set_pos 1, 13
.byte uibox_l," Defense"
.byte print_number $0609, 2, 5
.byte " ",uibox_r

.byte uibox_tl,uibox_tc,"Equip"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte 1
.byte incrementor
.byte 12

.byte uibox_l," Fight "
.byte print_number $060B, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0680, 0, 11
.byte uibox_r
.byte 1
.byte incrementor
.byte 14

.byte uibox_l," Speed "
.byte print_number $060C, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0690, 0, 11
.byte uibox_r
.byte 1
.byte incrementor
.byte 16

.byte uibox_l," Wisdom"
.byte print_number $060D, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06A0, 0, 11
.byte uibox_r
.byte 1
.byte incrementor
.byte 18

.byte uibox_l," Strength"
.byte print_number $060E, 1, 4
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06B0, 0, 11
.byte uibox_r
.byte 0
.byte incrementor
.byte 20


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
.byte 1
.byte incrementor
.byte 22

.byte uibox_l," Exp "
.byte print_number $0611, 3, 8
.byte " ",uibox_r

.byte uibox_l,"  "
.byte print_number $06F0, 0, 10
.byte uibox_r
.byte 0
.byte incrementor
.byte 24

.byte uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 0


setup_menu:
.byte set_pos 1, 1
.byte uibox_tl,uibox_tc,"Setup"
.byte repeatTile uibox_t, 22
.byte uibox_tr
.byte 1
.byte incrementor
.byte 0

.byte uibox_l," To change button function: ",uibox_r
.byte 1
.byte incrementor
.byte 2

.byte uibox_l,"  Move Cursor with CROSS,   ",uibox_r
.byte 1
.byte uibox_r
.byte 4

.byte uibox_l,"   press A button to change.",uibox_r
.byte 1
.byte incrementor
.byte 6

.byte uibox_l
.byte repeatTile $A0,$1C
.byte uibox_r
.byte 1
.byte incrementor
.byte 8

.byte uibox_l," B button assignment"
.byte repeatTile " ", 8
.byte uibox_r
.byte 1
.byte incrementor
.byte 10

.byte uibox_l,"   ",radial_empty,"State  ",radial_empty,"Map    ",radial_empty,"Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte 1
.byte incrementor
.byte 12


.byte uibox_l," START button assignment"
.byte repeatTile " ", 4
.byte uibox_r
.byte 1
.byte incrementor
.byte 14

.byte uibox_l,"   ",radial_empty,"State  ",radial_empty,"Map    ",radial_empty,"Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte 1
.byte incrementor
.byte 16


.byte uibox_l," SELECT button assignment"
.byte repeatTile " ", 3
.byte uibox_r
.byte 1
.byte incrementor
.byte 18

.byte uibox_l,"   ",radial_empty,"State  ",radial_empty,"Map    ",radial_empty,"Run"
.byte repeatTile " ", 5
.byte uibox_r
.byte 1
.byte incrementor
.byte 20


.byte uibox_l," Fight message speed"
.byte repeatTile " ", 8
.byte uibox_r
.byte 1
.byte incrementor
.byte 22

.byte uibox_l,"   ",radial_empty,"1  ",radial_empty,"2  ",radial_empty,"3  ",radial_empty,"4  ",radial_empty,"5"
.byte repeatTile " ", 7
.byte uibox_r
.byte 0
.byte incrementor
.byte 24

.byte uibox_bl
.byte repeatTile uibox_b, 28
.byte uibox_br
.byte 0

.res $BF, 0
.byte $48,$59
.res 4, 0
.res 4, 2
.res $a4, 0

.include "../../global/items.asm"
.include "../../global/choicers.asm"
.include "../../global/character_rates.asm"
.include "../../global/psi_data.asm"
