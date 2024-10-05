.include "../fontmap.asm"

.ifndef VER_JP

MSG_SYS_SYSERROR:
.byte   "System Error!!!",newLine
.byte   stopText

.endif

MSG_MYHOME_MINNIE_INVASION:
.ifndef VER_JP
.byte   "*Brother, I'm so",newLine
.byte   " scared! The lamp",newLine
.byte   " seems to be alive!",newLine
.byte   stopText
.else
kanjifix "*おにいちゃん こわい。"
.byte   newLine
kanjifix "でんきスタンドが くるったように"
.byte   newLine
kanjifix "あばれだしたの。"
.byte   newLine
.byte   stopText
.endif


.ifndef VER_JP

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

.byte   "*No, I'm Mimmie,",newLine
.byte   " don't confuse me",newLine
.byte   " with Minnie.",newLine
.byte   stopText

.byte   "*",nintenName,"." ,newLine
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

.byte   "*Son of mine,",newLine
.byte   " you are braver",newLine
.byte   " than I thought.",newLine
.byte   pauseText
.byte   "*I can't let you",newLine
.byte   " go on a journey",newLine
.byte   " so famished.",newLine
.byte   stopText

.byte   "*Oh, you have been",newLine
.byte   " wounded.",newLine
.byte   stopText

.byte   "*Well, the next",newLine
.byte   " level",newLine
.byte   " requires...",newLine
.byte   stopText

.byte   "*When you want to",newLine
.byte   " eat ",favFood,newLine
.byte   " again, just come",newLine
.byte   " back here.",newLine
.byte   stopText

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

.byte   "*Slam.",newLine
.byte   stopText

.byte   "*This is your Dad.",newLine
.byte   stopText

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

.byte   "*Now son, it's not",newLine
.byte   " my business, but",newLine
.byte   " why not rest?",newLine
.byte   stopText

.byte   "*I see. ",newLine
.byte   " I'll SAVE your",newLine
.byte   " progress.",newLine
.byte   stopText

.byte   "*I see.",newLine
.byte   " I know, the Earth",newLine
.byte   " faces a crisis.",newLine
.byte   stopText

.byte   "*OK...But, I was",newLine
.byte   " thinking of going",newLine
.byte   " to sleep now.",newLine
.byte   pauseText
.byte   "*I've SAVEd your",newLine
.byte   " progress, so far.",newLine
.byte   pauseText
.byte   "*Good night.",newLine
.byte   stopText

;yes
.byte   "*See you later!",newLine
.byte   pauseText
.byte   "*Remember, push in",newLine
.byte   " and hold RESET,",newLine
.byte   pauseText
.byte   "*while turning the",newLine
.byte   " POWER off. OK?",newLine
.byte   stopText

;no
.byte   "*Just like your",newLine
.byte   " Mom, you never",newLine
.byte   " want to stop.",newLine
.byte   pauseText
.byte   "*Please don't push",newLine
.byte   " yourself so hard.",newLine
.byte   stopText

.byte   "*By the way, do",newLine
.byte   " you want to SAVE?",newLine
.byte   stopText

.byte   "*Good luck.",newLine
.byte   stopText

.byte   "*I want to thank",newLine
.byte   " you again for your",newLine
.byte   " help.",newLine
.byte   pauseText
.byte   "*Pippi is",newLine
.byte   " fine now.",newLine
.byte   stopText

.byte   "*Don't tell me",newLine
.byte   " you've been south",newLine
.byte   " to the cemetery!",newLine
.byte   stopText

.byte   "*You are terrific.",newLine
.byte   stopText

.byte   "*Be honest,",newLine
.byte   " you're a zombie.",newLine
.byte   pauseText
.byte   "*Aren't you?",newLine
.byte   stopText

.byte   "*There is no cure",newLine
.byte   " for zombies!",newLine
.byte   " AAAAAAAHHH!",newLine
.byte   stopText

.byte   "*Are you really",newLine
.byte   " a human?",newLine
.byte   stopText

.byte   "*It's amazing",newLine
.byte   " you came here.",newLine
.byte   stopText

.byte   "*You see...",newLine
.byte   stopText

.byte   "*Don't tell anyone,",newLine
.byte   " but I'm so scared,",newLine
.byte   " I wet my pants.",newLine
.byte   stopText

.byte   "*It was dreadful...",newLine
.byte   stopText

.byte   "*Zombie!",newLine
.byte   stopText

.byte   "*Ha-ha...",newLine
.byte   " You shall become",newLine
.byte   " a Zombieeee!",newLine
.byte   stopText

.byte   "*Someone must be",newLine
.byte   " controlling the",newLine
.byte   " dead.",newLine
.byte   stopText

.byte   "*Young man,",newLine
.byte   " you did well.",newLine
.byte   stopText

.byte   "*Zombies may be",newLine
.byte   " anywhere in this",newLine
.byte   " town.",newLine
.byte   stopText

.byte   "*Did that Canary",newLine
.byte   " Chick come from",newLine
.byte   " Canary Village?",newLine
.byte   stopText

.byte   "*Hum.",newLine
.byte   stopText

.byte   "*The chicks at the",newLine
.byte   " Canary Village",newLine
.byte   " have lovely voices.",newLine
.byte   stopText

.byte   "*The gentleman in",newLine
.byte   " Canary Village",newLine
.byte   " is my idol.",newLine
.byte   stopText

.byte   "*The Town Mayor is",newLine
.byte   " looking for a",newLine
.byte   " brave man.",newLine
.byte   stopText

.byte   "*Has the little",newLine
.byte   " girl who strayed",newLine
.byte   pauseText
.byte   "*into the cemetery",newLine
.byte   " been rescued?",newLine
.byte   stopText

.byte   "*You...",newLine
.byte   " Are you really going",newLine
.byte   " to the cemetery?",newLine
.byte   stopText

.byte   "*I thought you were",newLine
.byte   " a sensible child.",newLine
.byte   stopText

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

.byte   "*You are super!",newLine
.byte   stopText

.byte   "*Did a poltergeist",newLine
.byte   " visit your house?",newLine
.byte   pauseText
.byte   "*It tore mine apart.",newLine
.byte   stopText

.byte   "*The animals went",newLine
.byte   " mad and began to",newLine
.byte   " escape,",newLine
.byte   pauseText
.byte   "*so the Zoo was",newLine
.byte   " locked.",newLine
.byte   stopText

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

.byte   "*Citizen, I know",newLine
.byte   " you would like to",newLine
.byte   " help your town.",newLine
.byte   stopText

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

.byte   "*Oh!?",newLine
.byte   " You will go there",newLine
.byte   " and save her?",newLine
.byte   stopText

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

.byte   "*By the way hero,",newLine
.byte   pauseText
.byte   "*maybe you'd like",newLine
.byte   " to go see what's",newLine
.byte   " up at the Zoo?",newLine
.byte   stopText

.byte   "*Yes, you'll go?",newLine
.byte   " Great, great",newLine
.byte   " great!",newLine
.byte   pauseText
.byte   "*Now make sure to",newLine
.byte   " get a Key from my",newLine
.byte   " assistant, Abbott.",newLine
.byte   stopText

.byte   "*This Key will open",newLine
.byte   " the Zoo's gate.",newLine
.byte   " Now don't lose it.",newLine
.byte   stopText

.byte   "*Return her to me",newLine
.byte   " alive, and surely",newLine
.byte   " I'll be a hero...",newLine
.byte   pauseText
.byte   "*Er, umh, I mean",newLine
.byte   " you'll be a hero.",newLine
.byte   stopText

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

.byte   "*I've heard a",newLine
.byte   " rumor about a",newLine
.byte   " wonder girl.",newLine
.byte   pauseText
.byte   "*She will help you",newLine
.byte   " on your trip.",newLine
.byte   stopText

.byte   "*Zoo Keys are a",newLine
.byte   " dime a dozen,",newLine
.byte   " have another.",newLine
.byte   stopText

.byte   "*Look for yourself,",newLine
.byte   " all the animals",newLine
.byte   " have escaped.",newLine
.byte   stopText

.byte   "*Only this Canary",newLine
.byte   " Chick is left.",newLine
.byte   " Want to buy it?",newLine
.byte   stopText

.byte   "*Well, how about",newLine
.byte   " $",price,"?",newLine
.byte   stopText

.byte   "*OK kid, it's a",newLine
.byte   " free country, you",newLine
.byte   " know.",newLine
.byte   stopText

.byte   "*Take care of it.",newLine
.byte   " Come see us again!",newLine
.byte   stopText

.byte   "*If it's free, do",newLine
.byte   " you want it?",newLine
.byte   " Then take it!",newLine
.byte   stopText

.byte   "*How's the Canary?",newLine
.byte   stopText

.byte   "*I think something",newLine
.byte   " is controlling",newLine
.byte   " the animals.",newLine
.byte   stopText

.byte   "*Ah... cute pets",newLine
.byte   " aren't they?",newLine
.byte   stopText

.byte   "*Hmmm.",newLine
.byte   stopText

.byte   "*You stupid jerk!",newLine
.byte   stopText

.byte   "*How may I help?",newLine
.byte   " Do you have some-",newLine
.byte   " thing to return?",newLine
.byte   stopText

.byte   "*Wait.. A voice is",newLine
.byte   " speaking into",newLine
.byte   " ",partyLead,"'s mind.",newLine
.byte   stopText

.byte   "*Good.",newLine
.byte   stopText

.byte   "*Thank you for",newLine
.byte   " shopping with us",newLine
.byte   " today.",newLine
.byte   stopText

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

.byte   "*It's fine weather",newLine
.byte   " today.",newLine
.byte   " But, I don't care.",newLine
.byte   stopText

.byte   "*Wow! That Canary",newLine
.byte   " is the baby of",newLine
.byte   " singing Laura.",newLine
.byte   pauseText
.byte   "*Will you return her",newLine
.byte   " baby to her.",newLine
.byte   stopText

.byte   "*Wait...",newLine
.byte   pauseText
.byte   "*You just missed",newLine
.byte   " something very",newLine
.byte   " important.",newLine
.byte   stopText

.byte   "*Where is Laura?...",newLine
.byte   stopText

.byte   "*Laura remembered",newLine
.byte   " her song, and began",newLine
.byte   " to sing once more.",newLine
.byte   pauseText
.byte   "*Did you learn",newLine
.byte   " the melody?",newLine
.byte   stopText

.byte   "*That's no good.",newLine
.byte   stopText

.byte   "*The truth is...",newLine
.byte   " There is power in",newLine
.byte   " song.",newLine
.byte   stopText

.byte   "*Hi! I am Pippi,",newLine
.byte   " and I'm lost.",newLine
.byte   pauseText
.byte   "*What a brave",newLine
.byte   " boy you are to",newLine
.byte   " have found me.",newLine
.byte   stopText

.byte   "*Don't get so",newLine
.byte   " swell headed.",newLine
.byte   " Ha-ha-ha.",newLine
.byte   stopText

.byte   "*You're brave. I",newLine
.byte   " hope we can meet",newLine
.byte   " again sometime.",newLine
.byte   stopText

.byte   "*I'm so happy!  To",newLine
.byte   " show my gratitude",newLine
.byte   " take my gift.",newLine
.byte   pauseText
.byte   "*This shiny Badge",newLine
.byte   " will guard you.",newLine
.byte   " Keep it!",newLine
.byte   stopText

.byte   "*You probably",newLine
.byte   " already have",newLine
.byte   " someone special,",newLine
.byte   stopText

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

.byte   "*You didn't have to",newLine
.byte   " answer, cutie.",newLine
.byte   stopText

.byte   "*EEE, EE EEK,",newLine
.byte   " EEK EEK!",newLine
.byte   stopText

.byte   "*",partyLead," felt this",newLine
.byte   " question enter ",newLine
.byte   " his mind.",newLine
.byte   pauseText
.byte   '*"Who has lost',newLine
.byte   ' his tail?"',newLine
.byte   stopText

.byte   "*My! What strange",newLine
.byte   " clothing you wear!",newLine
.byte   pauseText
.byte   "*Surely monsters",newLine
.byte   " will come after",newLine
.byte   " those clothes!!",newLine
.byte   stopText

.byte   "*Are you bothered that",newLine
.byte   " unhappiness and",newLine
.byte   pauseText
.byte   "*misfortune search",newLine
.byte   " you out?",newLine
.byte   stopText

.byte   "*If you desire to",newLine
.byte   " never find",newLine
.byte   " trouble...",newLine
.byte   pauseText
.byte   "*STAY HOME!!",newLine
.byte   stopText

.byte   "*Is that right?",newLine
.byte   " Trouble searches",newLine
.byte   " after you?",newLine
.byte   pauseText
.byte   "*Hmm, that's too",newLine
.byte   " bad.",newLine
.byte   stopText

.byte   "*Then, you admit I",newLine
.byte   " have good taste.",newLine
.byte   pauseText
.byte   "*Huh?",newLine
.byte   " You want a cool",newLine
.byte   " nickname, too?",newLine
.byte   stopText

.byte   "*OK, I've got it!",newLine
.byte   " From now on, you",newLine
.byte   " are Noodlenoggin!",newLine
.byte   pauseText
.byte   "*Sounds pretty",newLine
.byte   " cool, doesn't it?",newLine
.byte   stopText

.byte   "*Is that right?",newLine
.byte   " That's too bad.",newLine
.byte   stopText

.byte   "*Hello, there!",newLine
.byte   " Noodlenoggin",newLine
.byte   " ",partyLead,".",newLine
.byte   stopText

.byte   "*Have you ever met",newLine
.byte   " the man who practices",newLine
.byte   " philosophy?",newLine
.byte   stopText

.byte   "*He is so good at",newLine
.byte   " nicknaming.",newLine
.byte   pauseText
.byte   "*He uses such...",newLine
.byte   " good taste in it.",newLine
.byte   stopText

.byte   "*In the first",newLine
.byte   " place, if we",newLine
.byte   " have not met",newLine
.byte   pauseText
.byte   "*we cannot part!",newLine
.byte   stopText

.byte   "*Have you met a man",newLine
.byte   " who says, that you",newLine
.byte   " cannot part,",newLine
.byte   pauseText
.byte   "*with someone you",newLine
.byte   " have not met?",newLine
.byte   stopText

.byte   "*I tend to think",newLine
.byte   " the same way, too.",newLine
.byte   stopText

.byte   "*You should meet",newLine
.byte   " him.",newLine
.byte   stopText

.byte   "*I regained my",newLine
.byte   " strength at Queen",newLine
.byte   " Mary's fountain.",newLine
.byte   stopText

.byte   "*The bad thing",newLine
.byte   " about Queen Mary's",newLine
.byte   " fountain is...",newLine
.byte   pauseText
.byte   "*that it is so far",newLine
.byte   " away, and so hard",newLine
.byte   " to find.",newLine
.byte   stopText

.byte   "*I am taking this",newLine
.byte   " broken earring to",newLine
.byte   " the fountain.",newLine
.byte   pauseText
.byte   "*I'll bet it'll",newLine
.byte   " change into a",newLine
.byte   " magic earring.",newLine
.byte   stopText

.byte   "*The mysterious",newLine
.byte   " sound of the",newLine
.byte   " fountain soothes.",newLine
.byte   stopText

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

.byte   "*I bent my spoon",newLine
.byte   " and it's hard to",newLine
.byte   " use like this.",newLine
.byte   pauseText
.byte   "*Do you think",newLine
.byte   " somehow you could",newLine
.byte   " fix it for me?",newLine
.byte   stopText

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

.byte   "*Why not? You can",newLine
.byte   " fix it without any",newLine
.byte   " physical effort!",newLine
.byte   stopText

.byte   "*You're a strange",newLine
.byte   " person...",newLine
.byte   pauseText
.byte   "*but for some",newLine
.byte   " reason, I like",newLine
.byte   " you.",newLine
.byte   stopText

.byte   "*That's good.",newLine
.byte   stopText

.byte   "*Boo hoo hoo... You",newLine
.byte   " should accept",newLine
.byte   " kindness graciously.",newLine
.byte   stopText

.byte   "*Oh, traveller! Why",newLine
.byte   " don't you enjoy a",newLine
.byte   " meal at our house?",newLine
.byte   pauseText
.byte   "*Well.... Today's",newLine
.byte   " special. Can you",newLine
.byte   " guess what it is?",newLine
.byte   stopText

.byte   "*Why not!? You sound",newLine
.byte   " so suspicious!",newLine
.byte   stopText

.byte   "*Yes, it's ",newLine
.byte   " ",favFood,".",newLine
.byte   pauseText
.byte   "*I knew you liked",newLine
.byte   " ",favFood,". Do you",newLine
.byte   " want some?",newLine
.byte   stopText

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

.byte   "*Is that so?",newLine
.byte   stopText

.byte   "*Thanks. Your bed",newLine
.byte   " is ready. Please",newLine
.byte   " sleep well.",newLine
.byte   stopText

.else

kanjifix "*おにいちゃ-ん!"
.byte   newLine
kanjifix "おうちが こわれちゃうよう!"
.byte   newLine
.byte   stopText

kanjifix "*ウェ-ン。"
.byte   newLine
.byte   stopText

kanjifix "*はい おにいちゃん ジュ-ス。"
.byte   newLine
kanjifix "おなかすいたでしょ。"
.byte   newLine
.byte   stopText

kanjifix "*こわ-い!"
.byte   newLine
kanjifix "おにんぎょうが あばれだしたの!"
.byte   newLine
.byte   stopText

kanjifix "*こわかったぁ。"
.byte   newLine
kanjifix "あっ! おにんぎょうのなかに"
.byte   newLine
kanjifix "なにかあるみたい。"
.byte   newLine
.byte   stopText

kanjifix "*わたし ミミ-よ。"
.byte   newLine
kanjifix "ミニ-と まちがえちゃいや。"
.byte   newLine
.byte   stopText

kanjifix "*だいじょうぶだった?"
.byte   newLine
.byte   nintenName
kanjifix " "
.byte   newLine
.byte   pauseText
kanjifix "*このいえは いったい"
.byte   newLine
kanjifix "どうなっているのかしら。"
.byte   newLine
kanjifix "オロオロ。"
.byte   newLine
.byte   pauseText
kanjifix "*こんなときに パパがいてくれたら"
.byte   newLine
kanjifix "いいのかもしれないけど‥‥"
.byte   newLine
.byte   stopText

kanjifix "*あなたって おもってたより"
.byte   newLine
kanjifix "ずっと ゆうかんなこだったのね。"
.byte   newLine
.byte   pauseText
kanjifix "*‥‥でも あなたを"
.byte   newLine
kanjifix "つらいたびに だしたくないわ。"
.byte   newLine
.byte   stopText

kanjifix "*まぁ ずいぶんきずついて‥‥"
.byte   newLine
.byte   stopText

kanjifix "*え-と つぎのレベルまで‥‥"
.byte   newLine
.byte   stopText

kanjifix "*また"
.byte   newLine
.byte   favFood
kanjifix "が たべたくなったら"
.byte   newLine
kanjifix "かえってくるのよ。"
.byte   newLine
.byte   stopText

kanjifix "*ふむふむ‥‥ そうか"
.byte   newLine
kanjifix "それは ラップげんしょうだな。"
.byte   newLine
.byte   pauseText
kanjifix "*どうすればいいのかは‥‥"
.byte   newLine
kanjifix "パパにもわからないな。"
.byte   newLine
.byte   pauseText
kanjifix "*しかし ひいおじいさんが"
.byte   newLine
kanjifix "PSIの けんきゅうを"
.byte   newLine
kanjifix "していたはずだ。"
.byte   newLine
.byte   pauseText
kanjifix "*ちかしつをさがせば"
.byte   newLine
kanjifix "なにか わかるかもしれない。"
.byte   newLine
.byte   pauseText
kanjifix "*ちかしつのカギは‥‥"
.byte   newLine
kanjifix "どこかに つけておいたんだが‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*わすれた。"
.byte   newLine
.byte   pauseText
kanjifix "*とにかく おまえだけがたよりだ。"
.byte   newLine
kanjifix "いまこそ ぼうけんのときだ。"
.byte   newLine
kanjifix "すすめ "
.byte   nintenName
kanjifix "!"
.byte   newLine
.byte   pauseText
kanjifix "*みんなを まもってくれ。"
.byte   newLine
.byte   stopText

kanjifix "*ガチャン ツ-ツ-ツ-"
.byte   newLine
.byte   stopText

kanjifix "*あ パパだ。"
.byte   newLine
.byte   stopText

kanjifix "*"
.byte   nintenName
kanjifix "の ぎんこうこうざに"
.byte   newLine
.byte   cashDeposit
kanjifix "ドル"
.byte   newLine
kanjifix "ふりこんでおいたからね。"
.byte   newLine
.byte   pauseText
kanjifix "*おまえ"
.byte   $21,$0D,$6D;?
kanjifix "が"
.byte   newLine
kanjifix "つかったぶんと さしひきで"
.byte   newLine
.byte   pauseText
.byte   currentCash;correct
kanjifix "ドル"
.byte   newLine
kanjifix "ぎんこうに はいっているはずだ。"
.byte   newLine
.byte   pauseText
kanjifix "*だいじに つかいなさい。"
.byte   newLine
.byte   stopText

kanjifix "*おせっかいかもしれないが"
.byte   newLine
kanjifix "ちょっと きゅうけいしては"
.byte   newLine
kanjifix "どうかね。"
.byte   newLine
.byte   stopText

kanjifix "*そうか。"
.byte   newLine
kanjifix "じゃ きろくしとくよ。"
.byte   newLine
.byte   stopText

kanjifix "*そうか。"
.byte   newLine
kanjifix "ま ちきゅうの ききだからな。"
.byte   newLine
.byte   stopText

kanjifix "*そうか。"
.byte   newLine
kanjifix "パパも もう きょうは"
.byte   newLine
kanjifix "やすもうと おもってたところだ。"
.byte   newLine
.byte   pauseText
kanjifix "*たたかいのきろくは"
.byte   newLine
kanjifix "つけといたよ。"
.byte   newLine
.byte   pauseText
kanjifix "*おやすみ‥‥"
.byte   newLine
.byte   stopText

kanjifix "*おたがい よくやったよな。"
.byte   newLine
.byte   pauseText
kanjifix "*それじゃ リセットボタンを"
.byte   newLine
kanjifix "おしながら でんげんを OFFに"
.byte   newLine
kanjifix "しなさい。 わかったね。"
.byte   newLine
.byte   stopText

kanjifix "*"
.byte   partyLead
kanjifix "も ママににて"
.byte   newLine
kanjifix "がんばりやだなぁ。"
.byte   newLine
.byte   pauseText
kanjifix "*むりするなよ。"
.byte   newLine
.byte   stopText

kanjifix "*それはそうと なんのようだい?"
.byte   newLine
.byte   stopText

kanjifix "*がんばれよ。"
.byte   newLine
.byte   stopText

kanjifix "*こんにちは。"
.byte   newLine
kanjifix "わたしも ピッピも"
.byte   newLine
kanjifix "すっごく げんきよ。"
.byte   newLine
.byte   stopText

kanjifix "*おまえ まさか"
.byte   newLine
kanjifix "みなみの はかばから"
.byte   newLine
kanjifix "きたんじゃないだろうな。"
.byte   newLine
.byte   stopText

kanjifix "*おまえ すごいな。"
.byte   newLine
.byte   stopText

kanjifix "*おまえ まさか"
.byte   newLine
kanjifix "ゾンビじゃないだろうな。"
.byte   newLine
kanjifix "ゾンビか?"
.byte   newLine
.byte   stopText

kanjifix "*ゾ ゾ ゾンビの‥‥"
.byte   newLine
kanjifix "バカッ! ヒャ--"
.byte   newLine
.byte   stopText

kanjifix "*ほんとに にんげんか?"
.byte   newLine
.byte   stopText

kanjifix "*よく ここまで こられたな。"
.byte   newLine
.byte   stopText

kanjifix "*やっぱりな‥‥"
.byte   newLine
.byte   stopText

kanjifix "*おれ  こわくて"
.byte   newLine
kanjifix "おもらししそうだよ。"
.byte   newLine
.byte   stopText

kanjifix "*こわかったよなぁ。"
.byte   newLine
.byte   stopText

kanjifix "*ゾンビ-!"
.byte   newLine
.byte   stopText

kanjifix "*フフフフフ‥‥"
.byte   newLine
kanjifix "おまえも ゾンビに なれ!"
.byte   newLine
.byte   stopText

kanjifix "*ししゃたちを うごかしている"
.byte   newLine
kanjifix "なにものかが いるらしい。"
.byte   newLine
.byte   stopText

kanjifix "*おわかいの やるではないか。"
.byte   newLine
.byte   stopText

kanjifix "*このまちも ゾンビに"
.byte   newLine
kanjifix "せんりょうされてしまうのか。"
.byte   newLine
.byte   stopText

kanjifix "*あら カナリアのヒナね。"
.byte   newLine
kanjifix "カナリアむらで てにいれたの?"
.byte   newLine
.byte   stopText

kanjifix "*へ-え。"
.byte   newLine
.byte   stopText

kanjifix "*カナリアむらの ことりなら"
.byte   newLine
kanjifix "きれいなうたを"
.byte   newLine
kanjifix "うたうはずだものね。"
.byte   newLine
.byte   stopText

kanjifix "*わたし カナリアむらの"
.byte   newLine
kanjifix "おじさんに あこがれてるのよ。"
.byte   newLine
.byte   stopText

kanjifix "*ちょうちょうさんは"
.byte   newLine
kanjifix "ゆうきのある すけっとを"
.byte   newLine
kanjifix "さがしておられる。"
.byte   newLine
.byte   stopText

kanjifix "*はかばに こどもが"
.byte   newLine
kanjifix "まよいこんだっていうけど"
.byte   newLine
kanjifix "たすかったのかなぁ。"
.byte   newLine
.byte   stopText

kanjifix "*おまえ‥‥"
.byte   newLine
kanjifix "ほんとに はかばに いくつもりか?"
.byte   newLine
.byte   stopText

kanjifix "*じょうしきを わきまえた"
.byte   newLine
kanjifix "こどもだと おもったな オレは。"
.byte   newLine
.byte   stopText

kanjifix "*どうぶつたちは"
.byte   newLine
kanjifix "くるって あばれだすし"
.byte   newLine
.byte   pauseText
kanjifix "*しにんは"
.byte   newLine
kanjifix "ゾンビになっておそってくるし‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*どうすればいいのよ。"
.byte   newLine
kanjifix "ヒ-ヒ-‥‥"
.byte   newLine
.byte   stopText

kanjifix "*あなたって スゴイ!"
.byte   newLine
.byte   stopText

kanjifix "*おまえんち ポルタ-ガイストに"
.byte   newLine
kanjifix "みまわれなかったか?"
.byte   newLine
kanjifix "おれんちなんか たいへんだったぜ。"
.byte   newLine
.byte   stopText

kanjifix "*どうぶつえんは"
.byte   newLine
kanjifix "くるったどうぶつが これいじょう"
.byte   newLine
kanjifix "にげださないよう"
.byte   newLine
kanjifix "かんぜんに へいさしたそうだぜ。"
.byte   newLine
.byte   stopText

kanjifix "*パンは たべることもできるけれど"
.byte   newLine
kanjifix "ちぎって パンくずにすると"
.byte   newLine
kanjifix "めじるしに なるんじゃないかな。"
.byte   newLine
.byte   pauseText
kanjifix "*‥‥おせっかい ですけどね。"
.byte   newLine
.byte   stopText

kanjifix "*きみでは むりかなぁ。"
.byte   newLine
kanjifix "きたいしてるんだけどなぁ。"
.byte   newLine
.byte   stopText

kanjifix "*いやなに‥‥"
.byte   newLine
kanjifix "はかばに こどもがまよいこんでね。"
.byte   newLine
.byte   pauseText
kanjifix "*つぎの ちょうちょうせんきょも"
.byte   newLine
kanjifix "ちかいし‥‥"
.byte   newLine
kanjifix "‥‥たすけてチョ-ダイ!"
.byte   newLine
.byte   stopText

kanjifix "*えっ いってくれるか。"
.byte   newLine
kanjifix "たすけだして くれるってか。"
.byte   newLine
.byte   stopText

kanjifix "*そのこが まいごになった"
.byte   newLine
kanjifix "ピッピちゃんかね。"
.byte   newLine
.byte   pauseText
kanjifix "*いやいや すばらしい。"
.byte   newLine
.byte   pauseText
kanjifix "*みどころのあるしょうねんだと"
.byte   newLine
kanjifix "おもって いたが。"
.byte   newLine
.byte   pauseText
kanjifix "*はくしゅ パチパチパチ‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*よかったねぇ"
.byte   newLine
kanjifix "かわいいピッピちゃん。"
.byte   newLine
.byte   pauseText
kanjifix "*ママに ちょうちょうさんに"
.byte   newLine
kanjifix "たすけてもらったと"
.byte   newLine
kanjifix "ちゃんというんだよ。"
.byte   newLine
.byte   pauseText
kanjifix "*"
.byte   partyLead
kanjifix "くんにも"
.byte   newLine
kanjifix "しょうきんを "
.byte   price
kanjifix "ドル"
.byte   newLine
kanjifix "あげよう。 ホレッ。"
.byte   newLine
.byte   stopText

kanjifix "*ところで"
.byte   newLine
kanjifix "ついでといっては なんだが"
.byte   newLine
.byte   pauseText
kanjifix "*どうぶつえんの じけんのほうも"
.byte   newLine
kanjifix "ひとがんばりしてみちゃ"
.byte   newLine
kanjifix "くれないかね?"
.byte   newLine
.byte   stopText

kanjifix "*そうか やっぱりいってくれるか!"
.byte   newLine
.byte   partyLead
kanjifix "くん きみも"
.byte   newLine
kanjifix "ほんとに ゲ-ムずきだねぇ。"
.byte   newLine
.byte   pauseText
kanjifix "*どうぶつえんの カギは"
.byte   newLine
kanjifix "じょやくの アボットから"
.byte   newLine
kanjifix "もらいなさい。"
.byte   newLine
.byte   stopText

kanjifix "*はい"
.byte   newLine
kanjifix "これが どうぶつえんのカギです。"
.byte   newLine
.byte   stopText

kanjifix "*いきてかえって きみは えいゆう!"
.byte   newLine
kanjifix "からだのぐあいさえよければ"
.byte   newLine
kanjifix "わたしも いくんだけど‥‥"
.byte   newLine
.byte   stopText

kanjifix "*おお"
.byte   newLine
kanjifix "えいゆうの "
.byte   partyLead
kanjifix "くん。"
.byte   newLine
kanjifix "ふくに とらのふんがついているよ。"
.byte   newLine
.byte   pauseText
kanjifix "*あ うそ うそ。"
.byte   newLine
kanjifix "こんどは なにも"
.byte   newLine
kanjifix "あげるものがないが‥‥"
.byte   newLine
kanjifix "ワハハハハハ。"
.byte   newLine
.byte   stopText

kanjifix "*ふしぎな しょうじょの"
.byte   newLine
kanjifix "うわさは きいてるかしら?"
.byte   newLine
.byte   pauseText
kanjifix "*きっと きみの たびを"
.byte   newLine
kanjifix "たすけてくれると おもうの。"
.byte   newLine
.byte   stopText

kanjifix "*どうぶつえんのカギくらい"
.byte   newLine
kanjifix "いくらでもあります。"
.byte   newLine
kanjifix "はい またひとつあげましょう。"
.byte   newLine
.byte   stopText

kanjifix "*みてのとおり どうぶつたちは"
.byte   newLine
kanjifix "みんなにげだしちまった。"
.byte   newLine
.byte   stopText

kanjifix "*いるのは カナリアのヒナだけだ。"
.byte   newLine
kanjifix "かうかね?"
.byte   newLine
.byte   stopText

kanjifix "*じゃ "
.byte   price
kanjifix "ドルで かうかね?"
.byte   newLine
.byte   stopText

kanjifix "*うたをしらないカナリアだからなぁ。"
.byte   newLine
.byte   stopText

kanjifix "*かわいがってね。 ありがとさん。"
.byte   newLine
.byte   stopText

kanjifix "*ただでも いらないかね?"
.byte   newLine
kanjifix "もっていきな。"
.byte   newLine
.byte   stopText

kanjifix "*カナリアは まだ げんきかね。"
.byte   newLine
.byte   stopText

kanjifix "*どうぶつたちは きっと なにかに"
.byte   newLine
kanjifix "あやつられていると おもうの。"
.byte   newLine
.byte   stopText

kanjifix "*どうぶつは かわいいわよね。"
.byte   newLine
.byte   stopText

kanjifix "*うふっ。"
.byte   newLine
.byte   stopText

kanjifix "*バ-カ!"
.byte   newLine
.byte   stopText

kanjifix "*いらっしゃいませ。"
.byte   newLine
kanjifix "また ごへんぴんですね。"
.byte   newLine
.byte   stopText

kanjifix "*"
.byte   partyLead
kanjifix "の こころに"
.byte   newLine
kanjifix "なにかが といかけてきている。"
.byte   newLine
.byte   stopText

kanjifix "*ああ よかった。"
.byte   newLine
.byte   stopText

kanjifix "*これからも とうデパ-トを"
.byte   newLine
kanjifix "よろしくおひきたてくださいませね。"
.byte   newLine
kanjifix "うっふん。"
.byte   newLine
.byte   stopText

kanjifix "*デパ-トの 1かいに"
.byte   newLine
kanjifix "ちょきんを おろせる きかいが"
.byte   newLine
kanjifix "できたのは いいんだけどね。"
.byte   newLine
.byte   pauseText
kanjifix "*キャなんとかカ-ドが ないと"
.byte   newLine
kanjifix "おろせないってのが ふべんね。"
.byte   newLine
.byte   stopText

kanjifix "*いいてんきじゃ。 しかし"
.byte   newLine
kanjifix "それがどうしたと いうのだろう。"
.byte   newLine
.byte   stopText

kanjifix "*ありゃ きみのカナリアは"
.byte   newLine
kanjifix "うたひめロ-ラのこどもじゃないか。"
.byte   newLine
kanjifix "ロ-ラに とどけてやっておくれ。"
.byte   newLine
.byte   stopText

kanjifix "*きみは なにか たいせつなことを"
.byte   newLine
kanjifix "わすれているな。 かなしいことだ。"
.byte   newLine
.byte   stopText

kanjifix "*ロ-ラは どこにいたかな‥‥"
.byte   newLine
.byte   stopText

kanjifix "*うたひめロ-ラが うたを"
.byte   newLine
kanjifix "おもいだしてくれたようだ。"
.byte   newLine
kanjifix "きみも メロディ-をおぼえたかい?"
.byte   newLine
.byte   stopText

kanjifix "*だ-めだ そりゃ。"
.byte   newLine
.byte   stopText

kanjifix "*うたは ちからなり‥‥"
.byte   newLine
kanjifix "まことに そのとおりじゃ。"
.byte   newLine
.byte   stopText

kanjifix "*わたしは まいごのピッピだよ。"
.byte   newLine
kanjifix "あなたって ゆうき あるね。"
.byte   newLine
.byte   stopText

kanjifix "*この おちょうしもの。 ハハハ。"
.byte   newLine
.byte   stopText

kanjifix "*ゆうきあるわよ。"
.byte   newLine
kanjifix "また いつか どこかで"
.byte   newLine
kanjifix "あえるといいね?"
.byte   newLine
.byte   stopText

kanjifix "*うれしい。 このバッヂは"
.byte   newLine
kanjifix "やくそくのしるしよ。"
.byte   newLine
kanjifix "ハイ うけとって。"
.byte   newLine
.byte   stopText

kanjifix "*すきなひとがいるのね。"
.byte   newLine
kanjifix "きっと‥‥"
.byte   newLine
.byte   stopText

kanjifix "*じゃ ここでバイバイ。"
.byte   newLine
.byte   pauseText
kanjifix "*わたしの もっている グッズは"
.byte   newLine
kanjifix "あとで わたしのうちに"
.byte   newLine
kanjifix "とりにきてね。"
.byte   newLine
.byte   pauseText
kanjifix "*ところで‥‥"
.byte   newLine
kanjifix "わたしのくつした みじかすぎる?"
.byte   newLine
.byte   stopText

kanjifix "*こたえなくてもよかったのに。"
.byte   newLine
kanjifix "かわいいひと‥‥"
.byte   newLine
.byte   stopText

kanjifix "*キャッキャッキャッ"
.byte   newLine
kanjifix "(おまえの かあさんでべそ!)"
.byte   newLine
.byte   stopText

kanjifix "*"
.byte   partyLead
.byte   $21,$0D,$6D
kanjifix "は"
.byte   newLine
kanjifix "「かみのしっぽは どこにある。」"
.byte   newLine
kanjifix "という こえをきいた。"
.byte   newLine
.byte   stopText

kanjifix "*ありゃりゃ。 かわったふくを"
.byte   newLine
kanjifix "きているな おめぇ。"
.byte   newLine
.byte   pauseText
kanjifix "*そんなにめだつふくを きてると"
.byte   newLine
kanjifix "まものが よってくるだよ。"
.byte   newLine
.byte   stopText

kanjifix "*しあわせは あるいてこない。"
.byte   newLine
kanjifix "だども ふしあわせも"
.byte   newLine
kanjifix "あるいちゃこねぇよなぁ。"
.byte   newLine
.byte   stopText

kanjifix "*さいなんに であいたくなかったら"
.byte   newLine
kanjifix "いっぽも あるかねぇこった。"
.byte   newLine
.byte   stopText

kanjifix "*そうか"
.byte   newLine
kanjifix "ふしあわせは あるくか‥‥"
.byte   newLine
kanjifix "しらなんだ。"
.byte   newLine
.byte   stopText

kanjifix "*おらの センスを みとめただか。"
.byte   newLine
kanjifix "おめぇも カッコイイあだなが"
.byte   newLine
kanjifix "ほしいだな?"
.byte   newLine
.byte   stopText

kanjifix "*できた。"
.byte   newLine
kanjifix "いまから おめぇは"
.byte   newLine
kanjifix "うすのろぶた "
.byte   partyLead
kanjifix "だ。"
.byte   newLine
.byte   pauseText
kanjifix "*おしゃれな ム-ドになったぞ。"
.byte   newLine
.byte   stopText

kanjifix "*そうか。 ざんねんだな。"
.byte   newLine
.byte   stopText

kanjifix "*やぁ うすのろぶた"
.byte   partyLead
kanjifix "。"
.byte   newLine
.byte   stopText

kanjifix "*しあわせについて"
.byte   newLine
kanjifix "てつがくしてるやつに あったか?"
.byte   newLine
.byte   stopText

kanjifix "*やつは"
.byte   newLine
kanjifix "あだなをつける めいじんなんだ。"
.byte   newLine
kanjifix "さいこうに センスが いいんだぜ。"
.byte   newLine
.byte   stopText

kanjifix "*あわなきゃ わかれもないわけだ。"
.byte   newLine
.byte   stopText

kanjifix "*あわなきゃ わかれもないっていう"
.byte   newLine
kanjifix "かんがえのおとこに あったか?"
.byte   newLine
.byte   stopText

kanjifix "*おれも そんなかんがえかた"
.byte   newLine
kanjifix "してるんだ。"
.byte   newLine
.byte   stopText

kanjifix "*あったほうが ためになるぞ。"
.byte   newLine
.byte   stopText

kanjifix "*クイ-ンマリ-の いずみで"
.byte   newLine
kanjifix "すっかり げんきになったわ。"
.byte   newLine
.byte   stopText

kanjifix "*クイ-ンマリ-のいずみは"
.byte   newLine
kanjifix "とおいのが つらいわよねぇ。"
.byte   newLine
kanjifix "わかりにくい ばしょにあるし。"
.byte   newLine
.byte   stopText

kanjifix "*この こわれたイヤリングを"
.byte   newLine
kanjifix "いずみにもっていって まほうの"
.byte   newLine
kanjifix "イヤリングにするの。"
.byte   newLine
.byte   stopText

kanjifix "*いずみのふしぎなおとを きくと"
.byte   newLine
kanjifix "それだけで おちつくよなぁ。"
.byte   newLine
.byte   stopText

kanjifix "*もっと みなみ。"
.byte   newLine
kanjifix "みちにまよったのかい。"
.byte   newLine
.byte   pauseText
kanjifix "*ごめん ごめん"
.byte   newLine
kanjifix "いま おしえたのは"
.byte   newLine
kanjifix "トイレのばしょだった。"
.byte   newLine
.byte   pauseText
kanjifix "*クイ-ンマリ-の いずみなら"
.byte   newLine
kanjifix "おしろから にしに いくんだよ。"
.byte   newLine
.byte   stopText

kanjifix "*スプ-ンを まげちゃったら"
.byte   newLine
kanjifix "ごはんが たべにくいや。"
.byte   newLine
kanjifix "おにいちゃんもとに もどせる?"
.byte   newLine
.byte   stopText

kanjifix "*はやく もどして。"
.byte   newLine
.byte   pauseText
kanjifix "*("
.byte   nintenName
kanjifix "は"
.byte   newLine
kanjifix "PSIのちからで スプ-ンを"
.byte   newLine
kanjifix "もとに もどしてやった。)"
.byte   newLine
.byte   pauseText
kanjifix "*あんがと。"
.byte   newLine
kanjifix "パクパク モシャモシャ。"
.byte   newLine
kanjifix "うちにこんやは とまっていきなよ?"
.byte   newLine
.byte   stopText

kanjifix "*どうしてぇ!?"
.byte   newLine
.byte   stopText

kanjifix "*あなた へんなかんじの かたね。"
.byte   newLine
kanjifix "でも にくめないタイプ‥‥"
.byte   newLine
.byte   stopText

kanjifix "*よかった。"
.byte   newLine
.byte   stopText

kanjifix "*うぇ-ん。 ひとのしんせつは"
.byte   newLine
kanjifix "うけるものだよ。"
.byte   newLine
.byte   stopText

kanjifix "*あら たびのかた"
.byte   newLine
kanjifix "うちで おしょくじしていったら?"
.byte   newLine
.byte   pauseText
kanjifix "*さぁ"
.byte   newLine
kanjifix "きょうのメニュ-は なんでしょう?"
.byte   newLine
kanjifix "わかる?"
.byte   newLine
.byte   stopText

kanjifix "*まぁ どうしてわからないのかしら。"
.byte   newLine
kanjifix "あやしいひと!"
.byte   newLine
.byte   stopText

kanjifix "*そう "
.byte   favFood
kanjifix "。"
.byte   newLine
.byte   pauseText
kanjifix "*あなたのこころを よんで"
.byte   newLine
.byte   favFood
kanjifix "にしたのよ。"
.byte   newLine
kanjifix "おいしい?"
.byte   newLine
.byte   stopText

kanjifix "*うちは がっきや だったんだけど"
.byte   newLine
kanjifix "ちゅうもんした オカリナが"
.byte   newLine
kanjifix "ぜんぜん できてこないの。"
.byte   newLine
.byte   pauseText
kanjifix "*もう あきらめた-っと。"
.byte   newLine
.byte   stopText

kanjifix "*あら そう。"
.byte   newLine
.byte   stopText

kanjifix "*ありがとう"
.byte   newLine
kanjifix "ベッドのよういも できてるわ。"
.byte   newLine
kanjifix "ゆっくりおやすみ。"
.byte   newLine
.byte   stopText

kanjifix "*えんりょしないで"
.byte   newLine
kanjifix "また とまっていきなよ。"
.byte   newLine
.byte   stopText

kanjifix "*おまえ"
.byte   newLine
kanjifix "なんか このくにに なじまない"
.byte   newLine
kanjifix "かおしてるなぁ?"
.byte   newLine
.byte   stopText

kanjifix "*きぼうのオカリナができたんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*きみのしってる メロディ-が"
.byte   newLine
kanjifix "ながれるんだよ。"
.byte   newLine
.byte   pauseText
kanjifix "*ほしいか?"
.byte   newLine
.byte   stopText

kanjifix "*すなおな しょうねんだな。"
.byte   newLine
kanjifix "はい どうぞ。 アハハハハ。"
.byte   newLine
.byte   stopText

kanjifix "*ほしいって かおに かいてあるよ。"
.byte   newLine
kanjifix "アハハハハ もっていきな。"
.byte   newLine
.byte   stopText

kanjifix "*よっ ぼうず げんきか。"
.byte   newLine
.byte   stopText

kanjifix "*マジカントのくにに"
.byte   newLine
kanjifix "でぐちなんてものが あるものかね。"
.byte   newLine
kanjifix "アハハハ。"
.byte   newLine
.byte   stopText

kanjifix "*そと?"
.byte   newLine
kanjifix "そとのせかいって なんのこったね?"
.byte   newLine
.byte   stopText

kanjifix "*あなが あったら"
.byte   newLine
kanjifix "はいりたいですわ。"
.byte   newLine
kanjifix "もし あったら だけどね。"
.byte   newLine
.byte   stopText

kanjifix "*わたしは ふしぎな"
.byte   newLine
kanjifix "にもつあずかりにん。"
.byte   newLine
.byte   pauseText
kanjifix "*ごようですか?"
.byte   newLine
.byte   stopText

kanjifix "*ぼく ものまねが うまいんだぜ。"
.byte   newLine
.byte   stopText

kanjifix "*まちの ひがしのほうに"
.byte   newLine
kanjifix "あなが たくさんあるんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*どの あなか わからないんだけど"
.byte   newLine
kanjifix "べつの せかいの おとが"
.byte   newLine
kanjifix "きこえてくるんだ。"
.byte   newLine
.byte   stopText

kanjifix "*あかいくさを ひっこぬいて"
.byte   newLine
kanjifix "いずみにつければ なんと"
.byte   newLine
kanjifix "マジックハ-ブになるだよ。"
.byte   newLine
.byte   stopText

kanjifix "*でっかいふくろは いるかね?"
.byte   newLine
.byte   stopText

kanjifix "*じゃ あんたのキャッシュカ-ドを"
.byte   newLine
kanjifix "しばらくかしてくれんかね。"
.byte   newLine
.byte   stopText

kanjifix "*マジックハ-ブが 30たんいも"
.byte   newLine
kanjifix "はいっているんだぜ。"
.byte   newLine
.byte   stopText

kanjifix "*ありがとう かならず かえすよ。"
.byte   newLine
kanjifix "なんか"
.byte   newLine
kanjifix "カッコイイな とおもってね。"
.byte   newLine
.byte   stopText

kanjifix "*あんたは にんげんを"
.byte   newLine
kanjifix "うたがうことを しっとるな。"
.byte   newLine
kanjifix "そのほうが いいかもしれんが‥‥"
.byte   newLine
.byte   stopText

kanjifix "*ああ キャッシュカ-ドを"
.byte   newLine
kanjifix "かえさなきゃな。"
.byte   newLine
.byte   stopText

kanjifix "*クイ-ンは いま ちょっと"
.byte   newLine
kanjifix "からだの ぐあいがわるいの。"
.byte   newLine
.byte   stopText

kanjifix "*あやしい かおだな。"
.byte   newLine
kanjifix "わしのナゾナゾがわかったら"
.byte   newLine
kanjifix "ここをとおして やるけどな‥‥"
.byte   newLine
.byte   stopText

kanjifix "*そうでした。"
.byte   newLine
kanjifix "こたえは わに にひき。"
.byte   newLine
.byte   pauseText
kanjifix "*もんだいは"
.byte   newLine
kanjifix "まだ かんがえてなかったんだよ"
.byte   newLine
kanjifix "ヘヘヘ。"
.byte   newLine
.byte   stopText

kanjifix "*ごきげんよう。"
.byte   newLine
.byte   stopText

kanjifix "*クイ-ンの うたを"
.byte   newLine
kanjifix "また ききたいな。"
.byte   newLine
.byte   stopText

kanjifix "*ハロ-!"
.byte   newLine
kanjifix "おれは てつがくしていたところだ。"
.byte   newLine
.byte   pauseText
kanjifix "*ギタ-のおとが じゃまで ものを"
.byte   newLine
kanjifix "かんがえられないよ。"
.byte   newLine
.byte   pauseText
kanjifix "*あっ!"
.byte   newLine
kanjifix "じぶんが ギタ-をひいていたのか。"
.byte   newLine
kanjifix "まいった まいった。"
.byte   newLine
.byte   pauseText
kanjifix "*‥‥‥‥‥‥‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*ここからの はなしは"
.byte   newLine
kanjifix "ぜったいに ないしょなんだが"
.byte   newLine
.byte   pauseText
kanjifix "すっごく つよくなったら"
.byte   newLine
kanjifix "おれに あいにこい。"
.byte   newLine
.byte   pauseText
kanjifix "*それと このことは"
.byte   newLine
kanjifix "ぜったいに わすれないように"
.byte   newLine
kanjifix "メモなんか しとくと いいぞ。"
.byte   newLine
.byte   stopText

kanjifix "*おれを むししようとしたな。"
.byte   newLine
kanjifix "さみしいもんだぜ。"
.byte   newLine
kanjifix "こんなところで ひとりぼっちでさ。"
.byte   newLine
.byte   pauseText
kanjifix "*できることなら なんでもするぜ。"
.byte   newLine
kanjifix "ホラッ!"
.byte   newLine
.byte   stopText

kanjifix "*うれしいよな-"
.byte   newLine
kanjifix "おまえらが きてくれて。"
.byte   newLine
.byte   pauseText
kanjifix "*わかってるって"
.byte   newLine
kanjifix "やってほしいことは。"
.byte   newLine
kanjifix "ホラッ!"
.byte   newLine
.byte   stopText

kanjifix "*おれ ついに うたをつくったんだ。"
.byte   newLine
kanjifix "きけ!"
.byte   newLine
kanjifix "おんがくずきの ぼうけんか"
.byte   $21,$0D,$6D
kanjifix "よ。"
.byte   newLine
.byte   pauseText
kanjifix "「キュ-ピ-にんぎょう なぜなくの"
.byte   newLine
kanjifix "それは カナリアが なくからよ"
.byte   newLine
.byte   pauseText
kanjifix "サルが うたえば ピアノもうたう"
.byte   newLine
kanjifix "ピアノは おばけが ひくのかな"
.byte   newLine
.byte   pauseText
kanjifix "さばくのサボテン さみしそう"
.byte   newLine
kanjifix "ひとりで よなよな うたってる"
.byte   newLine
.byte   pauseText
kanjifix "ドラゴンたおれて おんぷがのこる"
.byte   newLine
kanjifix "イヴが さいごに うたうとき"
.byte   newLine
kanjifix "クイ-ンマリ-に じかんが もどる"
.byte   newLine
.byte   pauseText
kanjifix "ラララ ふしぎなララバイよ"
.byte   newLine
kanjifix "ララバイ バイバイ さようなら」"
.byte   newLine
.byte   pauseText
kanjifix "*いいうただろ。"
.byte   newLine
kanjifix "いいうただよなぁ‥‥"
.byte   newLine
.byte   stopText

kanjifix "*もりのおくに こどくをあいする"
.byte   newLine
kanjifix "ギタ-ひきが いるの。"
.byte   newLine
.byte   pauseText
kanjifix "*ちょっといいおとこで‥‥"
.byte   newLine
kanjifix "しかも すっごく しじんなの。"
.byte   newLine
.byte   stopText

kanjifix "*ゆうじょうの ゆびわ ほしい?"
.byte   newLine
.byte   stopText

kanjifix "*じゃ あなたは わたしの"
.byte   newLine
kanjifix "おともだちになるのよ。"
.byte   newLine
kanjifix "いい?"
.byte   newLine
.byte   stopText

kanjifix "*‥‥そんなきが‥‥したわ。"
.byte   newLine
.byte   stopText

kanjifix "*わたしのこと わすれちゃだめよ。"
.byte   newLine
kanjifix "ぜったいに。"
.byte   newLine
.byte   stopText

kanjifix "*おれは うたわないサルだ。"
.byte   newLine
.byte   pauseText
kanjifix "*でも ふつうサルってのは"
.byte   newLine
kanjifix "うたわないもんだ。"
.byte   newLine
kanjifix "しつもんは あるか?"
.byte   newLine
.byte   stopText

kanjifix "*ぐもんだね‥‥どうせ。"
.byte   newLine
.byte   stopText

kanjifix "*よかった。"
.byte   newLine
kanjifix "つっこんだ しつもんをされたら"
.byte   newLine
kanjifix "どうしようと おもってたんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*それにしても おまえ"
.byte   newLine
kanjifix "クイ-ンマリ-に かおが"
.byte   newLine
kanjifix "にてるなぁ。"
.byte   newLine
.byte   pauseText
kanjifix "*どうしてだろ。"
.byte   newLine
.byte   stopText

kanjifix "*あんた"
.byte   $21,$0D,$6D
kanjifix "に あったら"
.byte   newLine
kanjifix "いおうと おもってたんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*せんろが なおって"
.byte   newLine
kanjifix "でんしゃが"
.byte   newLine
kanjifix "とおれるように なったってね。"
.byte   newLine
.byte   stopText

kanjifix "*わたし"
.byte   newLine
kanjifix "いっしょうに いちどでいいから"
.byte   newLine
kanjifix "おしろに はいって"
.byte   newLine
.byte   pauseText
kanjifix "*マリ-さまの おかおを"
.byte   newLine
kanjifix "はいけんしたいわ。"
.byte   newLine
.byte   stopText

kanjifix "*たまに クイ-ンマリ-は"
.byte   newLine
kanjifix "うなされてるんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*わるいこを しかりつけるような"
.byte   newLine
kanjifix "ことをいって"
.byte   newLine
.byte   pauseText
kanjifix "*こわい こわい となきさけぶのさ。"
.byte   newLine
.byte   pauseText
kanjifix "*そして"
.byte   newLine
kanjifix "うたを うたいはじめるんだ。"
.byte   newLine
kanjifix "ほんのすこしだけ‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*で おもいだせないって"
.byte   newLine
kanjifix "くるしがってさ。 あせびっしょり"
.byte   newLine
kanjifix "かいて めざめるわけさ。"
.byte   newLine
.byte   pauseText
kanjifix "*クイ-ンマリ-は むかし"
.byte   newLine
kanjifix "よっぽど かなしい"
.byte   newLine
kanjifix "ひどいめに あったのかな。"
.byte   newLine
.byte   stopText

kanjifix "*でも"
.byte   newLine
kanjifix "おんなのこにしか あげないよ。"
.byte   newLine
.byte   stopText

kanjifix "*ぐ-ぐ-ぐ-‥‥"
.byte   newLine
.byte   stopText

kanjifix "*うそつきめ!"
.byte   newLine
.byte   stopText

kanjifix "*あなた"
.byte   $21,$0D,$6D
kanjifix "が このくにのひとで"
.byte   newLine
kanjifix "ないことは みんなしってるわ。"
.byte   newLine
kanjifix "でも なかまだと おもっているの。"
.byte   newLine
.byte   pauseText
kanjifix "*めのうのつりばり さえあれば"
.byte   newLine
kanjifix "いつでもかえってこられるはず。"
.byte   newLine
.byte   stopText

kanjifix "*きっと また かえってくるのよ。"
.byte   newLine
kanjifix "くるしいときに ここに‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*みんな あなた"
.byte   $21,$0D,$6D
kanjifix "を"
.byte   newLine
kanjifix "すきなんだから。"
.byte   newLine
.byte   stopText

kanjifix "*ようこそ "
.byte   partyLead
kanjifix "。"
.byte   newLine
.byte   pauseText
kanjifix "*このマジカントこくでは みんなが"
.byte   newLine
kanjifix "ともだちになれるし ほしいものは"
.byte   newLine
kanjifix "すきなだけ えられるのですよ。"
.byte   newLine
.byte   pauseText
kanjifix "*えっ"
.byte   newLine
kanjifix "わたしのうたが ききたいの?"
.byte   newLine
.byte   pauseText
kanjifix "*ごめんなさい。"
.byte   newLine
kanjifix "どうしても おもいだせない。"
.byte   newLine
.byte   pauseText
kanjifix "*いつか きっと"
.byte   newLine
kanjifix "おもいだして うたえるはず‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*あのうたを うたえたときに"
.byte   newLine
kanjifix "そう‥‥なにかが おこるの。"
.byte   newLine
.byte   stopText

kanjifix "*‥‥。"
.byte   newLine
.byte   stopText

kanjifix "*あなた"
.byte   $21,$0D,$6D
kanjifix "の おぼえてきたうたを"
.byte   newLine
kanjifix "わたしに きかせて。"
.byte   newLine
.byte   stopText

kanjifix "*そう。 そう‥‥このうただった。"
.byte   newLine
.byte   stopText

kanjifix "*ああ‥‥ギ-グ‥‥"
.byte   newLine
.byte   stopText

kanjifix "*わたし このマジカントこくが"
.byte   newLine
kanjifix "きえて なくなっちゃう"
.byte   newLine
kanjifix "ゆめをみたのよ。"
.byte   newLine
.byte   pauseText
kanjifix "*まだ"
.byte   newLine
kanjifix "しんぞうが ドキドキしてるわ。"
.byte   newLine
.byte   stopText

kanjifix "*ぼくは ぢめんを およぐねこ。"
.byte   newLine
kanjifix "ぼくの てのなかに"
.byte   newLine
kanjifix "はいってるものを あててごらん。"
.byte   newLine
.byte   stopText

kanjifix "*ぼくの てのなかに"
.byte   newLine
kanjifix "はいっているものが みえたかい?"
.byte   newLine
.byte   pauseText
kanjifix "*そう。 リボン。"
.byte   newLine
kanjifix "ふしぎなちからのわくリボンさ。"
.byte   newLine
.byte   stopText

kanjifix "*おんなのこには"
.byte   newLine
kanjifix "このふしぎなリボンを あげようね。"
.byte   newLine
.byte   stopText

kanjifix "*おれは およぐ ねこ。"
.byte   newLine
.byte   pauseText
kanjifix "*よわいこに ゆうきと ちからを"
.byte   newLine
kanjifix "あたえる キャンディを"
.byte   newLine
kanjifix "しってるかい?"
.byte   newLine
.byte   stopText

kanjifix "*そうか。 でも きみは"
.byte   newLine
kanjifix "つよいこだから いらないな。"
.byte   newLine
.byte   stopText

kanjifix "*そっちの メガネのこは"
.byte   newLine
kanjifix "よわそうだから あげような。"
.byte   newLine
.byte   stopText

kanjifix "*キャンディ おいしかっただろ?"
.byte   newLine
.byte   stopText

kanjifix "*おたすけじいさんを"
.byte   newLine
kanjifix "よびたかったら"
.byte   newLine
kanjifix "マリ-の いずみに ゆくのだ。"
.byte   newLine
.byte   pauseText
kanjifix "*こころの さけびで やってくる。"
.byte   newLine
kanjifix "こころの さけびだ!"
.byte   newLine
.byte   stopText

kanjifix "*(おきゃくは さわいだ。)"
.byte   newLine
.byte   pauseText
kanjifix "*あの ぼうしかぶった いしは"
.byte   newLine
kanjifix "なんなんだよ! ブ-ブ-。"
.byte   newLine
.byte   stopText

kanjifix "*よんだか?"
.byte   newLine
.byte   stopText

kanjifix "*そうか。 さいなら。"
.byte   newLine
.byte   stopText

kanjifix "*どうして ほしい?"
.byte   newLine
.byte   stopText

kanjifix "*やくにたってるかい?"
.byte   newLine
.byte   stopText

kanjifix "*そうか。"
.byte   newLine
kanjifix "ちょっと あらりょうじだが"
.byte   newLine
kanjifix "しんぼうするか?"
.byte   newLine
.byte   stopText

kanjifix "*えいやっ ホカホカ。"
.byte   newLine
kanjifix "なおった。 さいなら。"
.byte   newLine
.byte   stopText

kanjifix "*しんでしまうのも"
.byte   newLine
kanjifix "ひとつのたのしみかも しれんな。"
.byte   newLine
kanjifix "さいなら。"
.byte   newLine
.byte   stopText

kanjifix "*おれは わすれられたおとこ"
.byte   newLine
kanjifix "いないも どうぜん。"
.byte   newLine
.byte   pauseText
kanjifix "*きづいてくれなくても"
.byte   newLine
kanjifix "よかったのに‥‥"
.byte   newLine
.byte   pauseText
kanjifix "*おれのことなんか"
.byte   newLine
kanjifix "むしして いいんだ。"
.byte   newLine
.byte   stopText

kanjifix "*おれは どこにもいないおとこ"
.byte   newLine
kanjifix "やさしいことばなんて"
.byte   newLine
kanjifix "かけてくれたら こまっちゃうぜ。"
.byte   newLine
.byte   pauseText
kanjifix "*ひとこいしく なったら"
.byte   newLine
kanjifix "いきていけない。"
.byte   newLine
.byte   stopText

kanjifix "*おれのことばは"
.byte   newLine
kanjifix "いつも ひとりごと。"
.byte   newLine
.byte   pauseText
kanjifix "*うまれたときから きょうまで"
.byte   newLine
kanjifix "ずっと ひとりでいたおとこ。"
.byte   newLine
.byte   stopText

kanjifix "*うんがいいとか わるいとか。"
.byte   newLine
kanjifix "そんなことは おれには"
.byte   newLine
kanjifix "かんけいないね。"
.byte   newLine
.byte   pauseText
kanjifix "*いきをするのに せいいっぱいさ。"
.byte   newLine
.byte   stopText

kanjifix "*なぜ そんなにしつこく"
.byte   newLine
kanjifix "おれに はなしかけるんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*おまえも"
.byte   newLine
kanjifix "わすれられたおとこなのか?"
.byte   newLine
.byte   stopText

kanjifix "*うそを つけ。"
.byte   newLine
kanjifix "おまえを まってる おんなのこの"
.byte   newLine
kanjifix "ところへ かえれ!!"
.byte   newLine
.byte   stopText

kanjifix "*そうさ。 そうだよな。"
.byte   newLine
kanjifix "そうなんだ。"
.byte   newLine
.byte   pauseText
kanjifix "*おまえも はやく おれのことを"
.byte   newLine
kanjifix "むししろよ。"
.byte   newLine
.byte   stopText

kanjifix "*そうだ。 ありがとうよ。"
.byte   newLine
.byte   stopText

kanjifix "*もちきれないようだな。"
.byte   newLine
kanjifix "また でなおしておいで。"
.byte   newLine
.byte   stopText

kanjifix "*マザ-ズデイのあたりは なんか"
.byte   newLine
kanjifix "とんでもない じけんが"
.byte   newLine
kanjifix "おこってるらしいな。"
.byte   newLine
.byte   stopText

kanjifix "*ゾンビが ゆうかいされて"
.byte   newLine
kanjifix "どうぶつが どうしたとか‥‥"
.byte   newLine
kanjifix "めちゃくちゃらしいな。"
.byte   newLine
.byte   stopText

kanjifix "「サンクスギビングのまちに"
.byte   newLine
kanjifix "          ようこそ!!"
.byte   newLine
kanjifix " "
.byte   newLine
kanjifix "CM--"
.byte   newLine
kanjifix "やすくて はやくて いいおとこ。"
.byte   newLine
.byte   pauseText
kanjifix "いしゃは ビッグベン.ケ-シ-に"
.byte   newLine
kanjifix "かぎる。"
.byte   newLine
.byte   pauseText
kanjifix "いまなら とくべつ "
.byte   newLine
kanjifix "おおやすちりょう!!"
.byte   newLine
.byte   pauseText
kanjifix "いのちは しんでもまもりたいもの」"
.byte   newLine
.byte   stopText

.repeat $5A
.byte $FF
.endrepeat

.endif