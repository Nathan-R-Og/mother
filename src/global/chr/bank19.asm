.segment        "CHR9": absolute
        ;credits labels
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank19.bin",0,$1000
        .else
        incbinRange "../../split/us/chr/bank19.bin",0,$1000
        .endif

        ;leftover from JP, the tiles needed to construct the credits
        ;you can tell because it uses straight ascii for the (english) names, like JP
        ;for the localization, it seems like this half went untouched in favor of the end of bank27
        
        .include "../../src/jp/fontmap.asm"

        .repeat $288
        .byte 0
        .endrepeat

        ;DIRECTION
        .byte $5B,$5C,$5D,$5E,$5F

        .repeat $3B
        .byte 0
        .endrepeat

        .byte "SHIGESATO",0,"ITOI"

        .repeat $52
        .byte 0
        .endrepeat

        ;GAME DESIGN
        .byte $89,$8A,$8B,$8C,$8D,$8E

        .repeat $3A
        .byte 0
        .endrepeat

        .byte "SHIGESATO",0,"ITOI"
        .repeat $32
        .byte 0
        .endrepeat
        .byte "MIYUKI",0,"KURE"

        .repeat $37
        .byte 0
        .endrepeat

        ;?
        .byte $0A,02

        .repeat 6
        .byte 0
        .endrepeat

        ;?
        .byte $0A,02

        .repeat $54
        .byte 0
        .endrepeat

        ;MUSIC PRODUCE
        .byte $99,$9A,$9B,$9C,$9D,$9E,$9F

        .repeat $39
        .byte 0
        .endrepeat

        .byte "AKIO",0,"OHMORI"
        .repeat $35
        .byte 0
        .endrepeat
        .byte "RITSUO",0,"KAMIMURA"

        .repeat $51
        .byte 0
        .endrepeat

        ;MUSIC EFFECTS
        .byte $99,$9A,$9B,$AC,$AD,$AE,$AF

        .repeat $39
        .byte 0
        .endrepeat

        .byte "KEIICHI",0,"SUZUKI"
        .repeat $32
        .byte 0
        .endrepeat
        .byte "HIROKAZU",0,"TANAKA"

        .repeat $51
        .byte 0
        .endrepeat

        ;CHARACTER DESIGN
        .byte $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8

        .repeat $37
        .byte 0
        .endrepeat

        .byte "SHINBO",0,"MINAMI"
        .repeat $33
        .byte 0
        .endrepeat
        .byte "TATSUYA",0,"ISHII"

        .repeat $53
        .byte 0
        .endrepeat

        ;FIGURE MODELING
        .byte $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8

        .repeat $37
        .byte 0
        .endrepeat

        .byte "TOTTORI"

        .repeat $59
        .byte 0
        .endrepeat

        ;PROGRAM
        .byte $BA,$BB,$BC,$BD,$BE

        .repeat $35
        .byte 0
        .endrepeat

        ;? what is this stuff
        .byte $A0,$A0 
        
        .repeat $E
        .byte 0
        .endrepeat
        .byte $0A,$0A
        
        .repeat $E
        .byte 0
        .endrepeat
        .byte $0A,$0A,$02
        
        .repeat $5
        .byte 0
        .endrepeat
        
        .byte $A0,$A0,$20
        
        .repeat $D
        .byte 0
        .endrepeat

        .byte $0A,$0A
        
        .repeat $C
        .byte 0
        .endrepeat

        .byte "KAZUYA",0,"NAKATANI"
        .repeat $31
        .byte 0
        .endrepeat
        .byte "TAKAYUKI",0,"ONODERA"
        .repeat $30
        .byte 0
        .endrepeat
        .byte "MOTOO",0,"YASUMA"

        .repeat $54
        .byte 0
        .endrepeat

        ;SCENARIO ASSIST
        .byte $C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8

        .repeat $38
        .byte 0
        .endrepeat

        .byte "MASAYUKI",0,"KAMEYAMA"
        .repeat $2F
        .byte 0
        .endrepeat
        .byte "HIDEO",0,"KON"
        .repeat $37
        .byte 0
        .endrepeat
        .byte "KATSUTOMO",0,"MAEIWA"
        .repeat $30
        .byte 0
        .endrepeat
        .byte "KUNIKO",0,"SAKURAI"

        .repeat $52
        .byte 0
        .endrepeat

        ;CO-ORDINATE
        .byte $C9,$CA,$CB,$CC,$CD,$CE

        .repeat $3A
        .byte 0
        .endrepeat

        .byte "MASAHIRO",0,"TATEMOTO"
        .repeat $2F
        .byte 0
        .endrepeat
        .byte "TAKASHI",0,"KAWAGUCHI"
        .repeat $2F
        .byte 0
        .endrepeat
        .byte "KEIZOH",0,"KATOH"
        .repeat $34
        .byte 0
        .endrepeat
        .byte "MOTOHIRO",0,"ISHII"
        .repeat $32
        .byte 0
        .endrepeat
        .byte "AKIHITO",0,"TODA"

        .repeat $36
        .byte 0
        .endrepeat

        ;????????? please
        .byte $A0,$A0

        .repeat $16
        .byte 0
        .endrepeat

        .byte $A0,$20

        .repeat $24
        .byte 0
        .endrepeat

        .byte "YUKARI",0,"SAITOH"

        .repeat $53
        .byte 0
        .endrepeat

        ;PRODUCE
        .byte $D0,$D1,$D2,$D3
        
        .repeat $3C
        .byte 0
        .endrepeat

        .byte "SHIGERU",0,"MIYAMOTO"
        
        .repeat $50
        .byte 0
        .endrepeat

        ;EXECUTIVE PRODUCE
        .byte $90,$91,$92,$93,$94,$95,$96,$97,$98
        
        .repeat $37
        .byte 0
        .endrepeat

        .byte "HIROSHI",0,"YAMAUCHI"
        
        .repeat $AF
        .byte 0
        .endrepeat

        ;"PLAYER" (specifically with proper quote angling)
        .byte $1E,$83,$84,$85,$86,$87,$88,$1F
        
        .repeat $9C
        .byte 0
        .endrepeat

        ;the nintendo logo
        .repeat 2, ArgX
                .repeat $a, ArgI
                .byte ($D5 + ArgI) + ($20 * ArgX)
                .endrepeat
                .repeat $16
                .byte 0
                .endrepeat
        .endrepeat
        .byte $00,$F2,$F3,$F3,$F3,$F3,$F3,$F3,$F4,$00

        .repeat $12
        .byte 0
        .endrepeat

        ;TOKYO RESEARCH & DEVELOPMENT PRODUCTS
        .repeat $10, ArgX
        .byte $30 + ArgX
        .endrepeat
        .byte $7E, $7F


        .repeat $34
        .byte 0
        .endrepeat


        ;APE
        .repeat 7, ArgI
        .byte $07 + ArgI
        .endrepeat
        .repeat $19
        .byte 0
        .endrepeat
        .repeat 7, ArgI
        .byte $17 + ArgI
        .endrepeat
        .repeat $18
        .byte 0
        .endrepeat
        .repeat 9, ArgI
        .byte $26 + ArgI
        .endrepeat

        .repeat $2D
        .byte 0
        .endrepeat

        ;cant even end without garbage. cool man
        .byte $A0,$20

        .repeat $E
        .byte 0
        .endrepeat

        .byte $0A,$0A,$02

        .repeat 4
        .byte 0
        .endrepeat

        .byte $08,$0A,$0A

        .repeat 5
        .byte 0
        .endrepeat

        .byte $08,$0A,$0A

        .repeat 5
        .byte 0
        .endrepeat

        .byte $80

        .repeat 7
        .byte 0
        .endrepeat

        .byte $08,$0A,$FA,$FA,$3A,$02

        .repeat 4
        .byte 0
        .endrepeat

        .byte $0F,$0F,$03

        .repeat 2
        .byte 0
        .endrepeat
.code

