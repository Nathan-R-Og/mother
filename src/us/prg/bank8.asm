.segment        "PRG8": absolute

OBJ_BANK_POINTERS1:
.word OBJ_BANK_0
.word OBJ_BANK_1
.word $83F6
.word $8609
.word $8831
.word $8BA9
.word $8D92
.word $8EE7
.word $9003
.word $920C
.word $9361
.word $9628
.word $9674
.word $9764
.word $98C2
.word $9950
.word $99B0
.word $99CA
.word $9A10
.word $9A1C
.word $9A54
.word $9B10
.word $9B12
.word $9B2C
.word $9CF9
.word $9E73

OBJ_BANK_0:
.word 0
.word 0

OBJ_BANK_1:
.word OBJ_BANK_1_OBJ1
.word $8084
.word $808C
.word $8094
.word $809A
.word $80A0
.word $80D0
.word $80ED
.word $8158
.word $8184
.word $8190
.word $81C3
.word $81DD
.word $81E8
.word $81F3
.word $81FE
.word $8209
.word $8214
.word $821F
.word $822A
.word $825C
.word $8265
.word $8270
.word $827C
.word $8288
.word $8290
.word $82BF
.word $82E8
.word $8357
.word $837F
.word $838D
.word $83E2
.word $83EA
.word 0

.enum OBJ_TYPE
        NULL = 0
        DOOR = 1
        DOOR_UNK = 2
        STAIRS = 3
        HOLE = 4
        WANDERING_NPC = $15
.endenum

.enum DIRECTIONS
        UP = 0
        UP_RIGHT ;1
        RIGHT ;2
        DOWN_RIGHT ;3
        DOWN ;4
        DOWN_LEFT ;5
        LEFT ;6
        UP_LEFT ;7
        IN_PLACE ;8
.endenum

.enum SCRIPTS
        F_DISAPPEAR = 5 ;disappear if f == 1
        DIALOGUE = 8 ;display dialogue from msg_pointerlist
        J_TALK = 10 ;jump to j if not talking
        RESET = 15 ;reset the nes
        FJ_JUMP = 18 ;jump to j if f == 0
        I_PICKITEM = $25 ;load i into selected item
        IJ_HASITEM = $27 ;jump to j if i not in inventory
        J_GIVEITEM = $2D ;jump to j if inventory full. else give selected item
        S_PLAYSOUND = $5C ;play s
.endenum

.macro objectDef type, posX, direction, posY
        .word (posX << 6) | type
        .word (posY << 6) | direction
.endmacro

.macro doorArgDef music, targetPosX, targetDirection, targetPosY
        .word (targetPosX << 6) | music
        .word (targetPosY << 6) | targetDirection
.endmacro

OBJ_BANK_1_OBJ1:
objectDef OBJ_TYPE::DOOR, $B1, DIRECTIONS::UP, $13B
doorArgDef $12, $2D, DIRECTIONS::LEFT, $86


incbinRange "../../split/us/prg/bank8.bin",$84,$2000

OBJ_BANK_POINTERS2:
.word OBJB_BANK_UNK-$2000
.word OBJB_MYHOME-$2000
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

OBJB_BANK_UNK:
.word OBJ_BANK_UNK_OBJ1-$2000
.word $8064
.word $806C
.word $8074
.word $807C
.word $8084
.word $808C
.word $80B2
.word $80BA
.word $80C2
.word $80CA
.word $80D2
.word $80DA
.word $80E2
.word $80EA
.word $80F2
.word $811A
.word $8122
.word $812A
.word $8132
.word $813A
.word $8146
.word $8160
.word $8173
.word $8188
.word $819D
.word $81D2
.word $81EE
.word 0

OBJ_BANK_UNK_OBJ1:
incbinRange "../../split/us/prg/bank8.bin",$205C,$2208

OBJB_MYHOME:
.word OBJ_MYHOME_HOUSEDOOR-$2000
.word OBJ_MYHOME_HOUSESTAIRS-$2000
.word $8252
.word $8277
.word $827F
.word $8287
.word $828F
.word $8297
.word $829F
.word $82A7
.word $82CC
.word OBJ_MYHOME_MINNIEROOM_MINNIE-$2000
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
.word 1 ;MSG_MYHOME_MINNIE_INVASION
        OBJ_MYHOME_MINNIEROOM_MINNIE_J_NOTTALKING:
.byte 0

.incbin "../../split/us/prg/bank8.bin",$2325


.code

