.segment        "CHR10": absolute

MSG_SYS_SYSERROR:
.byte   "System Error!!!",newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION:
.byte   "*Brother, I'm so",newLine
.byte   " scared! The lamp",newLine
.byte   " seems to be alive!",newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT:
.byte   "*Oh my! Brother,",newLine
.byte   " our house is",newLine
.byte   " falling apart!",newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT_2:
.byte   "*Boo hoo!",newLine
.byte   stopText

MSG_MYHOME_JUICE:
.byte   "*Brother, here's",newLine
.byte   " some juice.",newLine
.byte   pauseText
.byte   "*You are thirsty,",newLine
.byte   " aren't you?",newLine
.byte   stopText

MSG_MYHOME_MIMMIE_INVASION:
.byte   "*Spooky!!",newLine
.byte   " The doll walks",newLine
.byte   " by itself!",newLine
.byte   stopText

MSG_MYHOME_MIMMIE_INVASION_FIGHT:
.byte   "*I was scared to",newLine
.byte   " death!!",newLine
.byte   pauseText
.byte   "*Oh wow! CHECK out",newLine
.byte   " what's hidden",newLine
.byte   " inside the doll.",newLine
.byte   stopText

MSG_MYHOME_MIMMIE:
.byte   "*No, I'm Mimmie,",newLine
.byte   " don't confuse me",newLine
.byte   " with Minnie.",newLine
.byte   stopText

MSG_MYHOME_MOM_INVASION:
.byte   "*",nintenName,".",newLine
.byte   " Are you alright?",newLine
.byte   pauseText
.byte   "*Egad!",newLine
.byte   " What is happening",newLine
.byte   " to our house?",newLine
.byte   pauseText
.byte   "*I wish your Dad",newLine
.byte   " were here now.",newLine
.byte   " Maybe...",newLine
.byte   stopText

MSG_MYHOME_MOM:
.byte   "*Son of mine,",newLine
.byte   " you are braver",newLine
.byte   " than I thought.",newLine
.byte   pauseText
.byte   "*I can't let you",newLine
.byte   " go on a journey",newLine
.byte   " so famished.",newLine
.byte   stopText

MSG_MYHOME_MOM_HURT:
.byte   "*Oh, you have been",newLine
.byte   " wounded.",newLine
.byte   stopText

MSG_PHONE_NEXTLVL:
.byte   "*Well, the next",newLine
.byte   " level",newLine
.byte   " requires...",newLine
.byte   stopText

MSG_MYHOME_MOM_EAT:
.byte   "*When you want to",newLine
.byte   " eat ",favFood,newLine
.byte   " again, just come",newLine
.byte   " back here.",newLine
.byte   stopText

MSG_MYHOME_PHONE:
.byte   "*Well...",newLine
.byte   " It seems like a",newLine
.byte   " poltergeist.",newLine
.byte   pauseText
.byte   "*I'm not exactly",newLine
.byte   " sure how to...",newLine
.byte   pauseText
.byte   "*But, your great-",newLine
.byte   " grand-father",newLine
.byte   " studied PSI.",newLine
.byte   pauseText
.byte   "*You might find",newLine
.byte   " something in the",newLine
.byte   " basement to help.",newLine
.byte   pauseText
.byte   "*But, I left the",newLine
.byte   " Basement Key",newLine
.byte   " someplace...",newLine
.byte   pauseText
.byte   "*...can't remember",newLine
.byte   " exactly where...",newLine
.byte   pauseText
.byte   "*Anyhow, son, you",newLine
.byte   " are my only hope.",newLine
.byte   pauseText
.byte   "*It's time for you",newLine
.byte   " to go on a little",newLine
.byte   " adventure,",newLine
.byte   pauseText
.byte   "*and explore the",newLine
.byte   " potential of your",newLine
.byte   " powers.",newLine
.byte   pauseText
.byte   "*Powers not be taken",newLine
.byte   " lightly.",newLine
.byte   pauseText
.byte   "*",nintenName,", go",newLine
.byte   " for it!!",newLine
.byte   pauseText
.byte   "*But remember to come",newLine
.byte   " back and check on",newLine
.byte   " our family.",newLine
.byte   pauseText
.byte   "*Bye.",newLine
.byte   pauseText
.byte   "*Oh... phone me,",newLine
.byte   " and I will SAVE",newLine
.byte   " your progress.",newLine
.byte   pauseText
.byte   "*Call me whenever",newLine
.byte   " you want.",newLine
.byte   stopText

MSG_PHONE_END:
.byte   "*Slam.",newLine
.byte   stopText

MSG_PHONE_INTRO:
.byte   "*This is your Dad.",newLine
.byte   stopText

MSG_PHONE_NEWMONEY:
.byte   "*I've transferred",newLine
.byte   " $",cashDeposit,newLine
.byte   " into your account.",newLine
.byte   pauseText
.byte   "*After the amount",newLine
.byte   " you've spent,",newLine
.byte   pauseText
.byte   "*the balance is",newLine
.byte   " $",currentCash,".",newLine
.byte   pauseText
.byte   "*Spend your money",newLine
.byte   " wisely.",newLine
.byte   stopText

MSG_PHONE_RESETPROMPT:
.byte   "*Now son, it's not",newLine
.byte   " my business, but",newLine
.byte   " why not rest?",newLine
.byte   stopText

MSG_PHONE_SAVE_YES:
.byte   "*I see. ",newLine
.byte   " I'll SAVE your",newLine
.byte   " progress.",newLine
.byte   stopText

MSG_PHONE_SAVE_NO:
.byte   "*I see.",newLine
.byte   " I know, the Earth",newLine
.byte   " faces a crisis.",newLine
.byte   stopText

MSG_PHONE_SAVED_RESETPROMPT:
.byte   "*OK...But, I was",newLine
.byte   " thinking of going",newLine
.byte   " to sleep now.",newLine
.byte   pauseText
.byte   "*I've SAVEd your",newLine
.byte   " progress, so far.",newLine
.byte   pauseText
.byte   "*Good night.",newLine
.byte   stopText

MSG_PHONE_RESET_YES:
.byte   "*See you later!",newLine
.byte   pauseText
.byte   "*Remember, push in",newLine
.byte   " and hold RESET,",newLine
.byte   pauseText
.byte   "*while turning the",newLine
.byte   " POWER off. OK?",newLine
.byte   stopText

MSG_PHONE_RESET_NO:
.byte   "*Just like your",newLine
.byte   " Mom, you never",newLine
.byte   " want to stop.",newLine
.byte   pauseText
.byte   "*Please don't push",newLine
.byte   " yourself so hard.",newLine
.byte   stopText

MSG_PHONE_SAVEPROMPT:
.byte   "*By the way, do",newLine
.byte   " you want to SAVE?",newLine
.byte   stopText

MSG_PHONE_GOODLUCK:
.byte   "*Good luck.",newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_THANKS:
.byte   "*I want to thank",newLine
.byte   " you again for your",newLine
.byte   " help.",newLine
.byte   pauseText
.byte   "*Pippi is",newLine
.byte   " fine now.",newLine
.byte   stopText

MSG_PODUNK_CEMETERYGUY1:
.byte   "*Don't tell me",newLine
.byte   " you've been south",newLine
.byte   " to the cemetery!",newLine
.byte   stopText

MSG_PODUNK_CEMETERYGUY2:
.byte   "*You are terrific.",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY1:
.byte   "*Be honest,",newLine
.byte   " you're a zombie.",newLine
.byte   pauseText
.byte   "*Aren't you?",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY2:
.byte   "*There is no cure",newLine
.byte   " for zombies!",newLine
.byte   " AAAAAAAHHH!",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY3:
.byte   "*Are you really",newLine
.byte   " a human?",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY4:
.byte   "*It's amazing",newLine
.byte   " you came here.",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY5:
.byte   "*You see...",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY6:
.byte   "*Don't tell anyone,",newLine
.byte   " but I'm so scared,",newLine
.byte   " I wet my pants.",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY7:
.byte   "*It was dreadful...",newLine
.byte   stopText

MSG_PODUNK_ZOMBIE:
.byte   "*Zombie!",newLine
.byte   stopText

MSG_PODUNK_ZOMBIE2:
.byte   "*Ha-ha...",newLine
.byte   " You shall become",newLine
.byte   " a Zombieeee!",newLine
.byte   stopText

MSG_PODUNK_NECROMANCERWOMAN1:
.byte   "*Someone must be",newLine
.byte   " controlling the",newLine
.byte   " dead.",newLine
.byte   stopText

MSG_PODUNK_NECROMANCERWOMAN2:
.byte   "*Young man,",newLine
.byte   " you did well.",newLine
.byte   stopText

MSG_PODUNK_WARYGUY:
.byte   "*Zombies may be",newLine
.byte   " anywhere in this",newLine
.byte   " town.",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL1:
.byte   "*Did that Canary",newLine
.byte   " Chick come from",newLine
.byte   " Canary Village?",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL2:
.byte   "*Hum.",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL3:
.byte   "*The chicks at the",newLine
.byte   " Canary Village",newLine
.byte   " have lovely voices.",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL4:
.byte   "*The gentleman in",newLine
.byte   " Canary Village",newLine
.byte   " is my idol.",newLine
.byte   stopText

MSG_PODUNK_MAYORGUY:
.byte   "*The Town Mayor is",newLine
.byte   " looking for a",newLine
.byte   " brave man.",newLine
.byte   stopText

MSG_PODUNK_CONCERNEDGUY:
.byte   "*Has the little",newLine
.byte   " girl who strayed",newLine
.byte   pauseText
.byte   "*into the cemetery",newLine
.byte   " been rescued?",newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY1:
.byte   "*You...",newLine
.byte   " Are you really going",newLine
.byte   " to the cemetery?",newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY2:
.byte   "*I thought you were",newLine
.byte   " a sensible child.",newLine
.byte   stopText

MSG_PODUNK_EVENTGIRL1:
.byte   "*The animals went",newLine
.byte   " mad and out of",newLine
.byte   " control.",newLine
.byte   pauseText
.byte   "*The dead became",newLine
.byte   " zombies and began",newLine
.byte   " attacking people.",newLine
.byte   pauseText
.byte   "*What can be done?",newLine
.byte   stopText

MSG_PODUNK_EVENTGIRL2:
.byte   "*You are super!",newLine
.byte   stopText

MSG_PODUNK_POLTERGUY:
.byte   "*Did a poltergeist",newLine
.byte   " visit your house?",newLine
.byte   pauseText
.byte   "*It tore mine apart.",newLine
.byte   stopText

MSG_PODUNK_ZOOGUY:
.byte   "*The animals went",newLine
.byte   " mad and began to",newLine
.byte   " escape,",newLine
.byte   pauseText
.byte   "*so the Zoo was",newLine
.byte   " locked.",newLine
.byte   stopText

MSG_PODUNK_BREADGIRL:
.byte   "*To EAT, you'll",newLine
.byte   " find Bread stale,",newLine
.byte   pauseText
.byte   "*but, with its",newLine
.byte   " Crumbs you can",newLine
.byte   " mark your trail.",newLine
.byte   pauseText
.byte   "*Do you think I",newLine
.byte   " talk too much?",newLine
.byte   " Well do I?",newLine
.byte   stopText

MSG_MAYOR_HELPTOWN:
.byte   "*Citizen, I know",newLine
.byte   " you would like to",newLine
.byte   " help your town.",newLine
.byte   stopText

MSG_MAYOR_PIPPIQUEST:
.byte   "*Well...",newLine
.byte   " A child has strayed",newLine
.byte   " into the cemetery.",newLine
.byte   pauseText
.byte   "*And...",newLine
.byte   " I'm up for re-",newLine
.byte   " election soon.",newLine
.byte   pauseText
.byte   "*You must help!",newLine
.byte   " Please help me!",newLine
.byte   stopText

MSG_MAYOR_PIPPIQUESTYES:
.byte   "*Oh!?",newLine
.byte   " You will go there",newLine
.byte   " and save her?",newLine
.byte   stopText

MSG_MAYOR_RETURNPIPPI:
.byte   "*Is she the lost",newLine
.byte   " girl, Pippi?",newLine
.byte   pauseText
.byte   "*Well that's just",newLine
.byte   " great.",newLine
.byte   pauseText
.byte   "*I knew that you",newLine
.byte   " could fulfill your",newLine
.byte   " civic duty.",newLine
.byte   pauseText
.byte   "*Applause,",newLine
.byte   " applause...",newLine
.byte   pauseText
.byte   "*Now pretty Pippi,",newLine
.byte   " don't forget...",newLine
.byte   pauseText
.byte   "*to tell your Mom",newLine
.byte   " that the Mayor",newLine
.byte   " saved you.",newLine
.byte   pauseText
.byte   "*Here, I will give",newLine
.byte   " ",partyLead," a prize of",newLine
.byte   " ",price,".",newLine
.byte   stopText

MSG_MAYOR_SEE_ZOO:
.byte   "*By the way hero,",newLine
.byte   pauseText
.byte   "*maybe you'd like",newLine
.byte   " to go see what's",newLine
.byte   " up at the Zoo?",newLine
.byte   stopText

MSG_MAYOR_SEE_ZOO_ACCEPT:
.byte   "*Yes, you'll go?",newLine
.byte   " Great, great",newLine
.byte   " great!",newLine
.byte   pauseText
.byte   "*Now make sure to",newLine
.byte   " get a Key from my",newLine
.byte   " assistant, Abbott.",newLine
.byte   stopText

MSG_ABBOTT_GET_KEY:
.byte   "*This Key will open",newLine
.byte   " the Zoo's gate.",newLine
.byte   " Now don't lose it.",newLine
.byte   stopText

MSG_MAYOR_HERO:
.byte   "*Return her to me",newLine
.byte   " alive, and surely",newLine
.byte   " I'll be a hero...",newLine
.byte   pauseText
.byte   "*Er, umh, I mean",newLine
.byte   " you'll be a hero.",newLine
.byte   stopText

MSG_MAYOR_POST_ZOO:
.byte   "*Why if it's not",newLine
.byte   " our hero ",partyLead,",",newLine
.byte   pauseText
.byte   "*You have tiger",newLine
.byte   " droppings on your",newLine
.byte   " clothes.",newLine
.byte   pauseText
.byte   "*Ha-ha, just",newLine
.byte   " joking. Now run",newLine
.byte   " along kid.",newLine
.byte   stopText

MSG_SECRETARY_ANA:
.byte   "*I've heard a",newLine
.byte   " rumor about a",newLine
.byte   " wonder girl.",newLine
.byte   pauseText
.byte   "*She will help you",newLine
.byte   " on your trip.",newLine
.byte   stopText

MSG_ABBOTT_NEWKEY:
.byte   "*Zoo Keys are a",newLine
.byte   " dime a dozen,",newLine
.byte   " have another.",newLine
.byte   stopText

MSG_PETVENDOR_INTRO:
.byte   "*Look for yourself,",newLine
.byte   " all the animals",newLine
.byte   " have escaped.",newLine
.byte   stopText

MSG_PETVENDOR_INTRO2:
.byte   "*Only this Canary",newLine
.byte   " Chick is left.",newLine
.byte   " Want to buy it?",newLine
.byte   stopText

MSG_PETVENDOR_PITCH:
.byte   "*Well, how about",newLine
.byte   " $",price,"?",newLine
.byte   stopText

MSG_PETVENDOR_DECLINE:
.byte   "*OK kid, it's a",newLine
.byte   " free country, you",newLine
.byte   " know.",newLine
.byte   stopText

MSG_PETVENDOR_ACCEPTPITCH:
.byte   "*Take care of it.",newLine
.byte   " Come see us again!",newLine
.byte   stopText

MSG_PETVENDOR_DECLINEPITCH:
.byte   "*If it's free, do",newLine
.byte   " you want it?",newLine
.byte   " Then take it!",newLine
.byte   stopText

MSG_PETVENDOR_CANARYCHECK:
.byte   "*How's the Canary?",newLine
.byte   stopText

MSG_PETVENDOR2_BRAINWASH:
.byte   "*I think something",newLine
.byte   " is controlling",newLine
.byte   " the animals.",newLine
.byte   stopText

MSG_PETVENDOR2_CUTEPETS:
.byte   "*Ah... cute pets",newLine
.byte   " aren't they?",newLine
.byte   stopText

MSG_PODUNK_PIPPI_MEET_NOYES:
.byte   "*Hmmm.",newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY2_LLOYD:
.byte   "*You stupid jerk!",newLine
.byte   stopText

MSG_RETURNS_INTRO:
.byte   "*How may I help?",newLine
.byte   " Do you have some-",newLine
.byte   " thing to return?",newLine
.byte   stopText

MSG_REINDEER_DRAGONGIRL_CHECK:
.byte   "*Wait.. A voice is",newLine
.byte   " speaking into",newLine
.byte   " ",partyLead,"'s mind.",newLine
.byte   stopText

MSG_RETURNS_DECLINE:
.byte   "*Good.",newLine
.byte   stopText

MSG_RETURNS_ACCEPT:
.byte   "*Thank you for",newLine
.byte   " shopping with us",newLine
.byte   " today.",newLine
.byte   stopText

MSG_PODUNK_CASHCARDWOMAN:
.byte   "*It's convenient that",newLine
.byte   " the cash machine is",newLine
.byte   pauseText
.byte   "*next to the",newLine
.byte   " Service Counter,",newLine
.byte   pauseText
.byte   "*but, why should I",newLine
.byte   " care. I don't have a",newLine
.byte   " card for it.",newLine
.byte   stopText

MSG_CANARY_MAN:
.byte   "*It's fine weather",newLine
.byte   " today.",newLine
.byte   " But, I don't care.",newLine
.byte   stopText

MSG_CANARY_MAN_BABY:
.byte   "*Wow! That Canary",newLine
.byte   " is the baby of",newLine
.byte   " singing Laura.",newLine
.byte   pauseText
.byte   "*Will you return her",newLine
.byte   " baby to her.",newLine
.byte   stopText

MSG_CANARY_MAN_BABY_NO:
.byte   "*Wait...",newLine
.byte   pauseText
.byte   "*You just missed",newLine
.byte   " something very",newLine
.byte   " important.",newLine
.byte   stopText

MSG_CANARY_MAN_BABY_YES:
.byte   "*Where is Laura?...",newLine
.byte   stopText

MSG_CANARY_MAN_MELODY:
.byte   "*Laura remembered",newLine
.byte   " her song, and began",newLine
.byte   " to sing once more.",newLine
.byte   pauseText
.byte   "*Did you learn",newLine
.byte   " the melody?",newLine
.byte   stopText

MSG_CANARY_MAN_MELODY_NO:
.byte   "*That's no good.",newLine
.byte   stopText

MSG_CANARY_MAN_MELODY_YES:
.byte   "*The truth is...",newLine
.byte   " There is power in",newLine
.byte   " song.",newLine
.byte   stopText

MSG_GRAVEYARD_PIPPI:
.byte   "*Hi! I am Pippi,",newLine
.byte   " and I'm lost.",newLine
.byte   pauseText
.byte   "*What a brave",newLine
.byte   " boy you are to",newLine
.byte   " have found me.",newLine
.byte   stopText

MSG_PODUNK_PIPPI_BRAVE_YES:
.byte   "*Don't get so",newLine
.byte   " swell headed.",newLine
.byte   " Ha-ha-ha.",newLine
.byte   stopText

MSG_PODUNK_PIPPI_BRAVE_NO:
.byte   "*You're brave. I",newLine
.byte   " hope we can meet",newLine
.byte   " again sometime.",newLine
.byte   stopText

MSG_PODUNK_PIPPI_MEET_YES:
.byte   "*I'm so happy!  To",newLine
.byte   " show my gratitude",newLine
.byte   " take my gift.",newLine
.byte   pauseText
.byte   "*This shiny Badge",newLine
.byte   " will guard you.",newLine
.byte   " Keep it!",newLine
.byte   stopText

MSG_PODUNK_PIPPI_MEET_NO:
.byte   "*You probably",newLine
.byte   " already have",newLine
.byte   " someone special,",newLine
.byte   stopText

MSG_PODUNK_MAYORPIPPI:
.byte   "*Now, it's time to",newLine
.byte   " say good-bye.",newLine
.byte   pauseText
.byte   "*Please come by my",newLine
.byte   " house, I'll be",newLine
.byte   " waiting there to",newLine
.byte   pauseText
.byte   "*see you again.",newLine
.byte   " By the way...",newLine
.byte   pauseText
.byte   "*Do you think my",newLine
.byte   " hair needs",newLine
.byte   " styling?",newLine
.byte   stopText

MSG_PODUNK_MAYORPIPPI_YES:
.byte   "*You didn't have to",newLine
.byte   " answer, cutie.",newLine
.byte   stopText

MSG_ZOO_GATEMONKEY:
.byte   "*EEE, EE EEK,",newLine
.byte   " EEK EEK!",newLine
.byte   stopText

MSG_MAGICAVE_SHELLQUESTION:
.byte   "*",partyLead," felt this",newLine
.byte   " question enter ",newLine
.byte   " his mind.",newLine
.byte   pauseText
.byte   '*"Who has lost',newLine
.byte   ' his tail?"',newLine
.byte   stopText

MSG_MAGICANT_CLOTHINGMAN:
.byte   "*My! What strange",newLine
.byte   " clothing you wear!",newLine
.byte   pauseText
.byte   "*Surely monsters",newLine
.byte   " will come after",newLine
.byte   " those clothes!!",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN:
.byte   "*Are you bothered that",newLine
.byte   " unhappiness and",newLine
.byte   pauseText
.byte   "*misfortune search",newLine
.byte   " you out?",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_YES:
.byte   "*If you desire to",newLine
.byte   " never find",newLine
.byte   " trouble...",newLine
.byte   pauseText
.byte   "*STAY HOME!!",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_NO:
.byte   "*Is that right?",newLine
.byte   " Trouble searches",newLine
.byte   " after you?",newLine
.byte   pauseText
.byte   "*Hmm, that's too",newLine
.byte   " bad.",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_AFTER:
.byte   "*Then, you admit I",newLine
.byte   " have good taste.",newLine
.byte   pauseText
.byte   "*Huh?",newLine
.byte   " You want a cool",newLine
.byte   " nickname, too?",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_AFTER_YES:
.byte   "*OK, I've got it!",newLine
.byte   " From now on, you",newLine
.byte   " are Noodlenoggin!",newLine
.byte   pauseText
.byte   "*Sounds pretty",newLine
.byte   " cool, doesn't it?",newLine
.byte   stopText

MSG_TRAIN_DECLINE:
.byte   "*Is that right?",newLine
.byte   " That's too bad.",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_QUEST:
.byte   "*Hello, there!",newLine
.byte   " Noodlenoggin",newLine
.byte   " ",partyLead,".",newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN:
.byte   "*Have you ever met",newLine
.byte   " the man who practices",newLine
.byte   " philosophy?",newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN_YES:
.byte   "*He is so good at",newLine
.byte   " nicknaming.",newLine
.byte   pauseText
.byte   "*He uses such...",newLine
.byte   " good taste in it.",newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN_NO:
.byte   "*In the first",newLine
.byte   " place, if we",newLine
.byte   " have not met",newLine
.byte   pauseText
.byte   "*we cannot part!",newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN:
.byte   "*Have you met a man",newLine
.byte   " who says, that you",newLine
.byte   " cannot part,",newLine
.byte   pauseText
.byte   "*with someone you",newLine
.byte   " have not met?",newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN_YES:
.byte   "*I tend to think",newLine
.byte   " the same way, too.",newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN_NO:
.byte   "*You should meet",newLine
.byte   " him.",newLine
.byte   stopText

MSG_MAGICANT_STRENGTHMAN:
.byte   "*I regained my",newLine
.byte   " strength at Queen",newLine
.byte   " Mary's fountain.",newLine
.byte   stopText

MSG_110:
.byte   "*The bad thing",newLine
.byte   " about Queen Mary's",newLine
.byte   " fountain is...",newLine
.byte   pauseText
.byte   "*that it is so far",newLine
.byte   " away, and so hard",newLine
.byte   " to find.",newLine
.byte   stopText

MSG_MAGICANT_EARRINGGIRL:
.byte   "*I am taking this",newLine
.byte   " broken earring to",newLine
.byte   " the fountain.",newLine
.byte   pauseText
.byte   "*I'll bet it'll",newLine
.byte   " change into a",newLine
.byte   " magic earring.",newLine
.byte   stopText

MSG_MAGICANT_FOUNTAINMAN:
.byte   "*The mysterious",newLine
.byte   " sound of the",newLine
.byte   " fountain soothes.",newLine
.byte   stopText

MSG_MAGICANT_RESTROOMBOY:
.byte   "*More to the south.",newLine
.byte   " Are you lost?",newLine
.byte   pauseText
.byte   "*Sorry...I was",newLine
.byte   " directing you to",newLine
.byte   " the rest room.",newLine
.byte   pauseText
.byte   "*Queen Mary's",newLine
.byte   " Fountain is west",newLine
.byte   " of the castle.",newLine
.byte   stopText

MSG_MAGICANT_INNBOY:
.byte   "*I bent my spoon",newLine
.byte   " and it's hard to",newLine
.byte   " use like this.",newLine
.byte   pauseText
.byte   "*Do you think",newLine
.byte   " somehow you could",newLine
.byte   " fix it for me?",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_YES:
.byte   "*Please fix it",newLine
.byte   " right away.",newLine
.byte   pauseText
.byte   "*(",nintenName," fixed",newLine
.byte   " the spoon with",newLine
.byte   " PSI-Power.)",newLine
.byte   pauseText
.byte   "*Thanks a million!",newLine
.byte   " Munch, munch...",newLine
.byte   pauseText
.byte   "*Hey, would you",newLine
.byte   " like to spend",newLine
.byte   " the night here?",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_NO:
.byte   "*Why not? You can",newLine
.byte   " fix it without any",newLine
.byte   " physical effort!",newLine
.byte   stopText

MSG_MAGICANT_STRANGEGIRL:
.byte   "*You're a strange",newLine
.byte   " person...",newLine
.byte   pauseText
.byte   "*but for some",newLine
.byte   " reason, I like",newLine
.byte   " you.",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_STAY:
.byte   "*That's good.",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_NOSTAY:
.byte   "*Boo hoo hoo... You",newLine
.byte   " should accept",newLine
.byte   " kindness graciously.",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER1:
.byte   "*Oh, traveller! Why",newLine
.byte   " don't you enjoy a",newLine
.byte   " meal at our house?",newLine
.byte   pauseText
.byte   "*Well.... Today's",newLine
.byte   " special. Can you",newLine
.byte   " guess what it is?",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER1_NO:
.byte   "*Why not!? You sound",newLine
.byte   " so suspicious!",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER2:
.byte   "*Yes, it's ",newLine
.byte   " ",favFood,".",newLine
.byte   pauseText
.byte   "*I knew you liked",newLine
.byte   " ",favFood,". Do you",newLine
.byte   " want some?",newLine
.byte   stopText

MSG_MAGICANT_MUSICVENDOR:
.byte   "*This was to be a",newLine
.byte   " musical instrument",newLine
.byte   " store,",newLine
.byte   pauseText
.byte   "*but the Ocarina",newLine
.byte   " that we ordered",newLine
.byte   " never arrived.",newLine
.byte   pauseText
.byte   "*So I've given up.",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER2_NO:
.byte   "*Is that so?",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER3:
.byte   "*Thanks. Your bed",newLine
.byte   " is ready. Please",newLine
.byte   " sleep well.",newLine
.byte   stopText

