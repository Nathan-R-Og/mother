;intial sram
;jp has minor diffs

.include "../fontmap.asm"

starting_sram:
save_checksum:
.byte $00,$00
save_slot:
.byte $B0+0
save_slot_state:
.byte $E9
xpos_music:
.word ($21 << 6) | $12
ypos_direction:
.word ($BE << 6) | DIRECTIONS::DOWN
party_members:
.byte 1,0,0,0
save_coordinates: ;_x:
.word ($21 << 6) | $12
save_coordinates_y:
.word ($BE << 6) | DIRECTIONS::LEFT
wallet_money: ;cash (on hand)
.word 0
bank_money: ;cash (atm)
.faraddr 0
dad_money: ;cash (since last call)
.faraddr 0

battle_message_speed:
.ifdef VER_JP
.byte 25
.else
.byte 33
.endif

.byte $00,$00,$6B,$84,$1C

;flags? higher nybble is used for the train blockage graphics, at least
.byte $42
big_bag_uses:
.byte 30

player_name:
;player name. a whopping 17 characters!!!!! wow!!!
.ifdef VER_JP
.byte "NO NAME"
.else
.byte "......."
.endif
.byte 0,0,0,0,0,0,0,0,0,0
player_name_end:

;?
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

save_ram_unk:
.ifdef VER_JP
.byte 0,0,0,0
.else
.byte $08,$20,$80,$20
.endif