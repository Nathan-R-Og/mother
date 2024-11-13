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
t_nop = 5

.define set_pos(tx,ty) $20,tx,ty
.define print_string(ta) $21,.LOBYTE(ta),.HIBYTE(ta)
.define repeatTile(ta,tb) $22,ta,tb
.define print_number(ta, tb) $23,.LOBYTE(ta),.HIBYTE(ta),tb

.define cashDeposit print_number $7415, 3, stopText
.define currentCash print_number $7412, 3, stopText
.define price print_number $002A, 2, stopText
.define damageAmount print_number $0590, 2, stopText
.define defenseStat print_number $0592, 2, stopText
.define lvHPPPinc print_number $005D, 1, stopText
.define lvFIGinc print_number $0058, 1, stopText
.define lvSPDinc print_number $0059, 1, stopText
.define lvWISinc print_number $005A, 1, stopText
.define lvSTRinc print_number $005B, 1, stopText
.define lvFORinc print_number $005C, 1, stopText
.define SMAAAAASH $97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F ; this isnt a command per se but this is helpful enough
.define user print_string $6D20
.define recipient print_string $6D24
.define result print_string $6d00
.define favFood print_string $7689
.define nintenName print_string $7478
.define lloydName print_string $74F8
.define anaName print_string $74B8
.define teddyName print_string $7538
.define partyLead print_string $670A
.define item print_string $6D04
.define playerName print_string $7420
.define attacker print_string $0580
.define beingAttacked print_string $0588
.define attackResult print_string $0590
.define unk set_pos $08, $06
.define unk2 set_pos $08, $07
.define unk3 repeatTile $A0, 16

;i cant charmap these :(
alpha = $BB ; α
beta  = $BC ; β
gamma = $BD ; γ
pi    = $BE ; π
omega = $BF ; Ω

.endif

