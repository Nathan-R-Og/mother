.segment        "PRG19": absolute

.byte 0

MSG_MERRYSVILLE_HOSPITALDOCTOR:
kanafix "*まずマネ-をみせてください。"
.byte   newLine
kanafix "ちりょうは それからです。"
.byte   newLine
.byte   pauseText
kanafix "*みせないなら"
.byte   newLine
kanafix "こちらから きんがくを いいます。"
.byte   newLine
.byte   pauseText
kanafix "*"
.byte   price
kanafix "ドルで"
.byte   newLine
kanafix "あなた"
.byte   unk4
kanafix "はなおる。"
.byte   newLine
.byte   pauseText
kanafix "*これ あかじ かくごの"
.byte   newLine
kanafix "しゅっけつサ-ビスです。"
.byte   newLine
kanafix "OK?"
.byte   newLine
.byte   stopText
MSG_MERRYSVILLE_HOSPITALDOCTOR_ACCEPT:
kanafix "*はい。 たしかに"
.byte   price
kanafix "ドル。"
.byte   newLine
.byte   pauseText
kanafix "*はい もうなおりました。"
.byte   newLine
.byte   pauseText
kanafix "*また おおけがを"
.byte   newLine
kanafix "してきてくださいね。"
.byte   newLine
kanafix "やすくしとくから。"
.byte   newLine
.byte   stopText
MSG_MERRYSVILLE_HOSPITALDOCTOR_DECLINE:
kanafix "*そうですか。 しんでしまいなさい。"
.byte   newLine
kanafix "そうぎやにでも"
.byte   newLine
kanafix "でんわしときましょう。"
.byte   newLine
.byte   stopText

MSG_PODUNK_MERRYCOP:
kanafix "*かいげんれいが とかれるまで"
.byte   newLine
kanafix "この はしを とおすなと"
.byte   newLine
.byte   pauseText
kanafix "*ちょうちょうさんから"
.byte   newLine
kanafix "めいれいされているのだ。"
.byte   newLine
.byte   pauseText
kanafix "*どうぶつえんの ひがしの はしを"
.byte   newLine
kanafix "とおりなさい。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_COP:
kanafix "*きみ がっこうは どうしたの。"
.byte   newLine
kanafix "きょうは おやすみじゃないはずよ。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_DUNCANGUY:
kanafix "*きたの ダンカンこうじょうから"
.byte   newLine
kanafix "バッテリ-を かっぱらってきた。"
.byte   newLine
.byte   stopText

MSG_DUNCANFACTORY_DOG:
kanafix "*このこうじょうは"
.byte   newLine
kanafix "ダンカンさんの もちものです。"
.byte   newLine
.byte   pauseText
kanafix "*つうこうきょかしょうは"
.byte   newLine
kanafix "もっていますか?"
.byte   newLine
.byte   stopText
MSG_DUNCANFACTORY_DOG_PASS:
kanafix "*こりゃ"
.byte   newLine
kanafix "きげんぎれですぜ おにいさん。"
.byte   newLine
kanafix "ひろったものだな。"
.byte   newLine
.byte   pauseText
kanafix "*あやしいやつ‥‥"
.byte   newLine
.byte   pauseText
kanafix "*おれの めを みろ!!"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_BEATUPGUY:
kanafix "*すげぇ ばけものに"
.byte   newLine
kanafix "やられちまった。"
.byte   newLine
.byte   pauseText
kanafix "*えきにいくなら"
.byte   newLine
kanafix "かくごしたほうが いいぜ。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_CURFEWGUY:
kanafix "*マザ-ズデイの まちの"
.byte   newLine
kanafix "かいげんれいは"
.byte   newLine
kanafix "とかれたんだってな。"
.byte   newLine
.byte   pauseText
kanafix "*ってことは あのはしも"
.byte   newLine
kanafix "とおれるように なったってことだ。"
.byte   newLine
kanafix "ドゥ ユ- アンダスタン?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY:
kanafix "*よわむし"
.byte   lloydName
kanafix "のやつを"
.byte   newLine
kanafix "いじめてたんだけど"
.byte   newLine
kanafix "にげられちまった。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY_LLOYD:
kanafix "*おい "
.byte   lloydName
kanafix "‥‥"
.byte   newLine
kanafix "よわむしけむし!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY2:
kanafix "*よわむし"
.byte   lloydName
kanafix "のやつを"
.byte   newLine
kanafix "いじめてたんですよね せんぱい。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_NO_CURE:
kanafix "*なんだ ひやかしか!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDEXPLOSIVES:
kanafix "*"
.byte   lloydName
kanafix "ったら ばくやくを"
.byte   newLine
kanafix "もちだしちゃったらしいの。"
.byte   newLine
.byte   pauseText
kanafix "*せんせいに みつかったら"
.byte   newLine
kanafix "たいへんだわ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_GLASSESSLIPPED:
kanafix "*"
.byte   lloydName
kanafix " "
.byte   newLine
kanafix "めがねが ずれてるわよ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SUZY:
kanafix "*あたし ス-ジ-。"
.byte   newLine
kanafix "ミス.いなかまちにえらばれたのよ。"
.byte   newLine
kanafix "きれい?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SUZY_YES:
kanafix "*あなたも すてきよ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SUZY_NO:
kanafix "*あなたのほうが ブス!"
.byte   newLine
kanafix "うすのろぶたって かんじよ!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_GAMEBOYKID:
kanafix "*おくじょうのドアが"
.byte   newLine
kanafix "しまっててよぉ。"
.byte   newLine
.byte   pauseText
kanafix "*トランジスタラジオでも"
.byte   newLine
kanafix "ききながら"
.byte   newLine
.byte   pauseText
kanafix "*タバコすおうと"
.byte   newLine
kanafix "おもってたのによぉ なっ?!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_GAMEBOYKID2:
kanafix "*むくちな やつ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SITUPSKID:
kanafix "*たいいくの せんこうに"
.byte   newLine
kanafix "またなぐられた。"
.byte   newLine
.byte   pauseText
kanafix "*ふりょうに なっちまおうかなぁ"
.byte   newLine
kanafix "‥‥おれ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_BAFFLEDKID:
kanafix "*じぶんのがっこうで"
.byte   newLine
kanafix "まいごになるなんて"
.byte   newLine
kanafix "‥‥ほんとに もうっ!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITOR1:
kanafix "*おくじょうのドアが"
.byte   newLine
kanafix "あかないって いうのか。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITOR3:
kanafix "*ぶくぶくふとるばっかしでよ。"
.byte   newLine
kanafix "ひでぇおんなだろ?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITORNOTHORRIBLE:
kanafix "*こどもにゃ わからねぇ。"
.byte   newLine
kanafix "じんせいのかなしみは‥‥"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITOR_WIFE:
kanafix "*おまえに うちのにょうぼうのことを"
.byte   newLine
kanafix "そんなふうにいわれる すじあいは"
.byte   newLine
kanafix "ないね。 でてってくれ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITOR4:
kanafix "*わかいときゃ かわいかったんだ。"
.byte   newLine
kanafix "そうさ いいところもあるんだよ。"
.byte   newLine
.byte   pauseText
kanafix "*ま おちゃでものんでくかい?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITOR5:
kanafix "*はなしのわかるこどもだな。"
.byte   newLine
kanafix "あ おくじょうに"
.byte   newLine
kanafix "いきたいんだっけな。"
.byte   newLine
.byte   pauseText
kanafix "*じゃ ついておいで。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANTIORNOTEA:
kanafix "*としよりを だいじにしないと"
.byte   newLine
kanafix "おとなになって なきをみるぞ。"
.byte   newLine
.byte   stopText

kanafix "*なんだ"
.byte   newLine
kanafix "こんなあぶないものを もって。"
.byte   newLine
kanafix "これは あずかっておくぞ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_JANITOR_TEA:
kanafix "*ま おちゃを のみなって。"
.byte   newLine
kanafix "なッ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_HALLMONITOR:
kanafix "*ろうかを はしるんじゃ"
.byte   newLine
kanafix "ありませんよ!"
.byte   newLine
.byte   stopText

MSG_TWINKLE_HALLMONITOR2:
kanafix "*コラッ みかけないこどもだな。"
.byte   newLine
kanafix "このがっこうの せいとか?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_HALLMONITOR2_YES:
kanafix "*そうか ろうかをはしるなよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHCOP_SEEWEAPON:
kanafix "*もちものを みせてみろ。"
.byte   newLine
.byte   pauseText
kanafix "*あぶないものは"
.byte   newLine
kanafix "もっていないだろうな。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_TRASHLLOYD1:
kanafix "*きみは だれだ!"
.byte   newLine
kanafix "ぼくは ここからでないぞ。"
.byte   newLine
.byte   pauseText
kanafix "*でたら きっと"
.byte   newLine
kanafix "いじめられるんだから。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_TRASHLLOYD2:
kanafix "*ぼくが"
.byte   newLine
kanafix "だいじなともだちだって!?"
.byte   newLine
.byte   pauseText
kanafix "*じゃあ りかしつから ばくやくを"
.byte   newLine
kanafix "もちだしたことを"
.byte   newLine
kanafix "だまっててくれるか?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_TRASHLLOYD_YES:
kanafix "*いま でる。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYD_INTRODUCTION:
kanafix "*ぼく "
.byte   lloydName
kanafix "。"
.byte   newLine
kanafix "スイ-トリトルこうじょうで"
.byte   newLine
kanafix "つくってたっていう"
.byte   newLine
.byte   pauseText
kanafix "ペンシルロケットを"
.byte   newLine
kanafix "とばして みたくてさ。"
.byte   newLine
.byte   stopText

MSG_SWAMP_HOUSEPIPPI_REST:
kanafix "*つかれてるでしょ。"
.byte   newLine
kanafix "とまっていけば?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDGETROCKET:
kanafix "*わぁっ"
.byte   newLine
kanafix "これが あの うわさの"
.byte   newLine
kanafix "ペンシルロケットか。 "
.byte   newLine
.byte   pauseText
kanafix "*これなら おなじものを"
.byte   newLine
kanafix "つくれるかもしれないぞ。"
.byte   newLine
.byte   pauseText
kanafix "*りかしつに きてくれ。"
.byte   newLine
.byte   stopText

MSG_DUNCANFACTORY_USEROCKET:
kanafix "*"
.byte   lloydName
kanafix " "
.byte   newLine
kanafix "「いいぞ!"
.byte   newLine
kanafix "よし このスイッチを オンだな。"
.byte   newLine
kanafix "‥‥きっと。 あっ。」"
.byte   newLine
.byte   stopText

MSG_ELLAY_LLOYD_TEDDYBED:
kanafix "*"
.byte   lloydName
kanafix " "
.byte   newLine
kanafix "「こんどこそ よわむしのぼくが"
.byte   newLine
kanafix "たたかう ばんだ。"
.byte   newLine
.byte   pauseText
.byte   teddyName
kanafix "! きみは"
.byte   newLine
kanafix "ここで やすんでいてくれ。」"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_INTRO:
kanafix "*わしは じぶんでもわかっておるが"
.byte   newLine
kanafix "このがっこうに かくれすんでいる"
.byte   newLine
kanafix "かわりもののせんせいだ。"
.byte   newLine
.byte   pauseText
kanafix "*けんきゅうひが ほしい。"
.byte   newLine
kanafix "わしの はつめいを"
.byte   newLine
kanafix "かってくれんか?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_AGREE:
kanafix "*じゃ メニュ-をみてくれ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_DECLINE:
kanafix "*おとしだまくらい もってるだろう。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_GOODBYE:
kanafix "*また いつでも きてくれ。"
.byte   newLine
kanafix "いいものをつくっておくからな。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_NOPROGRESS:
kanafix "*あれから はつめいが"
.byte   newLine
kanafix "すすんどらんのだよ。"
.byte   newLine
kanafix "むかしの メニュ-をみるか?"
.byte   newLine
.byte   stopText

MSG_TRAINGUARDIAN:
kanafix "*さっき ラジオで きいたんだけど"
.byte   newLine
kanafix "あっちもこっちも パニックらしい。"
.byte   newLine
kanafix "このえきだけは おいらがまもるぞ。"
.byte   newLine
.byte   stopText

MSG_TRAIN1:
kanafix "*きしゃが どこまで はしれるかは"
.byte   newLine
kanafix "ほしょうできないけど うんちんは"
.byte   newLine
kanafix "とるよ。"
.byte   newLine
.byte   pauseText
kanafix "*きしゃにのるかい?"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHCOP_TAKEWEAPON:
kanafix "*("
.byte   partyLead
kanafix "は"
.byte   newLine
kanafix "ぶきを とりあげられた。)"
.byte   newLine
.byte   stopText

MSG_TRAIN_ACCEPT:
kanafix "*じゃ "
.byte   price
kanafix "ドルになります。"
.byte   newLine
.byte   stopText

MSG_REINDEER_NOSEYGUY_HAT:
kanafix "*きみの もってる ぼうしは"
.byte   newLine
.byte   pauseText
kanafix "スノ-マンのまちの"
.byte   newLine
.byte   anaName
kanafix "ちゃんの"
.byte   newLine
kanafix "わすれものらしいね。"
.byte   newLine
.byte   pauseText
kanafix "*とどけてあげたまえ。"
.byte   newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHGUY_LEAVE:
kanafix "*ながいき しなされ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_TRAINDAD:
kanafix "*にょうぼうを さがしに"
.byte   newLine
kanafix "イ-スタ-の まちに いく"
.byte   newLine
kanafix "ところだよ"
.byte   newLine
.byte   pauseText
kanafix "*でも せんろが こわれたとかで"
.byte   newLine
kanafix "おてあげなんだ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_NOSEYGUY:
kanafix "*ちいさなおせっかいが ゲ-ムを"
.byte   newLine
kanafix "おもしろくするコツですな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_5:
kanafix "*はい あげる。"
.byte   newLine
.byte   stopText

MSG_REINDEER_COP1:
kanafix "*ペテンひげをはやしたおとこを"
.byte   newLine
kanafix "みかけたか?"
.byte   newLine
.byte   stopText
MSG_REINDEER_COP1_ACCEPT:
kanafix "*にげられたようだな。"
.byte   newLine
kanafix "あきらめて ちゅうしゃいはんでも"
.byte   newLine
kanafix "つかまえよう。"
.byte   newLine
.byte   stopText
MSG_REINDEER_COP1_DECLINE:
kanafix "*とんでもない サギしなんだ。"
.byte   newLine
kanafix "みかけたらおしえてくれ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_MONEYGUY:
kanafix "*おっと ぼうず このかねを"
.byte   newLine
kanafix "あずかってくれ。"
.byte   newLine
.byte   pauseText
kanafix "*おまわりに あってもしらんぷり"
.byte   newLine
kanafix "するんだぞ。"
.byte   newLine
.byte   stopText
MSG_REINDEER_MONEYGUY_ACCEPT:
kanafix "*もちにげするなよ!"
.byte   newLine
.byte   stopText
MSG_REINDEER_MONEYGUY_DECLINE:
kanafix "*さからうんじゃねえ!"
.byte   newLine
.byte   stopText
MSG_REINDEER_MONEYGUY_AFTER:
kanafix "*ひとが ひっしでにげてるときに"
.byte   newLine
kanafix "はなしかけるんじゃないよッ!"
.byte   newLine
.byte   stopText

MSG_REINDEER_COP2:
kanafix "*すごく はらのでた おとこを"
.byte   newLine
kanafix "みたか?"
.byte   newLine
.byte   stopText
MSG_REINDEER_COP2_ACCEPT:
kanafix "*にげられたようだな。"
.byte   newLine
kanafix "あきらめてスピ-ドいはんでも"
.byte   newLine
kanafix "つかまえよう。"
.byte   newLine
.byte   stopText
MSG_REINDEER_COP2_DECLINE:
kanafix "*"
.byte   favFood
kanafix "を 5にんまえも"
.byte   newLine
kanafix "くいにげしたんだ。"
.byte   newLine
kanafix "みかけたらおしえてくれ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_FULLGIRL:
kanafix "*ああ はらがきつい。 ゲ-ップ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_ELLAYGUY:
kanafix "*このまちも"
.byte   newLine
kanafix "ぶっそうになったもんだ。"
.byte   newLine
.byte   pauseText
kanafix "*だけど バレンタインのまちよりは"
.byte   newLine
kanafix "ましだよ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_SINGINGGUY:
kanafix "*オ- イエ-ッ! のってるかい?"
.byte   newLine
.byte   stopText
MSG_REINDEER_SINGINGGUY_ACCEPT:
kanafix "*イエイッ! おいらのうたを"
.byte   newLine
kanafix "ききたいかい?"
.byte   newLine
.byte   stopText
MSG_REINDEER_SINGINGGUY_DECLINE:
kanafix "*おいらは じてんしゃにのってるぜ。"
.byte   newLine
.byte   stopText
MSG_REINDEER_SINGINGGUY_DECLINE2:
kanafix "*もう おわかれのじかんに"
.byte   newLine
kanafix "なっちまうのかい‥‥"
.byte   newLine
.byte   stopText

MSG_REINDEER_DRAGONGIRL:
kanafix "*ドラゴンの こもりうた きいた?"
.byte   newLine
.byte   stopText

MSG_REINDEER_SPOOKANEGIRL:
kanafix "*ハロウィ-ンのまちのどこかに‥‥"
.byte   newLine
.byte   pauseText
kanafix "*ゆ"
.byte   newLine
.byte   pauseText
kanafix "*ゆっ"
.byte   newLine
.byte   pauseText
kanafix "*ゆゆゆゆ"
.byte   newLine
.byte   pauseText
kanafix "*ゆうれいやしきが あるそうよ。"
.byte   newLine
kanafix "ぜったいに いかないほうがいいわ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_FLEABAGGIRL:
kanafix "*なんでもいいから ものをくれ。"
.byte   newLine
.byte   pauseText
kanafix "*くれ。"
.byte   newLine
.byte   pauseText
kanafix "*ください。"
.byte   newLine
.byte   pauseText
kanafix "*くれますか?"
.byte   newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL2:
kanafix "*おれいは ぜひ させてもらうよ。"
.byte   newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL_DECLINE:
kanafix "*いいものを あげるんだけどなぁ。"
.byte   newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL_ACCEPT:
kanafix "*なにをくれるね?"
.byte   newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL_GIVE:
kanafix "*ありがとうよ。 これはおれいの"
.byte   newLine
kanafix "ノミとシラミだ。"
.byte   newLine
kanafix "もっていってくれ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_FLUGUY:
kanafix "*カゼが はやってて‥‥"
.byte   newLine
kanafix "ハ-ックショ-イ!"
.byte   newLine
kanafix "んちくしょおっ!"
.byte   newLine
.byte   stopText

MSG_REINDEER_RUMORMWGUY:
kanafix "*やまのなかに‥‥"
.byte   newLine
.byte   pauseText
kanafix "*かぜひとつひかずに"
.byte   newLine
kanafix "300ねん いきてるっていう"
.byte   newLine
kanafix "よげんしゃのじいさんがいるらしい。"
.byte   newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHGUY_DENTURELESS:
kanafix "*ひひぇひゃひょ ひょひょひへ"
.byte   newLine
kanafix "ふはく ひゃひぇひぇひゃひんひゃ。"
.byte   newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHKID:
kanafix "*いまの せんせいと"
.byte   newLine
kanafix "ふつうに しゃべるのは"
.byte   newLine
kanafix "わたしでも むりです。"
.byte   newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHGUY_DENTURES:
kanafix "*おお"
.byte   newLine
kanafix "いればを さがしてくれたおれいに "
.byte   newLine
kanafix "ながいきのひけつをおしえてやろう。"
.byte   newLine
.byte   pauseText
kanafix "*うがいを よく することじゃ。"
.byte   newLine
.byte   pauseText
kanafix "*カゼをひいたら うがいでなおせ。"
.byte   newLine
.byte   pauseText
kanafix "*わしの とくせいの"
.byte   newLine
kanafix "うがいぐすりを もっていきなさい。"
.byte   newLine
kanafix "ホレ。"
.byte   newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHKID_TAKE:
kanafix "*また うがいぐすりですか?"
.byte   newLine
kanafix "さぁ もっていきなさい。"
.byte   newLine
.byte   pauseText
kanafix "*こんどは"
.byte   price
kanafix "ドル"
.byte   newLine
kanafix "いただきますよ。"
.byte   newLine
kanafix "ガラガラッ ペッ。"
.byte   newLine
.byte   stopText

MSG_REINDEER_COLDGUY:
kanafix "*カゼがげんいんで"
.byte   newLine
kanafix "しんじゃったやつも いるらしいぜ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_RUMORGUY:
kanafix "*ハロウィ-ンのまちの"
.byte   newLine
kanafix "ゆうれいやしきの はなしは"
.byte   newLine
kanafix "きいたかい?"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_RUMORGUY_ACCEPT:
kanafix "*だれもいないやしきから"
.byte   newLine
kanafix "ピアノの メロディ-が"
.byte   newLine
kanafix "きこえてくるんだってな。"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_RUMORGUY_DECLINE:
kanafix "*しらなきゃ しらないほうがいい。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_HOTELBELLHOP:
kanafix "*ふっふっふっふふふ。"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_NOBODYHERE:
kanafix "*だれも いないよ。 くっくっく。"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_WORSTNIGHTMARE:
kanafix "*これは あくむ。"
.byte   newLine
kanafix "さめることのない わるいゆめ‥‥"
.byte   newLine
kanafix "ひっひっひ。"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_TURNBACK:
kanafix "*か  え  れ"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_AGH:
kanafix "*ギャ-----ッ!"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_NEVERMAKEIT:
kanafix "*"
.byte   partyLead
kanafix "! しぬぞ。"
.byte   newLine
kanafix "ひっひっひっひっひっひっひっひっ"
.byte   newLine
kanafix "‥‥くくくくく。"
.byte   newLine
.byte   stopText

MSG_ROSEMARYHOUSE_MOUSE:
kanafix "*あっしは"
.byte   newLine
kanafix "あやしい ねずみじゃありやせん。"
.byte   newLine
.byte   pauseText
kanafix "*ピアノのあるへや‥‥"
.byte   newLine
kanafix "へっへっへ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_ROSEMARYGUY:
kanafix "*ゆうれいやしきは"
.byte   newLine
kanafix "ロ-ズマリ-さんの ものだ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_SMALLGUY:
kanafix "*おれのうちも"
.byte   newLine
kanafix "ゆうれいがでるように"
.byte   newLine
kanafix "なったんだけどさ。"
.byte   newLine
.byte   pauseText
kanafix "*うさぎごやみたいに せまいから"
.byte   newLine
kanafix "イヤだって でてったよ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_HINTGIRL:
kanafix "*わたしは"
.byte   newLine
kanafix "このまちの にんげんというよりは"
.byte   newLine
kanafix "ゲ-ムのアシスタントなの。"
.byte   newLine
.byte   pauseText
kanafix "*あなた メモしわすれていること"
.byte   newLine
kanafix "あるんじゃない?"
.byte   newLine
.byte   pauseText
kanafix "*ひとつのヒントを"
.byte   newLine
.byte   price
kanafix "ドルで おしえるけど"
.byte   newLine
kanafix "かう?"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_HINTGIRL_DECLINE:
kanafix "*あら ずいぶん じしんがあるのね。"
.byte   newLine
kanafix "じゃ もう あわないようにするわ。"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_HINTGIRL_ACCEPT:
kanafix "*ヒントは3つまでよ。"
.byte   newLine
kanafix "あとは‥‥  ひ.み.つ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_CLOWN:
kanafix "*このハロウィ-ンのまちで"
.byte   newLine
kanafix "いちばんの ひょうきんものが"
.byte   newLine
kanafix "おれさ。"
.byte   newLine
.byte   pauseText
kanafix "*ほかのやつらって"
.byte   newLine
kanafix "なんか インキだろ?"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_CLOWN_ACCEPT:
kanafix "*そうなんだよな。"
.byte   newLine
kanafix "おれも ほんとは あかるいほうでも"
.byte   newLine
kanafix "ないんだ‥‥"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_CLOWN_DECLINE:
kanafix "*そうかなぁ。"
.byte   newLine
.byte   pauseText
kanafix "*おれ"
.byte   newLine
kanafix "じぶんが くらいのかも"
.byte   newLine
kanafix "しれないな。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_MRSROSEMARY:
kanafix "*うちのやしきが"
.byte   newLine
kanafix "ばけもののすみかに"
.byte   newLine
kanafix "なってしまって‥‥"
.byte   newLine
.byte   pauseText
kanafix "*わしらは こんなところでくらして"
.byte   newLine
kanafix "いるですよ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LABLLOYD:
kanafix "*"
.byte   lloydName
kanafix " "
.byte   newLine
kanafix "「きみの もってる"
.byte   newLine
kanafix "ロケットの ねんりょうは"
.byte   newLine
kanafix "ほらっ ぼくのもってる この‥‥"
.byte   newLine
.byte   pauseText
kanafix "*すっごいだろ。 あっ!」"
.byte   newLine
.byte   stopText

MSG_MTITOI_GIEGUEPRISON_GUY1:
kanafix "*くらくて よくみえないが"
.byte   newLine
kanafix "あんた"
.byte   unk4
kanafix "は もしかすると"
.byte   newLine
.byte   pauseText
kanafix "*スノ-マンまちの きょうかいの"
.byte   newLine
kanafix "むすめさん"
.byte   unk4
kanafix "だな‥‥ たしか"
.byte   newLine
.byte   anaName
kanafix "ちゃん‥‥ とかいう。"
.byte   newLine
.byte   pauseText
kanafix "*おかあさんは ずっとおくのへやに"
.byte   newLine
kanafix "とじこめられて いるはずだ。"
.byte   newLine
.byte   pauseText
kanafix "*しかし わたしたちを"
.byte   newLine
kanafix "いま たすけるのは むりだ。"
.byte   newLine
.byte   pauseText
kanafix "*とにかく あの マザ-シップを"
.byte   newLine
kanafix "なんとか できなければ‥‥"
.byte   newLine
.byte   stopText

MSG_TWINKLE_SCIENTISTROCKET3:
kanafix "*おお!"
.byte   newLine
kanafix "うちゅうくうかんへと とびさった。"
.byte   newLine
kanafix "あるいみで だいせいこうだ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_MRSROSEMARY_KEY:
kanafix "*まぁ あなたって ほんとうに"
.byte   newLine
kanafix "すてきなかた‥‥"
.byte   newLine
.byte   pauseText
kanafix "*いつまでも"
.byte   newLine
kanafix "みつめていたいくらい‥‥"
.byte   newLine
.byte   pauseText
kanafix "*あなたなら きっと あのやしきを"
.byte   newLine
kanafix "とりもどして くれるわね‥‥"
.byte   newLine
.byte   pauseText
kanafix "*ハイ これが あのいえのカギよ。"
.byte   newLine
kanafix "うふっ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_NINTENROSEMARY:
kanafix "*ぼくちゃん"
.byte   newLine
.byte   nintenName
kanafix "っていうの。"
.byte   newLine
.byte   pauseText
kanafix "*もとの なまえは"
.byte   newLine
kanafix "バグエラ-.ロ-ズマリ-"
.byte   newLine
kanafix "っていうんだ。"
.byte   newLine
.byte   stopText

MSG_SPOOKANE_MRSROSEMARY1:
kanafix "*"
.byte   nintenName
kanafix "のバカ!"
.byte   newLine
.byte   pauseText
kanafix "*いえ"
.byte   newLine
kanafix "うちのこに いったんですのよ。"
.byte   newLine
.byte   stopText
MSG_SPOOKANE_MRSROSEMARY2:
kanafix "*ゆうれいは"
.byte   newLine
kanafix "まだ でるみたいだけど"
.byte   newLine
.byte   pauseText
kanafix "あなたって ほんとうに"
.byte   newLine
kanafix "ゆうかんなかた!"
.byte   newLine
.byte   pauseText
kanafix "*わたし‥‥"
.byte   newLine
kanafix "むすこに あなた"
.byte   unk4
kanafix "の なまえを"
.byte   newLine
kanafix "いただきましたのよ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_TRAIN:
kanafix "*しゅうてんの スノ-マンえきだ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_YOUNGTOWNGUY:
kanafix "*イ-スタ-のまちでは"
.byte   newLine
kanafix "じゅうみんが ぜんぶ"
.byte   newLine
kanafix "かみかくしにあっちまったらしいよ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_TRAINDAUGHTER:
kanafix "*ママが イ-スタ-のまちに"
.byte   newLine
kanafix "いってるの。"
.byte   newLine
.byte   pauseText
kanafix "*なんにちも れんらくがないから"
.byte   newLine
kanafix "パパとさがしにいくのよ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_SPOOKANEGUY:
kanafix "*ハロウィ-ンのまちの"
.byte   newLine
kanafix "ゆうれいやしきには いったか?"
.byte   newLine
.byte   stopText
MSG_SNOWMAN_SPOOKANEGUY_ACCEPT:
kanafix "*こんど ゆっくり"
.byte   newLine
kanafix "はなしを きかせてくれ。"
.byte   newLine
.byte   pauseText
kanafix "*おれは コワイはなしが"
.byte   newLine
kanafix "だいすきなんだ。"
.byte   newLine
.byte   stopText
MSG_SNOWMAN_SPOOKANEGUY_DECLINE:
kanafix "*おれは いきたくないけど"
.byte   newLine
kanafix "おまえ いくといいぞ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_COLDGUY:
kanafix "*このスノ-マンのまちは"
.byte   newLine
kanafix "さむいから カゼひくなよ。"
.byte   newLine
.byte   pauseText
kanafix "*はみがきも しろよ。"
.byte   newLine
.byte   pauseText
kanafix "*ゴホッ ゴホッ‥‥"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_LIFEGIRL:
kanafix "*じんせいは ゲ-ムよ。"
.byte   newLine
kanafix "やすんだり もどったりも"
.byte   newLine
kanafix "だいじなのよ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_SCHOOLGUY:
kanafix "*"
.byte   anaName
kanafix "が"
.byte   newLine
kanafix "がっこうやすんでるから"
.byte   newLine
kanafix "しんぱいでよう。"
.byte   newLine
.byte   stopText
MSG_SNOWMAN_SCHOOLGUY2:
kanafix "*おれ "
.byte   anaName
kanafix "のことが"
.byte   newLine
kanafix "しんぱいで しんぱいで"
.byte   newLine
kanafix "よるも ねられねぇ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_JAILCOP_NOMONEY:
kanafix "*かねが たりないぜ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_NOSEGIRL:
kanafix "*あれあれ ハナミズがたれてるよ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PHONE_2:
kanafix "*ちょっと このゲ-ムをしている"
.byte   newLine
kanafix "プレイヤ- のかたに"
.byte   newLine
kanafix "かわってくれないか。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PHONE_1:
kanafix "*だいじな ようじが あるんだ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PHONE_3:
kanafix "*もしもし いつも "
.byte   nintenName
kanafix "が"
.byte   newLine
kanafix "おせわになっております。"
.byte   newLine
.byte   pauseText
kanafix "*わたくし そのこのちちで"
.byte   newLine
kanafix "ございますが"
.byte   newLine
.byte   pauseText
kanafix "*あなたさまの おなまえを"
.byte   newLine
kanafix "きかせて いただこうと"
.byte   newLine
kanafix "ぞんじまして‥‥"
.byte   newLine
.byte   pauseText
kanafix "*よろしくおねがい いたします。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PHONE_END:
kanafix "*どうも おいそがしいところを"
.byte   newLine
kanafix "ありがとうございました。"
.byte   newLine
.byte   pauseText
kanafix "*わたくしも いそがしいので"
.byte   newLine
kanafix "では これでしつれいいたします。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_ANA_NINTEN:
kanafix "*"
.byte   partyLead
kanafix "‥‥でしょ?"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_ANA_SILLY:
kanafix "*ふざけないでね。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_ANA_GO:
kanafix "*わたしが"
.byte   newLine
kanafix "ママを さがしにいくために"
.byte   newLine
.byte   pauseText
kanafix "あなた"
.byte   unk4
kanafix "の たすけが"
.byte   newLine
kanafix "ひつようだったの。"
.byte   newLine
kanafix "まっていたわ‥‥"
.byte   partyLead
kanafix "。"
.byte   newLine
.byte   pauseText
kanafix "*まず イ-スタ-のまちへ"
.byte   newLine
kanafix "いってみましょう。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_ANA:
kanafix "*あなたに とってもよくにたひとを"
.byte   newLine
kanafix "ゆめで みたことがあるわ。"
.byte   newLine
.byte   stopText

MSG_MTITOI_ANA:
kanafix "*"
.byte   nintenName
kanafix "‥‥そばにいて?"
.byte   newLine
.byte   stopText

MSG_MTITOI_ANA_NO:
kanafix "*いやっ!"
.byte   newLine
kanafix "そばにいて‥‥おねがい。"
.byte   newLine
.byte   stopText

MSG_MTITOI_ANA2:
kanafix "*しずかね。 おどりましょ?"
.byte   newLine
.byte   stopText

MSG_MTITOI_ANALOVE_NO:
kanafix "*‥‥そうね。"
.byte   newLine
kanafix "こんなことしてるときじゃないわね。"
.byte   newLine
kanafix "ごめんなさい。"
.byte   newLine
.byte   stopText

MSG_MTITOI_ANALOVE:
kanafix "*"
.byte   nintenName
kanafix "‥‥"
.byte   newLine
kanafix "わたしのこと すき?"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDMATTER:
kanafix "*"
.byte   lloydName
kanafix "ったら どうしたの。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_DRAGON_NOWAKE:
kanafix "*ドラゴンは ねむっている。"
.byte   newLine
.byte   pauseText
kanafix "*いまの "
.byte   partyLead
kanafix "には"
.byte   newLine
kanafix "まだ ドラゴンを"
.byte   newLine
kanafix "おこすことは できない。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_DRAGON_WAKE:
kanafix "*"
.byte   partyLead
kanafix "のけはいを かんじて"
.byte   newLine
kanafix "ドラゴンが めをさました。"
.byte   newLine
.byte   pauseText
kanafix "「ワタシヨリ ヨワイモノニ"
.byte   newLine
kanafix "コノ ガクフヲ ワタスコトハ"
.byte   newLine
kanafix "デキナイ。」"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PRIEST:
kanafix "*むすめの"
.byte   anaName
kanafix "は"
.byte   newLine
kanafix "おくびょうだけれど"
.byte   newLine
.byte   pauseText
kanafix "やさしいこころと ふしぎなちからを"
.byte   newLine
kanafix "もっている。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_PRIEST_AFTER:
kanafix "*あなたがたは"
.byte   newLine
kanafix "かならず しょうりする。"
.byte   newLine
.byte   pauseText
kanafix "*わたしたちのいのりが"
.byte   newLine
kanafix "きっと ちかいうちに"
.byte   newLine
kanafix "ききとどけられるだろう。"
.byte   newLine
.byte   pauseText
kanafix "*いまは おやすみ。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_PASSTRIGGER:
kanafix "*"
.byte   partyLead
kanafix "は おとしものの"
.byte   newLine
kanafix "つうこうきょかしょうを みつけた。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TOWER_ROCKET:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "ロケットに のりこんだ。"
.byte   newLine
.byte   stopText

MSG_SNOWMAN_YUCCAGIRL:
kanafix "*アドベントのさばくに"
.byte   newLine
kanafix "おじいちゃんがいるの。"
.byte   newLine
kanafix "もしあったら よろしくね。"
.byte   newLine
.byte   stopText

MSG_YUCCA_NICEBONES:
kanafix "*わたしは"
.byte   newLine
kanafix "よいひとの しかばねです。"
.byte   newLine
.byte   pauseText
kanafix "*だから おそいかかったり"
.byte   newLine
kanafix "しませんよ。"
.byte   newLine
.byte   stopText

MSG_YUCCA_SIGNBONES:
kanafix "*わたし めじるしとして"
.byte   newLine
kanafix "べんりでしょ。"
.byte   newLine
.byte   stopText

MSG_YUCCA_BRAVEBONES:
kanafix "*したいに はなしかけるなんて"
.byte   newLine
kanafix "どきょうのあるこどもだなぁ。"
.byte   newLine
.byte   stopText

MSG_YUCCA_CAMELBONES:
kanafix "*わたしゃ ラクダのホネですが"
.byte   newLine
kanafix "さばくでの あるきかたを"
.byte   newLine
kanafix "しりたいですか?"
.byte   newLine
.byte   stopText
MSG_YUCCA_CAMELBONES_ACCEPT:
kanafix "*みぎあしが しずみこむまえに"
.byte   newLine
kanafix "ひだりあしを だす。"
.byte   newLine
.byte   pauseText
kanafix "*ひだりあしが しずむまえに"
.byte   newLine
kanafix "みぎあしを だす。"
.byte   newLine
.byte   pauseText
kanafix "*これが わかるのに ひゃくねんも"
.byte   newLine
kanafix "かかったです。"
.byte   newLine
.byte   stopText
MSG_YUCCA_CAMELBONES_DECLINE:
kanafix "*おしえたいなぁ。 しりたいですか?"
.byte   newLine
.byte   stopText

MSG_YUCCA_GAMEBONES:
kanafix "*このゲ-ムのなかで"
.byte   newLine
kanafix "いちばん たいくつなのは"
.byte   newLine
kanafix "このアドベントのさばくなんです。"
.byte   newLine
.byte   pauseText
kanafix "*でも ほんとに ぢらいには"
.byte   newLine
kanafix "きをつけてね。"
.byte   newLine
.byte   stopText

MSG_YUCCA_SIGN:
kanafix "「アドベントさばく"
.byte   newLine
kanafix "ゆうらんひこうは いかがかね?」"
.byte   newLine
.byte   stopText

MSG_YUCCA_PILOT_MINE:
kanafix "*わしは まえのまえの"
.byte   newLine
kanafix "せんそうのときに このさばくに"
.byte   newLine
kanafix "ぢらいをうめたんじゃ。"
.byte   newLine
.byte   pauseText
kanafix "*ぜんぶ ほりおこしたつもりだったが"
.byte   newLine
kanafix "どうしても ひとつだけみつからん。"
.byte   newLine
kanafix "きをつけてくれよ。"
.byte   newLine
.byte   stopText
MSG_YUCCA_PILOT_RIDE:
kanafix "*おお ひこうきにのるか?"
.byte   newLine
.byte   stopText
MSG_YUCCA_PILOT_RIDE_ACCEPT:
kanafix "*では みんなのぶんで"
.byte   newLine
.byte   price
kanafix "ドルいただこうか。"
.byte   newLine
.byte   pauseText
kanafix "*チケットの はんけんは"
.byte   newLine
kanafix "なくさないようにな。"
.byte   newLine
.byte   pauseText
kanafix "*すごいぞ。 このはんけんを"
.byte   newLine
kanafix "10まいためると せんしゃに"
.byte   newLine
kanafix "のれるのじゃ。"
.byte   newLine
.byte   pauseText
kanafix "*うれしそうじゃな ハハハ。"
.byte   newLine
.byte   stopText
MSG_YUCCA_PILOT_RIDE_DECLINE:
kanafix "*ねだんがたかいから むりもないか。"
.byte   newLine
.byte   stopText

MSG_YUCCA_PILOT_TANK:
kanafix "*おお! 10まい たまったのか。"
.byte   newLine
kanafix "よしよし せんしゃをかしてやろう。"
.byte   newLine
.byte   pauseText
kanafix "*うれしそうじゃな ハハハ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_PILOT:
kanafix "*せんしゃを こわしたな。"
.byte   newLine
kanafix "わしのだいじな せんしゃを‥‥"
.byte   newLine
kanafix "オロオロ。"
.byte   newLine
.byte   pauseText
kanafix "*せんしゃの しゅうりひを"
.byte   newLine
kanafix "べんしょうしてくれ。"
.byte   newLine
.byte   price
kanafix "ドルだぞ。"
.byte   newLine
.byte   pauseText
kanafix "*いますぐはらうか?"
.byte   newLine
.byte   stopText
MSG_ELLAY_PILOT_ACCEPT:
kanafix "*ああよかった。 いざ さらば。"
.byte   newLine
.byte   stopText
MSG_ELLAY_PILOT_DECLINE:
kanafix "*わしは おこったぞ。"
.byte   newLine
kanafix "うっうっうううう‥‥"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_PARENTGIRL:
kanafix "*パパいない。 ママいない。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_GUARD:
kanafix "*ぼくわ もんばんだ。"
.byte   newLine
kanafix "おまえわ だれだ。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_GUARD2:
kanafix "*あ あやしいやつわ"
.byte   newLine
kanafix "やっつけるぞ‥‥ブルブル。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_BABYGIRL:
kanafix "*ガリクソンさんちの あかちゃんは"
.byte   newLine
kanafix "なんかへん。 ぜったいへん。"
.byte   newLine
kanafix "なんか すごいきがするわ。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_MATHGUY:
kanafix "*え-と 2たす3は5。"
.byte   newLine
kanafix "8ひく4は4‥‥ おれは"
.byte   newLine
kanafix "いつも べんきょうしてるんだ。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_MOMGIRL:
kanafix "*ママ-! さみしいよ-"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_DADGUY:
kanafix "*パパ-! さみしいよ-"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_SHIPGIRL:
kanafix "*でっかい そらとぶふねが"
.byte   newLine
kanafix "おとなたちを みんな"
.byte   newLine
kanafix "つれてっちゃったの。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_GROWNUPGUY:
kanafix "*おとなたちが いなくて"
.byte   newLine
kanafix "せいせいしたぜ グスン。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_HOLDMEGIRL:
kanafix "*おねえちゃん オッパイ!"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_HOLDMEGUY:
kanafix "*ぼくも オッパイ!"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_HOLDMEGUY2:
kanafix "*オッパイ!"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_PLEASEGIRL:
kanafix "*パパや ママを つれもどして。"
.byte   newLine
kanafix "おねがいします。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_TOMGARRICKSON:
kanafix "*あ どうも。 ぼく"
.byte   newLine
kanafix "トム.ガリクソンっていいます。"
.byte   newLine
kanafix "しゅみは じこしょうかいです。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_MYSTICGIRL:
kanafix "*このベビ-は ふしぎなちからを"
.byte   newLine
kanafix "もっているって"
.byte   newLine
kanafix "いつかママがいってたわ。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_BABYTALK:
kanafix "*アプ- アプ- バブバブ。"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_BABY:
kanafix "*わたしは このベビ-の いしき。"
.byte   newLine
kanafix "わたしも あなたたちと おなじ"
.byte   newLine
kanafix "エスパ-だ。"
.byte   newLine
.byte   pauseText
kanafix "*テレポ-トの ちからを"
.byte   newLine
kanafix "もっている。"
.byte   newLine
.byte   pauseText
kanafix "*あなたの しっている ところなら"
.byte   newLine
kanafix "どこにでもいける。"
.byte   newLine
.byte   pauseText
kanafix "*("
.byte   nintenName
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "ベビ-の いしきから"
.byte   newLine
.byte   pauseText
kanafix "テレポ-テ-ションの PSIを"
.byte   newLine
kanafix "うけついだ。)"
.byte   newLine
.byte   stopText

MSG_YOUNGTOWN_VOICEGUY:
kanafix "*とうちゃんたちの こえが"
.byte   newLine
kanafix "やまのほうで きこえたような"
.byte   newLine
kanafix "きがするんだ。"
.byte   newLine
.byte   pauseText
kanafix "*でも やまは バレンタインのまちの"
.byte   newLine
kanafix "むこうなんだ。"
.byte   newLine
kanafix "とおすぎて ぼくには いけない。"
.byte   newLine
.byte   stopText

MSG_ELLAY_JAILCOP_NOROOM:
kanafix "*なんだよ。 もちきれないんじゃ"
.byte   newLine
kanafix "やれないよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHCOP_JAIL:
kanafix "*つきひは たったが"
.byte   newLine
kanafix "おまえは まだ みせいねんだな。"
.byte   newLine
.byte   stopText

MSG_ELLAY_BBGANGFAKE:
kanafix "*きをつけて あるきなよ"
.byte   newLine
kanafix "おまえたち。"
.byte   newLine
kanafix "へっへっへ‥‥"
.byte   newLine
.byte   stopText

MSG_ELLAY_BBGANGWOMAN:
kanafix "*まったく ブラックブラッドだんの"
.byte   newLine
kanafix "やつらときたひにゃ‥‥"
.byte   newLine
.byte   stopText

MSG_ELLAY_BBGANGGIRL:
kanafix "*ブラックブラッドだんってなまえは"
.byte   newLine
kanafix "ながいから みんなブラブラだんと"
.byte   newLine
kanafix "よんでいるのよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_BBGANGWOMAN2:
kanafix "*おまえ"
.byte   unk4
.byte   newLine
kanafix "ブラブラだんの なかまじゃ"
.byte   newLine
kanafix "ないだろうね。"
.byte   newLine
.byte   stopText

MSG_ELLAY_CLOUDGUY:
kanafix "*やまのうえに くろいくもが"
.byte   newLine
kanafix "かかってからというものは"
.byte   newLine
.byte   pauseText
kanafix "ひとも まちも"
.byte   newLine
kanafix "おかしくなっちまったよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_PEACEGUY:
kanafix "*よっ! よっ!"
.byte   newLine
kanafix "そっちのおふたりさんは"
.byte   newLine
kanafix "こいびとどうしかね?"
.byte   newLine
.byte   stopText
MSG_ELLAY_PEACEGUY_DEFAULT:
kanafix "*あいしあってるかい。 イエ-。"
.byte   newLine
.byte   stopText
MSG_ELLAY_PEACEGUY_DECLINE:
kanafix "*いいや こころのおくには"
.byte   newLine
kanafix "あいが めばえちゃってるんじゃ"
.byte   newLine
kanafix "ないの。"
.byte   newLine
.byte   stopText

MSG_ELLAY_TICKETGUY:
kanafix "*ライブハウスのチケットあるよ。"
.byte   newLine
.byte   price
kanafix "ドルで かうかね?"
.byte   newLine
.byte   stopText
MSG_ELLAY_JAILCOP_HASWEAPON_ACCEPT:
kanafix "*ほれよ!"
.byte   newLine
kanafix "デパ-トじゃ うりきれだもんな。"
.byte   newLine
.byte   stopText
MSG_ELLAY_JAILCOP_HASWEAPON_DECLINE:
kanafix "*ケチンボなガキどもだぜ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_SECRETGIRL:
kanafix "*いいことおしえてあげるわよ。"
.byte   newLine
kanafix "しりたい?"
.byte   newLine
.byte   stopText
MSG_ELLAY_SECRETGIRL_ACCEPT:
kanafix "*ブラブラだんのボスの"
.byte   newLine
.byte   teddyName
kanafix "って ほんみょうは"
.byte   newLine
.byte   teddyName
kanafix "ざえもんっていうのよ。"
.byte   newLine
.byte   pauseText
kanafix "*うわさだけどね。"
.byte   newLine
.byte   stopText
MSG_ELLAY_SECRETGIRL_DECLINE:
kanafix "*きっと こうかいするわよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHBACKROOMGUY:
kanafix "*がくやを のぞいちゃダメよ。"
.byte   newLine
kanafix "どえらいめに あうからね。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHDRINKGIRL_OFFER:
kanafix "*すいたらしい ひと。"
.byte   newLine
kanafix "ふ-ん "
.byte   partyLead
kanafix "っていうの。"
.byte   newLine
kanafix "ビ-ルをおごるわ。 のんで。"
.byte   newLine
.byte   stopText
MSG_ELLAY_LHDRINKGIRL_OFFER_REFUSE:
kanafix "*おまわりが こわいのね。"
.byte   newLine
kanafix "なさけないやつ‥‥"
.byte   newLine
.byte   stopText
MSG_ELLAY_LHDRINKGIRL:
kanafix "*もうビ-ルは おごらないわ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHCOP_JAILSHAME:
kanafix "*はんせいしたか?"
.byte   newLine
.byte   stopText
MSG_ELLAY_LHCOP_JAILSHAME_YES:
kanafix "*もう にどとしないなら"
.byte   newLine
kanafix "かえってよろしい。"
.byte   newLine
.byte   pauseText
kanafix "*あぶないものは"
.byte   newLine
kanafix "あずかっておくからな。"
.byte   newLine
.byte   stopText
MSG_ELLAY_LHCOP_JAILSHAME_NO:
kanafix "*じゃ もういちにち"
.byte   newLine
kanafix "あたまをひやしていろ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_JAILCOP_HASWEAPON:
kanafix "*へっへっへ"
.byte   newLine
kanafix "このあいだ "
.byte   item
kanafix "が"
.byte   newLine
kanafix "てに はいったんだよ。"
.byte   newLine
.byte   pauseText
kanafix "*"
.byte   price
kanafix "ドルで かわないか?"
.byte   newLine
.byte   stopText

MSG_ELLAY_PILOT_NOMONEY:
kanafix "*おかねが たりないぞ。"
.byte   newLine
kanafix "うっうっううう‥‥"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHTEDDYGIRL:
kanafix "*"
.byte   teddyName
kanafix "は"
.byte   newLine
kanafix "やまのばけものに りょうしんを"
.byte   newLine
kanafix "ころされてしまったの。"
.byte   newLine
.byte   pauseText
kanafix "*それまではやさしくて"
.byte   newLine
kanafix "ひょうきんなこだったのよ。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHTEDDYGIRL2:
kanafix "*"
.byte   teddyName
kanafix "が むかしのように"
.byte   newLine
kanafix "やさしくなってくれたら"
.byte   newLine
kanafix "うれしいな。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHBOUNCERGUY_OFFER:
kanafix "*あんた"
.byte   unk4
kanafix "も うたうかね。"
.byte   newLine
.byte   stopText
MSG_ELLAY_LHBOUNCERGUY_OFFER_YES:
kanafix "*じゃあ けいきのいいやつを"
.byte   newLine
kanafix "やってくれ。"
.byte   newLine
.byte   stopText
MSG_ELLAY_LHBOUNCERGUY_OFFER_NO:
kanafix "*シャイな こだね。"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHCUTEGUY2:
kanafix "*"
.byte   anaName
kanafix "ちゃんっ!"
.byte   newLine
kanafix "いやなに ぼうしに なまえが"
.byte   newLine
kanafix "かいてあったからさ。"
.byte   newLine
.byte   stopText
