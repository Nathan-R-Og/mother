.segment        "PRG19": absolute

;different segment?
;anti-piracy
.incbin "../../split/us/antipiracy.bin"

;???? padding??
.res $F5C, $FF

;different segment?
rts_1:
  tay
  beq beq_1
  ldy #$04
  beq_1:
  lda $6222,Y
  sta $0584,X
  lda $6223,Y
  sta $0585,X
  lda $6224,Y
  sta $0586,X
  lda $6225,Y
  sta $0587,X
  rts

rts_2:
  lda $6073,X
  sta $74
  lda $6074,X
  sta $75
  rts

rts_3:
  lda $6085,X
  sta $80
  lda $6086,X
  sta $81
  rts

rts_4:
  lda #$FF
  sta $D6
  ldx #$06
  ldy #$05
  stx $76
  sty $77
  rts

rts_5:
  ;stash
  pha

  lda #0
  ldx #$74
  sta $30
  stx $31

  lda #0
  ldx #$BE
  sta $32
  stx $33

  ;2 $FF copies
  ldx #2
  ldy #0
  bne_1:
  lda ($32),Y
  sta ($30),Y
  iny
  bne bne_1
  inc $31
  inc $33
  dex
  bne bne_1

  ;clear $FF
  lda #0
  bne_2:
  sta ($30),Y
  iny
  bne bne_2

  ;pop
  pla
  ora $7402
  sta $7402
  rts


;intro stuff
.incbin "../../split/us/prg/bank19/unk1800.bin", $73

;$80 == letterSetup and $84 == NameCharacters
letterSetup:
;the width and height are array dimensions
gridWidth: .byte 16
gridHeight: .byte 6
moveTilesX: .byte 1
moveTilesY: .byte 2
controllerBits: .byte PAD_A | PAD_B | PAD_START
cursorSpriteTile: .byte $01
cursorInitX: .byte 8
cursorInitY: .byte 14

;$80 == finalSetup and $84 == finalChoicers
finalSetup:
;the width and height are array dimensions
finalChoicersWidth: .byte 2
finalChoicersHeight: .byte 1
finalChoicersXMove: .byte 4
finalChoicersYMove: .byte 0
finalcontrollerBits: .byte PAD_A
finalcursorSpriteTile: .byte $3A
finalcursorInitX: .byte 12
finalcursorInitY: .byte 24

.word   finalChoicers
;setting a choicer to 0 makes it unavailable
;if all are 0, it is completely skipped
;fairly certain unless there is implementation, the value itself
;is completely discarded
finalChoicers:
.byte 1
.byte 1

.byte 1
;these are wrote to $0400
;used to access the jumptable at bank 1f, $18c1
.byte 8
;amount of times to draw tile (set to reg x)
.byte $40
;vram addr set (set to reg a, sent to ppuaddr)
.byte $23,$C0
;tile (sent to ppudata)
.byte $FF
;some flag???
.byte 0

.include "../fontmap.asm"

NintenQuestion:
.byte   "What is this",newLine
.byte   "boy's name?"
.byte   stopText
AnaQuestion:
.byte   "What is this",newLine
.byte   "girl's name?"
.byte   stopText
LloydQuestion:
.byte   "This other",newLine
.byte   "boy's name?"
.byte   stopText
TeddyQuestion:
.byte   "This last",newLine
.byte   "boy's name?"
.byte   stopText
FoodQuestion:
.byte   "What is your",newLine
.byte   "favorite food?"
.byte   stopText
ChangeName:
.byte   "Please change",newLine
.byte   "this name."
.byte   stopText
CharExists:
.byte   "A character in ",newLine
.byte   "this game has  ",newLine
.byte   "that name. Try ",newLine
.byte   "again, and use ",newLine
.byte   "only capital   ",newLine
.byte   "letters.       "
.byte   stopText

;newLine decides the end of the entry
;the question marks are only needed to prevent an
;inclusive search
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
.byte   "She never returned."
.byte   stopText
IntroText2:
.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then."
.byte   stopText
