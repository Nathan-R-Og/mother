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
        IJ_USE = $d ;jump to j if not using this item
        RESET = $f ;reset the nes
        F_SETFLAG = $10 ;set flag f
        F_CLEARFLAG = $11 ;clear flag f
        FJ_JUMP = $12 ;jump to j if f == 0
        C_SELECT = $19 ;select character
        J_NONEWMONEY = $1B ;jump to j if no money has been gained since last call
        I_PICKITEM = $25 ;load i into selected item
        IJ_HASITEM = $27 ;jump to j if i not in inventory
        J_GIVEITEM = $2D ;jump to j if inventory full. else give selected item
        J_REMOVEITEM = $2E ;remove item, jump if doesn't have
        IJ_PICKCHARITEM = $31 ;pick character's I'th item, jump if empty (0)
        CJ_PRESENT = $33 ;jump to j if character is not in party
        J_TOUCH = $35 ;jump to j if not touching
        J_UNK = $36 ;jump to j if ??????
        JJ_CUSTOMMENU = $37 ;display menu pointer, jump to j1 if option 2, jump to j2 if b pressed
        CJ_SELECTPARTY = $3A ;select character c in party, jump to j if not present
        T_CHANGETYPE = $3B ;change object type to t
        DA_TELEPORT = $3D ;teleport player to doorArgDef (basically, runs a door command)
        M_MOVE = $3E ;move using m pointer (word)
        O_SIGNAL = $3F ;signal object o (index)
        J_SIGNALED = $40 ;jump to j if not signaled
        CJ_REMOVECHAR = $43 ;remove char c from party, jump to j if not in
        B_BATTLE = $44 ;start battle b in battles list
        J_NOTMAX = $50 ;jump to j if < max hp
        N_HEAL = $51 ;heal hp n
        SJ_PRESENT = $52 ;jump to j if character has status s
        S_REMOVEBUT = $53 ;remove all statuses but s
        SAVE = $56 ;self explanatory
        GETCHARNEXTEXP = $57 ;get selected characters' needed exp
        M_MUSIC = $5A ;play m song
        S_PLAYSOUND = $5C ;play s
        J_NOTMAXPP = $60 ;jump to j if < max pp
        N_HEALPP = $61 ;heal pp n
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

.macro doorArgDef music, targetPosX, targetDirection, targetPosY
        .word (targetPosX << 6) | music
        .word (targetPosY << 6) | targetDirection
.endmacro