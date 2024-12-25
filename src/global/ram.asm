.feature force_range
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

; $4E -> Damage (16-bit) -- only during battle?

; $53 -> Attacker offset -- in battles
; $54 -> Target offset -- in battles

; $58 -> Move type -- only during battle?

; $a0 -> Player movement direction?

; $aa -> X position for collision detection?
; $ac -> Y position for collision detection?

; $bb -> Something to do with music (2 bytes). Interacts with $07FF
; $bd -> Current music channel? (1=noise, 2=pulse1, 3=pulse2, 4=triangle, 5=dmc)?

frame_counter    = $d0 ; 24 bit
; $d3 -> How many multiples of 256 frames the controller hasn't been touched. Stops counting at 42 (about 3 minutes). When 42, the frame counter also stops counting (wtf...?)

; $d7 has a JMP instruction (if zero, then don't jump)
pad1_forced      = $da
pad2_forced      = $db
pad1_press       = $dc
pad2_press       = $dd
pad1_hold        = $de
pad2_hold        = $df

nmi_flag         = $ea ; 01 = waiting for NMI, 80 = is running NMI handler

irq_index        = $ed ; IRQ routine index (multiple of 2)
bankswitch_mode  = $ee ; Bankswitch "mode"  (-----mmm), $8000 MMC3 register
bankswitch_flags = $ef ; Bankswitch "flags" (ff------), $8000 MMC3 register
current_banks    = $f0 ; Current banks for each "mode" (8 bytes)
; $F8, etc.
scroll_x         = $fc
scroll_y         = $fd
ram_PPUMASK      = $fe
ram_PPUCTRL      = $ff

text_data_buffer = $0110

; $0540 = IRQ routine pointers (-1 because of it uses the RTS trick)

; $0600 -> Battlers -- in battles
; BATTLER STRUCT (32 bytes):
;  00 -> Enemy ID? (Ninten & co. are FF)
;  01 -> Status ailments (80=Faintd;40=Stone;20=Parlzd;10=Asleep;08=Confsd;04=Puzzld;02=Poison;01=Cold)
;  02 -> Resistances (80=Complete status immunity;40=Fire;20=Freeze;10=Thunder;08=???;04=Status;02=Beam;01=Weak to Bug Spray)
;  03 -> HP (16-bit)
;  05 -> PP (16-bit)
;  07 -> Offense? (16-bit)
;  09 -> Defense? (16-bit)
;  0B -> Fight
;  0C -> Speed
;  0D -> Wisdom
;  0E -> Strength
;  0F -> Force
;  10 -> ???
;  11 -> Character ID?
;  12 -> Enemy action #1
;  13 -> Enemy action #2
;  14 -> Enemy action #3
;  15 -> Enemy action #4
;  16 -> Enemy action #5
;  17 -> Enemy action #6
;  18 -> Pointer to party member data (struct at $7400)
;  19 -> ???
;  1A -> ???
;  1B -> ???
;  1C -> Target's battler offset
;  1D -> Battle action
;  1E -> Battle-specific status (80=Blind;40=Blocked;20=Roped;10=Shield;08=Guarding;04=PowerShield?;02=Asthma;01=???)
;  1F -> ???

pc_count = $6707

;;;; TODO: AREAS
; Area 0x08 -> Yucca Desert?
; Area 0x09 -> Youngtown
; Area 0x0A -> Ellay
; Area 0x0B -> Podunk (TODO: Just a tiny area??)
; Area 0x0C -> ...
; Area 0x0D -> ...
; Area 0x0E -> ...
; Area 0x0F -> Lost pass (TODO)
; Area 0x10 -> Just a door
; Area 0x11 -> Spookane? (Just a sign and 4 doors)
; Area 0x12 -> Nothing
; Area 0x13 -> A door, and Yucca Desert music changers
; Area 0x14 -> Yucca Desert
; Area 0x15 -> Nothing
; Area 0x16 -> Hospitals
; Area 0x17 -> Hotels
; Area 0x18 -> ...
; Area 0x19 -> More hotels (TODO: or just Spookane Hotel?)
; Area 0x1A -> Twinkle Elementary School
; Area 0x1B -> Ninten's house + healers
; Area 0x1C -> ???
; Area 0x1D -> Rosemary Mansion
; Area 0x1E -> Rosemary Mansion
; Area 0x1F -> Stores
; Area 0x20 -> Stores + ATM + Payphones
; Area 0x21 -> Stores + Union Station
; Area 0x22 -> Stores + payphones + other stuff
; Area 0x23 -> Some doctor
; Area 0x24 -> City Hall
; Area 0x25 -> By the sea at telescopes
;;;; TODO: AREAS

; EVENT FLAG 0   -> Temp flag used in subroutines?
; EVENT FLAG 10  -> Poltergeist stopped?
; EVENT FLAG 11  -> Pippi rescued
; EVENT FLAG 12  -> Gave canary chick to Laura
; EVENT FLAG 13  -> Defeated Starman Jr. (Zoo calmed down)
; EVENT FLAG 15  -> Rosemary Mansion conquered?
; EVENT FLAG 20  -> Defeated NPC zombie "Zombie!"
; EVENT FLAG 21  -> Defeated NPC zombie "You shall become a Zombieeee!"
; EVENT FLAG 23  -> Currently on airplane?
; EVENT FLAG 24  -> Currently on tank?
; EVENT FLAG 27  -> Opened Pippi casket
; EVENT FLAG 28  -> Opened zombie casket #1
; EVENT FLAG 29  -> Opened zombie casket #2
; EVENT FLAG 30  -> Opened zombie casket #3
; EVENT FLAG 31  -> Pippi joins
; EVENT FLAG 32  -> Zoo gate opened
; EVENT FLAG 33  -> Monkey stole the Zoo Key
; EVENT FLAG 38  -> Doll defeated
; EVENT FLAG 41  -> Forgotten Man is gone
; EVENT FLAG 43  -> Currently arrested for accepting drinks
; EVENT FLAG 45  -> Pippi by her house?
; EVENT FLAG 46  -> Got arrested for accepeting drinks
; EVENT FLAG 47  -> Got Ana's hat
; EVENT FLAG 49  -> Hint person gone (TODO: Who is this hint person?)
; EVENT FLAG 50  -> Constantly set while near Ninten's house
; EVENT FLAG 51  -> Got basement key
; EVENT FLAG 52  -> Accepted drink in the Live House
; EVENT FLAG 53  -> Teddy joins
; EVENT FLAG 54  -> Holding onto $423 dollars (TODO: from whom?)
; EVENT FLAG 56  -> Got Ghost Key
; EVENT FLAG 58  -> Learned about the desert landmine? (TODO)
; EVENT FLAG 59  -> Got Yucca Desert landmine easter egg
; EVENT FLAG 60  -> School roof open?
; EVENT FLAG 64  -> Answered first Dad call
; EVENT FLAG 81  -> Got the Ocarina
; EVENT FLAG 83  -> Learned about Red Weed to Magic Herb fountain transmutation
; EVENT FLAG 84  -> Got the Big Bag
; EVENT FLAG 85  -> Magicant man will give the Big Bag
; EVENT FLAG 86  -> Magicant man will return the Cash Card
; EVENT FLAG 96  -> Fixed bent spoon in Magicant
; EVENT FLAG 98  -> Got Pippi's Franklin Badge
; EVENT FLAG 99  -> Weapons confiscated
; EVENT FLAG 100 -> Flying Man #1 taken
; EVENT FLAG 101 -> Flying Man #2 taken
; EVENT FLAG 102 -> Flying Man #3 taken
; EVENT FLAG 103 -> Flying Man #4 taken
; EVENT FLAG 104 -> Flying Man #5 taken
; EVENT FLAG 105 -> Flying Man #1 died
; EVENT FLAG 106 -> Flying Man #2 died
; EVENT FLAG 107 -> Flying Man #3 died
; EVENT FLAG 108 -> Flying Man #4 died
; EVENT FLAG 109 -> Flying Man #5 died
; EVENT FLAG 110 -> At least one Flying Man died
; EVENT FLAG 111 -> Answered Merrysville questionnaire
; EVENT FLAG 112 -> Magicant cash man summoned?? (TODO: wut)
; EVENT FLAG 113 -> Merrysville train rails unblocked
; EVENT FLAG 115 -> Currently on the tank? (TODO: What's different from 24?)
; EVENT FLAG 117 -> The Fish defeated? (TODO: Confirm!)
; EVENT FLAG 120 -> Thrashed tank?
; EVENT FLAG 128 -> Player name registered
; EVENT FLAG 129 -> Defeated the Dragon
; EVENT FLAG 132 -> Something related to the haunted house
; EVENT FLAG 133 -> Got dropped pass (TODO: What's this?)
; EVENT FLAG 136 -> Saved 10 Ticket Stubs, can get into the Tank
; EVENT FLAG 137 -> Flight Plan A
; EVENT FLAG 138 -> Flight Plan B
; EVENT FLAG 139 -> Flight Plan C
; EVENT FLAG 144 -> Thrashed tank? (TODO: What's different from 120?)
; EVENT FLAG 224 -> Magicant has disappeared
; EVENT FLAG 239 -> Constantly set to true while on Ellay
; EVENT FLAG 240 -> Learned XX Stone's melody
; EVENT FLAG 241 -> Learned EVE's melody
; EVENT FLAG 242 -> Learned Dragon's melody
; EVENT FLAG 243 -> Learned Cactus' melody
; EVENT FLAG 244 -> Learned Piano melody
; EVENT FLAG 245 -> Learned Singing Monkey's melody
; EVENT FLAG 246 -> Learned Laura's melody
; EVENT FLAG 247 -> Learned Doll's melody

object_memory  = $6780
; $6780 - Object memory
;  00    -> Type
;  01    -> Area
;  02    -> Data pointer
;  04    -> X position
;  06    -> Y position
;  08~0D -> Data for $0300 (OAM stuff)
;  0A    -> Screen X position
;  0B    -> Screen Y position
;  0C    -> X velocity (better: X displacement?)
;  0D    -> Y velocity (better: Y displacement?)
;  0E~0F -> Graphics data pointer (16-bit)
;  10    -> Index to $0300 (OAM stuff)
;  11    -> Collision data offset
;  12    -> Collision data pointer? (16-bit)
;  14    -> Bitfield: 'citpssss' => c=collidable; i=interactable; t=change direction when talked to; p=high priority; s=offset from object data where script data starts
;  15    -> Direction
;  16    -> Graphics offset (16-bit)
;  18~1A -> Unknown
;  1B    -> Player touched object flag (-t---ddd => t=touched, d=direction player is facing)
;  1C    -> An offset to the object data (script)
;  1D~1F -> Unknown

; EACH SAVED GAME TAKES 0x0300 BYTES
; SAVED GAMES ARE STORED AT $7700, $7A00 and $7D00

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
; $7440 -> Party member data
; STRUCT FORMAT (64 bytes):
;  00 -> ???
;  01 -> Status ailments (80=Faintd;40=Stone;20=Parlzd;10=Asleep;08=Confsd;04=Puzzld;02=Poison;01=Cold)
;  02 -> Resistances (80=???related to bug spray???;40=Fire;20=Freeze;10=Thunder;08=???;04=???;02=???;01=related to bug spray)
;  03 -> Max HP (16 bit)
;  05 -> Max PP
;  07 -> Offense (16 bit)
;  09 -> Defense (16 bit)
;  0B -> Fight
;  0C -> Speed
;  0D -> Wisdom
;  0E -> Strength
;  0F -> Force
;  10 -> Level
;  11 -> Exp (24 bit)
;  14 -> HP (16 bit)
;  16 -> PP (16 bit)
;  18 -> Pointer to name
;
;  20 -> Inventory (8 bytes)
;  28 -> Equipment (4 bytes)
;  2C -> Breadcrumbs coordinates (copied from $7404, 4 bytes)
;  30 -> PSI Learned (--t----- => t=teleportation)
;
;  38 -> Name (8 bytes)

event_flags      = $7600
learned_melodies = event_flags+30
; $7620[64] = UNKNOWN BITFLAGS

;;;; TODO: COUNTERS
; Counter 0 -> ???
; Counter 1 -> ???
; Counter 2 -> Forgotten Man dialogue
; Counter 3 -> Hints
; Counter 4 -> Telephone Card credit
; Counter 5 -> Ticket Stubs
; Counter 6 -> ???
;;;; TODO: COUNTERS
script_counters  = $7660

; $7680 -> Labeled as "Weapon" in Normmatt's decomp

; $7689 -> Favorite Food name

item_storage = $76B0

; SOUND STUFF: https://pastebin.com/F3hkv8Cw
; $0780 = Sound driver RAM

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

; $07F8 = Current noise sound effect
; $07F9 = Current square1 sound effect
; $07FA = Current ????? sound effect
; $07FB = Current triangle sound effect
; $07FC = Current ????? sound effect
; $07FD = Current music track