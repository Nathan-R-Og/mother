;jp uses the raw pointers for messages, and has no pointer list
.ifdef VER_JP
.enum   UMSG
        MYHOME_MINNIE_INVASION = MSG_MYHOME_MINNIE_INVASION
        MYHOME_DOG = MSG_MYHOME_DOG
        MYHOME_DOG_CHECK = MSG_MYHOME_DOG_CHECK
        GET_ITEM = MSG_GET_ITEM
        INVENTORY_FULL = MSG_INVENTORY_FULL
        MYHOME_DOG_ADVICE = MSG_MYHOME_DOG_ADVICE
        PODUNK_PIPPIMOM_THANKS = MSG_PODUNK_PIPPIMOM_THANKS
        PODUNK_PIPPIMOM = MSG_PODUNK_PIPPIMOM
        PODUNK_PIPPIMOM_RETURN = MSG_PODUNK_PIPPIMOM_RETURN
        PODUNK_PIPPI_GOODS = MSG_PODUNK_PIPPI_GOODS
        PODUNK_PIPPI_NOGOODS = MSG_PODUNK_PIPPI_NOGOODS
        PODUNK_PIPPI_NOROOM = MSG_PODUNK_PIPPI_NOROOM
        PODUNK_PIPPI_FRIEND = MSG_PODUNK_PIPPI_FRIEND
        PODUNK_PIPPI_BRAVE = MSG_PODUNK_PIPPI_BRAVE
        PODUNK_PIPPI_BRAVE_YES = MSG_PODUNK_PIPPI_BRAVE_YES
        PODUNK_PIPPI_BRAVE_NO = MSG_PODUNK_PIPPI_BRAVE_NO
        PODUNK_PIPPI_MEET_NOYES = MSG_PODUNK_PIPPI_MEET_NOYES
        PODUNK_PIPPI_MEET_YES = MSG_PODUNK_PIPPI_MEET_YES
        PODUNK_PIPPI_MEET_NO = MSG_PODUNK_PIPPI_MEET_NO
        PODUNK_PIPPI_NOROOM2 = MSG_PODUNK_PIPPI_NOROOM2
        PODUNK_PIPPI_GOODBYE = MSG_PODUNK_PIPPI_GOODBYE
        CANARY_MAN = MSG_CANARY_MAN
        CANARY_MAN_BABY = MSG_CANARY_MAN_BABY
        CANARY_MAN_BABY_NO = MSG_CANARY_MAN_BABY_NO
        CANARY_MAN_BABY_YES = MSG_CANARY_MAN_BABY_YES
        CANARY_MAN_MELODY = MSG_CANARY_MAN_MELODY
        CANARY_MAN_MELODY_NO = MSG_CANARY_MAN_MELODY_NO
        CANARY_MAN_MELODY_YES = MSG_CANARY_MAN_MELODY_YES
        CANARY_PILLAR = MSG_CANARY_PILLAR
        CANARY_SING = MSG_CANARY_SING
        CANARY_LAURA = MSG_CANARY_LAURA
        CANARY_LAURA_SING = MSG_CANARY_LAURA_SING
        REMEMBER_MELODY = MSG_REMEMBER_MELODY
        CANARY_GENERIC = MSG_CANARY_GENERIC
        DUNCANFACTORY_DOG = MSG_DUNCANFACTORY_DOG
        DUNCANFACTORY_DOG_PASS = MSG_DUNCANFACTORY_DOG_PASS
        CANARY_SIGN = MSG_CANARY_SIGN
        MYHOME_SIGN = MSG_MYHOME_SIGN
        MTITOI_HEALERFAIL = MSG_MTITOI_HEALERFAIL
        MTITOI_HEALER = MSG_MTITOI_HEALER
        MTITOI_TEDDY_CALL = MSG_MTITOI_TEDDY_CALL
        MTITOI_TEDDY_SLEEP = MSG_MTITOI_TEDDY_SLEEP
        PHONE_GRAB = MSG_PHONE_GRAB
        PHONE_INTRO = MSG_PHONE_INTRO
        PHONE_NEWMONEY = MSG_PHONE_NEWMONEY
        PHONE_NEXTLVL = MSG_PHONE_NEXTLVL
        PHONE_EXPLVL = MSG_PHONE_EXPLVL
        PHONE_SAVEPROMPT = MSG_PHONE_SAVEPROMPT
        MENU_YES_NO = MSG_MENU_YES_NO
        MENU_CONTINUE_REST = MSG_MENU_CONTINUE_REST
        PHONE_SAVED_RESETPROMPT = MSG_PHONE_SAVED_RESETPROMPT
        PHONE_RESET_NO = MSG_PHONE_RESET_NO
        PHONE_END = MSG_PHONE_END
        PHONE_RESET_YES = MSG_PHONE_RESET_YES
        PHONE_GOODLUCK = MSG_PHONE_GOODLUCK
        PHONE_PAYPHONE = MSG_PHONE_PAYPHONE
        PODUNK_NOISYMOUSE = MSG_PODUNK_NOISYMOUSE
.endenum
.else
.define MSGID(ta) (ta-MSG_pointerList)/3
.enum   UMSG
        NONE = MSGID(UMSG_NONE) ;$0
        MYHOME_MINNIE_INVASION = MSGID(UMSG_MYHOME_MINNIE_INVASION) ;$1
        MYHOME_DOG = MSGID(UMSG_MYHOME_DOG)
        MYHOME_DOG_CHECK = MSGID(UMSG_MYHOME_DOG_CHECK)
        GET_ITEM = MSGID(UMSG_GET_ITEM)
        INVENTORY_FULL = MSGID(UMSG_INVENTORY_FULL)
        MYHOME_DOG_ADVICE = MSGID(UMSG_MYHOME_DOG_ADVICE)
        PODUNK_PIPPIMOM_THANKS = MSGID(UMSG_PODUNK_PIPPIMOM_THANKS)
        PODUNK_PIPPIMOM = MSGID(UMSG_PODUNK_PIPPIMOM)
        PODUNK_PIPPIMOM_RETURN = MSGID(UMSG_PODUNK_PIPPIMOM_RETURN)
        PODUNK_PIPPI_GOODS = MSGID(UMSG_PODUNK_PIPPI_GOODS)
        PODUNK_PIPPI_NOGOODS = MSGID(UMSG_PODUNK_PIPPI_NOGOODS)
        PODUNK_PIPPI_NOROOM = MSGID(UMSG_PODUNK_PIPPI_NOROOM)
        PODUNK_PIPPI_FRIEND = MSGID(UMSG_PODUNK_PIPPI_FRIEND)
        PODUNK_PIPPI_BRAVE = MSGID(UMSG_PODUNK_PIPPI_BRAVE)
        PODUNK_PIPPI_BRAVE_YES = MSGID(UMSG_PODUNK_PIPPI_BRAVE_YES)
        PODUNK_PIPPI_BRAVE_NO = MSGID(UMSG_PODUNK_PIPPI_BRAVE_NO)
        PODUNK_PIPPI_MEET_NOYES = MSGID(UMSG_PODUNK_PIPPI_MEET_NOYES)
        PODUNK_PIPPI_MEET_YES = MSGID(UMSG_PODUNK_PIPPI_MEET_YES)
        PODUNK_PIPPI_MEET_NO = MSGID(UMSG_PODUNK_PIPPI_MEET_NO)
        PODUNK_PIPPI_NOROOM2 = MSGID(UMSG_PODUNK_PIPPI_NOROOM2)
        PODUNK_PIPPI_GOODBYE = MSGID(UMSG_PODUNK_PIPPI_GOODBYE)
        CANARY_MAN = MSGID(UMSG_CANARY_MAN)
        CANARY_MAN_BABY = MSGID(UMSG_CANARY_MAN_BABY)
        CANARY_MAN_BABY_NO = MSGID(UMSG_CANARY_MAN_BABY_NO)
        CANARY_MAN_BABY_YES = MSGID(UMSG_CANARY_MAN_BABY_YES)
        CANARY_MAN_MELODY = MSGID(UMSG_CANARY_MAN_MELODY)
        CANARY_MAN_MELODY_NO = MSGID(UMSG_CANARY_MAN_MELODY_NO)
        CANARY_MAN_MELODY_YES = MSGID(UMSG_CANARY_MAN_MELODY_YES)
        CANARY_PILLAR = MSGID(UMSG_CANARY_PILLAR)
        CANARY_SING = MSGID(UMSG_CANARY_SING)
        CANARY_LAURA = MSGID(UMSG_CANARY_LAURA)
        CANARY_LAURA_SING = MSGID(UMSG_CANARY_LAURA_SING)
        REMEMBER_MELODY = MSGID(UMSG_REMEMBER_MELODY)
        CANARY_GENERIC = MSGID(UMSG_CANARY_GENERIC)
        DUNCANFACTORY_DOG = MSGID(UMSG_DUNCANFACTORY_DOG)
        DUNCANFACTORY_DOG_PASS = MSGID(UMSG_DUNCANFACTORY_DOG_PASS)
        CANARY_SIGN = MSGID(UMSG_CANARY_SIGN)
        MYHOME_SIGN = MSGID(UMSG_MYHOME_SIGN)
        MTITOI_HEALERFAIL = MSGID(UMSG_MTITOI_HEALERFAIL)
        MTITOI_HEALER = MSGID(UMSG_MTITOI_HEALER)
        MTITOI_TEDDY_CALL = MSGID(UMSG_MTITOI_TEDDY_CALL)
        MTITOI_TEDDY_SLEEP = MSGID(UMSG_MTITOI_TEDDY_SLEEP)
        PHONE_GRAB = MSGID(UMSG_PHONE_GRAB)
        PHONE_INTRO = MSGID(UMSG_PHONE_INTRO)
        PHONE_NEWMONEY = MSGID(UMSG_PHONE_NEWMONEY)
        PHONE_NEXTLVL = MSGID(UMSG_PHONE_NEXTLVL)
        PHONE_EXPLVL = MSGID(UMSG_PHONE_EXPLVL)
        PHONE_SAVEPROMPT = MSGID(UMSG_PHONE_SAVEPROMPT)
        MENU_YES_NO = MSGID(UMSG_MENU_YES_NO)
        MENU_CONTINUE_REST = MSGID(UMSG_MENU_CONTINUE_REST)
        PHONE_SAVED_RESETPROMPT = MSGID(UMSG_PHONE_SAVED_RESETPROMPT)
        PHONE_RESET_NO = MSGID(UMSG_PHONE_RESET_NO)
        PHONE_END = MSGID(UMSG_PHONE_END)
        PHONE_RESET_YES = MSGID(UMSG_PHONE_RESET_YES)
        PHONE_GOODLUCK = MSGID(UMSG_PHONE_GOODLUCK)
        PHONE_PAYPHONE = MSGID(UMSG_PHONE_PAYPHONE)
        PODUNK_NOISYMOUSE = MSGID(UMSG_PODUNK_NOISYMOUSE)
.endenum
.endif

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
        J_CHECK = $b ;jump to j if not talking
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
        MOVEFACE = $E; just moves the tiles, nothing else
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