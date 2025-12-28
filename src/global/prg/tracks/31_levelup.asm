mus_level_up_pulse1_intro:
.addr mus_level_up_pulse1_phrase01
.addr mus_level_up_pulse1_phrase02
mus_level_up_pulse1_loop:
.addr mus_level_up_pulse1_phrase03
.addr -1
.addr mus_level_up_pulse1_loop

mus_level_up_pulse2_intro:
.addr mus_level_up_pulse2_phrase01
mus_level_up_pulse2_loop:
.addr mus_level_up_pulse2_phrase02
.addr -1
.addr mus_level_up_pulse2_loop

mus_level_up_triangle_intro:
.addr mus_level_up_triangle_phrase01
mus_level_up_triangle_loop:
.addr mus_level_up_triangle_phrase02
.addr -1
.addr mus_level_up_triangle_loop

mus_level_up_pulse1_phrase02:
    .byte $9F,$0E,$F1
    Set_NLT NLT_18-Tempo_Lengths
    Note_Length nl_t_quarter
    Note_Rest

    Track_End

mus_level_up_pulse2_phrase02:
    .byte $9F,$0C,$F1
;fallthrough
mus_level_up_pulse1_phrase03:
    Note_Repeat 2
        Note_Length nl_quarter
        Note_C 6
        Note_G 6
        Note_E 5
    Note_End_Repeat

    Note_Repeat 2
        Note_C 6
        Note_G 6
        Note_F 5
    Note_End_Repeat

    Track_End

mus_level_up_triangle_phrase02:
    Note_Length nl_d_half
    Note_Rest

    Track_End
