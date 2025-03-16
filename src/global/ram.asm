.feature force_range
; *** RAM DEFINES ***
; zeropage global variables
melody_timer                = $08           ; Trippy background timer on melody
player_direction            = $0C
fade_type                   = $0E
can_enter_doors             = $0F           ; $00 (TRUE) when normal, $FF (FALSE) when teleporting
; $10 -> Field CHR bank 2
; $11 -> $10 & 3
; $12 -> Field CHR bank 3
; $13 -> $12 & 3
; $14 -> Current "tileset"?
; $15 -> Current area??

player_x                    = $18           ; 16-bit
player_y                    = $1A           ; 16-bit
player_localx               = $1B           ; local offset in NES tilemap; steps in $10
player_localy               = $1C           ; local offset in NES tilemap; steps in $10

overworld_tick_speed        = $1F           ; 0 = normal, set to 1 when B is held, increases during Teleport run


fade_flag                   = $20
;bytevar21                  = $21
    ; battle    : is_scripted
    ; overworld : is_cutscene
autowalk_direction          = $22           ; For cutscenes? If bit 4 is set, then walks through other objects

is_tank                     = $23           ; set when tank is being used

; $25 -> Cutscene flag? Doesn't allow run button and NPCs are frozen

random_num                  = $26           ; 2 bytes, updates every gametick

; $28 -> Object script character ID
; $29 -> Object script item ID

global_wordvar2a            = $2a                 ; always used for variables

; More Documentation Needed
text_printing_state         = $2C
; 00 = Clear (Initial string prints textbox and gets printed at default spot)
; 08 = Continuing (adds break at end -> next string is printed)
; 09 = Yes / No Menu
; 18 = Selection Menu (Who? Menu)
; 1C = Input Number (used for ATM)
; 20 = opens Inventory for item selection
; 21 = opens Storage for item selection
; 22 = Shop Menu
; 37 = Custom Yes / No Menu

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

enemy_group                 = $48       ; EG when an encounter happens



menu_cursor_pos             = $82       ; position of menu cursor in whole numbers, incrementing by 1 per step
menu_x_pos                  = $86       ; X pos in whole numbers
menu_y_pos                  = $87       ; Y pos in whole numbers



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

; Length    = 0x40 (64) bytes
; Area      = $0110 ~ $014F
; Zone where text data from CHR is stored to write into PPU
text_data_buffer = $0110

; $0540 = IRQ routine pointers (-1 because of it uses the RTS trick)

; ====================================================================================================
; Length : 0x20 (32) bytes per battler, 8 battlers total
; Battler Data Structure (in RAM)
; The data starts at $0600, but much of the code uses 1-Based indexing, hence the $0580 entry.
BATTLER_1BASED              = $0580
BATTLER                     = $0600             ; should always be 00 for player, EnemyTableID when enemy, FF when enemy deadge
BATTLER_DATASIZE            = $20
BATTLER_PLAYER2             = BATTLER + (BATTLER_DATASIZE)      ; $0620
BATTLER_PLAYER3             = BATTLER + (BATTLER_DATASIZE * 2)  ; $0640
BATTLER_PLAYER4             = BATTLER + (BATTLER_DATASIZE * 3)  ; $0660
BATTLER_ENEMY1              = BATTLER + (BATTLER_DATASIZE * 4)  ; $0680
BATTLER_ENEMY2              = BATTLER + (BATTLER_DATASIZE * 5)  ; $06A0
BATTLER_ENEMY3              = BATTLER + (BATTLER_DATASIZE * 6)  ; $06C0
BATTLER_ENEMY4              = BATTLER + (BATTLER_DATASIZE * 7)  ; $06E0

; offsets used by various functions, most notably attacker & target offset vars
PLAYER1_OFFSET      = $00
PLAYER2_OFFSET      = BATTLER_DATASIZE
PLAYER3_OFFSET      = BATTLER_DATASIZE * 2
PLAYER4_OFFSET      = BATTLER_DATASIZE * 3
ENEMY1_OFFSET       = BATTLER_DATASIZE * 4
ENEMY2_OFFSET       = BATTLER_DATASIZE * 5
ENEMY3_OFFSET       = BATTLER_DATASIZE * 6
ENEMY4_OFFSET       = BATTLER_DATASIZE * 7

BATTLER_STATUS              = BATTLER + $1
    UNCON           = %10000000
    PETRIFICATION   = %01000000
    PARALYSIS       = %00100000
    SLEEP           = %00010000
    CONFUSE         = %00001000
    PUZZLE          = %00000100
    POISON          = %00000010
    COLD            = %00000001
    NO_STATUS       = 0

BATTLER_RESISTANCES         = BATTLER + $2
    IMMUNITY    = %10000000 ; Immune to status, off/def lowering, and PK Beam Gamma
    FIRE        = %01000000
    ICE         = %00100000
    ELECTRIC    = %00010000
    ; unused    = %00001000
    MENTAL      = %00000100 ; Also resists Def.Down
    LIGHT       = %00000010
    INSECT      = %00000001 ; not a resistance: if set, dies to Bug Sprays

BATTLER_CURR_HP             = BATTLER + $3
BATTLER_CURR_PP             = BATTLER + $5
BATTLER_OFF                 = BATTLER + $7
    ; 2 hi bits are used to store enemy death effects (but not EVE's, cause fuck logic)
    DEATHEFFECT_FLAMES      = $1
    DEATHEFFECT_EXPLODE     = $2
BATTLER_DEF                 = BATTLER + $9

BATTLER_CORES               = BATTLER + $B
    BATTLER_FIT             = BATTLER_CORES
    BATTLER_SPD             = BATTLER_CORES + $1
    BATTLER_WIS             = BATTLER_CORES + $2
    BATTLER_STR             = BATTLER_CORES + $3
    BATTLER_FCE             = BATTLER_CORES + $4

; for enemies, $10 - $17 = moveset
BATTLER_MOVESET             = BATTLER + $10

; for players, they are just used as variables
BATTLER_TEMP_VARS           = BATTLER_MOVESET
    BATTLER_INVENTORY_SLOT  = BATTLER_MOVESET           ; used when item being used; 0~7
    BATTLER_PLAYER_ID       = BATTLER_MOVESET + $1
        NINTEN              = $1
        ANA                 = $2
        LLOYD               = $3
        TEDDY               = $4
        PIPPI               = $5
        EVE                 = $6
        FLYING_MAN          = $7
    ; rest goes unused

; pointer to battler's full data, whether it be player (player data in ram) or enemy (enemy data from table)
BATTLER_FULLDATA_PTR        = BATTLER + $18

; Letter that Suffixes multiple battlers of same enemy, e.g. StarmanA, StarmanB
; lower 2 bits are used for other purposes, so every +4 = new letter
BATTLER_LETTER              = BATTLER + $1A
    ; 0 is no letter
    BATTLER_LETTER_A        = $04
    BATTLER_LETTER_B        = $08
    BATTLER_LETTER_C        = $0C
    BATTLER_LETTER_D        = $10
    ; has functionality for E and beyond

; $1B goes unused

; Targeting for Action
BATTLER_TARGET              = BATTLER + $1C
; Changes to FF when action completed
BATTLER_ACTION_ID           = BATTLER + $1D
; Minor Status
BATTLER_MINOR_STATUS        = BATTLER + $1E
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

; SOUND STUFF: https://pastebin.com/F3hkv8Cw
; $0780 = Sound driver RAM

; Pointers used by music engine
; Yes, there are spaces of 2 bytes between each ptr. As far as I can tell, they are completely useless and go unused. Grrr....
currptr_pulse0      = $0780     ; $0780 ~ 0781
currptr_pulse1      = $0784     ; $0784 ~ 0785
currptr_triangle    = $0788     ; $0787 ~ 0788
; Noise & DPCM ptr is read straight from MusicHeader
current_music = $078C ; Current music track



; Length    = 10 bytes
; Area      = $0790 ~ $0799
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
MusicHeader             = $0790

; $0790 = Music transpose
; $0791 = Music note length table offset
; $0792 = Music channel music data pointer (2 bytes per channel)

; Length    = 3 bytes each
; Area      = $079A ~ $079F
ME_Envelopes            = $079a
    ME_Envelopes0       = ME_Envelopes
    ME_Envelopes1       = ME_Envelopes+3    ; $079D

; $079A = Envelope #1 (3 bytes, noise not included!)
; $079D = Envelope #2 (3 bytes, noise not included!)
; $07A0 = Unknown pointer (2 bytes per channel)
; $07A8 = Unknown offset (1 byte per channel)

; Music Channel variables
; RAM reserved for the music engine to do its thing
; Length    = 4 bytes each
; Format:
;   $0 : Pulse 0
;   $1 : Pulse 1
;   $2 : Triangle
;   $3 : Noise & DPCM

; Current Offset in Channel Music Banks
MusicChannel_Counter                = $07AC
; loop start offset
MusicChannel_LSOffset               = $07B0
MusicChannel_NoteLengthCounter      = $07B4
MusicChannel_NewNoteLength          = $07B8

; $07AC = Music channel music data offset (added to $0792[x])
; $07B0 = Music channel loop start offset
; $07B4 = Music channel note length counter
; $07B8 = Music channel new note length
; $07BC = Music channel loop counter
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
soundqueue                      = $07F0
    soundqueue_noise            = soundqueue
    soundqueue_pulseg0          = soundqueue+1
    soundqueue_triangle         = soundqueue+3
    soundqueue_pulseg1          = soundqueue+4
    soundqueue_track            = soundqueue+5

disable_dmc = $07F7 ; If not zero, DMC is disabled


; Same format as soundqueue. Holds the current playing SFX/Track until it ends. Almost all tracks don't "end," but loop a large number of times, so the value gets stuck in there, effectively making it a clone of curr_track_id
soundactive                     = $07F8
    soundactive_noise           = soundactive
    soundactive_pulseg0         = soundactive+1
    soundactive_triangle        = soundactive+3
    soundactive_pulseg1         = soundactive+4
    soundactive_track           = soundactive+5



;todo: verify
.ifdef VER_JP
pc_count = $6D07
.else
pc_count = $6707
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

object_memory  = $6780
; $6780 - Object memory
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

; SRAM
; EACH SAVED GAME TAKES 0x0300 BYTES
; SAVED GAMES ARE STORED AT $7700, $7A00 and $7D00

;save_slot            = $7402 ; TODO: CONFIRM AND LABEL
xpos_music           = $7404 ; xxxxxxxx.xxmmmmmm (x=xpos;m=music)
ypos_direction       = $7406 ; yyyyyyyy.yydddddd (y=ypos;d=direction)
party_members        = $7408 ; Array of party members (4 bytes)
save_coordinates     = $740C ; Saved game coordinates (copied from $7404, 4 bytes)
wallet_money         = $7410 ; Wallet money (2 bytes)
bank_money           = $7412 ; Bank money (3 bytes)
dad_money            = $7415 ; Money earned since last Dad call

; response delay - stores no. of frames to lag after printing a battle msg
; anything not named speed 5 (1 frame lag) is unbearably slow
battle_message_responsedelay    = $7418

;big_bag_uses         = $741F

; Player Data ($40 bytes)
Player_Data     = $7440
Ninten_Data     = Player_Data
Ana_Data        = $7480
Lloyd_Data      = $74C0
Teddy_Data      = $7500
Pippi_Data      = $7540
EVE_Data        = $7580
FlyingMan_Data  = $75C0

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

event_flags      = $7600
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


repel_counter = $7419

