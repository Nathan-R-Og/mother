.segment        "PRGC": absolute
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
.charmap $26, $A6 ;"
.charmap $27, $A7 ;' == $A7
.charmap $28, $A8 ;(
.charmap $29, $A9 ;)
.charmap $3A, $AA ;:
.charmap $2B, $AB ;;
.charmap $2C, $AC ;, == $AC
.charmap $2D, $AD ;-
.charmap $2E, $AE ;. == $AE
.charmap $2F, $AF ;/

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

stopText := 0
newLine := 1


.incbin "../split/prg/bankc.bin", 0, $3b03

;above here are variables or smth????? cursor control and whatever
NintenQuestion:
.byte   "What is this",newLine
.byte   "boy's name?",stopText
AnaQuestion:
.byte   "What is this",newLine
.byte   "girl's name?",stopText
LloydQuestion:
.byte   "This other",newLine
.byte   "boy's name?",stopText
TeddyQuestion:
.byte   "This last",newLine
.byte   "boy's name?",stopText
FoodQuestion:
.byte   "What is your",newLine
.byte   "favorite food?",stopText
ChangeName:
.byte   "Please change",newLine
.byte   "this name.",stopText
CharExists:
.byte   "A character in ",newLine
.byte   "this game has  ",newLine
.byte   "that name. Try ",newLine
.byte   "again, and use ",newLine
.byte   "only capital   ",newLine
.byte   "letters.       ",stopText
ExistEntries:
.byte   "Mary?",newLine
.byte   "Suzy?",newLine
.byte   "George?",newLine
.byte   "Maria?",newLine
.byte   "Mimmie?",newLine
.byte   "Minnie?",newLine
.byte   "Pippi?",newLine
.byte   "Duncan?",newLine
.byte   "Laura?",newLine
.byte   "Giegue?",newLine
.byte   "Abbott?",newLine
.byte   "Nancy?",newLine
.byte   "Ullrich",newLine
.byte   "Wally?",newLine
.byte   "Kelly?",newLine
.byte   "Juana?",newLine
.byte   " ",newLine
.byte   stopText

NameCharacters:
.byte   "ABCDEFG HIJKLMN",0
.byte   "OPQRSTU VWXYZ.'",0
.byte   "abcdefg hijklmn",0
.byte   "opqrstu vwxyz-:",0
;choicers
.byte   0,0,$A1,0,0,0,0,0,0,$A2,0,0,0,0,0,0
.byte   0,0,0,$A3,0,0,0,0,0,0,0,0,0,0,0,0

;LA2A2 in bank c loads everything from $B800 to $FFFF into $6000 in ram to $6800
;L9AA2 in bank a loads this specifically, in ram at $64D0
IntroText1_ram := IntroText1-$5800
IntroText1:
.byte   "In the early 1900's, a dark",newLine
.byte   "shadow covered a small",newLine
.byte   "country town in rural",newLine
.byte   "America.  At that time, a",newLine
.byte   "young married couple",newLine
.byte   "vanished mysteriously from",newLine
.byte   "their home.",newLine
.byte   " ",newLine
.byte   "The man's name was George,",newLine
.byte   "the woman's name was Maria.",newLine
.byte   " ",newLine
.byte   "Two years later, as suddenly",newLine
.byte   "as he left, George returned.",newLine
.byte   "He never told anyone where",newLine
.byte   "he had been or what he had",newLine
.byte   "done.  But, he began an odd",newLine
.byte   "study, all by himself.",newLine
.byte   " ",newLine
.byte   "As for Maria, his wife...",newLine
.byte   "She never returned.",stopText
IntroText2_ram := IntroText2-$5800
IntroText2:
.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then.",stopText

.code