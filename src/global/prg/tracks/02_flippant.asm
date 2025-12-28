; music::b_flippant pulse1 pointers
mus_b_flippant_pulse1:
    .addr mus_b_intro_pulse1 ; 00
    mus_b_flippant_pulse1_loop:
    .addr mus_b_flippant_pulse1_phrase01 ; 01
    .addr -1
    .addr mus_b_flippant_pulse1_loop

; music::b_flippant pulse2 pointers
mus_b_flippant_pulse2:
    .addr mus_b_intro_pulse2 ; 00
    mus_b_flippant_pulse2_loop:
    .addr mus_b_flippant_pulse2_phrase01 ; 01
    .addr mus_b_flippant_pulse2_phrase02 ; 02
    .addr -1
    .addr mus_b_flippant_pulse2_loop

; music::b_flippant triangle pointers
mus_b_flippant_triangle:
    .addr mus_b_intro_triangle ; 00
    mus_b_flippant_triangle_loop:
    .addr mus_b_intro_triangle_phrase01 ; 01
    .addr mus_b_intro_triangle_phrase02 ; 02
    .addr mus_b_intro_triangle_phrase01 ; 03
    .addr mus_b_intro_triangle_phrase01 ; 04
    .addr mus_b_intro_triangle_phrase02 ; 05
    .addr mus_b_intro_triangle_phrase03 ; 06
    .addr -1
    .addr mus_b_flippant_triangle_loop

; music::b_flippant noise pointers
mus_b_flippant_noise:
    .addr mus_b_intro_noise ; 00
    mus_b_flippant_noise_loop:
    .addr mus_b_flippant_noise_phrase01 ; 01
    .addr -1
    .addr mus_b_flippant_noise_loop





mus_b_flippant_pulse1_phrase01:
    Set_Timbre 0, 19, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 1
    Set_NLT NLT_00-Tempo_Lengths

; measures 1-4
    Note_Repeat 2
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_sixteenth
        Note_D 4
        Note_Length nl_quarter
        Note_Rest
        Note_Length nl_sixteenth
        Note_D 4
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_quarter
        Note_Rest
        Note_Length nl_sixteenth
        Note_D 4
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_d_half
        Note_Rest
    Note_End_Repeat

; measures 5-8
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_whole
    Note_G 3
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_d_half
    Note_Rest
    Note_Length nl_whole
    Note_Rest
    Note_Rest

; measures 9-12
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_F 4
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_sixteenth
    Note_F 4
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 4
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 4
    Note_Length nl_quarter
    Note_Rest

    Note_Length nl_whole
    Note_E 4
    Note_Rest

; measures 13-20
    Note_Repeat 2
        Note_Length nl_eighth
        Note_C 4
        Note_Rest
        Note_G 4
        Note_Rest
        Note_E 4
        Note_Rest
        Note_G 4
        Note_Rest
        Note_D 4
        Note_Rest
        Note_Length nl_d_eighth
        Note_E 4
        Note_Length nl_sixteenth
        Note_E 4
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_sixteenth
        Note_AS 3
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_sixteenth
        Note_DS 4

        Note_Length nl_eighth
        Note_C 4
        Note_Rest
        Note_C 4
        Note_Rest
        Note_C 4
        Note_Rest
        Note_C 4
        Note_Rest
        Note_C 4
        Note_Rest
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_half
        Note_E 3
        Note_Length nl_sixteenth
        Note_Rest
    Note_End_Repeat

; measures 21-24
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 3
    Note_Length nl_quarter
    Note_Rest
    Note_DS 3
    Note_DS 3
    Note_Length nl_sixteenth
    Note_DS 3
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 3
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 3

    Note_Length nl_eighth
    Note_E 3
    Note_Rest
    Note_E 3
    Note_Rest
    Note_E 3
    Note_Rest
    Note_Rest
    Note_Rest
    Note_Length nl_d_eighth
    Note_E 3
    Note_Length nl_sixteenth
    Note_E 3
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_half
    Note_E 3

; measures 25-28
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_quarter
    Note_F 3
    Note_Length nl_sixteenth
    Note_D 4
    Note_Length nl_eighth
    Note_B 3
    Note_Rest
    Note_F 4
    Note_Rest
    Note_A 3
    Note_Rest
    Note_D 4
    Note_Rest
    Note_Length nl_d_eighth
    Note_C 4
    Note_Length nl_sixteenth
    Note_D 4
    Note_Length nl_quarter
    Note_Rest

    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_A 3
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_eighth
    Note_AS 3
    Note_Rest
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_eighth
    Note_A 3
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_B 3
    Note_Length nl_half
    Note_Rest

; measures 29-32
    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_E 4
        Note_E 4
        Note_E 4
        Note_Length nl_thirtysecond ; two-frame allignment correction
        Note_Rest
        Note_Length nl_quarter
        Note_E 4
        Note_Rest
    Note_End_Repeat

    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_E 4
        Note_Length nl_sixtyfourth ; one-frame allignment correction
        Note_Rest
        Note_Length nl_t_quarter
        Note_E 4
        Note_Length nl_sixtyfourth
        Note_Rest
        Note_Length nl_t_quarter
        Note_E 4
    Note_End_Repeat
    Note_Length nl_quarter
    Note_E 4
    Note_Rest
    Note_E 4
    Note_Rest

    Track_End






mus_b_flippant_pulse2_phrase01:
    Set_Timbre 0, 21, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 1

; measures 1-4
    Note_Repeat 2
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_sixteenth
        Note_AS 3
        Note_Length nl_quarter
        Note_Rest
        Note_Length nl_sixteenth
        Note_AS 3
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_quarter
        Note_Rest
        Note_Length nl_sixteenth
        Note_AS 3
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_d_half
        Note_Rest
    Note_End_Repeat

; measures 5-8
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_whole
    Note_DS 3
    Note_Length nl_sixteenth
    Note_Rest
    Note_Length nl_d_half
    Note_Rest
    Note_Length nl_whole
    Note_Rest
    Note_Rest

; measures 9-12
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 3
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 3
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_sixteenth
    Note_D 3
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 3
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_whole
    Note_AS 3
    Note_Length nl_d_half
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_DS 4

    Track_End

; measures 13-20
mus_b_flippant_pulse2_phrase02:
    Note_Repeat 2
        Note_Length nl_eighth
        Note_E 4
        Note_Rest
        Note_G 4
        Note_Rest
        Note_A 4
        Note_Rest
        Note_G 4
        Note_Rest
        Note_AS 4
        Note_Rest
        Note_Length nl_d_eighth
        Note_A 4
        Note_Length nl_sixteenth
        Note_G 4
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_sixteenth
        Note_D 4
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_sixteenth
        Note_DS 4

        Note_Length nl_eighth
        Note_E 4
        Note_Rest
        Note_G 4
        Note_Rest
        Note_A 4
        Note_Rest
        Note_G 4
        Note_Rest
        Note_E 4
        Note_Rest
        Note_Length nl_d_eighth
        Note_Rest
        Note_Length nl_half
        Note_AS 3
        Note_Length nl_sixteenth
        Note_Rest
    Note_End_Repeat

; measures 21-24
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_C 4
    Note_Length nl_quarter
    Note_Rest
    Note_C 4
    Note_A 3
    Note_Length nl_sixteenth
    Note_C 4
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_d_eighth
    Note_A 3
    Note_Length nl_sixteenth
    Note_DS 4
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 3

    Note_Length nl_eighth
    Note_A 3
    Note_Rest
    Note_C 4
    Note_Rest
    Note_C 4
    Note_Rest
    Note_A 3
    Note_Rest
    Note_Length nl_d_eighth
    Note_G 3
    Note_Length nl_sixteenth
    Note_A 3
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_half
    Note_AS 3

; measures 25-28
    Note_Length nl_d_eighth
    Note_Rest

    Note_Length nl_sixteenth
    Note_AS 3
    Note_Length nl_d_eighth
    Note_B 3
    Note_Length nl_sixteenth
    Note_D 4
    Note_Length nl_eighth
    Note_G 4
    Note_Rest
    Note_F 4
    Note_Rest
    Note_DS 4
    Note_Rest
    Note_D 4
    Note_Rest
    Note_Length nl_d_eighth
    Note_C 4
    Note_Length nl_sixteenth
    Note_D 4
    Note_Length nl_quarter
    Note_Rest

    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_E 4
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_eighth
    Note_E 4
    Note_Rest
    Note_Length nl_quarter
    Note_Rest
    Note_Length nl_eighth
    Note_F 4
    Note_Rest
    Note_Length nl_d_eighth
    Note_Rest
    Note_Length nl_sixteenth
    Note_G 4
    Note_Length nl_half
    Note_Rest

; measures 29-32
    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_AS 3
        Note_AS 3
        Note_AS 3
        Note_Length nl_thirtysecond ; two-frame allignment correction
        Note_Rest
        Note_Length nl_quarter
        Note_AS 3
        Note_Rest
    Note_End_Repeat

    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_AS 3
        Note_Length nl_sixtyfourth ; one-frame allignment correction
        Note_Rest
        Note_Length nl_t_quarter
        Note_AS 3
        Note_Length nl_sixtyfourth
        Note_Rest
        Note_Length nl_t_quarter
        Note_AS 3
    Note_End_Repeat
    Note_Length nl_quarter
    Note_AS 3
    Note_Rest
    Note_AS 3
    Note_Rest

    Track_End





; measures 1-4, 13-20
mus_b_intro_triangle_phrase01:
    Set_Timbre 0, 0, 0
    Note_Repeat 2
        Note_Length nl_d_eighth
        Note_C 4
        Note_Length nl_sixteenth
        Note_C 4
        Note_Length nl_quarter
        Note_AS 3
        Note_A 3
        Note_GS 3
        Note_G 3
        Note_FS 3
        Note_F 3
        Note_E 3
    Note_End_Repeat

    Track_End

; measures 5-12, 21-28
mus_b_intro_triangle_phrase02:
    Note_Length nl_d_eighth
    Note_F 3
    Note_Length nl_sixteenth
    Note_F 3
    Note_Length nl_quarter
    Note_DS 3
    Note_D 3
    Note_GS 3
    Note_A 3
    Note_D 3
    Note_G 3
    Note_DS 3
    Note_Length nl_d_eighth
    Note_C 3
    Note_Length nl_sixteenth
    Note_C 3
    Note_Length nl_quarter
    Note_DS 3
    Note_E 3
    Note_G 3
    Note_AS 3
    Note_A 3
    Note_G 3
    Note_E 3

    Note_G 3
    Note_B 3
    Note_D 4
    Note_Length nl_d_eighth
    Note_B 3
    Note_Length nl_sixteenth
    Note_B 3
    Note_Length nl_quarter
    Note_F 3
    Note_DS 4
    Note_D 4
    Note_CS 4
    Note_Length nl_d_eighth
    Note_C 4
    Note_Length nl_sixteenth
    Note_C 4
    Note_Length nl_quarter
    Note_AS 3
    Note_A 3
    Note_GS 3
    Note_G 3
    Note_A 3
    Note_AS 3
    Note_B 3

    Track_End

; measures 29-32
mus_b_intro_triangle_phrase03:
    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_C 4
        Note_C 4
        Note_C 4
        Note_Length nl_thirtysecond ; two-frame allignment correction
        Note_Rest
        Note_Length nl_quarter
        Note_C 4
        Note_Rest
    Note_End_Repeat

    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_C 4
        Note_C 4
        Note_C 4
        Note_Length nl_thirtysecond ; two-frame allignment correction
        Note_Rest
    Note_End_Repeat
    Note_Length nl_quarter
    Note_C 4
    Note_Rest
    Note_C 4
    Note_Rest

    Track_End





; measures 1-28
mus_b_flippant_noise_phrase01:
    Note_Repeat 28
        Note_Length nl_d_eighth
        Note_Noise 0, 4
        Note_Length nl_sixteenth
        Note_Noise 0, 4
        Note_Length nl_quarter
        Note_Noise 0, 7
        Note_Length nl_d_eighth
        Note_Noise 0, 4
        Note_Length nl_sixteenth
        Note_Noise 0, 4
        Note_Length nl_quarter
        Note_Noise 0, 7
    Note_End_Repeat

; measures 29-32
    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_Noise 0, 7
        Note_Noise 0, 7
        Note_Noise 0, 7
        Note_Length nl_thirtysecond ; two-frame allignment correction
        Noise_Rest
        Note_Length nl_quarter
        Note_Noise 0, 7
        Noise_Rest
    Note_End_Repeat

    Note_Repeat 2
        Note_Length nl_t_quarter
        Note_Noise 0, 7
        Note_Length nl_sixtyfourth ; one-frame allignment correction
        Note_Noise 0, 2
        Note_Length nl_t_quarter
        Note_Noise 0, 7
        Note_Length nl_sixtyfourth ; one-frame allignment correction
        Note_Noise 0, 2
        Note_Length nl_t_quarter
        Note_Noise 0, 7
    Note_End_Repeat

    Note_Length nl_quarter
    Note_Noise 0, 7
    Noise_Rest
    Note_Noise 0, 7
    Noise_Rest

    Track_End
