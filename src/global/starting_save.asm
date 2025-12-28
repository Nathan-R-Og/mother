;intial sram
;jp has minor diffs

; EACH SAVED GAME TAKES 0x0300 BYTES
; SAVED GAMES ARE STORED AT $7700, $7A00 and $7D00

starting_sram:
save_checksum: .byte $00,$00
save_slot: .byte $B0+0
save_slot_state: .byte $E9
xpos_music: .word ($21 << 6) | $12
ypos_direction: .word ($BE << 6) | DIRECTIONS::DOWN
party_members: .byte 1,0,0,0
save_coordinates: .word ($21 << 6) | $12
save_coordinates_y: .word ($BE << 6) | DIRECTIONS::LEFT
wallet_money: .word 0 ;cash (on hand)
bank_money: .faraddr 0 ;cash (atm)
dad_money: .faraddr 0 ;cash (since last call)


; message speed - stores no. of frames to lag after printing a battle msg
; anything not named speed 5 (1 frame lag) is unbearably slow
battle_message_speed:
.ifdef VER_JP
.byte 25
.else
.byte 33
.endif

repel_counter: .byte $00

.byte $00
;Giegue Rock Not-Moved Chunk ID
.byte $6B ;ts2
;area encounter defs for the zoo, since it changes based on flags
areaEncounterDef 4, $10 ;area $29
areaEncounterDef 4, 3 ;area $d
;Duncan Factory Rocket Not-Moved Chunk ID
.byte $42 ;ts2

big_bag_uses: .byte 30

player_name:
;player name. a whopping 16 characters!!!!! wow!!!
.ifdef VER_JP
.byte "NO NAME"
.else
.byte "......."
.endif
.byte 0,0,0,0,0,0,0,0,0,0
player_name_end:

;?
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

preferences:
.ifdef VER_JP
.byte 0,0,0,0
.else
.byte %00001000 ;B button use
.byte %00100000 ;START button use
.byte %10000000 ;SELECT button use
.byte %00100000 ;Fight message speed preset
.endif