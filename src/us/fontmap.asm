;this helps us even use quotes in the first place.
;if a better method if found (escapes dont work), deprecate this.
.FEATURE loose_string_term

.charmap $41, $C1 ;A == $C1
.charmap $42, $C2 ;B == $C2
.charmap $43, $C3 ;C == $C3
.charmap $44, $C4 ;D == $C4
.charmap $45, $C5 ;E == $C5
.charmap $46, $C6 ;F == $C6
.charmap $47, $C7 ;G == $C7
.charmap $48, $C8 ;H == $C8
.charmap $49, $C9 ;I == $C9
.charmap $4A, $CA ;J == $CA
.charmap $4B, $CB ;K == $CB
.charmap $4C, $CC ;L == $CC
.charmap $4D, $CD ;M == $CD
.charmap $4E, $CE ;N == $CE
.charmap $4F, $CF ;O == $CF
.charmap $50, $D0 ;P == $D0
.charmap $51, $D1 ;Q == $D1
.charmap $52, $D2 ;R == $D2
.charmap $53, $D3 ;S == $D3
.charmap $54, $D4 ;T == $D4
.charmap $55, $D5 ;U == $D5
.charmap $56, $D6 ;V == $D6
.charmap $57, $D7 ;W == $D7
.charmap $58, $D8 ;X == $D8
.charmap $59, $D9 ;Y == $D9
.charmap $5A, $DA ;Z == $DA

.charmap $61, $E1 ;a == $E1
.charmap $62, $E2 ;b == $E2
.charmap $63, $E3 ;c == $E3
.charmap $64, $E4 ;d == $E4
.charmap $65, $E5 ;e == $E5
.charmap $66, $E6 ;f == $E6
.charmap $67, $E7 ;g == $E7
.charmap $68, $E8 ;h == $E8
.charmap $69, $E9 ;i == $E9
.charmap $6A, $EA ;j == $EA
.charmap $6B, $EB ;k == $EB
.charmap $6C, $EC ;l == $EC
.charmap $6D, $ED ;m == $ED
.charmap $6E, $EE ;n == $EE
.charmap $6F, $EF ;o == $EF
.charmap $70, $F0 ;p == $F0
.charmap $71, $F1 ;q == $F1
.charmap $72, $F2 ;r == $F2
.charmap $73, $F3 ;s == $F3
.charmap $74, $F4 ;t == $F4
.charmap $75, $F5 ;u == $F5
.charmap $76, $F6 ;v == $F6
.charmap $77, $F7 ;w == $F7
.charmap $78, $F8 ;x == $F8
.charmap $79, $F9 ;y == $F9
.charmap $7A, $FA ;z == $FA

;symbols

.charmap $20, $A0 ;" " == $A0
.charmap $21, $A1 ;!
.charmap $3F, $A2 ;?
.charmap $23, $A3 ;..
.charmap $24, $A4 ;$
.charmap $25, $A5 ;.
.charmap $22, $A6 ;"
.charmap $27, $A7 ;' == $A7
.charmap $28, $A8 ;(
.charmap $29, $A9 ;)
.charmap $3A, $AA ;:
.charmap $2B, $AB ;;
.charmap $2C, $AC ;, == $AC
.charmap $2D, $AD ;-
.charmap $2E, $AE ;. == $AE
.charmap $2F, $AF ;/
.charmap $2A, $C0 ;* == $C0 (is technically ◆, but can't be typed/is too big)
.charmap $3E, $FF ;> == $FF (is technically ▶, but can't be typed/is too big)
;also, > is specifically hardcoded for enemy CHECK listings. otherwise i wouldnt have put it here

;numbers
.charmap $30, $B0 ;0 == $B0
.charmap $31, $B1 ;1 == $B1
.charmap $32, $B2 ;2 == $B2
.charmap $33, $B3 ;3 == $B3
.charmap $34, $B4 ;4 == $B4
.charmap $35, $B5 ;5 == $B5
.charmap $36, $B6 ;6 == $B6
.charmap $37, $B7 ;7 == $B7
.charmap $38, $B8 ;8 == $B8
.charmap $39, $B9 ;9 == $B9


;manual defines
.ifndef stopText
;insertion codes
;https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings/TBL#Text_Commands
stopText = 0
newLine = 1
waitThenOverwrite = 2
pauseText = 3
.define cashDeposit $23,$15,$74,pauseText,stopText
.define currentCash $23,$12,$74,pauseText,stopText
.define price $23,$2A,stopText,waitThenOverwrite,stopText
.define damageAmount $23,$90,$05,waitThenOverwrite,stopText
.define defenseStat $23,$92,$05,waitThenOverwrite,stopText
.define lvHPPPinc $23,$5D,stopText,newLine,stopText
.define lvFIGinc $23,$58,stopText,newLine,stopText
.define lvSPDinc $23,$59,stopText,newLine,stopText
.define lvWISinc $23,$5A,stopText,newLine,stopText
.define lvSTRinc $23,$5B,stopText,newLine,stopText
.define lvFORinc $23,$5C,stopText,newLine,stopText
.define SMAAAAASH $97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F ; this isnt a command per se but this is helpful enough
.define user $21,$20,$6D
.define recipient $21,$24,$6D
.define result $21,$00,$6d
.define favFood $21,$89,$76
.define nintenName $21,$78,$74
.define lloydName $21,$F8,$74
.define anaName $21,$B8,$74
.define teddyName $21,$38,$75
.define partyLead $21,$0A,$67
.define item $21,$04,$6D
.define playerName $21,$20,$74
.define attacker $21,$80,$05
.define beingAttacked $21,$88,$05
.define attackResult $21,$90,$05
.define unk $20,$08,$06
.define unk2 $20,$08,$07
.define unk3 $22,$A0,$10

;i cant charmap these :(
alpha = $BB ; α
beta  = $BC ; β
gamma = $BD ; γ
pi    = $BE ; π
omega = $BF ; Ω

.endif

