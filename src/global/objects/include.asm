.ifndef obj_incs
obj_incs = 0

;jp uses the raw pointers for messages, and has no pointer list

;depending on version...
;JP:
;UMSG_list is generated from all instances of MSG_ labels in dialogue files.
;more files may need to be specified, but for now this should be fine.
;US:
;UMSG_list is generated from the pointer list, since that's what gets accessed.
;pretty straightforward tbh

;the version is then .ifdef'd during build to get a generated output that works with the version you chose
;tldr, if you build US you will be using the pointer list, and if you build JP you don't!
;either way, you still access them the same! isnt that fun

;this system might be incredibly fucked but it gets the job done. feel free to make better™
;UMSG stands for Use Message by the way. or at least it did. could be Universal now. idk
.include "../../build_artifacts/global/UMSG_list.asm"

.enum OBJ_TYPE
        NULL = 0
        DOOR = 1
        DOOR_UNK = 2
        STAIRS = 3
        HOLE = 4
        STATIONARY_NPC2 = $10
        WANDERING_NPC2 = $11
        WANDERINGFAST_NPC = $12
        SPINNING_NPC = $13
        WANDERING_NPC = $15
        TRIGGER = $1B
        FLAGSET_SEE = $29 ;sets a flag in a byte when on screen. uses teleportFlagDef
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
        J_JUMP = 1 ;just jump
        OJ_SUBROUTINE = 2 ;call pointer j of object o
        RETURN = 3 ;return from subroutine
        T_DELAY = 4 ;delay for t frames
        F_DISAPPEAR = 5 ;disappear if f == 1
        F_APPEAR = 6 ;appear if f == 1
        DIALOGUE = 8 ;display dialogue from msg_pointerlist
        J_YESNO = 9;ask yes or no, jump if no/b
        J_TALK = $a ;jump to j if not talking
        J_CHECK = $b ;jump to j if not checking
        PJ_USE = $C ;jump to j if not using psi p
        IJ_USE = $d ;jump to j if not using this item
        RESET = $f ;reset the nes
        F_SETFLAG = $10 ;set flag f
        F_CLEARFLAG = $11 ;clear flag f
        FJ_JUMP = $12 ;jump to j if f == 0
        C_DECCOUNTER = $13 ;decrements counter c
        C_INCCOUNTER = $14 ;increments counter c
        C_RESETCOUNTER = $15 ;resets counter c
        CNJ_COMPCOUNTER = $16 ;jumps to j if counter c < int n
        J_CHOOSECHAR = $18 ;choose character, jump if b pressed
        C_SELECT = $19 ;select character
        CJ_CHARSELECTED = $1A ;jump to j if chararacter c not selected
        J_NONEWMONEY = $1B ;jump to j if no money has been gained since last call
        N_LOADNUMBER = $1D ;load number ????
        SHOWMONEY = $1F ;yeah
        J_CHOOSEITEM = $20 ;jump to j if declined
        IIIIJ_LIST = $22 ;jump if b pressed
        I_PICKITEM = $25 ;load i into selected item
        IJ_SELECTEDITEM = $26 ;jump to j if i isnt selected
        IJ_HASITEM = $27 ;jump to j if i not in inventory
        J_GIVEMONEY = $28 ;jump to j if cant hold money
        J_TAKEMONEY = $29 ;jump to j if not enough money
        J_UNSELLABLE = $2C; jump to j if item cannot be sold
        J_GIVEITEM = $2D ;jump to j if inventory full. else give selected item
        J_REMOVEITEM = $2E ;remove item, jump if doesn't have
        IJ_PICKCHARITEM = $31 ;pick character's I'th item, jump if empty (0)
        N_MULNUMBER = $32 ;multiply number by n / 100
        CJ_PRESENT = $33 ;jump to j if character c is not in party
        J_TOUCH = $35 ;jump to j if not touching
        J_UNK = $36 ;jump to j if ??????
        JJ_CUSTOMMENU = $37 ;display menu pointer, jump to j1 if option 2, jump to j2 if b pressed
        CJ_SELECTPARTY = $3A ;select character c in party, jump to j if not present
        T_CHANGETYPE = $3B ;change object type to t
        DA_TELEPORT = $3D ;teleport player to doorArgDef (basically, runs a door command)
        M_MOVE = $3E ;move using m pointer (word)
        O_SIGNAL = $3F ;signal object o (index)
        J_SIGNALED = $40 ;jump to j if not signaled
        CJ_ADDCHAR = $42 ;add char c from party, jump to j if full
        CJ_REMOVECHAR = $43 ;remove char c from party, jump to j if not in
        B_BATTLE = $44 ;start battle b in battles list
        CHARMULT = $45 ;multiply by number of characters
        D_ROCKET = $46 ;spawn rocket in direction (?)
        D_AIRPLANE = $47 ;spawn airplane in direction (?)
        D_TANK = $48 ;spawn tank in direction (?)
        D_NOVEC = $4C ;spawn players in direction (?)
        PLANEEND = $4D ;ending of plane paths
        J_UNK2 = $4F ;jump to j if ?????
        J_NOTMAX = $50 ;jump to j if < max hp
        N_HEAL = $51 ;heal hp n
        SJ_PRESENT = $52 ;jump to j if character has status s
        S_REMOVEBUT = $53 ;remove all statuses but s
        SLEEP = $55 ;sleep
        SAVE = $56 ;self explanatory
        GETCHARNEXTEXP = $57 ;get selected characters' needed exp
        GETCASH = $58 ;get money
        S_GIVESTATUS = $59 ;inflict s status
        M_MUSIC = $5A ;play m song
        S_PLAYSOUND = $5C ;play s
        J_NOTMAXPP = $60 ;jump to j if < max pp
        N_HEALPP = $61 ;heal pp n
        J_REMOVEWEAPON = $62 ;jump to j if no weapon, else take
        J_CONFISC = $63 ;get confiscated weapon, jump to j if none
        LIVESHOW = $64 ;in ellay
        J_MELODIES = $65 ;jump to j if not all melodies learnt
        LANDMINE = $68 ;in yucca desert
.endenum

;these might be bitflags but until we find out what they are i dont really care
;more samplesizes would help, too
.enum MOVE_CMD
        MOVEFACE = $E; move the tiles and face the same direction
        MOVE = $F; just moves the tiles, nothing else
        ABOUTFACE = $1E; turns on a dime to the direction
.endenum
.macro moveDef direction, cmd, tiles
        .word (tiles << 8) | (cmd << 3) | direction
.endmacro

.macro objectDef type, posX, direction, posY
        .word (posX << 6) | type
        .word (posY << 6) | direction
.endmacro

;top left of the map is 0, $80. why?
.macro doorArgDef music, targetPosX, targetDirection, targetPosY
        .word (targetPosX << 6) | music
        .word (targetPosY << 6) | targetDirection
.endmacro

;APPARENTLY they made the teleport gaining object based??????
;i mean. sure man
;cant this technically be used for any flag?
;bbbbbfff
.macro teleportFlagDef flag, byte
    .byte (byte << 3) | flag
.endmacro
.endif