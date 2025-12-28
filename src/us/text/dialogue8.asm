.segment        "CHR17": absolute

MSG_MAGICANT_GOODSKEEPER_SOMEONEELSE:
.byte   "*Can't someone else",newLine
.byte   " carry that? Your",newLine
.byte   " load is too great!",newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_FULL:
.byte   "*The closet is",newLine
.byte   " full.",newLine
.byte   stopText

MSG_MAGICANT_MARIAFADE:
.byte   "*After telling the",newLine
.byte   " story to ",nintenName,",",newLine
.byte   pauseText
.byte   "*with a rush of",newLine
.byte   " wind, Queen Mary",newLine
.byte   " vanished.",newLine
.byte   pauseText
.byte   "*As she disappeared,",newLine
.byte   " so did Magicant.",newLine
.byte   pauseText
.byte   "*Magicant was a",newLine
.byte   " mirage...",newLine
.byte   pauseText
.byte   "*A mirage born of",newLine
.byte   " Maria's",newLine
.byte   " consciousness.",newLine
.byte   stopText

.byte   "*I am the one who",newLine
.byte   " has called you.",newLine
.byte   pauseText
.byte   "*",nintenName,", ",anaName,",",newLine
.byte   " ",lloydName,", and",newLine
.byte   " ",teddyName,"!",newLine
.byte   pauseText
.byte   "*All of the brave",newLine
.byte   " children.",newLine
.byte   pauseText
.byte   "*Now is the time!",newLine
.byte   stopText

MSG_MAGICANT_VENDORINTRO:
.byte   "*What are you",newLine
.byte   " staring at?",newLine
.byte   pauseText
.byte   "*Here in Magicant",newLine
.byte   " it's just like the",newLine
.byte   " world outside.",newLine
.byte   pauseText
.byte   "*Just leave me some",newLine
.byte   " cash, then with the",newLine
.byte   " Goods you can dash.",newLine
.byte   pauseText
.byte   "*Hee Hee Hee.",newLine
.byte   stopText

MSG_MR_RAILROADCORPSE:
.byte   "*Get on the train,",newLine
.byte   " or you will have a",newLine
.byte   " hard time like me.",newLine
.byte   stopText

MSG_BURGERSHOP_ANYMORE:
.byte   "*Do you want",newLine
.byte   " anything else?",newLine
.byte   stopText

MSG_MTITOI_TOMBSTONE1:
.byte   "*",partyLead,",",newLine
.byte   " Welcome...",newLine
.byte   pauseText
.byte   "*I always believed",newLine
.byte   " that you would",newLine
.byte   " find your way here.",newLine
.byte   pauseText
.byte   "*Your Great-Grand",newLine
.byte   " Mother Maria's love",newLine
.byte   " was scattered,",newLine
.byte   pauseText
.byte   "*scattered in the",newLine
.byte   " form of melodies.",newLine
.byte   pauseText
.byte   "*I have a melody",newLine
.byte   " for you. Listen",newLine
.byte   " and remember...",newLine
.byte   stopText

MSG_MTITOI_TOMBSTONE2:
.byte   "*The crystal",newLine
.byte   " fragments that had",newLine
.byte   " broken off",newLine
.byte   pauseText
.byte   "*stopped glowing and",newLine
.byte   " disappeared..",newLine
.byte   stopText

.byte   stopText

MSG_UNK:
.byte   stopText

MSG_GOODS_GIVESELF:
.byte   "*",user," didn't do",newLine
.byte   " anything.",newLine
.byte   stopText

MSG_GOODS_GIVE:
.byte   "*",user," gave",newLine
.byte   " ",recipient," to",newLine
.byte   " ",result,".",newLine
.byte   stopText

MSG_GOODS_HANDOFF:
.byte   "*",user," put",newLine
.byte   " ",recipient," in",newLine
.byte   " ",result,"'s bag.",newLine
.byte   stopText

MSG_GOODS_TAKEFROM:
.byte   "*",result," pulled",newLine
.byte   " ",recipient," from",newLine
.byte   " ",user,"'s bag.",newLine
.byte   stopText

MSG_GOODS_TAKENTHROW:
.byte   "*",partyLead," threw",newLine
.byte   " ",recipient," out of",newLine
.byte   " ",user,"'s bag.",newLine
.byte   stopText

MSG_GOODS_MOVE:
.byte   "*",partyLead," took",newLine
.byte   " ",recipient," from",newLine
.byte   " ",user,"'s bag ",newLine
.byte   pauseText
.byte   "*and placed it in",newLine
.byte   " ",result,"'s bag.",newLine
.byte   stopText

MSG_ITEM_EAT:
.byte   "*",user," ate",newLine
.byte   " ",recipient,".",newLine
.byte   stopText

MSG_ITEM_DRINK:
.byte   "*",user," drank",newLine
.byte   " ",recipient,".",newLine
.byte   stopText

MSG_ITEM_RECOVER:
.byte   "*recovered by",newLine
.byte   " ",price,".",newLine
.byte   stopText

MSG_ITEM_INCREASE:
.byte   "*increased by",newLine
.byte   " ",price,".",newLine
.byte   stopText

MSG_HP_IS:
.byte   "*",user,"'s HP is",newLine
.byte   stopText

MSG_PP_IS:
.byte   "*",user,"'s PP is",newLine
.byte   stopText

MSG_FIGHT_IS:
.byte   "*",user,"'s ENERGY is",newLine
.byte   stopText

MSG_SPEED_IS:
.byte   "*",user,"'s SPEED is",newLine
.byte   stopText

MSG_WISDOM_IS:
.byte   "*",user,"'s WISDOM is",newLine
.byte   stopText

MSG_STRENGTH_IS:
.byte   "*",user,"'s STRENGTH is",newLine
.byte   stopText

MSG_FORCE_IS:
.byte   "*",user,"'s FORCE is",newLine
.byte   stopText

MSG_USEBIGBAG:
.byte   "*",user," took out a",newLine
.byte   " Magic Herb from the",newLine
.byte   " Big Bag and USEd it.",newLine
.byte   stopText

MSG_USEBREAD:
.byte   "*",user," started ",newLine
.byte   " dropping the",newLine
.byte   " Crumbs.",newLine
.byte   stopText

MSG_USEBREAD_FAIL:
.byte   "*You can't USE",newLine
.byte   " Bread until old",newLine
.byte   " Crumbs are USEd up.",newLine
.byte   stopText

MSG_USECRUMBS:
.byte   "*",partyLead," returned",newLine
.byte   " to the head of the",newLine
.byte   " trail...",newLine
.byte   pauseText
.byte   "*by following the",newLine
.byte   " Crumbs that had",newLine
.byte   " been dropped.",newLine
.byte   stopText

MSG_USERIBBON:
.byte   "*",user," tied the",newLine
.byte   " Ribbon into",newLine
.byte   " her hair.",newLine
.byte   stopText

MSG_USEFINALWEAPON:
.byte   "*If that is true,",newLine
.byte   " push the POWER off,",newLine
.byte   pauseText
.byte   "*but remember to",newLine
.byte   " hold in RESET!",newLine
.byte   stopText

MSG_USERULER:
.byte   "*",user," measured the",newLine
.byte   " lengths of many",newLine
.byte   " things.",newLine
.byte   stopText

MSG_BIGBAG_EMPTY:
.byte   "*When the Big Bag",newLine
.byte   " was emptied,",newLine
.byte   pauseText
.byte   "*it disappeared",newLine
.byte   " into thin air.",newLine
.byte   stopText

MSG_PAYPHONE_CARDEXPIRE:
.byte   "*The credit limit of",newLine
.byte   " the Telephone Card",newLine
.byte   " has been reached.",newLine
.byte   stopText

MSG_CURE_POISON:
.byte   "*The poison was",newLine
.byte   " neutralized from",newLine
.byte   " ",user,"'s body.",newLine
.byte   stopText

MSG_CURE_COLD:
.byte   "*",user," was rid",newLine
.byte   " of the cold.",newLine
.byte   stopText

MSG_ITEM_PSISTONE:
.byte   "*",user," squeezed",newLine
.byte   " the PSI-Power",newLine
.byte   " Stone.",newLine
.byte   stopText

MSG_ITEM_PSISTONE_USEDUP:
.byte   "*The PSI-Power",newLine
.byte   " Stone became an",newLine
.byte   " ordinary stone.",newLine
.byte   stopText

MSG_PSI_TRIED:
.byte   "*",user," tried",newLine
.byte   " ",recipient,".",newLine
.byte   stopText

MSG_PSI_NOPP:
.byte   "*There isn't enough",newLine
.byte   " power left to try",newLine
.byte   " that.",newLine
.byte   stopText

MSG_PSI_REVIVE:
.byte   "*",user," has",newLine
.byte   " returned to the",newLine
.byte   " scene.",newLine
.byte   stopText

MSG_USEDIARY:
.byte   "*The Diary was hard",newLine
.byte   " to read, but opened",newLine
.byte   " up to this page...",newLine
.byte   pauseText
.byte   "*(PASSWORD)",newLine
.byte   pauseText
.byte   "*.... the one who",newLine
.byte   " lost the tail.",newLine
.byte   pauseText
.byte   "*The forgotten one...",newLine
.byte   " ...the ship",newLine
.byte   " that sails...",newLine
.byte   stopText

MSG_CURE_PETRIFY:
.byte   "*",result," became",newLine
.byte   " softened.",newLine
.byte   stopText

MSG_USEOCARINA:
.byte   "*The Ocarina",newLine
.byte   " played on and on...",newLine
.byte   stopText
MSG_USEOCARINA2:
.byte   "*Did you hear it?",newLine
.byte   stopText

MSG_USEMAP_FAIL:
.byte   "*This place is not",newLine
.byte   " on the map.",newLine
.byte   stopText

MSG_USEMAP:
.byte   "*",partyLead," checked",newLine
.byte   " the map.",newLine
.byte   stopText

MSG_PSI_NOTELEPORT:
.byte   "*Stopped by some",newLine
.byte   " mysterious force.",newLine
.byte   stopText

MSG_REPEL_RING_BREAK:
.byte   "*The Repel Ring",newLine
.byte   " has lost its",newLine
.byte   " mysterious power.",newLine
.byte   stopText

MSG_ANTIPIRACY:
.byte   '"This software is an illegal',newLine
.byte   "copy of a Nintendo game. The",newLine
.byte   "use, possession or sale of",newLine
.byte   "this counterfeit cartridge",newLine
.byte   "is illegal and infringes",newLine
.byte   'Nintendo copyrights."',newLine
.byte   "          Nintendo Co., Ltd.",newLine
.byte   "          Kyoto, Japan /",newLine
.byte   "          Redmond WA, USA.",newLine
.byte   '"This illegal copy of',newLine
.byte   "NES EARTH BOUND will",newLine
.byte   'no longer function."',newLine
.byte   stopText

.byte   " ",newLine
.byte   " ",newLine
.byte   " ",newLine
.byte   " ",newLine
.byte   stopText

MSG_CREDITS_1:
.byte   "At the summit of Mt. Itoi,",newLine
.byte   anaName," is reunited with her",newLine
.byte   "mom as the rest of the freed",newLine
.byte   "Earth people exit the cave.",newLine
.byte   stopText
MSG_CREDITS_2:
.byte   " ",teddyName,", his health fully",newLine
.byte   " recovered, now sings daily",newLine
.byte   " at The Live Show.",newLine
.byte   stopText
MSG_CREDITS_3:
.byte   "  The kidnapped grown-ups",newLine
.byte   "  return to their lonely",newLine
.byte   "  children in Youngtown.",newLine
.byte   stopText
MSG_CREDITS_4:
.byte   "(",anaName,")",newLine
.byte   "I promise I won't forget you",newLine
.byte   "so I will not say Good-Bye,",newLine
.byte   "just - 'til we meet again!",newLine
.byte   stopText
MSG_CREDITS_5:
.byte   " ",lloydName," returns to a hero's",newLine
.byte   " welcome at Twinkle",newLine
.byte   " Elementary School.",newLine
.byte   stopText
MSG_CREDITS_6:
.byte   "Son, your sisters and I are",newLine
.byte   "so happy to see you back in",newLine
.byte   "one piece. How unbelievable",newLine
.byte   "that you are not hungry.",newLine
.byte   stopText
MSG_CREDITS_7:
.byte   " A letter from ",nintenName,",",newLine
.byte   " I miss him so much. I hope",newLine
.byte   " we can get together again",newLine
.byte   " soon.",newLine
.byte   stopText
MSG_CREDITS_8:
.byte   " Well, now that the Earth's",newLine
.byte   " crisis is finally over, I",newLine
.byte   " think I'll just lay down",newLine
.byte   " for a moment and Zzzzzzzzz",newLine
.byte   stopText
MSG_CREDITS_9:
.byte   " I know that boy is home.",newLine
.byte   " Come on son and answer the",newLine
.byte   " phone. Something new has",newLine
.byte   " come up and...",newLine
.byte   stopText

;credits
MSG_CREDITS_PLAYERNAME:
.byte   playerName
.byte   stopText

MSG_CREDITS_SHIGESATO_ITOI:
.byte   "SHIGESATO ITOI"
.byte   stopText

MSG_CREDITS_MIYUKI_KURE:
.byte   "MIYUKI KURE"
.byte   stopText

MSG_CREDITS_AKIO_OHMORI:
.byte   "AKIO OHMORI"
.byte   stopText

MSG_CREDITS_RITSUO_KAMIMURA:
.byte   "RITSUO KAMIMURA"
.byte   stopText

MSG_CREDITS_KEIICHI_SUZUKI:
.byte   "KEIICHI SUZUKI"
.byte   stopText

MSG_CREDITS_HIROKAZU_TANAKA:
.byte   "HIROKAZU TANAKA"
.byte   stopText

MSG_CREDITS_SHINBO_MINAMI:
.byte   "SHINBO MINAMI"
.byte   stopText

MSG_CREDITS_TATSUYA_ISHII:
.byte   "TATSUYA ISHII"
.byte   stopText

MSG_CREDITS_TOTTORI:
.byte   "TOTTORI"
.byte   stopText

MSG_CREDITS_KAZUYA_NAKATANI:
.byte   "KAZUYA NAKATANI"
.byte   stopText

MSG_CREDITS_TAKAYUKI_ONODERA:
.byte   "TAKAYUKI ONODERA"
.byte   stopText

MSG_CREDITS_MOTOO_YASUMA:
.byte   "MOTOO YASUMA"
.byte   stopText

MSG_CREDITS_MASAYUKI_KAMEYAMA:
.byte   "MASAYUKI KAMEYAMA"
.byte   stopText

MSG_CREDITS_HIDEO_KON:
.byte   "HIDEO KON"
.byte   stopText

MSG_CREDITS_KATSUTOMO_MAEIWA:
.byte   "KATSUTOMO MAEIWA"
.byte   stopText

MSG_CREDITS_KUNIKO_SAKURAI:
.byte   "KUNIKO SAKURAI"
.byte   stopText

MSG_CREDITS_MASAHIRO_TATEMOTO:
.byte   "MASAHIRO TATEMOTO"
.byte   stopText

MSG_CREDITS_TAKASHI_KAWAGUCHI:
.byte   "TAKASHI KAWAGUCHI"
.byte   stopText

MSG_CREDITS_KEIZOH_KATOH:
.byte   "KEIZOH KATOH"
.byte   stopText

MSG_CREDITS_MOTOHIRO_ISHII:
.byte   "MOTOHIRO ISHII"
.byte   stopText

MSG_CREDITS_AKIHITO_TODA:
.byte   "AKIHITO TODA"
.byte   stopText

MSG_CREDITS_YUKARI_SAITOH:
.byte   "YUKARI SAITOH"
.byte   stopText

MSG_CREDITS_PHIL_SANDHOP:
.byte   "PHIL SANDHOP"
.byte   stopText

MSG_CREDITS_TOSHIKO_WATSON:
.byte   "TOSHIKO WATSON"
.byte   stopText

MSG_CREDITS_YUKA_NAKATA:
.byte   "YUKA NAKATA"
.byte   stopText

MSG_CREDITS_HIROKO_FAULKNER:
.byte   "HIROKO FAULKNER"
.byte   stopText

MSG_CREDITS_TONY_HARMAN:
.byte   "TONY HARMAN"
.byte   stopText

MSG_CREDITS_DAYV_BROOKS:
.byte   "DAYV BROOKS"
.byte   stopText

MSG_CREDITS_NORIYUKI_MINAMI:
.byte   "NORIYUKI MINAMI"
.byte   stopText

MSG_CREDITS_BIN_OHGAWARA:
.byte   "BIN OHGAWARA"
.byte   stopText

MSG_CREDITS_YOSHIHISA_WADA:
.byte   "YOSHIHISA WADA"
.byte   stopText

MSG_CREDITS_HIKONORI_SUZUKI:
.byte   "HIKONORI SUZUKI"
.byte   stopText

MSG_CREDITS_TAKAO_SHIMIZU:
.byte   "TAKAO SHIMIZU"
.byte   stopText

MSG_CREDITS_SHIGERU_MIYAMOTO:
.byte   "SHIGERU MIYAMOTO"
.byte   stopText

MSG_CREDITS_HIROSHI_YAMAUCHI:
.byte   "HIROSHI YAMAUCHI"
.byte   stopText

.byte 0
