.segment        "PRG1B": absolute

.byte   0

MSG_ELLAY_BBGANG5:
kanafix "*おれは つよい。"
.byte   newLine
kanafix "くちばっかしだけどな。"
.byte   newLine
.byte   stopText
MSG_ELLAY_BBGANG6:
kanafix "*"
.byte   teddyName
kanafix "の あにきがいたら"
.byte   newLine
kanafix "おまえなんか ゆびさきで"
.byte   newLine
kanafix "ヒョイッ さ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_SIGNGUY:
kanafix "*カンバンの もじは"
.byte   newLine
kanafix "ちゃんと よんどるかね?"
.byte   newLine
.byte   stopText

MSG_ELLAY_CACTUSGIRL:
kanafix "*もし どこかのさばくで"
.byte   newLine
kanafix "かおのあるサボテンを"
.byte   newLine
kanafix "みつけたら‥‥"
.byte   newLine
.byte   pauseText
kanafix "*とても こわいざますわね。"
.byte   newLine
.byte   stopText

MSG_ELLAY_FISHERGUY:
kanafix "*つりびとに はなしかけると"
.byte   newLine
kanafix "はなしが ながくて いけないね。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_ALLCARTWHEELGIRL:
kanafix "*しょうがく いちねんせいだったら"
.byte   newLine
kanafix "さかあがりくらい"
.byte   newLine
kanafix "できるものよねぇ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWERBELLHOP:
kanafix "*こちらのエレベ-タ-で"
.byte   newLine
kanafix "てんぼうだいまで"
.byte   newLine
kanafix "おあがりください。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWER_GUY:
kanafix "*ここの てんぼうだいから"
.byte   newLine
kanafix "みえる しまで けむりがでてたよ。"
.byte   newLine
kanafix "だれか すんでいるのかなぁ?"
.byte   newLine
.byte   pauseText
kanafix "*ぼうえんきょうで みてみれば"
.byte   newLine
kanafix "よかったなあ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_CANTCARTWHEELGIRL:
kanafix "*ぼく さかあがりできないのよ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SUBTRACTIONGIRL:
kanafix "*わたしは"
.byte   newLine
kanafix "ひきざんの くりさがりが"
.byte   newLine
kanafix "まだ よくわからない。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_TOFUKID:
kanafix "*いちごあじのとうふって"
.byte   newLine
kanafix "とかいのほうで"
.byte   newLine
kanafix "はやってるらしいな。"
.byte   newLine
.byte   pauseText
kanafix "*くってみてぇよ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_HUNGRYKID:
kanafix "*はら へったな。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_DADGIRL:
kanafix "*おれを ただのおじさんと"
.byte   newLine
kanafix "おもうなよ。"
.byte   newLine
.byte   pauseText
kanafix "*って うちのパパのくちぐせなの。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LATEGIRL:
kanafix "*あなた ちこくよね!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_STRANGEGIRL:
kanafix "*りかしつで"
.byte   newLine
kanafix "へんなせんせいを みなかったぁ?"
.byte   newLine
.byte   pauseText
kanafix "*‥‥わたし みた。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_GAMEKID:
kanafix "*ドラクエの フォ- やった?"
.byte   newLine
kanafix "おれ"
.byte   newLine
kanafix "まだスリ-でくろうしてるんだ。"
.byte   newLine
.byte   stopText

MSG_DRUGSVENDOR_WELCOME:
kanafix "*いらっしゃいませ。"
.byte   newLine
kanafix "なにを さしあげましょう?"
.byte   newLine
.byte   stopText

MSG_VARIETYVENDOR_OUTOFSTOCK:
kanafix "*もうしわけありません。"
.byte   newLine
kanafix "そのしなは"
.byte   newLine
kanafix "ただいまうりきれで ございます。"
.byte   newLine
.byte   stopText

MSG_BURGERSHOP_NO_BUY:
kanafix "*あら おやめになるんですか?"
.byte   newLine
kanafix "ざんねんですが‥‥"
.byte   newLine
.byte   pauseText
kanafix "*またの ごらいてんを"
.byte   newLine
kanafix "おまちしております。"
.byte   newLine
.byte   stopText

MSG_BURGERSHOP_GOODBYE:
kanafix "*ありがとうございました。"
.byte   newLine
kanafix "また ごりようください。"
.byte   newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHKID_NOTAKE:
kanafix "*おや やめるんですか?"
.byte   newLine
kanafix "では またきてくださいね。"
.byte   newLine
.byte   stopText

MSG_HOSPITAL_NURSE_REVIVE:
kanafix "*"
.byte   result
kanafix "さん"
.byte   newLine
kanafix "げんきになって よかったわね。"
.byte   newLine
kanafix "また いつでもどうぞ!"
.byte   newLine
.byte   stopText
MSG_HOSPITAL_NURSE_NOREVIVE:
kanafix "*あら あなたのおともだちでしょ?"
.byte   newLine
kanafix "ほんとに しんじゃいますよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_HOSPITALDOCTOR:
kanafix "*はいはい"
.byte   newLine
kanafix "ひとり "
.byte   price
kanafix "ドルで"
.byte   newLine
kanafix "しんさつしてあげましょうね。"
.byte   newLine
.byte   stopText
MSG_PODUNK_HOSPITALDOCTOR_DECLINE:
kanafix "*ほんとに ちりょうは いらない?"
.byte   newLine
kanafix "あっそ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_HOSPITALDOCTOR_NORMAL:
kanafix "*わたしのみたてでは"
.byte   newLine
kanafix "どこも わるくないようだよ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_HOSPITALDOCTOR_ACCEPT:
kanafix "*はい すっかりよくなったよ。"
.byte   newLine
.byte   stopText

MSG_HEALER:
kanafix "*しんじようが しんじまいが"
.byte   newLine
kanafix "わたしは ヒ-ラ-。"
.byte   newLine
kanafix "どうしたい?"
.byte   newLine
.byte   stopText

MSG_HEALER_NO:
kanafix "*おお そうか。 そうしなさい。"
.byte   newLine
.byte   stopText

MSG_HEALER_PRICE:
kanafix "*"
.byte   price
kanafix "ドル"
.byte   newLine
kanafix "いただいておこうか。"
.byte   newLine
.byte   stopText

MSG_HOTELBELLHOP:
kanafix "*いらっしゃいませ。"
.byte   newLine
kanafix "ひとばん "
.byte   price
kanafix "ドルに"
.byte   newLine
kanafix "なりますが おとまりになりますか?"
.byte   newLine
.byte   stopText
MSG_HOTELBELLHOP_DECLINE:
kanafix "*それは ざんねんです。"
.byte   newLine
kanafix "また いらしてくださいね。"
.byte   newLine
.byte   stopText
MSG_HOTELBELLHOP_ACCEPT:
kanafix "*では ごゆっくり。"
.byte   newLine
.byte   stopText
MSG_HOTELBELLHOP_GOODMORNING:
kanafix "*おはようございます。"
.byte   newLine
kanafix "また おたちよりください。"
.byte   newLine
kanafix "おまちしております。"
.byte   newLine
.byte   stopText

MSG_HOSPITAL_NURSE_SELECT:
kanafix "*"
.byte   result
kanafix "さんでしたら"
.byte   newLine
kanafix "さっき はこびこまれましたよ。"
.byte   newLine
kanafix "いしきが もどらないんですが‥‥"
.byte   newLine
.byte   pauseText
kanafix "*ちりょうひを "
.byte   price
kanafix "ドル"
.byte   newLine
kanafix "おしはらい ください。"
.byte   newLine
.byte   stopText
MSG_HOSPITAL_NURSE:
kanafix "*どなたに ごめんかいですか?"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_HOTELBELLHOP:
kanafix "*パパは るすです。"
.byte   newLine
kanafix "だから"
.byte   newLine
kanafix "おかねのことは わかんないけど"
.byte   newLine
.byte   pauseText
kanafix "ほかは"
.byte   newLine
kanafix "ぼくが ちゃんとやりますから"
.byte   newLine
kanafix "あんしんして とまってください。"
.byte   newLine
.byte   stopText
MSG_YOUNGTOWN_HOTELBELLHOP_GOODMORNING:
kanafix "*おはよう。"
.byte   newLine
kanafix "また とまりにきてね。"
.byte   newLine
kanafix "ひとりぼっちで さみしいんだ。"
.byte   newLine
.byte   stopText
MSG_YOUNGTOWN_HOTELBELLHOP_DECLINE:
kanafix "*なんだ とまっていかないの‥‥"
.byte   newLine
.byte   pauseText
kanafix "*パパがいなくても ぼくがちゃんと"
.byte   newLine
kanafix "かわりをするから"
.byte   newLine
kanafix "だいじょうぶなのに‥‥"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHBOUNCERGIRL_TICKET:
kanafix "*あらっ チケットがなきゃ"
.byte   newLine
kanafix "はいれないわよ。"
.byte   newLine
.byte   stopText

kanafix "*しかし‥‥‥"
.byte   newLine
kanafix "なにもなかった。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE:
kanafix "  あずける   もちだす"
.byte   stopText

.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_INVNOTHING:
kanafix "*なにももってないじゃない。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_NOTHING:
kanafix "*なにも あずかってないわよ。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_FULL:
kanafix "*ちょっとまって‥‥‥"
.byte   newLine
.byte   pauseText
kanafix "*そうこが いっぱいだから"
.byte   newLine
kanafix "もうあずかれないよ。"
.byte   newLine
.byte   stopText

MSG_ATM_INTRO:
kanafix "*イラッシャイマセ"
.byte   newLine
.byte   stopText

MSG_ATM_INSUFFICIENT:
kanafix "*ザンダカガ タリマセン"
.byte   newLine
.byte   stopText

MSG_ATM_NOT_ENOUGH_STORED:
kanafix "*オカネガ タリマセン"
.byte   newLine
.byte   stopText

MSG_ATM_DEPOSIT_TOO_MUCH:
kanafix "*モウシワケ アリマセン"
.byte   newLine
.byte   pauseText
kanafix "トリヒキ ゲンドガクヲ"
.byte   newLine
kanafix "コエマシタノデ"
.byte   newLine
kanafix "オアズカリ デキマセン"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_HOTELBELLHOP_THANKS:
kanafix "*アリガトウ ゴザイマシタ"
.byte   newLine
.byte   stopText

MSG_MYHOME_DOLL:
kanafix "*にんぎょうの なかには"
.byte   newLine
kanafix "ふるい オルゴ-ルが"
.byte   newLine
kanafix "かくされていた。"
.byte   newLine
.byte   pauseText
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "オルゴ-ルをあけた。"
.byte   newLine
.byte   pauseText
kanafix "*とぎれとぎれに"
.byte   newLine
kanafix "メロディ-がながれた。"
.byte   newLine
.byte   stopText

MSG_CANARY_PILLAR:
kanafix "* ?"
.byte   newLine
.byte   stopText

kanafix "*ありがとう ございました。"
.byte   newLine
.byte   stopText

MSG_ELLAY_JAILCOP:
kanafix "*おれ ぶきをてにいれる"
.byte   newLine
kanafix "いいル-トを もっているんだ。"
.byte   newLine
.byte   pauseText
kanafix "*そのうち すごいぶきを"
.byte   newLine
kanafix "てにいれられる かもな。"
.byte   newLine
.byte   stopText

kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "たたかいに かった。"
.byte   newLine
.byte   stopText

MSG_ATM_MENU:
kanafix "  ヒキダス   アズケル"
.byte   stopText

.byte   newLine
.byte   stopText

MSG_ATM_CURRENT_BALANCE:
kanafix "*ゲンザイ $"
.byte   currentCash, c00
.byte   newLine
kanafix "オアズカリ シテイマス"
.byte   newLine
.byte   stopText

MSG_DOOR_LOCKED:
kanafix "*カギが かかっている。"
.byte   newLine
.byte   stopText

MSG_DOOR_KEYFAIL:
kanafix "*カギが あわないようだ。"
.byte   newLine
.byte   stopText

MSG_DOOR_UNLOCKED:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "カギをあけて なかにはいった。"
.byte   newLine
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
kanafix "は"
.byte   newLine
kanafix "じゅわきを とった。"
.byte   newLine
.byte   stopText

MSG_HOSPITAL_NURSE_NOMONEY:
kanafix "*しつれいですが‥‥"
.byte   newLine
kanafix "おかねが たりないようですよ。"
.byte   newLine
.byte   stopText

MSG_BURGERSHOP_NOMONEY:
kanafix "*まあ おきゃくさま"
.byte   newLine
kanafix "おかねが たりませんわ。"
.byte   newLine
.byte   stopText

MSG_BURGERSHOP_NO_ROOM:
kanafix "*おきゃくさま"
.byte   newLine
kanafix "それいじょうおもちになろうなんて"
.byte   newLine
.byte   pauseText
kanafix "おやめになったほうが"
.byte   newLine
kanafix "よろしいとおもいます。"
.byte   newLine
.byte   stopText

MSG_HEALER_FIXED:
kanafix "*っはい! もうなおってる。"
.byte   newLine
kanafix "すごいでしょ。"
.byte   newLine
.byte   stopText

MSG_RETURNS_CANTSELL:
kanafix "*もうしわけありません。"
.byte   newLine
.byte   item
kanafix "は"
.byte   newLine
kanafix "かいとれません。"
.byte   newLine
.byte   stopText

MSG_CANARY_LAURA_SING:
kanafix "*うたひめロ-ラは わがこ と"
.byte   newLine
kanafix "たいめんして おおよろこびで"
.byte   newLine
kanafix "うたを うたいはじめた。"
.byte   newLine
.byte   stopText

MSG_REMEMBER_MELODY:
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "メロディ-をおぼえた。"
.byte   newLine
.byte   stopText

MSG_CANARY_SING:
kanafix "*カナリアが うたっている。"
.byte   newLine
.byte   stopText

MSG_ZOO_GATEMONKEY_KEY:
kanafix "*サルは"
.byte   newLine
kanafix "どうぶつえんのカギをぬすんだ。"
.byte   newLine
.byte   stopText

kanafix "*ロボットは ふるく"
.byte   newLine
kanafix "さびついていた。"
.byte   newLine
.byte   stopText

MSG_EVE_EVECHECK:
kanafix "*"
.byte   nintenName
kanafix "の けはいを"
.byte   newLine
kanafix "かんじた しゅんかん"
.byte   newLine
.byte   pauseText
kanafix "ロボットは"
.byte   newLine
kanafix "いのちを ふきこまれた。"
.byte   newLine
.byte   stopText

MSG_PHONE_EXPLVL:
kanafix "*"
.byte   result
kanafix "は "
.byte   price
.byte   newLine
.byte   stopText

MSG_ELLAY_FAKEHEALER_GOODBYE:
kanafix "*がんばりなさい。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FOUNTAIN:
kanafix "*いずみの みずにふれると"
.byte   newLine
kanafix "すっごく げんきになりました。"
.byte   newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_RETURN:
kanafix "*ピッピ!"
.byte   newLine
kanafix "よかったわ よかったわ。"
.byte   newLine
kanafix "ほんとによかった。"
.byte   newLine
.byte   pauseText
kanafix "*ちょうちょうさんも"
.byte   newLine
kanafix "ピッピを さがしてくれてるはずよ。"
.byte   newLine
.byte   pauseText
kanafix "*ちゃんと ごあいさつに"
.byte   newLine
kanafix "いってきてちょうだい。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_F1_ROOM6ENTRANCE_NOJANITOR:
kanafix "*はいってます!"
.byte   newLine
kanafix "って ここはトイレじゃないけどな。"
.byte   newLine
.byte   pauseText
kanafix "*いま てがはなせないんだ。"
.byte   newLine
kanafix "あとでおいで。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_CURE:
kanafix "*だれが どくに やられたんだね?"
.byte   newLine
.byte   stopText

MSG_HEALER_WHO:
kanafix "*だれを やわらかくしようかね‥‥?"
.byte   newLine
.byte   stopText

kanafix "*どくなんか ない!"
.byte   newLine
.byte   stopText

MSG_HEALER_SOFTEN_FAIL:
kanafix "*かたくなって ないじゃないか。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_SWEETSGUY_YES:
kanafix "*あそこは むかし"
.byte   newLine
kanafix "ペンシルロケットを"
.byte   newLine
kanafix "じゃんじゃん つくってたんだよ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_F2JANITOR:
kanafix "*うちの にょうぼうは"
.byte   newLine
kanafix "しょだいの ミスいなかまち"
.byte   newLine
kanafix "だったんだ。"
.byte   newLine
.byte   stopText
MSG_TWINKLE_F2JANITOR2:
kanafix "*カギは あけたよ。"
.byte   newLine
kanafix "おくじょうは けしきがいいぞ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_F2LLOYD:
kanafix "*あとで ダンカンのだいこうじょうに"
.byte   newLine
kanafix "いこう。"
.byte   newLine
.byte   pauseText
kanafix "*あそこには すっごいロケットが"
.byte   newLine
kanafix "あるらしいんだ。"
.byte   newLine
.byte   stopText
MSG_TWINKLE_F1LLOYD:
kanafix "*みんなが ぼくのことを"
.byte   newLine
kanafix "よわむしとか けむしとか"
.byte   newLine
kanafix "アホタレとか"
.byte   newLine
.byte   pauseText
kanafix "うわさしてなかったかなぁ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_FISHER2:
kanafix "*いや‥‥あさになってしまったな。"
.byte   newLine
.byte   stopText

MSG_ELLAY_HOTELCOLDLADY:
kanafix "*としよりを たいせつにしなさいね。"
.byte   newLine
kanafix "ゴホゴホ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_HOTELMEANGUY:
kanafix "*チビ!"
.byte   newLine
kanafix "きやすく はなしかけんじゃねぇよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_HOTELBIGLADY:
kanafix "*ある"
.byte   newLine
kanafix "ファミコンソフトのはなしだけどね。"
.byte   newLine
.byte   pauseText
kanafix "*マザ-って タイトルに"
.byte   newLine
kanafix "きまったらしいんだけど"
.byte   newLine
.byte   pauseText
kanafix "ジョン.レノンの まねだよな。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_HINTGIRL_HINT2:
kanafix "*レインディアの えきにいる"
.byte   newLine
kanafix "おばあさんは とっても"
.byte   newLine
kanafix "たいせつなものを くれるんだけど"
.byte   newLine
.byte   pauseText
kanafix "*あなた"
.byte   unk4
kanafix "は あったかしら‥‥"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_HINTGIRL_HINT3:
kanafix "*さいごの ヒントよ。"
.byte   newLine
kanafix "マジカントこくの ギタ-ひきの"
.byte   newLine
kanafix "うたは ぜひ きいてね。"
.byte   newLine
.byte   stopText

MSG_MYHOME_DOG_ADVICE:
kanafix "*なにか あるなとおもったら"
.byte   newLine
kanafix "こまめに チェックするといいぞ。"
.byte   newLine
.byte   stopText

MSG_ZOO_MONKEY:
kanafix "*うたうサルは しみじみとうたった。"
.byte   newLine
.byte   stopText

MSG_YUCCA_SINGINGCACTUS:
kanafix "*サボテンは うたう。"
.byte   newLine
kanafix "なぜか うたう。"
.byte   newLine
kanafix "せつせつと うたいつづけた。"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_PIANO_MELODY:
kanafix "*ピアノは ひとりでに"
.byte   newLine
kanafix "けんばんが うごいて"
.byte   newLine
kanafix "えんそうを はじめた。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_DRAGON_MELODY:
kanafix "*ドラゴンは いがいと すなおに"
.byte   newLine
kanafix "ふるい がくふを みせてくれた。"
.byte   newLine
.byte   pauseText
kanafix "*こんな うただった。"
.byte   newLine
.byte   stopText

MSG_MTITOI_EVE_MELODY:
kanafix "*ロボット イヴは"
.byte   newLine
kanafix "はかいされ うごかなくなった。"
.byte   newLine
.byte   pauseText
kanafix "*イヴの むねのあたりから"
.byte   newLine
kanafix "おんがくが ながれてきた。"
.byte   newLine
.byte   stopText

MSG_ZOO_MONKEYSIGN:
kanafix "「よにも めずらしい うたうさるは"
.byte   newLine
kanafix "とう シュ-クリ-ムどうぶつえんに"
.byte   newLine
kanafix "しか おりません。」"
.byte   newLine
.byte   stopText

MSG_TWINKLE_F2_UPSTAIRS_PADLOCK:
kanafix "*かいだんの うえの とびらには"
.byte   newLine
kanafix "おおきな じょうまえが"
.byte   newLine
kanafix "かかっている。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PRIEST_GOODBYE:
kanafix "*わたしは スノ-マンのまちの"
.byte   newLine
kanafix "ひとたちのために ここにのこるが"
.byte   newLine
kanafix "どうか‥‥きをつけて‥‥いって。"
.byte   newLine
.byte   stopText

MSG_PHONE_PAYPHONE:
kanafix "*おかねが たりません。"
.byte   newLine
.byte   stopText

MSG_GRAVEYARD_PIPPI_AFRAID:
kanafix "*やっぱり こわいから"
.byte   newLine
.byte   nintenName
kanafix "ちゃん"
.byte   newLine
kanafix "さきに あるいてよ。"
.byte   newLine
.byte   stopText

MSG_ZOO_GATE:
kanafix "*よくみると とびらの カギは"
.byte   newLine
kanafix "こわれていた。"
.byte   newLine
.byte   partyLead
kanafix "は とびらを あけた。"
.byte   newLine
.byte   stopText

MSG_ELLAY_BBGANG2_TEDDY:
kanafix "*あっ "
.byte   teddyName
kanafix "さん"
.byte   newLine
kanafix "こんにちは ッス。"
.byte   newLine
.byte   stopText

MSG_ELLAY_BBGANG1_TEDDY2:
kanafix "*"
.byte   teddyName
kanafix "のアニキを はやく"
.byte   newLine
kanafix "カムバックさせてくれよう!"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_STORAGE_CANT:
kanafix "*あ だめだめ。"
.byte   newLine
.byte   item
kanafix "は"
.byte   newLine
kanafix "あずかれないのよ。"
.byte   newLine
.byte   pauseText
kanafix "*わたし わがままなの。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE1:
kanafix "「"
.byte   nintenName
kanafix "の"
.byte   newLine
kanafix "えいえんのしもべ。"
.byte   newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし"
.byte   newLine
kanafix "ここに ねむる。」"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE2:
kanafix "「"
.byte   nintenName
kanafix "の"
.byte   newLine
kanafix "うちなる ちから。"
.byte   newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし"
.byte   newLine
kanafix "ここに ねむる。」"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE3:
kanafix "「"
.byte   nintenName
kanafix "の"
.byte   newLine
kanafix "ぜんなる こころ。"
.byte   newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし"
.byte   newLine
kanafix "ここに ねむる。」"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE4:
kanafix "「"
.byte   nintenName
kanafix "の"
.byte   newLine
kanafix "おおいなる かなしみ。"
.byte   newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし"
.byte   newLine
kanafix "ここに ねむる。」"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMANGRAVE5:
kanafix "「"
.byte   nintenName
kanafix "の"
.byte   newLine
kanafix "ち と にく。"
.byte   newLine
.byte   pauseText
kanafix "ゆうかんなる フライングマンせんし"
.byte   newLine
kanafix "ここに ねむる。」"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAGICOP:
kanafix "*ちょうちょうさんの めいれいで"
.byte   newLine
.byte   pauseText
kanafix "どうぶつえんの じけんが"
.byte   newLine
kanafix "かいけつするまで"
.byte   newLine
kanafix "ここは とおれないんだぞ。"
.byte   newLine
.byte   pauseText
kanafix "*ちょっと ロコツな"
.byte   newLine
kanafix "やりかただけどな。"
.byte   newLine
.byte   stopText
MSG_PODUNK_MAGICOP_LIFTED:
kanafix "*このおくの やまのどうくつに"
.byte   newLine
kanafix "へんな いわが あるんだぞ。"
.byte   newLine
.byte   pauseText
kanafix "*あんまりへんだから"
.byte   newLine
kanafix "けんぶつすると いいぞ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAGICOP2_LIFTED:
kanafix "*ところで‥‥"
.byte   newLine
kanafix "おまえ"
.byte   unk4
kanafix " テレパシ-とかが"
.byte   newLine
kanafix "できるんだってな。"
.byte   newLine
.byte   pauseText
kanafix "*だいひょうばんだぞ。"
.byte   newLine
.byte   pauseText
kanafix "*この にんきもの!"
.byte   newLine
.byte   stopText

MSG_ANAHAT_WOMAN1:
kanafix "*あんた"
.byte   unk4
.byte   newLine
kanafix "スノ-マンに いくのかい?"
.byte   newLine
.byte   stopText

MSG_ANAHAT_WOMAN_YES:
kanafix "*このぼうしを ひろったんだけど"
.byte   newLine
kanafix "スノ-マンにいる おんなのこの"
.byte   newLine
kanafix "ものらしいの。"
.byte   newLine
.byte   pauseText
kanafix "*とどけてあげて ちょうだいな。"
.byte   newLine
.byte   stopText

MSG_ANAHAT_WOMAN_NO:
kanafix "*たのみたいことが あったんだけど"
.byte   newLine
kanafix "ざんねんだわ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_SINGINGGUY_ACCEPT2:
kanafix "*かっこいいしょうねんは"
.byte   newLine
kanafix "どくとくの うたをうたった。"
.byte   newLine
.byte   pauseText
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "このメロディ-は"
.byte   newLine
kanafix "さすがに おぼえられなかった。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE:
kanafix "*すみません。"
.byte   newLine
kanafix "ちょっと アンケ-トに"
.byte   newLine
kanafix "こたえていただけますか?"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_Q1:
kanafix "*あなたは"
.byte   newLine
kanafix "きしゃの うんちんを"
.byte   newLine
kanafix "たかいと おもいますか?"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_Q2:
kanafix "*あなたは"
.byte   newLine
kanafix "ふしぎなメガホンを"
.byte   newLine
kanafix "つかいましたか?"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_FINISH:
kanafix "*ごきょうりょく"
.byte   newLine
kanafix "ありがとうございました。"
.byte   newLine
kanafix "おれいの テレホンカ-ドです。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_QUESTIONNAIRE_DONE:
kanafix "*すいません。 ちょっと‥‥"
.byte   newLine
kanafix "アンケ-トに‥‥‥"
.byte   newLine
.byte   pauseText
kanafix "*あっ"
.byte   newLine
kanafix "まえに おねがいしましたっけね。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_APPEAR:
kanafix "*こころの さけびを ききつけて"
.byte   newLine
kanafix "おたすけじいさんが"
.byte   newLine
kanafix "とうじょうした。"
.byte   newLine
.byte   stopText

MSG_GRAVEYARD_CASKET_GENERIC:
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "カンオケを あけた。"
.byte   newLine
kanafix "カンオケのなかから‥‥!!"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWER_TELESCOPE:
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "ぼうえんきょうを のぞいた。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWER_TELESCOPE2:
kanafix "*うみが きれいだった。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWER_TELESCOPE_ROCKET:
kanafix "*むこうのしまで"
.byte   newLine
kanafix "なにかが ひかった!"
.byte   newLine
.byte   stopText

MSG_ZOO_CAPSULE:
kanafix "*カプセルのなかから"
.byte   newLine
kanafix "なにかが とびだした。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_ANA_GOODBYE:
kanafix "*"
.byte   anaName
kanafix " "
.byte   newLine
kanafix "「パパ‥‥いまは‥‥さよなら。"
.byte   newLine
kanafix "つぎに あうときは"
.byte   newLine
kanafix "きっと ママといっしょよ!"
.byte   newLine
.byte   pauseText
kanafix "‥‥いのっててください。」"
.byte   newLine
.byte   stopText

.byte   stopText

MSG_TALK_NOONE:
kanafix "*だれに はなしているのだ。"
.byte   newLine
.byte   stopText

MSG_TALK_PARTY:
kanafix "*なに?"
.byte   newLine
.byte   stopText

MSG_CHECK_NOTHING:
kanafix "*もんだいなし。"
.byte   newLine
.byte   stopText

MSG_USE_ITEM:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を つかった。"
.byte   newLine
.byte   stopText

MSG_CANT_USE_ITEM:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を"
.byte   newLine
kanafix "つかえない。"
.byte   newLine
.byte   stopText

MSG_CANT_EAT:
kanafix "*やめてください。"
.byte   newLine
.byte   stopText

MSG_EQUIPPED_ITEM:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を"
.byte   newLine
kanafix "そうびした。"
.byte   newLine
.byte   stopText

MSG_CANT_EQUIP_ITEM:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を"
.byte   newLine
kanafix "そうびできない。"
.byte   newLine
.byte   stopText

MSG_TOSS_ITEM:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を"
.byte   newLine
kanafix "すててしまった。"
.byte   newLine
.byte   stopText

MSG_CANT_TOSS_ITEM:
kanafix "*"
.byte   recipient
kanafix "は"
.byte   newLine
kanafix "すててはいけない。"
.byte   newLine
.byte   stopText

MSG_GIVE_ITEM:
kanafix "*"
.byte   user
kanafix "は "
.byte   result
kanafix "に"
.byte   newLine
.byte   recipient
kanafix "を"
.byte   newLine
kanafix "わたした。"
.byte   newLine
.byte   stopText

MSG_CANT_GIVE:
kanafix "*"
.byte   recipient
kanafix "は"
.byte   newLine
kanafix "わたせない。"
.byte   newLine
.byte   stopText

MSG_CANT_GIVE_FULL:
kanafix "*"
.byte   result
kanafix "は"
.byte   newLine
kanafix "これいじょう ものをもてない。"
.byte   newLine
.byte   stopText

MSG_NOTHING_HAPPENED:
kanafix "*なにも おこらない。"
.byte   newLine
.byte   stopText

MSG_OPEN_PRESENT:
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "プレゼントのはこを あけた。"
.byte   newLine
.byte   stopText

MSG_PRESENT_ITEM:
kanafix "*"
.byte   item
kanafix "が あった。"
.byte   newLine
.byte   stopText

MSG_GET_ITEM:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
.byte   item
kanafix "を てにいれた。"
.byte   newLine
.byte   stopText

MSG_INVENTORY_FULL:
kanafix "*しかし これいじょう"
.byte   newLine
kanafix "ものを もてない。"
.byte   newLine
.byte   stopText

MSG_PRESENT_EMPTY:
kanafix "*しかし からっぽだった。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_MENU:
kanafix "  ドクをけす  やわらかくする"
.byte   stopText

.byte   newLine
.byte   stopText

MSG_CANARY_SIGN:
kanafix "「みなみ.マザ-ズデイ"
.byte   newLine
kanafix " きた .シュ-クリ-ム"
.byte   newLine
kanafix "        どうぶつえん」"
.byte   newLine
.byte   stopText

MSG_PODUNK_CANARYSIGN:
kanafix "「このおく カナリアむら。"
.byte   newLine
kanafix " しぜんを たいせつにしよう!」"
.byte   newLine
.byte   stopText

MSG_PODUNK_CITYHALLSIGN:
kanafix "「マザ-ズデイ まちやくば」"
.byte   newLine
.byte   stopText

MSG_ELLAY_RESIDENTIALSIGN:
kanafix "「にし.うみのてんぼうだい"
.byte   newLine
kanafix " きた.バレンタインみなと"
.byte   newLine
kanafix "       うみをきれいに!」"
.byte   newLine
.byte   stopText
MSG_ELLAY_RESIDENTIALSIGN2:
kanafix "「にし .バレンタイン"
.byte   newLine
kanafix " ひがし.ホ-リ-ロ-リ-"
.byte   newLine
kanafix "          マウンテン」"
.byte   newLine
.byte   stopText

MSG_PODUNK_GRAVESIGN:
kanafix "「にし    .ヒ-ラ-のいえ"
.byte   newLine
kanafix " はしのむこう.はかば"
.byte   newLine
kanafix "    ひとりあるき きけん!」"
.byte   newLine
.byte   stopText

MSG_PODUNK_MERRYSIGN:
kanafix "「にし .マザ-ズデイ"
.byte   newLine
kanafix " ひがし.サンクスギビング」"
.byte   newLine
.byte   stopText

MSG_PODUNK_ZOOSIGN:
kanafix "「シュ-クリ-ムどうぶつえんは"
.byte   newLine
kanafix "    にしに 700メ-トル」"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_SIGN:
kanafix "「スノ-マンきょうかい このおく」"
.byte   newLine
.byte   stopText

MSG_ELLAY_INTROSIGN:
kanafix "「にし .バレンタイン"
.byte   newLine
kanafix " みなみ.しっちたい」"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_SCHOOLSIGN:
kanafix "「サンクスギビングおおどおり"
.byte   newLine
kanafix " みなみ.ティンクル"
.byte   newLine
kanafix "        しょうがっこう」"
.byte   newLine
.byte   stopText

MSG_MYHOME_SIGN:
kanafix "「"
.byte   nintenName
kanafix " の いえ」"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_SIGN:
kanafix "「サンクスギビングへ ようこそ!"
.byte   newLine
kanafix " にし.マザ-ズデイ"
.byte   newLine
kanafix " きた.サンタクロ-スえき」"
.byte   newLine
.byte   stopText

MSG_REINDEER_SIGN:
kanafix "「にし .ヒ-ラ-のいえ"
.byte   newLine
kanafix " ひがし.レインディアえき"
.byte   newLine
kanafix " みなみ.レインディアのまち」"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_SIGN:
kanafix "「にし .ハロウィ-ンダウンタウン"
.byte   newLine
kanafix " ひがし.ハロウィ-ン"
.byte   newLine
kanafix "         じゅうたくち」"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_SIGN:
kanafix "「ひがし.しっちたい」"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_MANSIONSIGN:
kanafix "「このさき"
.byte   newLine
kanafix " ロ-ズマリ-さんの しゆうち」"
.byte   newLine
.byte   stopText

MSG_ELLAY_JAILSIGN:
kanafix "「バレンタイン けいさつしょ」"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_DUNCANSIGN:
kanafix "「ストリップげきじょう"
.byte   newLine
kanafix "      けんせつよていち"
.byte   newLine
kanafix "   ダンカンけんせつがいしゃ」"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMAN_REPLACE:
kanafix "*アニハ ウツクシク"
.byte   newLine
kanafix "タオレタト キキマス。"
.byte   newLine
.byte   pauseText
kanafix "*ハカヲ タテテ"
.byte   newLine
kanafix "テアツク トムライマシタ。"
.byte   newLine
.byte   pauseText
kanafix "*ツギハ ワタシノ バンデス。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMAN_SERVE:
kanafix "*ワタシモ ハヤク"
.byte   newLine
kanafix "アナタノ オテツダイガ シタイ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FLYINGMAN_INTRO:
kanafix "*ワタシハ ふらいんぐまん。"
.byte   newLine
kanafix "アナタノ チカラニナル。"
.byte   newLine
kanafix "ソノタメニ ウマレテキタ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAGICOP2_LIFTED2:
kanafix "*かいげんれいは とかれた。"
.byte   newLine
kanafix "ちょっと おおげさだったけどな。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWER_ROCKETCHECK:
kanafix "*ふるぼけた ロケットだ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_PIPPI_GOODS:
kanafix "*グッズを とりにきたのね。"
.byte   newLine
kanafix "はい どうぞ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_NOGOODS:
kanafix "*グッズは ぜんぶわたしたわよ。"
.byte   newLine
kanafix "でも また あいにきてね。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE:
kanafix "*わたし ミニ-よ。"
.byte   newLine
.byte   stopText


MSG_HEALER_MENU:
kanafix "  きをいれる  やわらかくする"
.byte   stopText

.byte   newLine
.byte   stopText

MSG_MTITOI_TEDDY_CALL:
kanafix "*"
.byte   teddyName
kanafix " "
.byte   newLine
kanafix "「おまえら"
.byte   newLine
kanafix "ふたりで いたいんだろう。"
.byte   newLine
.byte   pauseText
kanafix "おれ ここで ねてるわ。」"
.byte   newLine
.byte   stopText

MSG_MTITOI_LLOYDSAVE:
kanafix "*しまった! まにあわなかった。"
.byte   newLine
.byte   stopText

MSG_MTITOI_ANALOVE_YES:
kanafix "*‥‥よかった。"
.byte   newLine
.byte   stopText

MSG_MTITOI_TEDDYLEAVE:
kanafix "*"
.byte   teddyName
kanafix " "
.byte   newLine
kanafix "「おい! なんか"
.byte   newLine
kanafix "とんでもないおとが したぜ。」"
.byte   newLine
.byte   stopText

MSG_MTITOI_TEDDYLEAVE2:
kanafix "*"
.byte   teddyName
kanafix " "
.byte   newLine
kanafix "「ほ-んとかよ!?」"
.byte   newLine
.byte   stopText

MSG_MTITOI_BOAT:
kanafix "*ボ-トは"
.byte   newLine
kanafix "エンジンの ちょうしが"
.byte   newLine
kanafix "わるいようだ。"
.byte   newLine
.byte   stopText

MSG_MTITOI_BOAT_NOFIX:
kanafix "*"
.byte   partyLead
kanafix "には"
.byte   newLine
kanafix "うごかすことが できない。"
.byte   newLine
.byte   stopText

MSG_MTITOI_BOAT_FIX:
kanafix "*しかし "
.byte   lloydName
kanafix "は"
.byte   newLine
kanafix "じょうずに エンジンを"
.byte   newLine
kanafix "かけることが できた。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_SEND:
kanafix "*"
.byte   item
kanafix "ですね。"
.byte   newLine
kanafix "ちゃんと "
.byte   nintenName
kanafix "さんの"
.byte   newLine
kanafix "うちへ おくっておきますね。"
.byte   newLine
.byte   pauseText
kanafix "*ほかに あずかるものは"
.byte   newLine
kanafix "ありますか?"
.byte   newLine
.byte   stopText

kanafix "*こんな せまいなかに"
.byte   newLine
kanafix "とじこめられて‥‥"
.byte   newLine
kanafix "これから どうなるんだろう。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_SWEETSSIGN:
kanafix "「スイ-トリトル こうじょう」"
.byte   newLine
.byte   stopText

MSG_MTITOI_GIEGUEPRISON_GUY2:
kanafix "*やまのうえの"
.byte   newLine
kanafix "マザ-シップに つれていかれて"
.byte   newLine
kanafix "きがついたら こんなことに‥‥"
.byte   newLine
.byte   pauseText
kanafix "*なんとかしてくれ!"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PHONE_CHECK:
kanafix "*スペルの まちがいは ないですね?"
.byte   newLine
.byte   stopText

MSG_ZOO_WIN:
kanafix "*どうぶつたちを くるわせていた"
.byte   newLine
kanafix "あやしいおとは きえた。"
.byte   newLine
kanafix "どうぶつえんは あんぜんになった。"
.byte   newLine
.byte   stopText

MSG_YUCCA_PILOT_TANKRIDE:
kanafix "*だいじな せんしゃだからな。"
.byte   newLine
kanafix "こわさんようにな。"
.byte   newLine
.byte   stopText

MSG_MYHOME_DOG_CHECK:
kanafix "*いぬの くびわには"
.byte   newLine
kanafix "ちかしつのカギが さがっていた。"
.byte   newLine
.byte   stopText

MSG_PODUNK_NOISYMOUSE:
kanafix "*へっへっへ あっしは"
.byte   newLine
kanafix "おせっかいな ねずみです。"
.byte   newLine
.byte   pauseText
kanafix "*まちの いえには"
.byte   newLine
kanafix "はいれる いえと"
.byte   newLine
kanafix "はいれない いえが あります。"
.byte   newLine
.byte   pauseText
kanafix "*まるいドアと かんばんのあるドアは"
.byte   newLine
kanafix "はいれる いえ。"
.byte   newLine
.byte   pauseText
kanafix "*あとは はいろうとしても"
.byte   newLine
kanafix "あたまを ぶつけるだけでさぁ。"
.byte   newLine
.byte   pauseText
kanafix "*さいなら。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_BABY_AFTER:
kanafix "*テレポ-テ-ションを"
.byte   newLine
kanafix "おもちゃに するんじゃないぞ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA4:
kanafix "*ほんとうの こどものように"
.byte   newLine
kanafix "かわいがったのに‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA5:
kanafix "*しっぽを ふってた"
.byte   newLine
kanafix "あかちゃんだった‥‥"
.byte   newLine
kanafix "こもりうたを‥‥でも‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA6:
kanafix "*ああ ジョ-ジ!"
.byte   newLine
kanafix "あなたの つま マリアです。"
.byte   newLine
.byte   pauseText
kanafix "*あなたのまつ てんごくに"
.byte   newLine
kanafix "わたしも いまから むかいます‥‥"
.byte   newLine
.byte   stopText

MSG_ATM_INSERT_CASHCARD:
kanafix "*キャッシュカ-ドヲ イレテクダサイ"
.byte   newLine
.byte   stopText

MSG_ATM_TOO_MUCH_CASH:
kanafix "*そんなに げんきんを"
.byte   newLine
kanafix "もちあるいては いけない。"
.byte   newLine
.byte   stopText

MSG_GAMEOVER_SAVEDATA:
kanafix "*このまえの"
.byte   newLine
kanafix "セ-ブデ-タまで もどるが"
.byte   newLine
kanafix "それで よいのか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_NOHAVE:
kanafix "*「はい」って いったのに"
.byte   newLine
kanafix "もってないじゃないか。"
.byte   newLine
kanafix "アハハハハ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TEDDY_TEDDYBED:
kanafix "*こきゅうが みだれて"
.byte   newLine
kanafix "くるしそうだ。"
.byte   newLine
.byte   stopText

MSG_GIVE_CANT:
kanafix "*まだ グッズをわたせる"
.byte   newLine
kanafix "なかまが いない。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_GIVE:
kanafix "*"
.byte   item
kanafix "ですね。"
.byte   newLine
kanafix "たしかに おわたししましたよ。"
.byte   newLine
.byte   pauseText
kanafix "*ほかに もっていくものは"
.byte   newLine
kanafix "ありますか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_SOMEONEELSE:
kanafix "*もちきれない みたいだけど"
.byte   newLine
kanafix "ほかのひとに わたしますか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER_FULL:
kanafix "*そうこが いっぱいです。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIAFADE:
kanafix "*クイ-ンマリ-は"
.byte   newLine
.byte   nintenName
kanafix "に かたりおえると"
.byte   newLine
kanafix "かぜのなかに きえていった。"
.byte   newLine
.byte   pauseText
kanafix "*そして マジカントのくにも"
.byte   newLine
kanafix "また あとかたもなく"
.byte   newLine
kanafix "かききえた。"
.byte   newLine
.byte   pauseText
kanafix "*マジカントのくに とは"
.byte   newLine
kanafix "マリ-のいしきが うみだした"
.byte   newLine
kanafix "まぼろしだったのだ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA_INTRO:
kanafix "*わたしが"
.byte   newLine
kanafix "あなた"
.byte   unk4
kanafix "を よんだのです。"
.byte   newLine
.byte   pauseText
kanafix "*"
.byte   nintenName
kanafix "!"
.byte   newLine
.byte   anaName
kanafix "!"
.byte   newLine
.byte   lloydName
kanafix "!"
.byte   newLine
.byte   teddyName
kanafix "!"
.byte   newLine
.byte   pauseText
kanafix "*そして すべての"
.byte   newLine
kanafix "ゆうきある こどもたち。"
.byte   newLine
.byte   pauseText
kanafix "*いまが そのときです!"
.byte   newLine
.byte   stopText

MSG_MAGICANT_VENDORINTRO:
kanafix "*し-っ! わたくしどもも"
.byte   newLine
kanafix "あなた"
.byte   unk4
kanafix "と おなじように"
.byte   newLine
kanafix "あっちの せかいの にんげんです。"
.byte   newLine
.byte   pauseText
kanafix "*おかねさえ いただければ"
.byte   newLine
kanafix "マジカントの すばらしいおみやげを"
.byte   newLine
kanafix "わけて さしあげますよ。"
.byte   newLine
.byte   pauseText
kanafix "*ヒッヒッヒ。"
.byte   newLine
.byte   stopText

.byte   stopText

.byte   stopText

MSG_GOODS_GIVESELF:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
kanafix "わたすのを やめた。"
.byte   newLine
.byte   stopText

MSG_GOODS_GIVE:
kanafix "*"
.byte   user
kanafix "は "
.byte   result
kanafix "に"
.byte   newLine
.byte   recipient
kanafix "を あたえた。"
.byte   newLine
.byte   stopText

MSG_GOODS_HANDOFF:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   result
kanafix "の バッグに"
.byte   newLine
.byte   recipient
kanafix "を いれた。"
.byte   newLine
.byte   stopText

MSG_GOODS_TAKEFROM:
kanafix "*"
.byte   result
kanafix "は"
.byte   newLine
.byte   user
kanafix "の バッグから"
.byte   newLine
.byte   recipient
kanafix "を だした。"
.byte   newLine
.byte   stopText

MSG_GOODS_TAKENTHROW:
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
.byte   user
kanafix "の バッグから"
.byte   newLine
.byte   recipient
kanafix "を すてた。"
.byte   newLine
.byte   stopText

MSG_GOODS_MOVE:
kanafix "*"
.byte   partyLead
kanafix "は"
.byte   newLine
.byte   user
kanafix "の バッグから"
.byte   newLine
.byte   recipient
kanafix "を だして"
.byte   newLine
.byte   pauseText
.byte   result
kanafix "の バッグに いれた。"
.byte   newLine
.byte   stopText

MSG_ITEM_EAT:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を たべた。"
.byte   newLine
.byte   stopText

MSG_ITEM_DRINK:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "を のんだ。"
.byte   newLine
.byte   stopText

MSG_ITEM_RECOVER:
.byte   price
kanafix " かいふくした。"
.byte   newLine
.byte   stopText

MSG_ITEM_INCREASE:
.byte   price
kanafix " あがった。"
.byte   newLine
.byte   stopText

MSG_HP_IS:
kanafix "*"
.byte   user
kanafix "の HPは"
.byte   newLine
.byte   stopText

MSG_PP_IS:
kanafix "*"
.byte   user
kanafix "の PPは"
.byte   newLine
.byte   stopText

MSG_FIGHT_IS:
kanafix "*"
.byte   user
kanafix "の ファイトは"
.byte   newLine
.byte   stopText

MSG_SPEED_IS:
kanafix "*"
.byte   user
kanafix "の スピ-ドは"
.byte   newLine
.byte   stopText

MSG_WISDOM_IS:
kanafix "*"
.byte   user
kanafix "の かしこさは"
.byte   newLine
.byte   stopText

MSG_STRENGTH_IS:
kanafix "*"
.byte   user
kanafix "の たいりょくは"
.byte   newLine
.byte   stopText

MSG_FORCE_IS:
kanafix "*"
.byte   user
kanafix "の フォ-スは"
.byte   newLine
.byte   stopText

MSG_USEBIGBAG:
kanafix "*"
.byte   user
kanafix "は でかぶくろから"
.byte   newLine
kanafix "マジックハ-ブを とりだして"
.byte   newLine
kanafix "つかった。"
.byte   newLine
.byte   stopText

MSG_USEBREAD:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
kanafix "パンを ちぎって"
.byte   newLine
kanafix "まきながら あるきだした。"
.byte   newLine
.byte   stopText

MSG_USEBREAD_FAIL:
kanafix "*ふるいパンくずを"
.byte   newLine
kanafix "すててからでないと"
.byte   newLine
kanafix "パンは つかえない。"
.byte   newLine
.byte   stopText

MSG_USECRUMBS:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "パンくずを たどりながら"
.byte   newLine
kanafix "もとのばしょに もどった。"
.byte   newLine
.byte   stopText

MSG_USERIBBON:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
kanafix "かみに リボンを つけた。"
.byte   newLine
.byte   stopText

MSG_USEFINALWEAPON:
kanafix "*「でんげんを きってしまえ!」"
.byte   newLine
.byte   stopText

MSG_USERULER:
kanafix "*いろいろなものの"
.byte   newLine
kanafix "ながさが わかった。"
.byte   newLine
.byte   stopText

MSG_BIGBAG_EMPTY:
kanafix "*でかぶくろは からになって"
.byte   newLine
kanafix "かききえてしまった。"
.byte   newLine
.byte   stopText

MSG_PAYPHONE_CARDEXPIRE:
kanafix "*テレホンカ-ドを"
.byte   newLine
kanafix "つかいきってしまった。"
.byte   newLine
.byte   stopText

MSG_CURE_POISON:
kanafix "*"
.byte   user
kanafix "の からだから"
.byte   newLine
kanafix "どくが ぬけた。"
.byte   newLine
.byte   stopText

MSG_CURE_COLD:
kanafix "*"
.byte   user
kanafix "のカゼが なおった。"
.byte   newLine
.byte   stopText

MSG_ITEM_PSISTONE:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
kanafix "サイパワ-スト-ンをにぎりしめた。"
.byte   newLine
.byte   stopText

MSG_ITEM_PSISTONE_USEDUP:
kanafix "*サイパワ-スト-ンは"
.byte   newLine
kanafix "ただの いしころに なった。"
.byte   newLine
.byte   stopText

MSG_PSI_TRIED:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
.byte   recipient
kanafix "をこころみた。"
.byte   newLine
.byte   stopText

MSG_PSI_NOPP:
kanafix "*それを こころみるだけの"
.byte   newLine
kanafix "パワ-は のこっていない。"
.byte   newLine
.byte   stopText

MSG_PSI_REVIVE:
kanafix "*"
.byte   user
kanafix "は カムバックした。"
.byte   newLine
.byte   stopText

MSG_USEDIARY:
kanafix "*にっきは ほとんど"
.byte   newLine
kanafix "よみとれなかったが かろうじて"
.byte   newLine
.byte   pauseText
kanafix "*「あいことば‥‥"
.byte   newLine
kanafix "かみのしっぽは どこにある。"
.byte   newLine
kanafix "あまかけるふねの わすれもの」"
.byte   newLine
.byte   pauseText
kanafix "と よめた。"
.byte   newLine
.byte   stopText

MSG_CURE_PETRIFY:
kanafix "*"
.byte   result
kanafix "は"
.byte   newLine
kanafix "すっかり やわらかくなった。"
.byte   newLine
.byte   stopText

MSG_USEOCARINA:
kanafix "*きぼうのオカリナを ふいた。"
.byte   newLine
.byte   stopText
MSG_USEOCARINA2:
kanafix "*「きこえたかい?」"
.byte   newLine
.byte   stopText

MSG_USEMAP_FAIL:
kanafix "*このばしょは"
.byte   newLine
kanafix "ちずに のっていない。"
.byte   newLine
.byte   stopText

MSG_USEMAP:
kanafix "*"
.byte   user
kanafix "は"
.byte   newLine
kanafix "ちずを しらべた。"
.byte   newLine
.byte   stopText

MSG_PSI_NOTELEPORT:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "なにかの ちからに"
.byte   newLine
kanafix "おしとどめられて しまった。"
.byte   newLine
.byte   stopText

.byte   stopText
