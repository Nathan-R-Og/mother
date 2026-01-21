;this helps us even use quotes in the first place.
;if a better method is found (escapes dont work), deprecate this.
.feature loose_string_term

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

.define goto(ta) 4,.LOBYTE(ta),.HIBYTE(ta)
.define set_pos(tx,ty) $20,tx,ty
.define print_string(ta) $21,.LOBYTE(ta),.HIBYTE(ta)
.define repeatTile(ta,tb) $22,ta,tb
.define print_number(ta, tb, tc) $23,.LOBYTE(ta),.HIBYTE(ta),tb,tc

.define price print_number $2A, 2, 0
.define lvFIGinc print_number $58, 1, 0
.define lvSPDinc print_number $59, 1, 0
.define lvWISinc print_number $5A, 1, 0
.define lvSTRinc print_number $5B, 1, 0
.define lvFORinc print_number $5C, 1, 0
.define lvHPPPinc print_number $5D, 1, 0
.define attacker print_string $580
.define beingAttacked print_string $588
.define attackResult print_string $590
.define damageAmount print_number $590, 2, 0
.define defenseStat print_number $592, 2, 0
.define partyLead print_string $670A
.define result print_string $6d00
.define item print_string $6D04
.define user print_string $6D20
.define recipient print_string $6D24
.define currentCash print_number $7412, 3, 0
.define cashDeposit print_number $7415, 3, 0
.define playerName print_string $7420
.define nintenName print_string Ninten_Data+party_info::name
.define lloydName print_string Lloyd_Data+party_info::name
.define anaName print_string Ana_Data+party_info::name
.define teddyName print_string Teddy_Data+party_info::name
.define favFood print_string $7689
.define SMAAAAASH $97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F ; this isnt a command per se but this is helpful enough


;i cant charmap these :(
music_note = $96 ;
dot_tile = $a5 ;
alpha = $BB ; α
beta  = $BC ; β
gamma = $BD ; γ
pi    = $BE ; π
omega = $BF ; Ω
c00 = $BA ; 00. even if i could i dont know how to do it
arrow = $E0

;top
uibox_tl = $DB
uibox_t = $DC
uibox_tr = $DD
uibox_tc = $FE ;version cut off (save menus and whatnot)

;middle
;(problem area)
uibox_l = $24 ;is actually $DE
uibox_r = $25 ;is actually $DF

;middle
;(For real this time)
uibox_l_r = $DE
uibox_r_r = $DF

;bottom
uibox_bl = $FB
uibox_b = $FC
uibox_br = $FD

radial_empty = $94
radial_filled = $95

.endif

