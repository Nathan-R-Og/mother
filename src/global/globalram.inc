.globalzp is_scripted, is_tank, menucursor_pos
.global pad1_forced, pad2_forced
.global current_track
.global soundqueue, soundqueue_noise_sfx, soundqueue_pulse_sfx_g0, soundqueue_pulse_sfx_g1, soundqueue_triangle_sfx, soundqueue_track, soundactive, soundactive_noise_sfx, soundactive_pulse_sfx_g0, soundactive_pulse_sfx_g1, soundactive_triangle_sfx, soundactive_track
.global battle_message_lagframes

; zeropage global variables
is_scripted                 = $21
is_tank                     = $23

global_wordvar              = $2a


frame_counter               = $d0  ; 24 bit

pad1_forced                 = $da
pad2_forced                 = $db
pad1_press                  = $dc
pad2_press                  = $dd
pad1_hold                   = $de
pad2_hold                   = $df

nmi_flag                    = $ea ; 01 = waiting for NMI, 80 = is running NMI handler

irq_index                   = $ed ; IRQ routine index (multiple of 2)
bankswitch_mode             = $ee ; Bankswitch "mode"  (-----mmm), $8000 MMC3 register
bankswitch_flags            = $ef ; Bankswitch "flags" (ff------), $8000 MMC3 register
current_banks               = $f0 ; Current banks for each "mode" (8 bytes)

scroll_x                    = $fc
scroll_y                    = $fd
ram_PPUMASK                 = $fe
ram_PPUCTRL                 = $ff

; Position of menu cursor in whole numbers, incrementing by 1 per step
menucursor_pos              = $82
menu_x_pos                  = $86       ; X pos in whole numbers
menu_y_pos                  = $87       ; Y pos in whole numbers

; global variable that ignores controller input while set
input_blocker               = $EA


; Length    = 0x40 (64) bytes
; Area      = $0110 ~ $014F
; Zone where text data from CHR is stored to write into PPU
text_data_buffer    = $0110


; Pointers used by music engine
; Yes, there are spaces of 2 bytes between each ptr. As far as I can tell, they are completely useless and go unused. Grrr....
currptr_pulse0      = $0780     ; $0780 ~ 0781
currptr_pulse1      = $0784     ; $0784 ~ 0785
currptr_triangle    = $0788     ; $0787 ~ 0788
; Noise & DPCM ptr is read straight from MusicHeader
current_track       = $078C


; Music Engine Variables

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


; Length    = 3 bytes each
; Area      = $079A ~ $079F
ME_Envelopes            = $079a
    ME_Envelopes0       = ME_Envelopes
    ME_Envelopes1       = ME_Envelopes+3    ; $079D

; $07A0 = Unknown pointer (2 bytes per channel)
; $07A8 = Unknown offset (1 byte per channel)


; $07BC = Music channel loop counter
; $07C0 = Music channel sweep ($4001/$4005), not used for triangle and noise since sweep only exists for pulse

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


; $07CC = Current music ID (gets value from $07F5 minus one)

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

disable_dmc                     = $07F7         ; DMC disabled when set

; Same format as soundqueue. Holds the current playing SFX/Track until it ends. Almost all tracks don't "end," but loop a large number of times, so the value gets stuck in there, effectively making it a clone of curr_track_id
soundactive                     = $07F8
    soundactive_noise           = soundactive
    soundactive_pulseg0         = soundactive+1
    soundactive_triangle        = soundactive+3
    soundactive_pulseg1         = soundactive+4
    soundactive_track           = soundactive+5


; Save RAM variables
; response delay - stores no. of frames to lag after printing a battle msg
; anything not named speed 5 (1 frame lag) is unbearably slow
battle_message_responsedelay    = $7418

; ROM
ItemDataOffset = $9800