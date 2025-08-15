.segment        "PRG0": absolute

.byte   0

binclude "../global/enemy_names.asm"

.res $1B, 0
.byte $29,$29,$29,$29
.res $3C, 0

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
.ifdef VER_JP
.byte $01,17,17,$FE
.else
.byte $01,15,17,$FE
.endif
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
.ifdef VER_JP
.byte $01,$16,$11,$FE
.else
.byte $01,7,17,$FE
.endif
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
.ifdef VER_JP
.byte $01,19,$FF,$FD
.else
.byte $01,17,$FF,$FD
.endif
.byte $01
.addr $8523
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
.byte 0

ui_battlelog_top:
.byte repeatTile " ", 5
.byte uibox_tl
.byte repeatTile uibox_t, 20
.byte uibox_tr
.byte repeatTile " ", 5
.byte 0
ui_battlelog_middle:
.byte repeatTile " ", 5
.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte repeatTile " ", 5
.byte 0
ui_battlelog_bottom:
.byte repeatTile " ", 5
.byte uibox_bl
.byte repeatTile uibox_b, 20
.byte uibox_br
.byte repeatTile " ", 5
.byte 0

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
.byte uibox_l
kanafix " たたかう"
.byte repeatTile " ", 5
kanafix "オ-ト"
.byte repeatTile " ", 5
.byte uibox_r
.byte 0
ui_actionbox_line2:
.byte uibox_l," PSI"
.byte repeatTile " ", 6
kanafix "ガ-ド"
.byte repeatTile " ", 5
.byte uibox_r
.byte 0
ui_actionbox_line3:
.byte uibox_l
kanafix " グッズ"
.byte repeatTile " ", 6
kanafix "にげる"
.byte repeatTile " ", 5
.byte uibox_r
.byte 0
ui_actionbox_line4:
.byte uibox_l
kanafix " チェック"
.byte repeatTile " ", 13
.byte uibox_r
.byte 0
ui_actionbox_bottom:
.byte uibox_bl
.byte repeatTile uibox_b, 18
.byte uibox_br
.byte 0
ui_actionbox_line4_melodies:
.byte uibox_l
kanafix " チェック"
.byte repeatTile " ", 5
kanafix "うたう"
.byte repeatTile " ", 5
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
.byte repeatTile uibox_t, 12
.byte uibox_tr
.byte 0
ui_thing_tiles2:
.byte uibox_l
.byte repeatTile " ", 12
.byte uibox_r
.byte 0
ui_thing_tiles3:
.byte uibox_bl
.byte repeatTile uibox_b, 12
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
.byte repeatTile " ", 18
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
kanafix "せんとうちゅうは つかえない"
.byte 0
ui_thing_tilesF:
.byte set_pos 13, 25
kanafix "せんとうちゅうは そうびできない"
.byte 0
ui_thing_tiles10:
.byte set_pos 13, 25
.byte attacker
kanafix "は つかえない"
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


Battle_Text:
.addr $94C8
.addr $94C8
.addr $88D2
.addr $88DF
.addr $88EC
.addr $88F7
.addr $8F15
.addr $8C1E
.addr $8909
.addr $891A
.addr $892B
.addr $8F23
.addr $8F2E
.addr $8C28
.addr $8C38
.addr $8F43
.addr $8F51
.addr $8F5F
.addr $8F73
.addr $893D
.addr $8F84
.addr $894A
.addr $895C
.addr $8F91
.addr $8FA1
.addr $8FB9
.addr $8976
.addr $8FC6
.addr $8988
.addr $8997
.addr $8FD6
.addr $8FE5
.addr $8FF4
.addr $900C
.addr $9024
.addr $903D
.addr $8C9C
.addr $8CAB
.addr $9054
.addr $906B
.addr $89AB
.addr $9084
.addr $89BB
.addr $909B
.addr $89C8
.addr $89DA
.addr $89E9
.addr $90B2
.addr $89F7
.addr $8C5A
.addr $8A04
.addr $8A18
.addr $8A2D
.addr $90C9
.addr $90D7
.addr $90E5
.addr $90F1
.addr $9107
.addr $8A3E
.addr $911A
.addr $8A51
.addr $9126
.addr $913E
.addr $8A5E
.addr $9156
.addr $9169
.addr $9171
.addr $8A74
.addr $8A80
.addr $8A89
.addr $8A93
.addr $8AA0
.addr $917E
.addr $9193
.addr $8AB0
.addr $91A1
.addr $91B0
.addr $91C2
.addr $91D8
.addr $91E9
.addr $91FC
.addr $9205
.addr $921E
.addr $9243
.addr $9258
.addr $9262
.addr $8AC3
.addr $8AE1
.addr $8AF0
.addr $8B04
.addr $8B11
.addr $8B20
.addr $8B2D
.addr $9274
.addr $9287
.addr $9297
.addr $92A8
.addr $92BB
.addr $92C9
.addr $8B3C
.addr $8B4C
.addr $8B5D
.addr $8B74
.addr $8B85
.addr $8B98
.addr $92DC
.addr $8BA6
.addr $8C69
.addr $8C72
.addr $8C7C
.addr $8C87
.addr $8C91
.addr $92EF
.addr $9300
.addr $9310
.addr $9316
.addr $931D
.addr $93D1
.addr $8BB7
.addr $8BCA
.addr $93E3
.addr $9331
.addr $9341
.addr $9352
.addr $935E
.addr $936D
.addr $937D
.addr $938D
.addr $939E
.addr $8BDA
.addr $940D
.addr $94A2
.addr $941F
.addr $9433
.addr $9447
.addr $9459
.addr $946B
.addr $947D
.addr $9490
.addr $8BEF
.addr $94BD
.addr $93AD
.addr $8C00
.addr $8C0C
.addr $93C2
.addr $93F7
.addr $8C4D
.addr $94C8
.addr $94C8
.addr $94C8
.addr $8CBA
.addr $8CE1
.addr $8D04
.addr $8D3F
.addr $8D7E
.addr $8DAA
.addr $8DCD
.addr $8E05
.addr $8E34
.addr $8E44
.addr $8E51
.addr $8E60
.addr $8E6F
.addr $8E8C
.addr $8E96
.addr $8E9F
.addr $8EA7
.addr $8EAF
.addr $8EB8
.addr $8EC2
.addr $8EE0
.addr $8F03

.byte set_pos 8, 6
.byte repeatTile " ", 16
.byte set_pos 8, 7
.byte repeatTile " ", 16
.byte 0

.byte   attacker
kanafix "がおそいかかった!"
.byte   stopText

.byte   attacker
kanafix "の こうげき!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "せんしゃほうを うった!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
.byte   beingAttacked
kanafix "に かみついた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
.byte   beingAttacked
kanafix "を ひっかいた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
.byte   beingAttacked
kanafix "に のしかかった!"
.byte   stopText

.byte   attacker
kanafix "は ぼうそうした!"
.byte   stopText

.byte   attacker
kanafix "の"
.byte   newLine
kanafix "さいごの いちげき!!!"
.byte   stopText

.byte   attacker
kanafix "からの"
.byte   newLine
kanafix "こうげきのしょうたいが つかめない!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ねんえきを はきかけた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "しばられている‥‥"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ふしぎなさけびごえをあげた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ふてきに ほほえんだ"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "かっとなった!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "いしきを かきみだした!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "なかまを よんだ!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "たねを まいた!"
.byte   stopText

.byte   attacker
kanafix "は わらいだした!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "こわいことばを なげつけた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "きたないことばを なげつけた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "けはいを ころしている"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "わけがわからなくなっている"
.byte   stopText

.byte   attacker
kanafix "は ねむっている‥"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "エネルギ-を ちゅうにゅうした!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "にげだした!"
.byte   stopText

kanafix " ‥‥だめでした"
.byte   stopText

.byte   attacker
kanafix "は ころんだ"
.byte   stopText

.byte   attacker
kanafix "は うごけない‥‥"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "いしになっている‥‥"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "はいきガスを ふきかけた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ぜんそくの ほっさがでた"
.byte   newLine
kanafix " ‥‥ゴホ ゴホ ゴホ"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "おいのりをしている"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "あいさつをして とおりすぎた"
.byte   stopText

.byte   attacker
kanafix "は みがまえている"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "うたを うたった!"
.byte   stopText

.byte   attacker
kanafix "は ガ-ドしている"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "にじりよってきた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
.byte   attackResult
kanafix "を つかった!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
.byte   attackResult
kanafix "を こころみた!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
.byte   attackResult
kanafix "を"
.byte   newLine
kanafix "つかうことが できない!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "たちばを かんがえた‥"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "なにか あやしいことをした"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ぼ-っとしている"
.byte   stopText

.byte   attacker
kanafix "は "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix "チェックした"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "デ-モンシ-ドをつかった!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "まひガスをつかった!"
.byte   stopText

.byte   attacker
kanafix "は "
.byte   beingAttacked
kanafix "の"
.byte   newLine
.byte   attackResult
kanafix "を うばった!"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ロ-プから ぬけだした"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "めをさました"
.byte   stopText

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "くうかんを きりさいた!"
.byte   stopText

kanafix "れんぞくこうげき!"
.byte   stopText

;the "YOU WIN" text uses a different w. this makes my job a lot harder
.charmap $57, $79 ;W == $79
.byte   newLine
.byte "     YOU WIN!"
.byte   newLine
.byte   stopText
.charmap $57, $57 ;W == $57

.byte   newLine
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "たたかいに やぶれた"
.byte   newLine
.byte   stopText

.byte   newLine
kanafix "しょうぶが つかない"
.byte   newLine
.byte   stopText

kanafix "せんしゃは こわれてしまった"
.byte   stopText

kanafix "> ねつにつよい"
.byte   stopText

kanafix "> さむさにつよい"
.byte   stopText

kanafix "> かみなりにつよい"
.byte   stopText

kanafix "> ひかりにつよい"
.byte   stopText

kanafix "> スプレ-によわい"
.byte   stopText

kanafix "> オフェンス  "
.byte   damageAmount
.byte   stopText

kanafix "> ディフェンス "
.byte   defenseStat
.byte   stopText

kanafix "「"
.byte   nintenName
kanafix "!"
.byte   newLine
kanafix "あなたの いちぞくには ほんとうに"
.byte   newLine
.byte   pauseText
kanafix "おせわになっています」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「おさない わたしを そだててくれた"
.byte   newLine
kanafix "ジョ-ジのつま‥‥マリア」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「わたしたちのほしから たいせつな"
.byte   newLine
kanafix "じょうほうを ぬすみだして"
.byte   newLine
.byte   pauseText
kanafix "わたしたちに はむかおうとした‥‥"
.byte   newLine
kanafix "ジョ-ジ」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「そして そのふうふの しそん"
.byte   newLine
kanafix "また わたしたちの けいかくを"
.byte   newLine
.byte   pauseText
kanafix "じゃましようとしている‥‥"
.byte   newLine
.byte   nintenName
kanafix "! あなたのことだ」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「もう おかえりなさい みにくい"
.byte   newLine
kanafix "ちきゅうじんたちと ともに"
.byte   newLine
.byte   pauseText
kanafix "ほろびてください」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「その むしけらのような ちからでは"
.byte   newLine
kanafix "どうすることも できない」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「"
.byte   nintenName
kanafix "‥‥あなただけ"
.byte   newLine
kanafix "ひとりなら たすけてあげてもよい"
.byte   newLine
.byte   pauseText
kanafix "わたしと ともに マザ-シップに"
.byte   newLine
kanafix "のりなさい」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「‥‥ならば ともだちや みにくい"
.byte   newLine
kanafix "ちきゅうじんと いっしょに ここに"
.byte   newLine
.byte   pauseText
kanafix "ねむりなさい」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「うたうのを やめなさい」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「うたを‥‥やめろ」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「う うたを やめろ!」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「うたを やめるんだ!」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「ちきゅうの むしけらども!"
.byte   newLine
kanafix "だまれ! うたうな!」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「うたを‥‥」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「やめろ!」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「!!!」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「や‥‥」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「!!!!」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「‥‥‥‥‥」"
.byte   stopText

.byte   pauseText,waitThenOverwrite
kanafix "「ナゼ コノワタシガ コンナウタニ"
.byte   newLine
kanafix "ヤブレタノダ‥‥」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「ワタシハ カナラズ オマエタチヲ"
.byte   newLine
kanafix "‥‥‥‥マタ‥‥イツカ‥‥」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix "「"
.byte   nintenName
kanafix "! また あおう!」"
.byte   newLine
.byte   newLine
.byte   pauseText,waitThenOverwrite
.byte   beingAttacked2
.byte   newLine
kanafix " すばやく よけた"
.byte   stopText

kanafix " "
.byte SMAAAAASH
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " "
.byte   damageAmount
kanafix "の ダメ-ジをうけた"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix " やっつけた!"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " きずつきたおれた"
.byte   stopText

kanafix " しかし "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " すでにいなかった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "には"
.byte   newLine
kanafix " こうかがなかった"
.byte   stopText

kanafix " "
.byte   attacker
kanafix "は ちからつきた"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " バリアに つつまれた"
.byte   stopText

kanafix " 「おまえの おかあさんは"
.byte   newLine
kanafix " ないているぞ!」"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は いしになった"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " めがみえなくなった!"
.byte   stopText


kanafix " "
.byte   attacker
kanafix "は"
.byte   newLine
kanafix " ばくはつした!"
.byte   stopText

kanafix " "
.byte   attacker
kanafix "は"
.byte   newLine
kanafix " もえあがった!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " オフェンスが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " オフェンスが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ディフェンスが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " スピ-ドが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ファイトが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ディフェンスが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ファイトが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " スピ-ドが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

kanafix " なぜか "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " けいけんちが あがった"
.byte   stopText

kanafix " せっとくに せいこうした"
.byte   stopText

kanafix " せっとくに しっぱいした"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "を おこらせた"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " ききてきじょうたいに おちいった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " わけがわからなくなった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "を ねむらせた"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " PPが "
.byte   damageAmount
kanafix "かいふくした!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " HPが "
.byte   damageAmount
kanafix "かいふくした!"
.byte   stopText

kanafix " しかし だれもきてくれなかったのだ"
.byte   stopText

kanafix " し-ん‥‥‥"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "が くわわった!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の PPを"
.byte   newLine
kanafix " "
.byte   damageAmount
kanafix "うばった"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " うごけなくなった"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " どくに おかされた"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " すいぶんを すいとられた"
.byte   stopText

.byte   beingAttacked2
.byte   newLine
kanafix " ちょうのうりょくを ふうじられた"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix " ロ-プで しばった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " シ-ルドに つつまれた"
.byte   stopText

kanafix " からぶり-っ!"
.byte   stopText

kanafix " しかし ちょうのうりょくは"
.byte   newLine
kanafix " ふうじられていた"
.byte   stopText

kanafix " しかし "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " フランクリンバッヂが"
.byte   newLine
kanafix " こうせんを はねかえした!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " こうげきを はねかえした!"
.byte   stopText

kanafix " PPが たりない"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "には"
.byte   newLine
kanafix " こうかが なかった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " からだのどくが きえた"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " われに かえった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " かゆみに もだえた"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " うごきを とりもどした"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " めをさました"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix " カムバックさせた!!!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " シ-ルドを はかいした"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ぜんそくがなおった"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " やわらかくなった"
.byte   stopText

kanafix " 「すき」"
.byte   stopText

kanafix " 「きらい」"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " ぜんそくの ほっさがでた"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " われにかえった!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " おとなしくなった!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "を たおした!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " はかいされた!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " つちにかえった!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " もう うごかない"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " ポンコツになった!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " かきけされた!"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " こんらんから たちなおった"
.byte   stopText

kanafix " しかし こうかが なかった"
.byte   stopText

kanafix " "
.byte   attackResult
kanafix "は"
.byte   newLine
kanafix " こわれてしまった‥‥"
.byte   stopText

kanafix " "
.byte   attackResult
kanafix "は"
.byte   newLine
kanafix " ただの いしになった‥‥"
.byte   stopText

kanafix " "
.byte   attackResult
kanafix "は"
.byte   newLine
kanafix " からになった‥‥"
.byte   stopText

kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine

.byte   attacker
kanafix "は"
.byte   newLine
kanafix "レベルが あがった!"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " さいだいHPが "
.byte   lvHPPPinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " さいだいPPが "
.byte   lvHPPPinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " ファイトが "
.byte   lvFIGinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " スピ-ドが "
.byte   lvSPDinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " かしこさが "
.byte   lvWISinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " たいりょくが "
.byte   lvSTRinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
kanafix " フォ-スが "
.byte   lvFORinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite

.byte   attacker
kanafix "は たたかいのなかで"
.byte   newLine
kanafix "PSIを おぼえた!"
.byte   newLine
.byte   pauseText,waitThenOverwrite

.byte   item
kanafix "を ひろった!"
.byte   stopText

.byte 0

;why do these feel like addresses
incrementor = $2B
incrementor_2 = $4e
incrementor_3 = $25
incrementor_4 = $93
incrementor_5 = $C1
incrementor_6 = $8d
incrementor_7 = $99

command_box_top:
.byte set_pos 1, 1
.byte uibox_tl,uibox_t
kanafix "コマン"
.byte jp_do ;ド
.byte uibox_t,uibox_tr
.byte 1
.byte incrementor
.byte 0
;command box middle
.byte uibox_l
kanafix " はなす  "
.byte uibox_r
.byte 1
.byte incrementor
.byte 2
.byte uibox_l
kanafix " チェック "
.byte uibox_r
.byte 1
.byte incrementor
.byte 4
.byte uibox_l
.byte " PSI  "
.byte uibox_r
.byte 1
.byte incrementor
.byte 6
.byte uibox_l
kanafix " グッズ  "
.byte uibox_r
.byte 0
.byte incrementor
.byte 8
;command box bottom
.byte uibox_bl
.byte uibox_b,uibox_b,uibox_b,uibox_b,uibox_b,uibox_b
.byte uibox_br
.byte 1

cash_box_top:
.byte set_pos 19, 1
.byte uibox_tl
.byte repeatTile uibox_t, 10
.byte uibox_tr
.byte 1
.byte incrementor
.byte 0
;cash box middle
.byte uibox_l,"  $"
.byte print_number $7410, 2, 5
.byte c00," ",uibox_r
.byte 0
.byte incrementor_2
.byte 2
;cash box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 10
.byte uibox_br
.byte 1
window_unk:
.byte goto $6D00

;stat bar top
.byte uibox_tl,uibox_t
.byte "NAME"
.byte uibox_t,uibox_t,uibox_t,uibox_t
.byte "HP"
.byte uibox_t,uibox_t
.byte "PP"
.byte uibox_t,uibox_t
.byte "LV"
.byte uibox_t,uibox_t,uibox_t,uibox_t,uibox_t,uibox_t
.byte "EX"
.byte uibox_t,uibox_tr
.byte 0

window_unk_2:
.byte set_pos 9, 17
.byte uibox_tl
.byte repeatTile uibox_t, 20
.byte uibox_tr
.byte 1
.byte incrementor_3
.byte 16

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 1
.byte incrementor_4
.byte 18

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 1
.byte incrementor_4
.byte 20

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 1
.byte incrementor_4
.byte 22

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte 0
.byte incrementor_4
.byte 24

.byte uibox_bl
.byte repeatTile uibox_b, 20
.byte uibox_br
.byte 0



window_unk_3:
.byte set_pos 5, 3
.byte uibox_tl
.byte repeatTile uibox_t, 15
.byte " ",arrow
.byte repeatTile uibox_t, 7
.byte uibox_tr
.byte 1
.byte incrementor_5
.byte 2

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 1
.byte incrementor_5
.byte 4

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 1
.byte incrementor_5
.byte 6

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 1
.byte incrementor_5
.byte 8

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte 0
.byte incrementor_6
.byte 10

.byte uibox_bl
.byte repeatTile uibox_b, 24
.byte uibox_br
.byte 0


window_unk_4:
.byte set_pos 1, 1
.byte uibox_tl
.byte repeatTile uibox_t, 18
.byte uibox_tr
.byte 1
.byte incrementor_3
.byte 0

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte 1
.byte incrementor_5
.byte 2

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte 1
.byte incrementor_7
.byte 4

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte 1
.byte incrementor_7
.byte 6

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte 0
.byte incrementor_7
.byte 8

.byte uibox_bl
.byte repeatTile uibox_b, 18
.byte uibox_br
.byte 0


window_unk_5:
.byte uibox_tl
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte 1
.byte incrementor_3
.byte 14

.byte uibox_l
kanafix " だれ "
.byte uibox_r
.byte 0
.byte incrementor_3
.byte 16

.byte uibox_bl
.byte repeatTile uibox_b, 4
.byte uibox_br
.byte 0


item_action_menu:
.byte set_pos 25, 5
.byte uibox_tl
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte 1
.byte incrementor_3
.byte 4

.byte uibox_l
kanafix " つかう" ; Use
.byte uibox_r
.byte 1
.byte incrementor_3
.byte 6

.byte uibox_l
kanafix " たべる" ; Eat
.byte uibox_r
.byte 1
.byte incrementor_3
.byte 8

.byte uibox_l
kanafix " わたす" ; Give
.byte uibox_r
.byte 1
.byte incrementor_3
.byte 10

.byte uibox_l
kanafix " すてる" ; Drop
.byte uibox_r
.byte 0
.byte incrementor_3
.byte 12

.byte uibox_bl
.byte repeatTile uibox_b, 4
.byte uibox_br
.byte 0



cash_box_menu:
.byte set_pos 5, 3
.byte uibox_tl
.byte repeatTile uibox_t, 24
.byte uibox_tr
.byte goto $958C


cash_box_top_2:
.byte set_pos 19, 1
.byte uibox_tl
.byte repeatTile uibox_t, 10
.byte uibox_tr
.byte 1
.byte incrementor
.byte 0

.byte uibox_l,"  $"
.byte print_number $7410, 2, 5
.byte c00," "
.byte uibox_r
.byte 0
.byte incrementor_2
.byte 2

.byte uibox_bl
.byte repeatTile uibox_b, 10
.byte uibox_br
.byte 0


cash_box_middle:
.byte set_pos 9, 1
.byte uibox_tl
.byte repeatTile uibox_t, 8
.byte uibox_tr
.byte 0
.byte incrementor_3
.byte 0

.byte uibox_l
.byte repeatTile " ", 8
.byte uibox_r
.byte 1


state_menu:
.byte set_pos 1, 3
.byte uibox_tl,uibox_t
.byte "STATE"
.byte uibox_t,uibox_l
.byte repeatTile " ", 8
.byte uibox_r," ",arrow,"PSI"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte 0
.byte incrementor_5
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
.byte uibox_l," LV"
.byte print_number $0610, 1, 3
.byte repeatTile " ", 8
.byte uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte 1
.byte incrementor_5
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
.byte incrementor_5
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
.byte incrementor_5
.byte 8


.byte uibox_l
kanafix " オフェンス "
.byte print_number $0607, 2, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte 0
.byte incrementor_5
.byte 10

.byte uibox_l_r," ",$FE
.byte repeatTile " ", 11
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 1

.byte set_pos 1, 13
.byte uibox_l
kanafix " ティフェンス"
.byte print_number $0609, 2, 6
.byte " ",uibox_r

.byte uibox_tl,uibox_t,"EQUIP"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte 1
.byte incrementor_5
.byte 12

.byte uibox_l
kanafix " ファイト  "
.byte print_number $060B, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0680, 0, 10
.byte " ",uibox_r
.byte 1
.byte incrementor_5
.byte 14

.byte uibox_l
kanafix " スピ-ド  "
.byte print_number $060C, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0690, 0, 10
.byte " ",uibox_r
.byte 1
.byte incrementor_5
.byte 16

.byte uibox_l
kanafix " かしこさ  "
.byte print_number $060D, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06A0, 0, 10
.byte " ",uibox_r
.byte 1
.byte incrementor_5
.byte 18

.byte uibox_l
kanafix " たいりょく "
.byte print_number $060E, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06B0, 0, 10
.byte " ",uibox_r
.byte 0
.byte incrementor_5
.byte 20

.byte uibox_l_r," "
.byte repeatTile " ", 12
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 1

.byte set_pos 1, 23
.byte uibox_l
kanafix " フォ-ス  "
.byte print_number $060F, 1, 6
.byte " ",uibox_r

.byte uibox_tl,uibox_t,"MELODY"
.byte repeatTile uibox_t, 5
.byte uibox_tr
.byte 1
.byte incrementor_5
.byte 22

.byte uibox_l," EX  "
.byte print_number $0611, 3, 8
.byte " ",uibox_r

.byte uibox_l,"  "
.byte print_number $06F0, 0, 10
.byte uibox_r
.byte 0
.byte incrementor_5
.byte 24

.byte uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte 0


.res 19, 0

.include "../../global/items.asm"
.include "../../global/choicers.asm"
.include "../../global/character_rates.asm"
.include "../../global/psi_data.asm"
