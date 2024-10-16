.segment        "PRGC": absolute

.include "../text_pointers.asm"

;???? padding??
.res $690, $FF

.include "../../global/starting_sram.asm"
.include "../../global/starting_characters.asm"

;anti-piracy
incbinRange "../../split/us/prg/bankc.bin", $2000, $28A4

;???? padding??
.res $F5C, $FF

;intro stuff
incbinRange "../../split/us/prg/bankc.bin", $3800, $3ae8


;ramOffset := $5800
gridWidth: .byte 16
gridHeight: .byte 6
moveTilesX: .byte 1
moveTilesY: .byte 2
controllerBits: .byte PAD_A | PAD_B | PAD_START
cursorSpriteTile: .byte $01
cursorInitX: .byte 8
cursorInitY: .byte 14
finalChoicersWidth: .byte 2
finalChoicersHeight: .byte 1
finalChoicersXMove: .byte 4
finalChoicersYMove: .byte 0
finalcontrollerBits: .byte PAD_A
finalcursorSpriteTile: .byte $3A
finalcursorInitX: .byte 12
finalcursorInitY: .byte 24
.byte   $FA
finalcontrollerBits2: .byte $62
    .byte   $01,$01,$01,$08,$40,$23
LBB00:  .byte   $C0,$FF,$00
;above here are variables or smth????? cursor control and whatever
.include "../fontmap.asm"

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
.byte   0,0,$A1,  0,0,0,0,0,0,$A2,0,0,0,0,0,0
.byte   0,0,  0,$A3,0,0,0,0,0,  0,0,0,0,0,0,0

;LA2A2 in bank c loads everything from $B800 to $FFFF into $6000 in ram to $6800
;L9AA2 in bank a loads this specifically, in ram at $64D0
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
IntroText2:
.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then.",stopText

.code