.segment        "CHRF": absolute

;random battle sprite pieces
incbinRange "../../split/us/chr/bank1f.bin", 0, $800

;this portion might be leftover from JP? jp uses this bank for this screen so it would make sense

;the same
incbinRange "../../split/us/chr/bank1f.bin", $800, $b03
;incbinRange "../../split/us/prg/bankc.bin", $3800, $3b03

.include "../fontmap.asm"

.byte   "What is this",newLine
.byte   "boy's name?"
.byte   stopText

.byte   "What is this",newLine
.byte   "girl's name?"
.byte   stopText

.byte   "This other",newLine
.byte   "boy's name?"
.byte   stopText

.byte   "This last",newLine
.byte   "boy's name?"
.byte   stopText

.byte   "What is your",newLine
.byte   "favorite food?"
.byte   stopText

.byte   "Please change",newLine
.byte   "this name."
.byte   stopText

.byte   "A character in ",newLine
.byte   "this game has  ",newLine
.byte   "that name. Try ",newLine
.byte   "again, and use ",newLine
.byte   "only capital   ",newLine
.byte   "letters.       "
.byte   stopText

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

.byte   "ABCDEFG HIJKLMN",0
.byte   "OPQRSTU VWXYZ.'",0
.byte   "abcdefg hijklmn",0
.byte   "opqrstu vwxyz-:",0
;choicers
.byte   0,0,$A1,  0,0,0,0,0,0,$A2,0,0,0,0,0,0
.byte   0,0,  0,$A3,0,0,0,0,0,  0,0,0,0,0,0,0

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

.byte   "80 years have passed",newLine
.byte   " ",newLine
.byte   "since then."
.byte   stopText

.res $160, $FF

;text gfx
.incbin "../../split/us/chr/bank1f.bin", $1000


.code

