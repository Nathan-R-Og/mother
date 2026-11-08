.segment        "PRG1B": absolute

.byte   0

MSG_ELLAY_BBGANG5:
kanafix "*おれは つよい。",newLine
kanafix "くちばっかしだけどな。",newLine
.byte   stopText
MSG_ELLAY_BBGANG6:
kanafix "*"
.byte   teddyName
kanafix "の あにきがいたら",newLine
kanafix "おまえなんか ゆびさきで",newLine
kanafix "ヒョイッ さ。",newLine
.byte   stopText

MSG_ELLAY_SIGNGUY:
kanafix "*カンバンの もじは",newLine
kanafix "ちゃんと よんどるかね?",newLine
.byte   stopText

MSG_ELLAY_CACTUSGIRL:
kanafix "*もし どこかのさばくで",newLine
kanafix "かおのあるサボテンを",newLine
kanafix "みつけたら‥‥",newLine
.byte   pauseText
kanafix "*とても こわいざますわね。",newLine
.byte   stopText

MSG_ELLAY_FISHERGUY:
kanafix "*つりびとに はなしかけると",newLine
kanafix "はなしが ながくて いけないね。",newLine
.byte   stopText

MSG_TWINKLE_ALLCARTWHEELGIRL:
kanafix "*しょうがく いちねんせいだったら",newLine
kanafix "さかあがりくらい",newLine
kanafix "できるものよねぇ。",newLine
.byte   stopText

MSG_ELLAY_TOWERBELLHOP:
kanafix "*こちらのエレベ-タ-で",newLine
kanafix "てんぼうだいまで",newLine
kanafix "おあがりください。",newLine
.byte   stopText

MSG_ELLAY_TOWER_GUY:
kanafix "*ここの てんぼうだいから",newLine
kanafix "みえる しまで けむりがでてたよ。",newLine
kanafix "だれか すんでいるのかなぁ?",newLine
.byte   pauseText
kanafix "*ぼうえんきょうで みてみれば",newLine
kanafix "よかったなあ。",newLine
.byte   stopText

MSG_TWINKLE_CANTCARTWHEELGIRL:
kanafix "*ぼく さかあがりできないのよ。",newLine
.byte   stopText

MSG_TWINKLE_SUBTRACTIONGIRL:
kanafix "*わたしは",newLine
kanafix "ひきざんの くりさがりが",newLine
kanafix "まだ よくわからない。",newLine
.byte   stopText

MSG_TWINKLE_TOFUKID:
kanafix "*いちごあじのとうふって",newLine
kanafix "とかいのほうで",newLine
kanafix "はやってるらしいな。",newLine
.byte   pauseText
kanafix "*くってみてぇよ。",newLine
.byte   stopText

MSG_TWINKLE_HUNGRYKID:
kanafix "*はら へったな。",newLine
.byte   stopText

MSG_TWINKLE_DADGIRL:
kanafix "*おれを ただのおじさんと",newLine
kanafix "おもうなよ。",newLine
.byte   pauseText
kanafix "*って うちのパパのくちぐせなの。",newLine
.byte   stopText

MSG_TWINKLE_LATEGIRL:
kanafix "*あなた ちこくよね!",newLine
.byte   stopText

MSG_TWINKLE_STRANGEGIRL:
kanafix "*りかしつで",newLine
kanafix "へんなせんせいを みなかったぁ?",newLine
.byte   pauseText
kanafix "*‥‥わたし みた。",newLine
.byte   stopText

MSG_TWINKLE_GAMEKID:
kanafix "*ドラクエの フォ- やった?",newLine
kanafix "おれ",newLine
kanafix "まだスリ-でくろうしてるんだ。",newLine
.byte   stopText

MSG_DRUGSVENDOR_WELCOME:
kanafix "*いらっしゃいませ。",newLine
kanafix "なにを さしあげましょう?",newLine
.byte   stopText

MSG_VARIETYVENDOR_OUTOFSTOCK:
kanafix "*もうしわけありません。",newLine
kanafix "そのしなは",newLine
kanafix "ただいまうりきれで ございます。",newLine
.byte   stopText

MSG_BURGERSHOP_NO_BUY:
kanafix "*あら おやめになるんですか?",newLine
kanafix "ざんねんですが‥‥",newLine
.byte   pauseText
kanafix "*またの ごらいてんを",newLine
kanafix "おまちしております。",newLine
.byte   stopText

MSG_BURGERSHOP_GOODBYE:
kanafix "*ありがとうございました。",newLine
kanafix "また ごりようください。",newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHKID_NOTAKE:
kanafix "*おや やめるんですか?",newLine
kanafix "では またきてくださいね。",newLine
.byte   stopText

MSG_HOSPITAL_NURSE_REVIVE:
kanafix "*"
.byte   result
kanafix "さん",newLine
kanafix "げんきになって よかったわね。",newLine
kanafix "また いつでもどうぞ!",newLine
.byte   stopText
MSG_HOSPITAL_NURSE_NOREVIVE:
kanafix "*あら あなたのおともだちでしょ?",newLine
kanafix "ほんとに しんじゃいますよ。",newLine
.byte   stopText

MSG_PODUNK_HOSPITALDOCTOR:
kanafix "*はいはい",newLine
kanafix "ひとり "
.byte   price
kanafix "ドルで",newLine
kanafix "しんさつしてあげましょうね。",newLine
.byte   stopText
MSG_PODUNK_HOSPITALDOCTOR_DECLINE:
kanafix "*ほんとに ちりょうは いらない?",newLine
kanafix "あっそ。",newLine
.byte   stopText
MSG_PODUNK_HOSPITALDOCTOR_NORMAL:
kanafix "*わたしのみたてでは",newLine
kanafix "どこも わるくないようだよ。",newLine
.byte   stopText
MSG_PODUNK_HOSPITALDOCTOR_ACCEPT:
kanafix "*はい すっかりよくなったよ。",newLine
.byte   stopText

MSG_HEALER:
kanafix "*しんじようが しんじまいが",newLine
kanafix "わたしは ヒ-ラ-。",newLine
kanafix "どうしたい?",newLine
.byte   stopText

MSG_HEALER_NO:
kanafix "*おお そうか。 そうしなさい。",newLine
.byte   stopText

MSG_HEALER_PRICE:
kanafix "*"
.byte   price
kanafix "ドル",newLine
kanafix "いただいておこうか。",newLine
.byte   stopText

MSG_HOTELBELLHOP:
kanafix "*いらっしゃいませ。",newLine
kanafix "ひとばん "
.byte   price
kanafix "ドルに",newLine
kanafix "なりますが おとまりになりますか?",newLine
.byte   stopText
MSG_HOTELBELLHOP_DECLINE:
kanafix "*それは ざんねんです。",newLine
kanafix "また いらしてくださいね。",newLine
.byte   stopText
MSG_HOTELBELLHOP_ACCEPT:
kanafix "*では ごゆっくり。",newLine
.byte   stopText
MSG_HOTELBELLHOP_GOODMORNING:
kanafix "*おはようございます。",newLine
kanafix "また おたちよりください。",newLine
kanafix "おまちしております。",newLine
.byte   stopText

MSG_HOSPITAL_NURSE_SELECT:
kanafix "*"
.byte   result
kanafix "さんでしたら",newLine
kanafix "さっき はこびこまれましたよ。",newLine
kanafix "いしきが もどらないんですが‥‥",newLine
.byte   pauseText
kanafix "*ちりょうひを "
.byte   price
kanafix "ドル",newLine
kanafix "おしはらい ください。",newLine
.byte   stopText
MSG_HOSPITAL_NURSE:
kanafix "*どなたに ごめんかいですか?",newLine
.byte   stopText

MSG_YOUNGTOWN_HOTELBELLHOP:
kanafix "*パパは るすです。",newLine
kanafix "だから",newLine
kanafix "おかねのことは わかんないけど",newLine
.byte   pauseText
kanafix "ほかは",newLine
kanafix "ぼくが ちゃんとやりますから",newLine
kanafix "あんしんして とまってください。",newLine
.byte   stopText
MSG_YOUNGTOWN_HOTELBELLHOP_GOODMORNING:
kanafix "*おはよう。",newLine
kanafix "また とまりにきてね。",newLine
kanafix "ひとりぼっちで さみしいんだ。",newLine
.byte   stopText
MSG_YOUNGTOWN_HOTELBELLHOP_DECLINE:
kanafix "*なんだ とまっていかないの‥‥",newLine
.byte   pauseText
kanafix "*パパがいなくても ぼくがちゃんと",newLine
kanafix "かわりをするから",newLine
kanafix "だいじょうぶなのに‥‥",newLine
.byte   stopText

MSG_ELLAY_LHBOUNCERGIRL_TICKET:
kanafix "*あらっ チケットがなきゃ",newLine
kanafix "はいれないわよ。",newLine
.byte   stopText

kanafix "*しかし‥‥‥",newLine
kanafix "なにもなかった。",newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE:
kanafix "  あずける   もちだす"
.byte   stopText
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_INVNOTHING:
kanafix "*なにももってないじゃない。",newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_NOTHING:
kanafix "*なにも あずかってないわよ。",newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_FULL:
kanafix "*ちょっとまって‥‥‥",newLine
.byte   pauseText
kanafix "*そうこが いっぱいだから",newLine
kanafix "もうあずかれないよ。",newLine
.byte   stopText

MSG_ATM_INTRO:
kanafix "*イラッシャイマセ",newLine
.byte   stopText

MSG_ATM_INSUFFICIENT:
kanafix "*ザンダカガ タリマセン",newLine
.byte   stopText

MSG_ATM_NOT_ENOUGH_STORED:
kanafix "*オカネガ タリマセン",newLine
.byte   stopText

MSG_ATM_DEPOSIT_TOO_MUCH:
kanafix "*モウシワケ アリマセン",newLine
.byte   pauseText
kanafix "トリヒキ ゲンドガクヲ",newLine
kanafix "コエマシタノデ",newLine
kanafix "オアズカリ デキマセン",newLine
.byte   stopText

MSG_SPOOKANE_HOTELBELLHOP_THANKS:
kanafix "*アリガトウ ゴザイマシタ",newLine
.byte   stopText

MSG_MYHOME_DOLL:
kanafix "*にんぎょうの なかには",newLine
kanafix "ふるい オルゴ-ルが",newLine
kanafix "かくされていた。",newLine
.byte   pauseText
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "オルゴ-ルをあけた。",newLine
.byte   pauseText
kanafix "*とぎれとぎれに",newLine
kanafix "メロディ-がながれた。",newLine
.byte   stopText

MSG_CANARY_PILLAR:
kanafix "* ?",newLine
.byte   stopText

kanafix "*ありがとう ございました。",newLine
.byte   stopText

MSG_ELLAY_JAILCOP:
kanafix "*おれ ぶきをてにいれる",newLine
kanafix "いいル-トを もっているんだ。",newLine
.byte   pauseText
kanafix "*そのうち すごいぶきを",newLine
kanafix "てにいれられる かもな。",newLine
.byte   stopText

kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
kanafix "たたかいに かった。",newLine
.byte   stopText

MSG_ATM_MENU:
kanafix "  ヒキダス   アズケル"
.byte   stopText
.byte   newLine
.byte   stopText

MSG_ATM_CURRENT_BALANCE:
kanafix "*ゲンザイ $"
.byte   currentCash, c00,newLine
kanafix "オアズカリ シテイマス",newLine
.byte   stopText

MSG_DOOR_LOCKED:
kanafix "*カギが かかっている。",newLine
.byte   stopText

MSG_DOOR_KEYFAIL:
kanafix "*カギが あわないようだ。",newLine
.byte   stopText

MSG_DOOR_UNLOCKED:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
kanafix "カギをあけて なかにはいった。",newLine
.byte   stopText

MSG_MENU_YES_NO:
kanafix "  きろくする  とくにない"
.byte   stopText
.byte   newLine
.byte   stopText

MSG_MENU_CONTINUE_REST:
kanafix "  つづける   おわる"
.byte   stopText
.byte   newLine
.byte   stopText

MSG_PHONE_GRAB:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "じゅわきを とった。",newLine
.byte   stopText

MSG_HOSPITAL_NURSE_NOMONEY:
kanafix "*しつれいですが‥‥",newLine
kanafix "おかねが たりないようですよ。",newLine
.byte   stopText

MSG_BURGERSHOP_NOMONEY:
kanafix "*まあ おきゃくさま",newLine
kanafix "おかねが たりませんわ。",newLine
.byte   stopText

MSG_BURGERSHOP_NO_ROOM:
kanafix "*おきゃくさま",newLine
kanafix "それいじょうおもちになろうなんて",newLine
.byte   pauseText
kanafix "おやめになったほうが",newLine
kanafix "よろしいとおもいます。",newLine
.byte   stopText

MSG_HEALER_FIXED:
kanafix "*っはい! もうなおってる。",newLine
kanafix "すごいでしょ。",newLine
.byte   stopText

MSG_RETURNS_CANTSELL:
kanafix "*もうしわけありません。",newLine
.byte   item
kanafix "は",newLine
kanafix "かいとれません。",newLine
.byte   stopText

MSG_CANARY_LAURA_SING:
kanafix "*うたひめロ-ラは わがこ と",newLine
kanafix "たいめんして おおよろこびで",newLine
kanafix "うたを うたいはじめた。",newLine
.byte   stopText

MSG_REMEMBER_MELODY:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "メロディ-をおぼえた。",newLine
.byte   stopText

MSG_CANARY_SING:
kanafix "*カナリアが うたっている。",newLine
.byte   stopText

MSG_ZOO_GATEMONKEY_KEY:
kanafix "*サルは",newLine
kanafix "どうぶつえんのカギをぬすんだ。",newLine
.byte   stopText

kanafix "*ロボットは ふるく",newLine
kanafix "さびついていた。",newLine
.byte   stopText

MSG_EVE_EVECHECK:
kanafix "*"
.byte   nintenName
kanafix "の けはいを",newLine
kanafix "かんじた しゅんかん",newLine
.byte   pauseText
kanafix "ロボットは",newLine
kanafix "いのちを ふきこまれた。",newLine
.byte   stopText

MSG_PHONE_EXPLVL:
kanafix "*"
.byte   result
kanafix "は "
.byte   price,newLine
.byte   stopText

MSG_ELLAY_FAKEHEALER_GOODBYE:
kanafix "*がんばりなさい。",newLine
.byte   stopText

MSG_MAGICANT_FOUNTAIN:
kanafix "*いずみの みずにふれると",newLine
kanafix "すっごく げんきになりました。",newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_RETURN:
kanafix "*ピッピ!",newLine
kanafix "よかったわ よかったわ。",newLine
kanafix "ほんとによかった。",newLine
.byte   pauseText
kanafix "*ちょうちょうさんも",newLine
kanafix "ピッピを さがしてくれてるはずよ。",newLine
.byte   pauseText
kanafix "*ちゃんと ごあいさつに",newLine
kanafix "いってきてちょうだい。",newLine
.byte   stopText

MSG_TWINKLE_F1_ROOM6ENTRANCE_NOJANITOR:
kanafix "*はいってます!",newLine
kanafix "って ここはトイレじゃないけどな。",newLine
.byte   pauseText
kanafix "*いま てがはなせないんだ。",newLine
kanafix "あとでおいで。",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_CURE:
kanafix "*だれが どくに やられたんだね?",newLine
.byte   stopText

MSG_HEALER_WHO:
kanafix "*だれを やわらかくしようかね‥‥?",newLine
.byte   stopText

kanafix "*どくなんか ない!",newLine
.byte   stopText

MSG_HEALER_SOFTEN_FAIL:
kanafix "*かたくなって ないじゃないか。",newLine
.byte   stopText

MSG_MERRYSVILLE_SWEETSGUY_YES:
kanafix "*あそこは むかし",newLine
kanafix "ペンシルロケットを",newLine
kanafix "じゃんじゃん つくってたんだよ。",newLine
.byte   stopText

MSG_TWINKLE_F2JANITOR:
kanafix "*うちの にょうぼうは",newLine
kanafix "しょだいの ミスいなかまち",newLine
kanafix "だったんだ。",newLine
.byte   stopText
MSG_TWINKLE_F2JANITOR2:
kanafix "*カギは あけたよ。",newLine
kanafix "おくじょうは けしきがいいぞ。",newLine
.byte   stopText

MSG_TWINKLE_F2LLOYD:
kanafix "*あとで ダンカンのだいこうじょうに",newLine
kanafix "いこう。",newLine
.byte   pauseText
kanafix "*あそこには すっごいロケットが",newLine
kanafix "あるらしいんだ。",newLine
.byte   stopText
MSG_TWINKLE_F1LLOYD:
kanafix "*みんなが ぼくのことを",newLine
kanafix "よわむしとか けむしとか",newLine
kanafix "アホタレとか",newLine
.byte   pauseText
kanafix "うわさしてなかったかなぁ。",newLine
.byte   stopText

MSG_ELLAY_FISHER2:
kanafix "*いや‥‥あさになってしまったな。",newLine
.byte   stopText

MSG_ELLAY_HOTELCOLDLADY:
kanafix "*としよりを たいせつにしなさいね。",newLine
kanafix "ゴホゴホ。",newLine
.byte   stopText

MSG_REINDEER_HOTELMEANGUY:
kanafix "*チビ!",newLine
kanafix "きやすく はなしかけんじゃねぇよ。",newLine
.byte   stopText

MSG_ELLAY_HOTELBIGLADY:
kanafix "*ある",newLine
kanafix "ファミコンソフトのはなしだけどね。",newLine
.byte   pauseText
kanafix "*マザ-って タイトルに",newLine
kanafix "きまったらしいんだけど",newLine
.byte   pauseText
kanafix "ジョン.レノンの まねだよな。",newLine
.byte   stopText

MSG_SPOOKANE_HINTGIRL_HINT2:
kanafix "*レインディアの えきにいる",newLine
kanafix "おばあさんは とっても",newLine
kanafix "たいせつなものを くれるんだけど",newLine
.byte   pauseText
kanafix "*あなた"
.byte   unk4
kanafix "は あったかしら‥‥",newLine
.byte   stopText
MSG_SPOOKANE_HINTGIRL_HINT3:
kanafix "*さいごの ヒントよ。",newLine
kanafix "マジカントこくの ギタ-ひきの",newLine
kanafix "うたは ぜひ きいてね。",newLine
.byte   stopText

MSG_MYHOME_DOG_ADVICE:
kanafix "*なにか あるなとおもったら",newLine
kanafix "こまめに チェックするといいぞ。",newLine
.byte   stopText

MSG_ZOO_MONKEY:
kanafix "*うたうサルは しみじみとうたった。",newLine
.byte   stopText

MSG_YUCCA_SINGINGCACTUS:
kanafix "*サボテンは うたう。",newLine
kanafix "なぜか うたう。",newLine
kanafix "せつせつと うたいつづけた。",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_PIANO_MELODY:
kanafix "*ピアノは ひとりでに",newLine
kanafix "けんばんが うごいて",newLine
kanafix "えんそうを はじめた。",newLine
.byte   stopText

MSG_MAGICANT_DRAGON_MELODY:
kanafix "*ドラゴンは いがいと すなおに",newLine
kanafix "ふるい がくふを みせてくれた。",newLine
.byte   pauseText
kanafix "*こんな うただった。",newLine
.byte   stopText

MSG_MTITOI_EVE_MELODY:
kanafix "*ロボット イヴは",newLine
kanafix "はかいされ うごかなくなった。",newLine
.byte   pauseText
kanafix "*イヴの むねのあたりから",newLine
kanafix "おんがくが ながれてきた。",newLine
.byte   stopText

MSG_ZOO_MONKEYSIGN:
kanafix "「よにも めずらしい うたうさるは",newLine
kanafix "とう シュ-クリ-ムどうぶつえんに",newLine
kanafix "しか おりません。」",newLine
.byte   stopText

MSG_TWINKLE_F2_UPSTAIRS_PADLOCK:
kanafix "*かいだんの うえの とびらには",newLine
kanafix "おおきな じょうまえが",newLine
kanafix "かかっている。",newLine
.byte   stopText

MSG_SNOWMAN_PRIEST_GOODBYE:
kanafix "*わたしは スノ-マンのまちの",newLine
kanafix "ひとたちのために ここにのこるが",newLine
kanafix "どうか‥‥きをつけて‥‥いって。",newLine
.byte   stopText

MSG_PHONE_PAYPHONE:
kanafix "*おかねが たりません。",newLine
.byte   stopText

MSG_GRAVEYARD_PIPPI_AFRAID:
kanafix "*やっぱり こわいから",newLine
.byte   nintenName
kanafix "ちゃん",newLine
kanafix "さきに あるいてよ。",newLine
.byte   stopText

MSG_ZOO_GATE:
kanafix "*よくみると とびらの カギは",newLine
kanafix "こわれていた。",newLine
.byte   partyLead
kanafix "は とびらを あけた。",newLine
.byte   stopText

MSG_ELLAY_BBGANG2_TEDDY:
kanafix "*あっ "
.byte   teddyName
kanafix "さん",newLine
kanafix "こんにちは ッス。",newLine
.byte   stopText

MSG_ELLAY_BBGANG1_TEDDY2:
kanafix "*"
.byte   teddyName
kanafix "のアニキを はやく",newLine
kanafix "カムバックさせてくれよう!",newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_CANT:
kanafix "*あ だめだめ。",newLine
.byte   item
kanafix "は",newLine
kanafix "あずかれないのよ。",newLine
.byte   pauseText
kanafix "*わたし わがままなの。",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE1:
kanafix "「"
.byte   nintenName
kanafix "の",newLine
kanafix "えいえんのしもべ。",newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし",newLine
kanafix "ここに ねむる。」",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE2:
kanafix "「"
.byte   nintenName
kanafix "の",newLine
kanafix "うちなる ちから。",newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし",newLine
kanafix "ここに ねむる。」",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE3:
kanafix "「"
.byte   nintenName
kanafix "の",newLine
kanafix "ぜんなる こころ。",newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし",newLine
kanafix "ここに ねむる。」",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE4:
kanafix "「"
.byte   nintenName
kanafix "の",newLine
kanafix "おおいなる かなしみ。",newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし",newLine
kanafix "ここに ねむる。」",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE5:
kanafix "「"
.byte   nintenName
kanafix "の",newLine
kanafix "ち と にく。",newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし",newLine
kanafix "ここに ねむる。」",newLine
.byte   stopText

MSG_PODUNK_MAGICOP:
kanafix "*ちょうちょうさんの めいれいで",newLine
.byte   pauseText
kanafix "どうぶつえんの じけんが",newLine
kanafix "かいけつするまで",newLine
kanafix "ここは とおれないんだぞ。",newLine
.byte   pauseText
kanafix "*ちょっと ロコツな",newLine
kanafix "やりかただけどな。",newLine
.byte   stopText
MSG_PODUNK_MAGICOP_LIFTED:
kanafix "*このおくの やまのどうくつに",newLine
kanafix "へんな いわが あるんだぞ。",newLine
.byte   pauseText
kanafix "*あんまりへんだから",newLine
kanafix "けんぶつすると いいぞ。",newLine
.byte   stopText

MSG_PODUNK_MAGICOP2_LIFTED:
kanafix "*ところで‥‥",newLine
kanafix "おまえ"
.byte   unk4
kanafix " テレパシ-とかが",newLine
kanafix "できるんだってな。",newLine
.byte   pauseText
kanafix "*だいひょうばんだぞ。",newLine
.byte   pauseText
kanafix "*この にんきもの!",newLine
.byte   stopText

MSG_ANAHAT_WOMAN1:
kanafix "*あんた"
.byte   unk4,newLine
kanafix "スノ-マンに いくのかい?",newLine
.byte   stopText

MSG_ANAHAT_WOMAN_YES:
kanafix "*このぼうしを ひろったんだけど",newLine
kanafix "スノ-マンにいる おんなのこの",newLine
kanafix "ものらしいの。",newLine
.byte   pauseText
kanafix "*とどけてあげて ちょうだいな。",newLine
.byte   stopText

MSG_ANAHAT_WOMAN_NO:
kanafix "*たのみたいことが あったんだけど",newLine
kanafix "ざんねんだわ。",newLine
.byte   stopText

MSG_REINDEER_SINGINGGUY_ACCEPT2:
kanafix "*かっこいいしょうねんは",newLine
kanafix "どくとくの うたをうたった。",newLine
.byte   pauseText
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "このメロディ-は",newLine
kanafix "さすがに おぼえられなかった。",newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE:
kanafix "*すみません。",newLine
kanafix "ちょっと アンケ-トに",newLine
kanafix "こたえていただけますか?",newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_Q1:
kanafix "*あなたは",newLine
kanafix "きしゃの うんちんを",newLine
kanafix "たかいと おもいますか?",newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_Q2:
kanafix "*あなたは",newLine
kanafix "ふしぎなメガホンを",newLine
kanafix "つかいましたか?",newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_FINISH:
kanafix "*ごきょうりょく",newLine
kanafix "ありがとうございました。",newLine
kanafix "おれいの テレホンカ-ドです。",newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_DONE:
kanafix "*すいません。 ちょっと‥‥",newLine
kanafix "アンケ-トに‥‥‥",newLine
.byte   pauseText
kanafix "*あっ",newLine
kanafix "まえに おねがいしましたっけね。",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_APPEAR:
kanafix "*こころの さけびを ききつけて",newLine
kanafix "おたすけじいさんが",newLine
kanafix "とうじょうした。",newLine
.byte   stopText

MSG_GRAVEYARD_CASKET_GENERIC:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "カンオケを あけた。",newLine
kanafix "カンオケのなかから‥‥!!",newLine
.byte   stopText

MSG_ELLAY_TOWER_TELESCOPE:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "ぼうえんきょうを のぞいた。",newLine
.byte   stopText

MSG_ELLAY_TOWER_TELESCOPE2:
kanafix "*うみが きれいだった。",newLine
.byte   stopText

MSG_ELLAY_TOWER_TELESCOPE_ROCKET:
kanafix "*むこうのしまで",newLine
kanafix "なにかが ひかった!",newLine
.byte   stopText

MSG_ZOO_CAPSULE:
kanafix "*カプセルのなかから",newLine
kanafix "なにかが とびだした。",newLine
.byte   stopText

MSG_SNOWMAN_ANA_GOODBYE:
kanafix "*"
.byte   anaName
kanafix " ",newLine
kanafix "「パパ‥‥いまは‥‥さよなら。",newLine
kanafix "つぎに あうときは",newLine
kanafix "きっと ママといっしょよ!",newLine
.byte   pauseText
kanafix "‥‥いのっててください。」",newLine
.byte   stopText

.byte   stopText

MSG_TALK_NOONE:
kanafix "*だれに はなしているのだ。",newLine
.byte   stopText

MSG_TALK_PARTY:
kanafix "*なに?",newLine
.byte   stopText

MSG_CHECK_NOTHING:
kanafix "*もんだいなし。",newLine
.byte   stopText

MSG_USE_ITEM:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を つかった。",newLine
.byte   stopText

MSG_CANT_USE_ITEM:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を",newLine
kanafix "つかえない。",newLine
.byte   stopText

MSG_CANT_EAT:
kanafix "*やめてください。",newLine
.byte   stopText

MSG_EQUIPPED_ITEM:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を",newLine
kanafix "そうびした。",newLine
.byte   stopText

MSG_CANT_EQUIP_ITEM:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を",newLine
kanafix "そうびできない。",newLine
.byte   stopText

MSG_TOSS_ITEM:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を",newLine
kanafix "すててしまった。",newLine
.byte   stopText

MSG_CANT_TOSS_ITEM:
kanafix "*"
.byte   recipient
kanafix "は",newLine
kanafix "すててはいけない。",newLine
.byte   stopText

MSG_GIVE_ITEM:
kanafix "*"
.byte   user
kanafix "は "
.byte   result
kanafix "に",newLine
.byte   recipient
kanafix "を",newLine
kanafix "わたした。",newLine
.byte   stopText

MSG_CANT_GIVE:
kanafix "*"
.byte   recipient
kanafix "は",newLine
kanafix "わたせない。",newLine
.byte   stopText

MSG_CANT_GIVE_FULL:
kanafix "*"
.byte   result
kanafix "は",newLine
kanafix "これいじょう ものをもてない。",newLine
.byte   stopText

MSG_NOTHING_HAPPENED:
kanafix "*なにも おこらない。",newLine
.byte   stopText

MSG_OPEN_PRESENT:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
kanafix "プレゼントのはこを あけた。",newLine
.byte   stopText

MSG_PRESENT_ITEM:
kanafix "*"
.byte   item
kanafix "が あった。",newLine
.byte   stopText

MSG_GET_ITEM:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
.byte   item
kanafix "を てにいれた。",newLine
.byte   stopText

MSG_INVENTORY_FULL:
kanafix "*しかし これいじょう",newLine
kanafix "ものを もてない。",newLine
.byte   stopText

MSG_PRESENT_EMPTY:
kanafix "*しかし からっぽだった。",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_MENU:
kanafix "  ドクをけす  やわらかくする"
.byte   stopText
.byte   newLine
.byte   stopText

MSG_CANARY_SIGN:
kanafix "「みなみ.マザ-ズデイ",newLine
kanafix " きた .シュ-クリ-ム",newLine
kanafix "        どうぶつえん」",newLine
.byte   stopText

MSG_PODUNK_CANARYSIGN:
kanafix "「このおく カナリアむら。",newLine
kanafix " しぜんを たいせつにしよう!」",newLine
.byte   stopText

MSG_PODUNK_CITYHALLSIGN:
kanafix "「マザ-ズデイ まちやくば」",newLine
.byte   stopText

MSG_ELLAY_RESIDENTIALSIGN:
kanafix "「にし.うみのてんぼうだい",newLine
kanafix " きた.バレンタインみなと",newLine
kanafix "       うみをきれいに!」",newLine
.byte   stopText
MSG_ELLAY_RESIDENTIALSIGN2:
kanafix "「にし .バレンタイン",newLine
kanafix " ひがし.ホ-リ-ロ-リ-",newLine
kanafix "          マウンテン」",newLine
.byte   stopText

MSG_PODUNK_GRAVESIGN:
kanafix "「にし    .ヒ-ラ-のいえ",newLine
kanafix " はしのむこう.はかば",newLine
kanafix "    ひとりあるき きけん!」",newLine
.byte   stopText

MSG_PODUNK_MERRYSIGN:
kanafix "「にし .マザ-ズデイ",newLine
kanafix " ひがし.サンクスギビング」",newLine
.byte   stopText

MSG_PODUNK_ZOOSIGN:
kanafix "「シュ-クリ-ムどうぶつえんは",newLine
kanafix "    にしに 700メ-トル」",newLine
.byte   stopText

MSG_SNOWMAN_SIGN:
kanafix "「スノ-マンきょうかい このおく」",newLine
.byte   stopText

MSG_ELLAY_INTROSIGN:
kanafix "「にし .バレンタイン",newLine
kanafix " みなみ.しっちたい」",newLine
.byte   stopText

MSG_MERRYSVILLE_SCHOOLSIGN:
kanafix "「サンクスギビングおおどおり",newLine
kanafix " みなみ.ティンクル",newLine
kanafix "        しょうがっこう」",newLine
.byte   stopText

MSG_MYHOME_SIGN:
kanafix "「"
.byte   nintenName
kanafix " の いえ」",newLine
.byte   stopText

MSG_MERRYSVILLE_SIGN:
kanafix "「サンクスギビングへ ようこそ!",newLine
kanafix " にし.マザ-ズデイ",newLine
kanafix " きた.サンタクロ-スえき」",newLine
.byte   stopText

MSG_REINDEER_SIGN:
kanafix "「にし .ヒ-ラ-のいえ",newLine
kanafix " ひがし.レインディアえき",newLine
kanafix " みなみ.レインディアのまち」",newLine
.byte   stopText

MSG_SPOOKANE_SIGN:
kanafix "「にし .ハロウィ-ンダウンタウン",newLine
kanafix " ひがし.ハロウィ-ン",newLine
kanafix "         じゅうたくち」",newLine
.byte   stopText

MSG_YOUNGTOWN_SIGN:
kanafix "「ひがし.しっちたい」",newLine
.byte   stopText

MSG_SPOOKANE_MANSIONSIGN:
kanafix "「このさき",newLine
kanafix " ロ-ズマリ-さんの しゆうち」",newLine
.byte   stopText

MSG_ELLAY_JAILSIGN:
kanafix "「バレンタイン けいさつしょ」",newLine
.byte   stopText

MSG_MERRYSVILLE_DUNCANSIGN:
kanafix "「ストリップげきじょう",newLine
kanafix "      けんせつよていち",newLine
kanafix "   ダンカンけんせつがいしゃ」",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMAN_REPLACE:
kanafix "*アニハ ウツクシク",newLine
kanafix "タオレタト キキマス。",newLine
.byte   pauseText
kanafix "*ハカヲ タテテ",newLine
kanafix "テアツク トムライマシタ。",newLine
.byte   pauseText
kanafix "*ツギハ ワタシノ バンデス。",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMAN_SERVE:
kanafix "*ワタシモ ハヤク",newLine
kanafix "アナタノ オテツダイガ シタイ。",newLine
.byte   stopText

MSG_MAGICANT_FLYINGMAN_INTRO:
kanafix "*ワタシハ ふらいんぐまん。",newLine
kanafix "アナタノ チカラニナル。",newLine
kanafix "ソノタメニ ウマレテキタ。",newLine
.byte   stopText

MSG_PODUNK_MAGICOP2_LIFTED2:
kanafix "*かいげんれいは とかれた。",newLine
kanafix "ちょっと おおげさだったけどな。",newLine
.byte   stopText

MSG_ELLAY_TOWER_ROCKETCHECK:
kanafix "*ふるぼけた ロケットだ。",newLine
.byte   stopText

MSG_PODUNK_PIPPI_GOODS:
kanafix "*グッズを とりにきたのね。",newLine
kanafix "はい どうぞ。",newLine
.byte   stopText
MSG_PODUNK_PIPPI_NOGOODS:
kanafix "*グッズは ぜんぶわたしたわよ。",newLine
kanafix "でも また あいにきてね。",newLine
.byte   stopText

MSG_MYHOME_MINNIE:
kanafix "*わたし ミニ-よ。",newLine
.byte   stopText


MSG_HEALER_MENU:
kanafix "  きをいれる  やわらかくする"
.byte   stopText
.byte   newLine
.byte   stopText

MSG_MTITOI_TEDDY_CALL:
kanafix "*"
.byte   teddyName
kanafix " ",newLine
kanafix "「おまえら",newLine
kanafix "ふたりで いたいんだろう。",newLine
.byte   pauseText
kanafix "おれ ここで ねてるわ。」",newLine
.byte   stopText

MSG_MTITOI_LLOYDSAVE:
kanafix "*しまった! まにあわなかった。",newLine
.byte   stopText

MSG_MTITOI_ANALOVE_YES:
kanafix "*‥‥よかった。",newLine
.byte   stopText

MSG_MTITOI_TEDDYLEAVE:
kanafix "*"
.byte   teddyName
kanafix " ",newLine
kanafix "「おい! なんか",newLine
kanafix "とんでもないおとが したぜ。」",newLine
.byte   stopText

MSG_MTITOI_TEDDYLEAVE2:
kanafix "*"
.byte   teddyName
kanafix " ",newLine
kanafix "「ほ-んとかよ!?」",newLine
.byte   stopText

MSG_MTITOI_BOAT:
kanafix "*ボ-トは",newLine
kanafix "エンジンの ちょうしが",newLine
kanafix "わるいようだ。",newLine
.byte   stopText

MSG_MTITOI_BOAT_NOFIX:
kanafix "*"
.byte   partyLead
kanafix "には",newLine
kanafix "うごかすことが できない。",newLine
.byte   stopText

MSG_MTITOI_BOAT_FIX:
kanafix "*しかし "
.byte   lloydName
kanafix "は",newLine
kanafix "じょうずに エンジンを",newLine
kanafix "かけることが できた。",newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_SEND:
kanafix "*"
.byte   item
kanafix "ですね。",newLine
kanafix "ちゃんと "
.byte   nintenName
kanafix "さんの",newLine
kanafix "うちへ おくっておきますね。",newLine
.byte   pauseText
kanafix "*ほかに あずかるものは",newLine
kanafix "ありますか?",newLine
.byte   stopText

kanafix "*こんな せまいなかに",newLine
kanafix "とじこめられて‥‥",newLine
kanafix "これから どうなるんだろう。",newLine
.byte   stopText

MSG_MERRYSVILLE_SWEETSSIGN:
kanafix "「スイ-トリトル こうじょう」",newLine
.byte   stopText

MSG_MTITOI_GIEGUEPRISON_GUY2:
kanafix "*やまのうえの",newLine
kanafix "マザ-シップに つれていかれて",newLine
kanafix "きがついたら こんなことに‥‥",newLine
.byte   pauseText
kanafix "*なんとかしてくれ!",newLine
.byte   stopText

MSG_SNOWMAN_PHONE_CHECK:
kanafix "*スペルの まちがいは ないですね?",newLine
.byte   stopText

MSG_ZOO_WIN:
kanafix "*どうぶつたちを くるわせていた",newLine
kanafix "あやしいおとは きえた。",newLine
kanafix "どうぶつえんは あんぜんになった。",newLine
.byte   stopText

MSG_YUCCA_PILOT_TANKRIDE:
kanafix "*だいじな せんしゃだからな。",newLine
kanafix "こわさんようにな。",newLine
.byte   stopText

MSG_MYHOME_DOG_CHECK:
kanafix "*いぬの くびわには",newLine
kanafix "ちかしつのカギが さがっていた。",newLine
.byte   stopText

MSG_PODUNK_NOISYMOUSE:
kanafix "*へっへっへ あっしは",newLine
kanafix "おせっかいな ねずみです。",newLine
.byte   pauseText
kanafix "*まちの いえには",newLine
kanafix "はいれる いえと",newLine
kanafix "はいれない いえが あります。",newLine
.byte   pauseText
kanafix "*まるいドアと かんばんのあるドアは",newLine
kanafix "はいれる いえ。",newLine
.byte   pauseText
kanafix "*あとは はいろうとしても",newLine
kanafix "あたまを ぶつけるだけでさぁ。",newLine
.byte   pauseText
kanafix "*さいなら。",newLine
.byte   stopText

MSG_YOUNGTOWN_BABY_AFTER:
kanafix "*テレポ-テ-ションを",newLine
kanafix "おもちゃに するんじゃないぞ。",newLine
.byte   stopText

MSG_MAGICANT_MARIA4:
kanafix "*ほんとうの こどものように",newLine
kanafix "かわいがったのに‥‥",newLine
.byte   stopText

MSG_MAGICANT_MARIA5:
kanafix "*しっぽを ふってた",newLine
kanafix "あかちゃんだった‥‥",newLine
kanafix "こもりうたを‥‥でも‥‥",newLine
.byte   stopText

MSG_MAGICANT_MARIA6:
kanafix "*ああ ジョ-ジ!",newLine
kanafix "あなたの つま マリアです。",newLine
.byte   pauseText
kanafix "*あなたのまつ てんごくに",newLine
kanafix "わたしも いまから むかいます‥‥",newLine
.byte   stopText

MSG_ATM_INSERT_CASHCARD:
kanafix "*キャッシュカ-ドヲ イレテクダサイ",newLine
.byte   stopText

MSG_ATM_TOO_MUCH_CASH:
kanafix "*そんなに げんきんを",newLine
kanafix "もちあるいては いけない。",newLine
.byte   stopText

MSG_GAMEOVER_SAVEDATA:
kanafix "*このまえの",newLine
kanafix "セ-ブデ-タまで もどるが",newLine
kanafix "それで よいのか?",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_NOHAVE:
kanafix "*「はい」って いったのに",newLine
kanafix "もってないじゃないか。",newLine
kanafix "アハハハハ。",newLine
.byte   stopText

MSG_ELLAY_TEDDY_TEDDYBED:
kanafix "*こきゅうが みだれて",newLine
kanafix "くるしそうだ。",newLine
.byte   stopText

MSG_GIVE_CANT:
kanafix "*まだ グッズをわたせる",newLine
kanafix "なかまが いない。",newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_GIVE:
kanafix "*"
.byte   item
kanafix "ですね。",newLine
kanafix "たしかに おわたししましたよ。",newLine
.byte   pauseText
kanafix "*ほかに もっていくものは",newLine
kanafix "ありますか?",newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_SOMEONEELSE:
kanafix "*もちきれない みたいだけど",newLine
kanafix "ほかのひとに わたしますか?",newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_FULL:
kanafix "*そうこが いっぱいです。",newLine
.byte   stopText

MSG_MAGICANT_MARIAFADE:
kanafix "*クイ-ンマリ-は",newLine
.byte   nintenName
kanafix "に かたりおえると",newLine
kanafix "かぜのなかに きえていった。",newLine
.byte   pauseText
kanafix "*そして マジカントのくにも",newLine
kanafix "また あとかたもなく",newLine
kanafix "かききえた。",newLine
.byte   pauseText
kanafix "*マジカントのくに とは",newLine
kanafix "マリ-のいしきが うみだした",newLine
kanafix "まぼろしだったのだ。",newLine
.byte   stopText

MSG_MAGICANT_MARIA_INTRO:
kanafix "*わたしが",newLine
kanafix "あなた"
.byte   unk4
kanafix "を よんだのです。",newLine
.byte   pauseText
kanafix "*"
.byte   nintenName
kanafix "!",newLine
.byte   anaName
kanafix "!",newLine
.byte   lloydName
kanafix "!",newLine
.byte   teddyName
kanafix "!",newLine
.byte   pauseText
kanafix "*そして すべての",newLine
kanafix "ゆうきある こどもたち。",newLine
.byte   pauseText
kanafix "*いまが そのときです!",newLine
.byte   stopText

MSG_MAGICANT_VENDORINTRO:
kanafix "*し-っ! わたくしどもも",newLine
kanafix "あなた"
.byte   unk4
kanafix "と おなじように",newLine
kanafix "あっちの せかいの にんげんです。",newLine
.byte   pauseText
kanafix "*おかねさえ いただければ",newLine
kanafix "マジカントの すばらしいおみやげを",newLine
kanafix "わけて さしあげますよ。",newLine
.byte   pauseText
kanafix "*ヒッヒッヒ。",newLine
.byte   stopText

.byte   stopText

.byte   stopText

MSG_GOODS_GIVESELF:
kanafix "*"
.byte   user
kanafix "は",newLine
kanafix "わたすのを やめた。",newLine
.byte   stopText

MSG_GOODS_GIVE:
kanafix "*"
.byte   user
kanafix "は "
.byte   result
kanafix "に",newLine
.byte   recipient
kanafix "を あたえた。",newLine
.byte   stopText

MSG_GOODS_HANDOFF:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   result
kanafix "の バッグに",newLine
.byte   recipient
kanafix "を いれた。",newLine
.byte   stopText

MSG_GOODS_TAKEFROM:
kanafix "*"
.byte   result
kanafix "は",newLine
.byte   user
kanafix "の バッグから",newLine
.byte   recipient
kanafix "を だした。",newLine
.byte   stopText

MSG_GOODS_TAKENTHROW:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
.byte   user
kanafix "の バッグから",newLine
.byte   recipient
kanafix "を すてた。",newLine
.byte   stopText

MSG_GOODS_MOVE:
kanafix "*"
.byte   partyLead
kanafix "は",newLine
.byte   user
kanafix "の バッグから",newLine
.byte   recipient
kanafix "を だして",newLine
.byte   pauseText
.byte   result
kanafix "の バッグに いれた。",newLine
.byte   stopText

MSG_ITEM_EAT:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を たべた。",newLine
.byte   stopText

MSG_ITEM_DRINK:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "を のんだ。",newLine
.byte   stopText

MSG_ITEM_RECOVER:
.byte   price
kanafix " かいふくした。",newLine
.byte   stopText

MSG_ITEM_INCREASE:
.byte   price
kanafix " あがった。",newLine
.byte   stopText

MSG_HP_IS:
kanafix "*"
.byte   user
kanafix "の HPは",newLine
.byte   stopText

MSG_PP_IS:
kanafix "*"
.byte   user
kanafix "の PPは",newLine
.byte   stopText

MSG_FIGHT_IS:
kanafix "*"
.byte   user
kanafix "の ファイトは",newLine
.byte   stopText

MSG_SPEED_IS:
kanafix "*"
.byte   user
kanafix "の スピ-ドは",newLine
.byte   stopText

MSG_WISDOM_IS:
kanafix "*"
.byte   user
kanafix "の かしこさは",newLine
.byte   stopText

MSG_STRENGTH_IS:
kanafix "*"
.byte   user
kanafix "の たいりょくは",newLine
.byte   stopText

MSG_FORCE_IS:
kanafix "*"
.byte   user
kanafix "の フォ-スは",newLine
.byte   stopText

MSG_USEBIGBAG:
kanafix "*"
.byte   user
kanafix "は でかぶくろから",newLine
kanafix "マジックハ-ブを とりだして",newLine
kanafix "つかった。",newLine
.byte   stopText

MSG_USEBREAD:
kanafix "*"
.byte   user
kanafix "は",newLine
kanafix "パンを ちぎって",newLine
kanafix "まきながら あるきだした。",newLine
.byte   stopText

MSG_USEBREAD_FAIL:
kanafix "*ふるいパンくずを",newLine
kanafix "すててからでないと",newLine
kanafix "パンは つかえない。",newLine
.byte   stopText

MSG_USECRUMBS:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
kanafix "パンくずを たどりながら",newLine
kanafix "もとのばしょに もどった。",newLine
.byte   stopText

MSG_USERIBBON:
kanafix "*"
.byte   user
kanafix "は",newLine
kanafix "かみに リボンを つけた。",newLine
.byte   stopText

MSG_USEFINALWEAPON:
kanafix "*「でんげんを きってしまえ!」",newLine
.byte   stopText

MSG_USERULER:
kanafix "*いろいろなものの",newLine
kanafix "ながさが わかった。",newLine
.byte   stopText

MSG_BIGBAG_EMPTY:
kanafix "*でかぶくろは からになって",newLine
kanafix "かききえてしまった。",newLine
.byte   stopText

MSG_PAYPHONE_CARDEXPIRE:
kanafix "*テレホンカ-ドを",newLine
kanafix "つかいきってしまった。",newLine
.byte   stopText

MSG_CURE_POISON:
kanafix "*"
.byte   user
kanafix "の からだから",newLine
kanafix "どくが ぬけた。",newLine
.byte   stopText

MSG_CURE_COLD:
kanafix "*"
.byte   user
kanafix "のカゼが なおった。",newLine
.byte   stopText

MSG_ITEM_PSISTONE:
kanafix "*"
.byte   user
kanafix "は",newLine
kanafix "サイパワ-スト-ンをにぎりしめた。",newLine
.byte   stopText

MSG_ITEM_PSISTONE_USEDUP:
kanafix "*サイパワ-スト-ンは",newLine
kanafix "ただの いしころに なった。",newLine
.byte   stopText

MSG_PSI_TRIED:
kanafix "*"
.byte   user
kanafix "は",newLine
.byte   recipient
kanafix "をこころみた。",newLine
.byte   stopText

MSG_PSI_NOPP:
kanafix "*それを こころみるだけの",newLine
kanafix "パワ-は のこっていない。",newLine
.byte   stopText

MSG_PSI_REVIVE:
kanafix "*"
.byte   user
kanafix "は カムバックした。",newLine
.byte   stopText

MSG_USEDIARY:
kanafix "*にっきは ほとんど",newLine
kanafix "よみとれなかったが かろうじて",newLine
.byte   pauseText
kanafix "*「あいことば‥‥",newLine
kanafix "かみのしっぽは どこにある。",newLine
kanafix "あまかけるふねの わすれもの」",newLine
.byte   pauseText
kanafix "と よめた。",newLine
.byte   stopText

MSG_CURE_PETRIFY:
kanafix "*"
.byte   result
kanafix "は",newLine
kanafix "すっかり やわらかくなった。",newLine
.byte   stopText

MSG_USEOCARINA:
kanafix "*きぼうのオカリナを ふいた。",newLine
.byte   stopText
MSG_USEOCARINA2:
kanafix "*「きこえたかい?」",newLine
.byte   stopText

MSG_USEMAP_FAIL:
kanafix "*このばしょは",newLine
kanafix "ちずに のっていない。",newLine
.byte   stopText

MSG_USEMAP:
kanafix "*"
.byte   user
kanafix "は",newLine
kanafix "ちずを しらべた。",newLine
.byte   stopText

MSG_PSI_NOTELEPORT:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
kanafix "なにかの ちからに",newLine
kanafix "おしとどめられて しまった。",newLine
.byte   stopText

.byte   stopText
