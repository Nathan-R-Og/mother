; *** RAM DEFINES ***

melody_timer       = $08 ; Trippy background timer on melody

player_direction   = $0C

fade_type          = $0E

; $10 -> Field CHR bank 2
; $11 -> $10 & 3
; $12 -> Field CHR bank 3
; $13 -> $12 & 3
; $14 -> Current "tileset"?
; $15 -> Current area??

player_x           = $18
player_y           = $1A

; $1F -> 1 when run button is held?

fade_flag            = $20

; $21 -> An object index?

autowalk_direction   = $22 ; For cutscenes? If bit 4 is set, then walks through other objects

; $25 -> Cutscene flag? Doesn't allow run button and NPCs are frozen

random_num           = $26 ; 2 bytes

; $28 -> Object script character ID
; $29 -> Object script item ID
; $2A -> Object script 16-bit number

object_pointer       = $30 ; Pointer to object_memory
object_data          = $32 ; Pointer to ROM object data
; $34 -> Object script interaction type
object_script_offset = $35 ; TODO: APPLY ALL LABELS

movement_direction   = $3E

; $40 -> CHR bank 2 during IRQ?
; $41 -> CHR bank 3 during IRQ?
; $42 -> CHR bank 4 during IRQ? -- ALSO: Another party member? Seems related to $28
; $43 -> CHR bank 5 during IRQ?

; $46 -> Some scanline for IRQ?

enemy_group        = $48

pad1_forced = $da
pad2_forced = $db
pad1_press = $dc
pad2_press = $dd
pad1_hold = $de
pad2_hold = $df

; 01 = waiting for NMI, 80 = is running NMI handler
nmi_flag = $ea


scroll_x = $fc
scroll_y = $fd
ram_PPUMASK = $fe
ram_PPUCTRL = $ff


pc_count = $6707

object_memory  = $6780

event_flags      = $7600
learned_melodies = event_flags+30


item_storage = $76B0

current_music = $078C ; Current music track

; $0790 = Music transpose
; $0791 = Music note length table offset
; $0792 = Music channel music data pointer (2 bytes per channel)
; $079A = Envelope #1 (3 bytes, noise not included!)
; $079D = Envelope #2 (3 bytes, noise not included!)
; $07A0 = Unknown pointer (2 bytes per channel)
; $07A8 = Unknown offset (1 byte per channel)
; $07AC = Music channel music data offset (added to $0792[x])
; $07B0 = Music channel loop start offset
; $07B4 = Music channel note length counter
; $07B8 = Music channel new note length
; $07BC = Music channel loop counter
; $07C0 = Music channel sweep ($4001/$4005), not used for triangle and noise since sweep only exists for pulse

; $07CC = Current music ID (gets value from $07F5 minus one)

; $07EF = Unknown (initialized to $C0)
; $07F0 = New noise sound effect
; $07F1 = New square1 sound effect
; $07F2 = New ????? sound effect
; $07F3 = New triangle sound effect
; $07F4 = New ????? sound effect

new_music   = $07F5 ; New music track

disable_dmc = $07F7 ; If not zero, DMC is disabled


save_slot            = $7402 ; TODO: CONFIRM AND LABEL
xpos_music           = $7404 ; xxxxxxxx.xxmmmmmm (x=xpos;m=music)
ypos_direction       = $7406 ; yyyyyyyy.yydddddd (y=ypos;d=direction)
party_members        = $7408 ; Array of party members (4 bytes)
save_coordinates     = $740C ; Saved game coordinates (copied from $7404, 4 bytes)
wallet_money         = $7410 ; Wallet money (2 bytes)
bank_money           = $7412 ; Bank money (3 bytes)
dad_money            = $7415 ; Money earned since last Dad call
battle_message_speed = $7418

big_bag_uses         = $741F

party_data           = $7440