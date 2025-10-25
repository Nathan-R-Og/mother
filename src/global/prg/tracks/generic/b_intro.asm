mus_b_intro_pulse1:
    Set_Timbre 1, 24, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 1
    Note_Length nl_sixteenth
    Note_A 2
    Note_D 3
    Note_G 3
    Note_A 3
    Note_D 4
    Note_G 4
    Note_A 4
    Note_D 5

    Set_Timbre 1, 3, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 10
    Note_Length nl_half
    Note_G 5

    Track_End

mus_b_intro_pulse2:
    Set_Timbre 1, 24, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 1
    Note_Length nl_sixteenth
    Note_G 2
    Note_A 2
    Note_D 3
    Note_G 3
    Note_A 3
    Note_D 4
    Note_G 4
    Note_A 4

    Set_Timbre 1, 3, timbre_c_square SQTD_12_5, 1, SQTV_ISVOL, 10
    Note_Length nl_half
    Note_D 5

    Track_End

mus_b_intro_triangle:
    Set_Timbre 0, 10, timbre_c_triangle 0, 0
    Note_Length nl_sixteenth
    Note_D 3
    Note_G 3
    Note_A 3
    Note_D 4
    Note_G 4
    Note_A 4
    Note_D 5
    Note_G 5

    Set_Timbre 5, 0, timbre_c_triangle 0, 0
    Note_Length nl_half
    Note_A 5

    Track_End

mus_b_intro_noise:
    Note_Length nl_whole
    Noise_Rest

    Track_End
