.segment        "CHR9": absolute
    ;credits labels
    .ifdef VER_JP
    .incbin "../../split/jp/chr/9/jp.bin"
    .else
    .incbin "../../split/us/chr/9/us.bin"
    .endif


    ;leftover from JP, the tiles needed to construct the credits
    ;you can tell because it uses straight ascii for the (english) names, like JP
    ;for the localization, it seems like this half went untouched in favor of the end of bank17

    ;force jp
    .ifndef VER_JP
    .include "../../src/jp/fontmap.asm"
    .endif

    .res $288, 0
    ;DIRECTION
    .byte $5B,$5C,$5D,$5E,$5F
    .res $3B, 0
    .byte "SHIGESATO",0,"ITOI"
    .res $52, 0
    ;GAME DESIGN
    .byte $89,$8A,$8B,$8C,$8D,$8E
    .res $3A, 0
    .byte "SHIGESATO",0,"ITOI"
    .res $32, 0
    .byte "MIYUKI",0,"KURE"
    .res $37, 0
    ;?
    .byte $0A,02
    .res 6, 0
    ;?
    .byte $0A,02
    .res $54, 0
    ;MUSIC PRODUCE
    .byte $99,$9A,$9B,$9C,$9D,$9E,$9F
    .res $39, 0
    .byte "AKIO",0,"OHMORI"
    .res $35, 0
    .byte "RITSUO",0,"KAMIMURA"
    .res $51, 0
    ;MUSIC EFFECTS
    .byte $99,$9A,$9B,$AC,$AD,$AE,$AF
    .res $39, 0
    .byte "KEIICHI",0,"SUZUKI"
    .res $32, 0
    .byte "HIROKAZU",0,"TANAKA"
    .res $51, 0
    ;CHARACTER DESIGN
    .byte $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8
    .res $37, 0
    .byte "SHINBO",0,"MINAMI"
    .res $33, 0
    .byte "TATSUYA",0,"ISHII"
    .res $53, 0
    ;FIGURE MODELING
    .byte $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8
    .res $37, 0
    .byte "TOTTORI"
    .res $59, 0
    ;PROGRAM
    .byte $BA,$BB,$BC,$BD,$BE
    .res $35, 0
    ;? what is this stuff
    .byte $A0,$A0
    .res $E, 0
    .byte $0A,$0A
    .res $E, 0
    .byte $0A,$0A,$02
    .res 5, 0
    .byte $A0,$A0,$20
    .res $D, 0
    .byte $0A,$0A
    .res $C, 0
    .byte "KAZUYA",0,"NAKATANI"
    .res $31, 0
    .byte "TAKAYUKI",0,"ONODERA"
    .res $30, 0
    .byte "MOTOO",0,"YASUMA"
    .res $54, 0
    ;SCENARIO ASSIST
    .byte $C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8
    .res $38, 0
    .byte "MASAYUKI",0,"KAMEYAMA"
    .res $2F, 0
    .byte "HIDEO",0,"KON"
    .res $37, 0
    .byte "KATSUTOMO",0,"MAEIWA"
    .res $30, 0
    .byte "KUNIKO",0,"SAKURAI"
    .res $52, 0
    ;CO-ORDINATE
    .byte $C9,$CA,$CB,$CC,$CD,$CE
    .res $3A, 0
    .byte "MASAHIRO",0,"TATEMOTO"
    .res $2F, 0
    .byte "TAKASHI",0,"KAWAGUCHI"
    .res $2F, 0
    .byte "KEIZOH",0,"KATOH"
    .res $34, 0
    .byte "MOTOHIRO",0,"ISHII"
    .res $32, 0
    .byte "AKIHITO",0,"TODA"
    .res $36, 0
    ;????????? please
    .byte $A0,$A0
    .res $16, 0
    .byte $A0,$20
    .res $24, 0
    .byte "YUKARI",0,"SAITOH"
    .res $53, 0
    ;PRODUCE
    .byte $D0,$D1,$D2,$D3
    .res $3C, 0
    .byte "SHIGERU",0,"MIYAMOTO"
    .res $50, 0
    ;EXECUTIVE PRODUCE
    .byte $90,$91,$92,$93,$94,$95,$96,$97,$98
    .res $37, 0
    .byte "HIROSHI",0,"YAMAUCHI"
    .res $AF, 0
    ;"PLAYER" (specifically with proper quote angling)
    .byte $1E,$83,$84,$85,$86,$87,$88,$1F
    .res $9C, 0
    ;the nintendo logo
    .repeat 2, ArgX
        .repeat $a, ArgI
            .byte ($D5 + ArgI) + ($20 * ArgX)
        .endrepeat
        .res $16, 0
    .endrepeat
    .byte $00,$F2,$F3,$F3,$F3,$F3,$F3,$F3,$F4,$00

    .res $12, 0

    ;TOKYO RESEARCH & DEVELOPMENT PRODUCTS
    .repeat $10, ArgX
        .byte $30 + ArgX
    .endrepeat
    .byte $7E, $7F

    .res $34, 0

    ;APE
    .repeat 7, ArgI
        .byte $07 + ArgI
    .endrepeat
    .res $19, 0
    .repeat 7, ArgI
        .byte $17 + ArgI
    .endrepeat
    .res $18, 0
    .repeat 9, ArgI
        .byte $26 + ArgI
    .endrepeat

    .res $2D, 0
    ;cant even end without garbage. cool man
    .byte $A0,$20
    .res $E, 0
    .byte $0A,$0A,$02
    .res 4, 0
    .byte $08,$0A,$0A
    .res 5, 0
    .byte $08,$0A,$0A
    .res 5, 0
    .byte $80
    .res 7, 0
    .byte $08,$0A,$FA,$FA,$3A,$02
    .res 4, 0
    .byte $0F,$0F,$03
    .res 2, 0

    ;restore if wasnt jp
    .ifndef VER_JP
    .include "../../src/us/fontmap.asm"
    .endif