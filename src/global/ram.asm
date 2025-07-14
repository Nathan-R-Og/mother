.feature force_range

.segment        "ZP": zeropage
; zeropage global variables
UNK_0: .res 1
UNK_1: .res 1
UNK_2: .res 1
UNK_3: .res 1
UNK_4: .res 1
UNK_5: .res 1
UNK_6: .res 1
UNK_7: .res 1
melody_timer: .res 1 ; $8
UNK_9: .res 3
player_direction: .res 1 ;$C
UNK_d: .res 1
fade_type: .res 1 ;$E
UNK_f: .res 1
UNK_10: .res 8
; $10 -> Field CHR bank 2
; $11 -> $10 & 3
; $12 -> Field CHR bank 3
; $13 -> $12 & 3
; $14 -> Current "tileset"?
; $15 -> Current area??
player_x: .res 2 ; $18
player_y: .res 2 ; $1A
UNK_1c: .res 4
; $1F -> 1 when run button is held?
fade_flag: .res 1 ; $20
is_scripted: .res 1
; $21 -> An object index?
autowalk_direction: .res 1 ; $22 ; For cutscenes? If bit 4 is set, then walks through other objects
is_tank: .res 1
UNK_24: .res 2
; $25 -> Cutscene flag? Doesn't allow run button and NPCs are frozen
random_num: .res 2 ; $26
UNK_28: .res 2
global_wordvar: .res 2 ; $2A ; Object script 16-bit number
UNK_2C: .res 4
; $28 -> Object script character ID
; $29 -> Object script item ID
object_pointer: .res 2 ; $30 ; Pointer to object_memory
object_data: .res 2 ; $32 ; Pointer to ROM object data
UNK_34: .res 1
; $34 -> Object script interaction type
object_script_offset: .res 1 ; $35 ; TODO: APPLY ALL LABELS
UNK_36: .res 8
movement_direction: .res 2 ; $3E
UNK_40: .res 1 ; $40 -> CHR bank 2 during IRQ?
UNK_41: .res 1 ; $41 -> CHR bank 3 during IRQ?
UNK_42: .res 1 ; $42 -> CHR bank 4 during IRQ? -- ALSO: Another party member? Seems related to $28
UNK_43: .res 1 ; $43 -> CHR bank 5 during IRQ?
UNK_44: .res 1
UNK_45: .res 1
UNK_46: .res 1 ; $46 -> Some scanline for IRQ?
UNK_47: .res 1
enemy_group: .res 1 ; $48
UNK_49: .res 7
; $4E -> Damage (16-bit) -- only during battle?
UNK_50: .res $10
; $53 -> Attacker offset -- in battles
; $54 -> Target offset -- in battles
; $58 -> Move type -- only during battle?
UNK_60: .res $10
UNK_70: .res 1
UNK_71: .res 1
UNK_72: .res 1
UNK_73: .res 1
UNK_74: .res 1
UNK_75: .res 1
UNK_76: .res 1
UNK_77: .res 1
UNK_78: .res 1
UNK_79: .res 1
UNK_7A: .res 1
UNK_7B: .res 1
UNK_7C: .res 1
UNK_7D: .res 1
UNK_7E: .res 1
UNK_7F: .res 1
UNK_80: .res 2

; Position of menu cursor in whole numbers, incrementing by 1 per step
menucursor_pos: .res 2 ; $82
UNK_84: .res 2
menu_x_pos: .res 1 ; $86 ; X pos in whole numbers
menu_y_pos: .res 1 ; $87 ; Y pos in whole numbers
UNK_88: .res 8
UNK_90: .res $10
UNK_A0: .res $10
unk_b0: .res 1 ; $b0
unk_b1: .res 1 ; $b1
unk_b2: .res 1 ; $b2
unk_b3: .res 1 ; $b3
unk_b4: .res 1 ; $b4
UNK_b5: .res 1 ; $b5
unk_b6: .res 2 ; $b6 ;two byte
UNK_b8: .res 2 ; $b7
unk_ba: .res 1 ; $ba
unk_bb: .res 2 ; $bb ;SOMETIMES two byte???? lohi??? probably
unk_bd: .res 1 ; $bd
unk_be: .res 1 ; $be
unk_bf: .res 1 ; $bf
UNK_C0: .res $10
; $a0 -> Player movement direction?
; $aa -> X position for collision detection?
; $ac -> Y position for collision detection?
; $bb -> Something to do with music (2 bytes). Interacts with $07FF
; $bd -> Current music channel? (1=noise, 2=pulse1, 3=pulse2, 4=triangle, 5=dmc)?
frame_counter: .res 3 ; $d0 ; 24 bit
UNK_D3: .res 7
; $d3 -> How many multiples of 256 frames the controller hasn't been touched. Stops counting at 42 (about 3 minutes). When 42, the frame counter also stops counting (wtf...?)
; $d7 has a JMP instruction (if zero, then don't jump)
pad1_forced: .res 1 ; $da
pad2_forced: .res 1 ; $db
pad1_press: .res 1 ; $dc
pad2_press: .res 1 ; $dd
pad1_hold: .res 1 ; $de
pad2_hold: .res 1 ; $df
UNK_E0: .res 1
UNK_E1: .res 1
UNK_E2: .res 1
UNK_E3: .res 1
UNK_E4: .res 1
UNK_E5: .res 1
UNK_E6: .res 1
UNK_E7: .res 1
UNK_E8: .res 1
UNK_E9: .res 1
nmi_flag: .res 1 ; $ea ; 01 = waiting for NMI, 80 = is running NMI handler ;ignores controller input while set
UNK_EB: .res 1
UNK_EC: .res 1
irq_index: .res 1 ; $ed ; IRQ routine index (multiple of 2)
bankswitch_mode: .res 1 ; $ee ; Bankswitch "mode"  (-----mmm), $8000 MMC3 register
bankswitch_flags: .res 1 ; $ef ; Bankswitch "flags" (ff------), $8000 MMC3 register
current_banks: .res 1 ; $f0 ; Current banks for each "mode" (8 bytes)
UNK_F1: .res $b
; $F8, etc.
scroll_x: .res 1 ; $fc
scroll_y: .res 1 ; $fd
ram_PPUMASK: .res 1 ; $fe
ram_PPUCTRL: .res 1 ; $ff


; *** RAM DEFINES ***
.segment        "RAM": absolute
UNK_100: .res $10

; Zone where text data from CHR is stored to write into PPU
text_data_buffer: .res $40 ;$0110 ~ $014F
stack: .res $B0 ; $150
shadow_oam: .res $100 ; $200
shadow_something: .res $100 ; $300 / ??? overworld sprites????
UNK_400: .res $100 ;nmi queue???
UNK_500: .res $40 ;palette queue???
irq_pointers: .res $40 ; $540 / (-1 because of it uses the RTS trick)
UNK_580: .res $80

; ====================================================================================================
; Length : 0x20 (32) bytes per battler, 8 battlers total

.struct battler_struct
    unk_0 .byte
    status .byte
    resistances .byte
    curr_hp .word
    curr_pp .word
    offense .word
    defense .word
    fight .byte
    speed .byte
    wisdom .byte
    strength .byte
    force .byte
    .union
        moveset .res 8

        .struct ;player
            inventory_slot .byte
            player_id .byte
            unused .res 6
        .endstruct
    .endunion
    fulldata .addr
    enemy_letter .byte
    unk_1b .byte
    target .byte
    action .byte
    m_status .byte
    unk_1f .byte
.endstruct

BATTLER_DATASIZE = $20
; Battler Data Structure (in RAM)
; The data starts at $0600, but much of the code uses 1-Based indexing, hence the $0580 entry.
BATTLER: .tag battler_struct ; should always be 00 for player, EnemyTableID when enemy, FF when enemy deadge
BATTLER_1BASED = BATTLER - (BATTLER_DATASIZE * 4) ; $580

BATTLER_PLAYER2: .tag battler_struct ; $0620
BATTLER_PLAYER3: .tag battler_struct ; $0640
BATTLER_PLAYER4: .tag battler_struct ; $0660
BATTLER_ENEMY1: .tag battler_struct ; $0680
BATTLER_ENEMY2: .tag battler_struct ; $06A0
BATTLER_ENEMY3: .tag battler_struct ; $06C0
BATTLER_ENEMY4: .tag battler_struct ; $06E0

; offsets used by various functions, most notably attacker & target offset vars
PLAYER1_OFFSET := BATTLER - BATTLER
PLAYER2_OFFSET := BATTLER_PLAYER2 - BATTLER
PLAYER3_OFFSET := BATTLER_PLAYER3 - BATTLER
PLAYER4_OFFSET := BATTLER_PLAYER4 - BATTLER
ENEMY1_OFFSET := BATTLER_ENEMY1 - BATTLER
ENEMY2_OFFSET := BATTLER_ENEMY2 - BATTLER
ENEMY3_OFFSET := BATTLER_ENEMY3 - BATTLER
ENEMY4_OFFSET := BATTLER_ENEMY4 - BATTLER

BATTLER_STATUS := BATTLER + battler_struct::status ;$600+1
    UNCON           = %10000000
    PETRIFICATION   = %01000000
    PARALYSIS       = %00100000
    SLEEP           = %00010000
    CONFUSE         = %00001000
    PUZZLE          = %00000100
    POISON          = %00000010
    COLD            = %00000001
    NO_STATUS       = 0

BATTLER_RESISTANCES         := BATTLER + battler_struct::resistances
    IMMUNITY    = %10000000 ; Immune to status, off/def lowering, and PK Beam Gamma
    FIRE        = %01000000
    ICE         = %00100000
    ELECTRIC    = %00010000
    ; unused    = %00001000
    MENTAL      = %00000100 ; Also resists Def.Down
    LIGHT       = %00000010
    INSECT      = %00000001 ; not a resistance: if set, dies to Bug Sprays

BATTLER_CURR_HP             := BATTLER + battler_struct::curr_hp
BATTLER_CURR_PP             := BATTLER + battler_struct::curr_pp
BATTLER_OFF                 := BATTLER + battler_struct::offense
    ; 2 hi bits are used to store enemy death effects (but not EVE's, cause fuck logic)
    DEATHEFFECT_FLAMES      = %01
    DEATHEFFECT_EXPLODE     = %10
BATTLER_DEF                 := BATTLER + battler_struct::defense

BATTLER_CORES               := BATTLER + battler_struct::fight
    BATTLER_FIT             := BATTLER_CORES
    BATTLER_SPD             := BATTLER + battler_struct::speed
    BATTLER_WIS             := BATTLER + battler_struct::wisdom
    BATTLER_STR             := BATTLER + battler_struct::strength
    BATTLER_FCE             := BATTLER + battler_struct::force

; for enemies, $10 - $17 = moveset
BATTLER_MOVESET             := BATTLER + battler_struct::moveset

; for players, they are just used as variables
BATTLER_TEMP_VARS           := BATTLER + battler_struct::inventory_slot
    BATTLER_INVENTORY_SLOT  := BATTLER + battler_struct::inventory_slot ; used when item being used; 0~7
    BATTLER_PLAYER_ID       := BATTLER + battler_struct::player_id
        NINTEN     = 1
        ANA        = 2
        LLOYD      = 3
        TEDDY      = 4
        PIPPI      = 5
        EVE        = 6
        FLYING_MAN = 7
    ; rest goes unused

; pointer to battler's full data, whether it be player (player data in ram) or enemy (enemy data from table)
BATTLER_FULLDATA_PTR := BATTLER + battler_struct::fulldata

; Letter that Suffixes multiple battlers of same enemy, e.g. StarmanA, StarmanB
; lower 2 bits are used for other purposes, so every +4 = new letter
BATTLER_LETTER := BATTLER + battler_struct::enemy_letter
    ; 0 is no letter
    BATTLER_LETTER_A        = %00000100
    BATTLER_LETTER_B        = %00001000
    BATTLER_LETTER_C        = %00010000
    BATTLER_LETTER_D        = %00100000
    ; has functionality for E and beyond

; $1B goes unused

; Targeting for Action
BATTLER_TARGET := BATTLER + battler_struct::target
; Changes to FF when action completed
BATTLER_ACTION_ID := BATTLER + battler_struct::action
; Minor Status
BATTLER_MINOR_STATUS := BATTLER + battler_struct::m_status
    BLIND       = %10000000
    BLOCK       = %01000000
    BIND        = %00100000
    SHIELD      = %00010000
    GUARD       = %00001000
    BARRIER     = %00000100
    ASTHMA      = %00000010
    CALLABLE    = %00000001

; $1F goes unused
; ====================================================================================================

UNK_700: .res $80

; SOUND STUFF: https://pastebin.com/F3hkv8Cw
; $0780 = Sound driver RAM

; Pointers used by music engine
; Yes, there are spaces of 2 bytes between each ptr. As far as I can tell, they are completely useless and go unused. Grrr....

currptr_pulse0: .res 2 ; $780
currptr_pulse0_blank: .res 2 ; $782
currptr_pulse1: .res 2 ; $0784
currptr_pulse1_blank: .res 2 ; $0786
currptr_triangle: .res 2 ; $0788
currptr_triangle_blank: .res 2 ; $078A
; Noise & DPCM ptr is read straight from MusicHeader
current_music: .res 2 ; $078C / Current music track
current_music_blank: .res 2 ; $078E



; Length    = 10 bytes
; Music Header data from ROM is copied to here
; Format:
;   $0      : (signed) KeySig Modifier ($02 = 1 Half Step)
;   $1      : Tempo (Based on LUT)
;   $2, $3  : PTR to Pulse 0 data start
;   $4, $5  : PTR to Pulse 1 data start
;   $6, $7  : PTR to Triangle data start
;   $8, $9  : PTR to Noise & DPCM data
;       DPCM uses upper 2 bits of a byte for data to rep. what sample to play (Snare and Kick Drum, don't remember which is which)
;       Noise uses the rest of the bits
MusicHeader: ; $0790
    ME_Transpose: .res 1 ; Music transpose
    ME_NoteLengthOffset: .res 1 ; $0791 / Music note length table offset
    ME_DataPointer: ; $0792 / Music channel music data pointer (2 bytes per channel)
    ME_Pulse1Channel: .res 2
    ME_Pulse2Channel: .res 2
    ME_TriangleChannel: .res 2
    ME_NoiseChannel: .res 2

ME_Envelopes: ; $079a
    ME_Envelopes0: .res 3
    ME_Envelopes1: .res 3 ; $079D

;guess
ME_CurrentPhrases: ; $07a0
    ME_CurrentPulse1Phrase: .res 2
    ME_CurrentPulse2Phrase: .res 2 ; $07a2
    ME_CurrentTrianglePhrase: .res 2 ; $07a4
    ME_CurrentNoisePhrase: .res 2 ; $07a6

;guess
;if looped, sets head to loop point
ME_CurrentPhraseIndex: ; $07a8
    ME_Pulse1Index: .res 1
    ME_Pulse2Index: .res 1 ; $07a9
    ME_TriangleIndex: .res 1 ; $07aa
    ME_NoiseIndex: .res 1 ; $07ab

; Music Channel variables
; RAM reserved for the music engine to do its thing
; Length    = 4 bytes each
; Format:
;   $0 : Pulse 0
;   $1 : Pulse 1
;   $2 : Triangle
;   $3 : Noise & DPCM

; Current Offset in Channel Music Banks
MusicChannel_Counter: .res 4 ; $07AC / Music channel music data offset (added to $0792[x])
MusicChannel_LSOffset: .res 4 ; $07B0 / Music channel loop start offset
MusicChannel_NoteLengthCounter: .res 4 ; $07B4 / Music channel note length counter
MusicChannel_NewNoteLength: .res 4 ; $07B8 / Music channel new note length
MusicChannel_LoopCounter: .res 4 ; $07BC / Music channel loop counter
UNK_7C0: .res $30
; $07C0 = Music channel sweep ($4001/$4005), not used for triangle and noise since sweep only exists for pulse

; $07C0 = Music channel sweep ($4001/$4005), not used for triangle and noise since sweep only exists for pulse

; $07CC = Current music ID (gets value from $07F5 minus one)

; $07EF = Unknown (initialized to $C0)

; Sounds
; direct sfx (put into soundqueues)
; $0 : noise
; this is the only one directly used by battle engine bank
Noise_Hit                   = $1
Noise_Bomb                  = $2
Noise_Thunder               = $3
Noise_Fire                  = $4
Noise_Crit                  = $5
Noise_EnemyKilled           = $6
; $7 not used (plays junk data)
Noise_Stairs                = $8
Noise_Rocket                = $9
Noise_RocketLand            = $A
; $1 : pulses group 0
PulseG0_EnemyAttack         = $1
PulseG0_Beam                = $2
PulseG0_StatBoost           = $3
PulseG0_TakeDamage          = $4
PulseG0_MenuBloop           = $5
PulseG0_ItemDropGet         = $6
PulseG0_Recovery            = $7
PulseG0_Canary              = $8
PulseG0_LearnedPSI          = $9
PulseG0_PlayerAttack        = $a
PulseG0_Purchase            = $b
PulseG0_Dodge               = $c
; PulseG0_LowMenuBloop  = $e (unused)
; PulseG0_HighMenuBloop = $f (unused)
PulseG0_Miss                = $f
PulseG0_MagicantWarp        = $10
PulseG0_Laura               = $11   ; plays canary then swaps track to 2nd melody (doesnt change track back)
PulseG0_XXStone             = $12
; $2 : unused
; $3 : triangle
Triangle_Freeze             = $1    ; also used for teleport
Triangle_Equip              = $4
; $2 plays junk
Triangle_PlayerKilled       = $3
Triangle_Equipped           = $4
; $4 pulse group 1
PulseG1_DimensionSlip       = $1    ; also used for teleport
PulseG1_Status              = $2
PulseG1_GiegueAttack        = $3
; $5 : track
Track_LevelUp               = $1f
Track_Clear                 = $ff

; Length    = 6 bytes
; Area      = $07F0 ~ $07F5
; Place to store sounds to play. On main loop, move from queue to active (overrides current playing sfx/track) SFX takes priority of Sound Channels over the Track.
; Format:
;   $0 : Noise SFX
;   $1 : Pulse SFX group 0 (the sfx can use both pulse channels)
;   $2 : unused (does nothing)
;   $3 : Triangle SFX
;   $4 : Pulse SFX group 1 (ties in with there being 2 playSFX commands for objects)
;   $5 : Track (changes track on next mainloop)
soundqueue: ; $07F0
    soundqueue_noise: .res 1
    soundqueue_pulseg0: .res 1 ; $07F1
    soundactive_unk: .res 1 ; $07F2
    soundqueue_triangle: .res 1 ; $07F3
    soundqueue_pulseg1: .res 1 ; $07F4
    soundqueue_track: .res 1 ; $07F5

UNK_7f6: .res 1

disable_dmc: .res 1 ; $07F7 / If not zero, DMC is disabled


; Same format as soundqueue. Holds the current playing SFX/Track until it ends. Almost all tracks don't "end," but loop a large number of times, so the value gets stuck in there, effectively making it a clone of curr_track_id
soundactive: ; $07F8
    soundactive_noise: .res 1
    soundactive_pulseg0: .res 1 ; $07F9
    soundactive_unknown: .res 1 ; $07FA
    soundactive_triangle: .res 1 ; $07FB
    soundactive_pulseg1: .res 1 ; $07FC
    soundactive_track: .res 1 ; $07FD

UNK_7FE: .res 2
UNK_800: .res $5800


.segment "SRAM": absolute
;sram start
UNK_6000: .res $700

;todo: verify
.ifdef VER_JP
something = $6D00
pc_count = $6D07
unkx: .res 8
.else
something: .res 7
pc_count: .res 1 ; $6707
.endif

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
; EVENT FLAG 239 -> Constantly set to  rue while on Ellay
; EVENT FLAG 240 -> Learned XX Stone's melody
; EVENT FLAG 241 -> Learned EVE's melody
; EVENT FLAG 242 -> Learned Dragon's melody
; EVENT FLAG 243 -> Learned Cactus' melody
; EVENT FLAG 244 -> Learned Piano melody
; EVENT FLAG 245 -> Learned Singing Monkey's melody
; EVENT FLAG 246 -> Learned Laura's melody
; EVENT FLAG 247 -> Learned Doll's melody
UNK_6708: .res 8
party_member_1_stats: .res $1e
party_member_2_stats: .res 2
UNK_6730: .res $1c
party_member_3_stats: .res 4
UNK_6750: .res $30

object_memory: .res $C80 ; $6780
object_m_type = 0 ;byte
object_m_area = 1 ;byte
object_m_data_pointer = 2 ;word
object_m_xpos = 4 ;word (world)
object_m_ypos = 6 ;word (world)
object_m_oam = 8 ;word
object_m_sxpos = $a ;byte (screen)
object_m_sypos = $b ;byte (screen)
object_m_sxvel = $c ;byte (screen)
object_m_syvel = $d ;byte (screen)
object_m_sprite = $e ;word
object_m_oam2 = $10 ;byte
object_m_colOffset = $11 ;byte
object_m_colPointer = $12 ;word
object_m_bitfield1 = $14 ;byte
;'citpssss' => c=collidable; i=interactable; t=change direction when talked to; p=high priority; s=offset from object data where script data starts
object_m_direction = $15 ;byte
object_m_sprite2 = $16 ;word
object_m_unk1 = $18 ;3 bytes
object_m_playerTouch = $1b ;byte
;(-t---ddd => t=touched, d=direction player is facing)
object_m_scriptOffset = $1c; byte
object_m_unk2 = $1d ;3 bytes
object_m_sizeof = $20

save_file_current: .res $200

; $00 : Unused (always 00)
Status_Offset               = $1
Resistance_Offset           = $2
HP_Offset                   = $3
PP_Offset                   = $5
Off_Offset                  = $7
Def_Offset                  = $9
Fit_Offset                  = $B
Spd_Offset                  = $C
Wis_Offset                  = $D
Str_Offset                  = $E
Fce_Offset                  = $F
Lv_Offset                   = $10
Exp_Offset                  = $11
CurrHP_Offset               = $14
CurrPP_Offset               = $16
NamePtr_Offset              = $18
Inventory_Offset            = $20            ; 8 bytes
Equipment_Offset            = $28
    Weapon_Offset           = Equipment_Offset
    Coin_Offset             = Equipment_Offset + 1
    Bracelet_Offset         = Equipment_Offset + 2
    Pendant_Offset          = Equipment_Offset + 3
Crumbs_Offset               = $2C
    CrumbsX_Offset          = Crumbs_Offset
    CrumbsY_Offset          = Crumbs_Offset + 2
PSILearned_Offset           = $30

Name_Offset                 = $38
; Terminator_Offset         = $3F   ; always 00

event_flags = $7600
learned_melodies = event_flags+$1e
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

;may not be entirely accurate
confiscated_weapon = $7680
; $7680 -> Labeled as "Weapon" in Normmatt's decomp

fav_food = $7689
; $7689 -> Favorite Food name

item_storage = $76B0



save_file_fill: .res $100

save_file_1: .res $300
save_file_2: .res $300
save_file_3: .res $300

