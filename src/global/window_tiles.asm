.ifdef VER_JP

command_box_top:
.byte set_pos 1, 1
.byte uibox_tl,uibox_t
kanafix "コマン"
.byte jp_do ;ド
.byte uibox_t,uibox_tr
.byte newLine
.byte .LOBYTE(B30_022C-1), 0 ;irqValue, irqIndex
;command box middle
.byte uibox_l
kanafix " はなす  "
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_022C-1), 2 ;irqValue, irqIndex
.byte uibox_l
kanafix " チェック "
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_022C-1), 4 ;irqValue, irqIndex
.byte uibox_l
.byte " PSI  "
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_022C-1), 6 ;irqValue, irqIndex
.byte uibox_l
kanafix " グッズ  "
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_022C-1), 8 ;irqValue, irqIndex
;command box bottom
.byte uibox_bl
.byte uibox_b,uibox_b,uibox_b,uibox_b,uibox_b,uibox_b
.byte uibox_br
.byte newLine

cash_box_top:
.byte set_pos 19, 1
.byte uibox_tl
.byte repeatTile uibox_t, 10
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_022C-1), 0 ;irqValue, irqIndex
;cash box middle
.byte uibox_l,"  $"
.byte print_number $7410, 2, 5
.byte c00," ",uibox_r
.byte stopText
.byte .LOBYTE(B30_024F-1), 2 ;irqValue, irqIndex
;cash box bottom
.byte uibox_bl
.byte repeatTile uibox_b, 10
.byte uibox_br
.byte newLine

window_unk:
.byte goto party_menu_buffer_goto_1

;stat bar top
battle_statbar_top:
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
.byte stopText

window_message:
.byte set_pos 9, 17
.byte uibox_tl
.byte repeatTile uibox_t, 20
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 16 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C294-1), 18 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C294-1), 20 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C294-1), 22 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 20
.byte uibox_r
.byte stopText
.byte .LOBYTE(L3C294-1), 24 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 20
.byte uibox_br
.byte stopText

; box with 8 entries used for overworld PSI, Inventory
window_8entries:
.byte set_pos 5, 3
.byte uibox_tl
.byte repeatTile uibox_t, 15
.byte " ",arrow
.byte repeatTile uibox_t, 7
.byte uibox_tr
window_8entries_goto:
.byte newLine
.byte .LOBYTE(L3C2C2-1), 2 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 4 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 6 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 8 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 24
.byte uibox_r
.byte stopText
.byte .LOBYTE(L3C28E-1), 10 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 24
.byte uibox_br
.byte stopText

; used when looking at shop's items
; hard coded 4 entries per shop (the entry can be empty)
window_shopitems:
.byte set_pos 1, 1
.byte uibox_tl
.byte repeatTile uibox_t, 18
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 0 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 2 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C29A-1), 4 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte newLine
.byte .LOBYTE(L3C29A-1), 6 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 18
.byte uibox_r
.byte stopText
.byte .LOBYTE(L3C29A-1), 8 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 18
.byte uibox_br
.byte stopText

; little "Who?" box that appears when asking player to select a party member
window_who:
.byte uibox_tl
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 14 ;irqValue, irqIndex

.byte uibox_l
kanafix " だれ "
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 16 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 4
.byte uibox_br
.byte stopText

; Window that appears when selecting an item (Use, Eat, Give, etc...)
window_itemactions:
.byte set_pos 25, 5
.byte uibox_tl
.byte repeatTile uibox_t, 4
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_0226-1), 4 ;irqValue, irqIndex

.byte uibox_l
kanafix " つかう" ; Use
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 6 ;irqValue, irqIndex

.byte uibox_l
kanafix " たべる" ; Eat
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 8 ;irqValue, irqIndex

.byte uibox_l
kanafix " わたす" ; Give
.byte uibox_r
.byte newLine
.byte .LOBYTE(B30_0226-1), 10 ;irqValue, irqIndex

.byte uibox_l
kanafix " すてる" ; Drop
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_0226-1), 12 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 4
.byte uibox_br
.byte stopText

cash_box_menu:
.byte set_pos 5, 3
.byte uibox_tl
.byte repeatTile uibox_t, 24
.byte uibox_tr
.byte goto window_8entries_goto

cash_box_top_2:
.byte set_pos 19, 1
.byte uibox_tl
.byte repeatTile uibox_t, 10
.byte uibox_tr
.byte newLine
.byte .LOBYTE(B30_022C-1), 0 ;irqValue, irqIndex

.byte uibox_l,"  $"
.byte print_number $7410, 2, 5
.byte c00," "
.byte uibox_r
.byte stopText
.byte .LOBYTE(B30_024F-1), 2 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 10
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
.byte uibox_tl,uibox_t
.byte "STATE"
.byte uibox_t,uibox_l
.byte repeatTile " ", 8
.byte uibox_r," ",arrow,"PSI"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte stopText
.byte .LOBYTE(L3C2C2-1), 2 ;irqValue, irqIndex

.byte uibox_l
.byte repeatTile " ", 7
.byte uibox_bl
.byte repeatTile uibox_b, 8
.byte uibox_br
.byte repeatTile " ", 11
.byte uibox_r
.byte newLine

.byte set_pos 1, 5
.byte uibox_l," LV"
.byte print_number $0610, 1, 3
.byte repeatTile " ", 8
.byte uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 4 ;irqValue, irqIndex

.byte uibox_l," HP"
.byte print_number $0614, 2, 6
.byte "/"
.byte print_number $0603, 2, 3
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 6 ;irqValue, irqIndex

.byte uibox_l," PP"
.byte print_number $0616, 2, 6
.byte "/"
.byte print_number $0605, 2, 3
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 8 ;irqValue, irqIndex

.byte uibox_l
kanafix " オフェンス "
.byte print_number $0607, 2, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte repeatTile " ", 10
.byte " ",uibox_r
.byte stopText
.byte .LOBYTE(L3C2C2-1), 10 ;irqValue, irqIndex

.byte uibox_l_r," ",$FE
.byte repeatTile " ", 11
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte newLine

.byte set_pos 1, 13
.byte uibox_l
kanafix " ティフェンス"
.byte print_number $0609, 2, 6
.byte " ",uibox_r

.byte uibox_tl,uibox_t,"EQUIP"
.byte repeatTile uibox_t, 6
.byte uibox_tr
.byte newLine
.byte .LOBYTE(L3C2C2-1), 12 ;irqValue, irqIndex

.byte uibox_l
kanafix " ファイト  "
.byte print_number $060B, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0680, 0, 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 14 ;irqValue, irqIndex

.byte uibox_l
kanafix " スピ-ド  "
.byte print_number $060C, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $0690, 0, 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 16 ;irqValue, irqIndex

.byte uibox_l
kanafix " かしこさ  "
.byte print_number $060D, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06A0, 0, 10
.byte " ",uibox_r
.byte newLine
.byte .LOBYTE(L3C2C2-1), 18 ;irqValue, irqIndex

.byte uibox_l
kanafix " たいりょく "
.byte print_number $060E, 1, 6
.byte " ",uibox_r

.byte uibox_l," "
.byte print_number $06B0, 0, 10
.byte " ",uibox_r
.byte stopText
.byte .LOBYTE(L3C2C2-1), 20 ;irqValue, irqIndex

.byte uibox_l_r," "
.byte repeatTile " ", 12
.byte " ",uibox_r_r

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte newLine

.byte set_pos 1, 23
.byte uibox_l
kanafix " フォ-ス  "
.byte print_number $060F, 1, 6
.byte " ",uibox_r

.byte uibox_tl,uibox_t,"MELODY"
.byte repeatTile uibox_t, 5
.byte uibox_tr
.byte newLine
.byte .LOBYTE(L3C2C2-1), 22 ;irqValue, irqIndex

.byte uibox_l," EX  "
.byte print_number $0611, 3, 8
.byte " ",uibox_r

.byte uibox_l,"  "
.byte print_number $06F0, 0, 10
.byte uibox_r
.byte stopText
.byte .LOBYTE(L3C2C2-1), 24 ;irqValue, irqIndex

.byte uibox_bl
.byte repeatTile uibox_b, 14
.byte uibox_br

.byte uibox_bl
.byte repeatTile uibox_b, 12
.byte uibox_br
.byte stopText

.else

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
.byte goto party_menu_buffer_goto_1

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


window_message:
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

; box with 8 entries used for overworld PSI, Inventory
window_8entries:
.byte set_pos 5, 3
.byte uibox_tl,uibox_t," ",arrow
.byte repeatTile uibox_t, 21
.byte uibox_tr
window_8entries_goto:
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

; used when looking at shop's items
; hard coded 4 entries per shop (the entry can be empty)
window_shopitems:
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

; little "Who?" box that appears when asking player to select a party member
window_who:
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

; Window that appears when selecting an item (Use, Eat, Give, etc...)
window_itemactions:
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
.byte goto window_8entries_goto

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

.endif