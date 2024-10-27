.include "../../global/objects/include.asm"
.include "../../global/objects/1.asm"

.segment        "PRG8_2": absolute

OBJ_BANK_POINTERS2:
.word OBJ_BANK_1A
.word OBJ_BANK_1B
.word $8675
.word $872F
.word $87E9
.word $88FB
.word $8A7B
.word $8DC5
.word $8FD5
.word $9285
.word $9385
.word $94D5
.word $964A
.word $9749
.word $990B
.word $9B86
.word $9C96

;twinkle elementary
.include "../../global/objects/2/bank1a.asm"

OBJ_BANK_1B:
.word OBJ_MYHOME_HOUSEDOOR
.word OBJ_MYHOME_HOUSESTAIRS
.word $8252
.word $8277
.word $827F
.word $8287
.word $828F
.word $8297
.word $829F
.word $82A7
.word $82CC
.word OBJ_MYHOME_MINNIEROOM_MINNIE
.word $8325
.word $838A
.word $83B8
.word $8426
.word $8458
.word $8471
.word $8499
.word $84D1
.word $8505
.word $857D
.word $85F5
.word $8603
.word $8610
.word $861D
.word $8651
.word $8659
.word 0

OBJ_MYHOME_HOUSEDOOR:
objectDef OBJ_TYPE::DOOR, $2E, DIRECTIONS::RIGHT, $86
doorArgDef 6, $B1, DIRECTIONS::DOWN, $13C
OBJ_MYHOME_HOUSESTAIRS:
objectDef OBJ_TYPE::STAIRS, $22, DIRECTIONS::LEFT, $85
doorArgDef 0, $22, DIRECTIONS::RIGHT, $E6

incbinRange "../../split/us/prg/bank8.bin",$2252,$22f9

OBJ_MYHOME_MINNIEROOM_MINNIE:
objectDef OBJ_TYPE::WANDERING_NPC, $274, DIRECTIONS::RIGHT, $3F6
;sprite
.word $867C
;disappear if on lower floor
.byte SCRIPTS::F_DISAPPEAR, $32
.byte SCRIPTS::J_TALK, OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOTTALKING-OBJ_MYHOME_MINNIEROOM_MINNIE
;flag $25 is whether or not you have beaten the lamp in her room
.byte SCRIPTS::FJ_JUMP, $25, OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOFLAGX25-OBJ_MYHOME_MINNIEROOM_MINNIE
;flag $26 is whether or not you have rid the ghosts
.byte SCRIPTS::FJ_JUMP, $26, OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOFLAGX26-OBJ_MYHOME_MINNIEROOM_MINNIE
.byte SCRIPTS::DIALOGUE
.word 4 ;MSG_MYHOME_JUICE
;they specifically check if you have item id 0 to see if you have room
.byte SCRIPTS::IJ_HASITEM, 0, OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOHAVE-OBJ_MYHOME_MINNIEROOM_MINNIE
.byte SCRIPTS::S_PLAYSOUND, 6
.byte SCRIPTS::I_PICKITEM, $3C
.byte SCRIPTS::J_GIVEITEM, OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOTTALKING-OBJ_MYHOME_MINNIEROOM_MINNIE
.byte 0
        OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOHAVE:
.byte SCRIPTS::DIALOGUE
.word $249
.byte 0
        OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOFLAGX26:
.byte SCRIPTS::DIALOGUE
.word 2 ;MSG_MYHOME_MINNIE_INVASION_FIGHT
.byte SCRIPTS::DIALOGUE
.word 3 ;MSG_MYHOME_MINNIE_INVASION_FIGHT_2
.byte 0
        OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOFLAGX25:
.byte SCRIPTS::DIALOGUE
.word UMSG::MYHOME_MINNIE_INVASION
        OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOTTALKING:
.byte 0

.incbin "../../split/us/prg/bank8.bin",$2325

