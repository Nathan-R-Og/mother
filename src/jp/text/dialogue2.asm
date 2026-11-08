.segment        "PRG19": absolute

.byte 0

MSG_MERRYSVILLE_HOSPITALDOCTOR:
kanafix "*まずマネ-をみせてください。",newLine
kanafix "ちりょうは それからです。",newLine
.byte   pauseText
kanafix "*みせないなら",newLine
kanafix "こちらから きんがくを いいます。",newLine
.byte   pauseText
kanafix "*"
.byte   price
kanafix "ドルで",newLine
kanafix "あなた"
.byte   unk4
kanafix "はなおる。",newLine
.byte   pauseText
kanafix "*これ あかじ かくごの",newLine
kanafix "しゅっけつサ-ビスです。",newLine
kanafix "OK?",newLine
.byte   stopText
MSG_MERRYSVILLE_HOSPITALDOCTOR_ACCEPT:
kanafix "*はい。 たしかに"
.byte   price
kanafix "ドル。",newLine
.byte   pauseText
kanafix "*はい もうなおりました。",newLine
.byte   pauseText
kanafix "*また おおけがを",newLine
kanafix "してきてくださいね。",newLine
kanafix "やすくしとくから。",newLine
.byte   stopText
MSG_MERRYSVILLE_HOSPITALDOCTOR_DECLINE:
kanafix "*そうですか。 しんでしまいなさい。",newLine
kanafix "そうぎやにでも",newLine
kanafix "でんわしときましょう。",newLine
.byte   stopText

MSG_PODUNK_MERRYCOP:
kanafix "*かいげんれいが とかれるまで",newLine
kanafix "この はしを とおすなと",newLine
.byte   pauseText
kanafix "*ちょうちょうさんから",newLine
kanafix "めいれいされているのだ。",newLine
.byte   pauseText
kanafix "*どうぶつえんの ひがしの はしを",newLine
kanafix "とおりなさい。",newLine
.byte   stopText

MSG_MERRYSVILLE_COP:
kanafix "*きみ がっこうは どうしたの。",newLine
kanafix "きょうは おやすみじゃないはずよ。",newLine
.byte   stopText

MSG_MERRYSVILLE_DUNCANGUY:
kanafix "*きたの ダンカンこうじょうから",newLine
kanafix "バッテリ-を かっぱらってきた。",newLine
.byte   stopText

MSG_DUNCANFACTORY_DOG:
kanafix "*このこうじょうは",newLine
kanafix "ダンカンさんの もちものです。",newLine
.byte   pauseText
kanafix "*つうこうきょかしょうは",newLine
kanafix "もっていますか?",newLine
.byte   stopText
MSG_DUNCANFACTORY_DOG_PASS:
kanafix "*こりゃ",newLine
kanafix "きげんぎれですぜ おにいさん。",newLine
kanafix "ひろったものだな。",newLine
.byte   pauseText
kanafix "*あやしいやつ‥‥",newLine
.byte   pauseText
kanafix "*おれの めを みろ!!",newLine
.byte   stopText

MSG_MERRYSVILLE_BEATUPGUY:
kanafix "*すげぇ ばけものに",newLine
kanafix "やられちまった。",newLine
.byte   pauseText
kanafix "*えきにいくなら",newLine
kanafix "かくごしたほうが いいぜ。",newLine
.byte   stopText

MSG_MERRYSVILLE_CURFEWGUY:
kanafix "*マザ-ズデイの まちの",newLine
kanafix "かいげんれいは",newLine
kanafix "とかれたんだってな。",newLine
.byte   pauseText
kanafix "*ってことは あのはしも",newLine
kanafix "とおれるように なったってことだ。",newLine
kanafix "ドゥ ユ- アンダスタン?",newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY:
kanafix "*よわむし"
.byte   lloydName
kanafix "のやつを",newLine
kanafix "いじめてたんだけど",newLine
kanafix "にげられちまった。",newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY_LLOYD:
kanafix "*おい "
.byte   lloydName
kanafix "‥‥",newLine
kanafix "よわむしけむし!",newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY2:
kanafix "*よわむし"
.byte   lloydName
kanafix "のやつを",newLine
kanafix "いじめてたんですよね せんぱい。",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENT_NO_CURE:
kanafix "*なんだ ひやかしか!",newLine
.byte   stopText

MSG_TWINKLE_LLOYDEXPLOSIVES:
kanafix "*"
.byte   lloydName
kanafix "ったら ばくやくを",newLine
kanafix "もちだしちゃったらしいの。",newLine
.byte   pauseText
kanafix "*せんせいに みつかったら",newLine
kanafix "たいへんだわ。",newLine
.byte   stopText

MSG_TWINKLE_GLASSESSLIPPED:
kanafix "*"
.byte   lloydName
kanafix " ",newLine
kanafix "めがねが ずれてるわよ。",newLine
.byte   stopText

MSG_TWINKLE_SUZY:
kanafix "*あたし ス-ジ-。",newLine
kanafix "ミス.いなかまちにえらばれたのよ。",newLine
kanafix "きれい?",newLine
.byte   stopText

MSG_TWINKLE_SUZY_YES:
kanafix "*あなたも すてきよ。",newLine
.byte   stopText

MSG_TWINKLE_SUZY_NO:
kanafix "*あなたのほうが ブス!",newLine
kanafix "うすのろぶたって かんじよ!",newLine
.byte   stopText

MSG_TWINKLE_GAMEBOYKID:
kanafix "*おくじょうのドアが",newLine
kanafix "しまっててよぉ。",newLine
.byte   pauseText
kanafix "*トランジスタラジオでも",newLine
kanafix "ききながら",newLine
.byte   pauseText
kanafix "*タバコすおうと",newLine
kanafix "おもってたのによぉ なっ?!",newLine
.byte   stopText

MSG_TWINKLE_GAMEBOYKID2:
kanafix "*むくちな やつ。",newLine
.byte   stopText

MSG_TWINKLE_SITUPSKID:
kanafix "*たいいくの せんこうに",newLine
kanafix "またなぐられた。",newLine
.byte   pauseText
kanafix "*ふりょうに なっちまおうかなぁ",newLine
kanafix "‥‥おれ。",newLine
.byte   stopText

MSG_TWINKLE_BAFFLEDKID:
kanafix "*じぶんのがっこうで",newLine
kanafix "まいごになるなんて",newLine
kanafix "‥‥ほんとに もうっ!",newLine
.byte   stopText

MSG_TWINKLE_JANITOR1:
kanafix "*おくじょうのドアが",newLine
kanafix "あかないって いうのか。",newLine
.byte   stopText

MSG_TWINKLE_JANITOR3:
kanafix "*ぶくぶくふとるばっかしでよ。",newLine
kanafix "ひでぇおんなだろ?",newLine
.byte   stopText

MSG_TWINKLE_JANITORNOTHORRIBLE:
kanafix "*こどもにゃ わからねぇ。",newLine
kanafix "じんせいのかなしみは‥‥",newLine
.byte   stopText

MSG_TWINKLE_JANITOR_WIFE:
kanafix "*おまえに うちのにょうぼうのことを",newLine
kanafix "そんなふうにいわれる すじあいは",newLine
kanafix "ないね。 でてってくれ。",newLine
.byte   stopText

MSG_TWINKLE_JANITOR4:
kanafix "*わかいときゃ かわいかったんだ。",newLine
kanafix "そうさ いいところもあるんだよ。",newLine
.byte   pauseText
kanafix "*ま おちゃでものんでくかい?",newLine
.byte   stopText

MSG_TWINKLE_JANITOR5:
kanafix "*はなしのわかるこどもだな。",newLine
kanafix "あ おくじょうに",newLine
kanafix "いきたいんだっけな。",newLine
.byte   pauseText
kanafix "*じゃ ついておいで。",newLine
.byte   stopText

MSG_TWINKLE_JANTIORNOTEA:
kanafix "*としよりを だいじにしないと",newLine
kanafix "おとなになって なきをみるぞ。",newLine
.byte   stopText

kanafix "*なんだ",newLine
kanafix "こんなあぶないものを もって。",newLine
kanafix "これは あずかっておくぞ。",newLine
.byte   stopText

MSG_TWINKLE_JANITOR_TEA:
kanafix "*ま おちゃを のみなって。",newLine
kanafix "なッ。",newLine
.byte   stopText

MSG_TWINKLE_HALLMONITOR:
kanafix "*ろうかを はしるんじゃ",newLine
kanafix "ありませんよ!",newLine
.byte   stopText

MSG_TWINKLE_HALLMONITOR2:
kanafix "*コラッ みかけないこどもだな。",newLine
kanafix "このがっこうの せいとか?",newLine
.byte   stopText

MSG_TWINKLE_HALLMONITOR2_YES:
kanafix "*そうか ろうかをはしるなよ。",newLine
.byte   stopText

MSG_ELLAY_LHCOP_SEEWEAPON:
kanafix "*もちものを みせてみろ。",newLine
.byte   pauseText
kanafix "*あぶないものは",newLine
kanafix "もっていないだろうな。",newLine
.byte   stopText

MSG_TWINKLE_TRASHLLOYD1:
kanafix "*きみは だれだ!",newLine
kanafix "ぼくは ここからでないぞ。",newLine
.byte   pauseText
kanafix "*でたら きっと",newLine
kanafix "いじめられるんだから。",newLine
.byte   stopText

MSG_TWINKLE_TRASHLLOYD2:
kanafix "*ぼくが",newLine
kanafix "だいじなともだちだって!?",newLine
.byte   pauseText
kanafix "*じゃあ りかしつから ばくやくを",newLine
kanafix "もちだしたことを",newLine
kanafix "だまっててくれるか?",newLine
.byte   stopText

MSG_TWINKLE_TRASHLLOYD_YES:
kanafix "*いま でる。",newLine
.byte   stopText

MSG_TWINKLE_LLOYD_INTRODUCTION:
kanafix "*ぼく "
.byte   lloydName
kanafix "。",newLine
kanafix "スイ-トリトルこうじょうで",newLine
kanafix "つくってたっていう",newLine
.byte   pauseText
kanafix "ペンシルロケットを",newLine
kanafix "とばして みたくてさ。",newLine
.byte   stopText

MSG_SWAMP_HOUSEPIPPI_REST:
kanafix "*つかれてるでしょ。",newLine
kanafix "とまっていけば?",newLine
.byte   stopText

MSG_TWINKLE_LLOYDGETROCKET:
kanafix "*わぁっ",newLine
kanafix "これが あの うわさの",newLine
kanafix "ペンシルロケットか。 ",newLine
.byte   pauseText
kanafix "*これなら おなじものを",newLine
kanafix "つくれるかもしれないぞ。",newLine
.byte   pauseText
kanafix "*りかしつに きてくれ。",newLine
.byte   stopText

MSG_DUNCANFACTORY_USEROCKET:
kanafix "*"
.byte   lloydName
kanafix " ",newLine
kanafix "「いいぞ!",newLine
kanafix "よし このスイッチを オンだな。",newLine
kanafix "‥‥きっと。 あっ。」",newLine
.byte   stopText

MSG_ELLAY_LLOYD_TEDDYBED:
kanafix "*"
.byte   lloydName
kanafix " ",newLine
kanafix "「こんどこそ よわむしのぼくが",newLine
kanafix "たたかう ばんだ。",newLine
.byte   pauseText
.byte   teddyName
kanafix "! きみは",newLine
kanafix "ここで やすんでいてくれ。」",newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_INTRO:
kanafix "*わしは じぶんでもわかっておるが",newLine
kanafix "このがっこうに かくれすんでいる",newLine
kanafix "かわりもののせんせいだ。",newLine
.byte   pauseText
kanafix "*けんきゅうひが ほしい。",newLine
kanafix "わしの はつめいを",newLine
kanafix "かってくれんか?",newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_AGREE:
kanafix "*じゃ メニュ-をみてくれ。",newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_DECLINE:
kanafix "*おとしだまくらい もってるだろう。",newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_GOODBYE:
kanafix "*また いつでも きてくれ。",newLine
kanafix "いいものをつくっておくからな。",newLine
.byte   stopText

MSG_TWINKLE_SCIENTIST_NOPROGRESS:
kanafix "*あれから はつめいが",newLine
kanafix "すすんどらんのだよ。",newLine
kanafix "むかしの メニュ-をみるか?",newLine
.byte   stopText

MSG_TRAINGUARDIAN:
kanafix "*さっき ラジオで きいたんだけど",newLine
kanafix "あっちもこっちも パニックらしい。",newLine
kanafix "このえきだけは おいらがまもるぞ。",newLine
.byte   stopText

MSG_TRAIN1:
kanafix "*きしゃが どこまで はしれるかは",newLine
kanafix "ほしょうできないけど うんちんは",newLine
kanafix "とるよ。",newLine
.byte   pauseText
kanafix "*きしゃにのるかい?",newLine
.byte   stopText

MSG_ELLAY_LHCOP_TAKEWEAPON:
kanafix "*("
.byte   partyLead
kanafix "は",newLine
kanafix "ぶきを とりあげられた。)",newLine
.byte   stopText

MSG_TRAIN_ACCEPT:
kanafix "*じゃ "
.byte   price
kanafix "ドルになります。",newLine
.byte   stopText

MSG_REINDEER_NOSEYGUY_HAT:
kanafix "*きみの もってる ぼうしは",newLine
.byte   pauseText
kanafix "スノ-マンのまちの",newLine
.byte   anaName
kanafix "ちゃんの",newLine
kanafix "わすれものらしいね。",newLine
.byte   pauseText
kanafix "*とどけてあげたまえ。",newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHGUY_LEAVE:
kanafix "*ながいき しなされ。",newLine
.byte   stopText

MSG_SNOWMAN_TRAINDAD:
kanafix "*にょうぼうを さがしに",newLine
kanafix "イ-スタ-の まちに いく",newLine
kanafix "ところだよ",newLine
.byte   pauseText
kanafix "*でも せんろが こわれたとかで",newLine
kanafix "おてあげなんだ。",newLine
.byte   stopText

MSG_REINDEER_NOSEYGUY:
kanafix "*ちいさなおせっかいが ゲ-ムを",newLine
kanafix "おもしろくするコツですな。",newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_5:
kanafix "*はい あげる。",newLine
.byte   stopText

MSG_REINDEER_COP1:
kanafix "*ペテンひげをはやしたおとこを",newLine
kanafix "みかけたか?",newLine
.byte   stopText
MSG_REINDEER_COP1_ACCEPT:
kanafix "*にげられたようだな。",newLine
kanafix "あきらめて ちゅうしゃいはんでも",newLine
kanafix "つかまえよう。",newLine
.byte   stopText
MSG_REINDEER_COP1_DECLINE:
kanafix "*とんでもない サギしなんだ。",newLine
kanafix "みかけたらおしえてくれ。",newLine
.byte   stopText

MSG_REINDEER_MONEYGUY:
kanafix "*おっと ぼうず このかねを",newLine
kanafix "あずかってくれ。",newLine
.byte   pauseText
kanafix "*おまわりに あってもしらんぷり",newLine
kanafix "するんだぞ。",newLine
.byte   stopText
MSG_REINDEER_MONEYGUY_ACCEPT:
kanafix "*もちにげするなよ!",newLine
.byte   stopText
MSG_REINDEER_MONEYGUY_DECLINE:
kanafix "*さからうんじゃねえ!",newLine
.byte   stopText
MSG_REINDEER_MONEYGUY_AFTER:
kanafix "*ひとが ひっしでにげてるときに",newLine
kanafix "はなしかけるんじゃないよッ!",newLine
.byte   stopText

MSG_REINDEER_COP2:
kanafix "*すごく はらのでた おとこを",newLine
kanafix "みたか?",newLine
.byte   stopText
MSG_REINDEER_COP2_ACCEPT:
kanafix "*にげられたようだな。",newLine
kanafix "あきらめてスピ-ドいはんでも",newLine
kanafix "つかまえよう。",newLine
.byte   stopText
MSG_REINDEER_COP2_DECLINE:
kanafix "*"
.byte   favFood
kanafix "を 5にんまえも",newLine
kanafix "くいにげしたんだ。",newLine
kanafix "みかけたらおしえてくれ。",newLine
.byte   stopText

MSG_REINDEER_FULLGIRL:
kanafix "*ああ はらがきつい。 ゲ-ップ。",newLine
.byte   stopText

MSG_REINDEER_ELLAYGUY:
kanafix "*このまちも",newLine
kanafix "ぶっそうになったもんだ。",newLine
.byte   pauseText
kanafix "*だけど バレンタインのまちよりは",newLine
kanafix "ましだよ。",newLine
.byte   stopText

MSG_REINDEER_SINGINGGUY:
kanafix "*オ- イエ-ッ! のってるかい?",newLine
.byte   stopText
MSG_REINDEER_SINGINGGUY_ACCEPT:
kanafix "*イエイッ! おいらのうたを",newLine
kanafix "ききたいかい?",newLine
.byte   stopText
MSG_REINDEER_SINGINGGUY_DECLINE:
kanafix "*おいらは じてんしゃにのってるぜ。",newLine
.byte   stopText
MSG_REINDEER_SINGINGGUY_DECLINE2:
kanafix "*もう おわかれのじかんに",newLine
kanafix "なっちまうのかい‥‥",newLine
.byte   stopText

MSG_REINDEER_DRAGONGIRL:
kanafix "*ドラゴンの こもりうた きいた?",newLine
.byte   stopText

MSG_REINDEER_SPOOKANEGIRL:
kanafix "*ハロウィ-ンのまちのどこかに‥‥",newLine
.byte   pauseText
kanafix "*ゆ",newLine
.byte   pauseText
kanafix "*ゆっ",newLine
.byte   pauseText
kanafix "*ゆゆゆゆ",newLine
.byte   pauseText
kanafix "*ゆうれいやしきが あるそうよ。",newLine
kanafix "ぜったいに いかないほうがいいわ。",newLine
.byte   stopText

MSG_REINDEER_FLEABAGGIRL:
kanafix "*なんでもいいから ものをくれ。",newLine
.byte   pauseText
kanafix "*くれ。",newLine
.byte   pauseText
kanafix "*ください。",newLine
.byte   pauseText
kanafix "*くれますか?",newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL2:
kanafix "*おれいは ぜひ させてもらうよ。",newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL_DECLINE:
kanafix "*いいものを あげるんだけどなぁ。",newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL_ACCEPT:
kanafix "*なにをくれるね?",newLine
.byte   stopText
MSG_REINDEER_FLEABAGGIRL_GIVE:
kanafix "*ありがとうよ。 これはおれいの",newLine
kanafix "ノミとシラミだ。",newLine
kanafix "もっていってくれ。",newLine
.byte   stopText

MSG_REINDEER_FLUGUY:
kanafix "*カゼが はやってて‥‥",newLine
kanafix "ハ-ックショ-イ!",newLine
kanafix "んちくしょおっ!",newLine
.byte   stopText

MSG_REINDEER_RUMORMWGUY:
kanafix "*やまのなかに‥‥",newLine
.byte   pauseText
kanafix "*かぜひとつひかずに",newLine
kanafix "300ねん いきてるっていう",newLine
kanafix "よげんしゃのじいさんがいるらしい。",newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHGUY_DENTURELESS:
kanafix "*ひひぇひゃひょ ひょひょひへ",newLine
kanafix "ふはく ひゃひぇひぇひゃひんひゃ。",newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHKID:
kanafix "*いまの せんせいと",newLine
kanafix "ふつうに しゃべるのは",newLine
kanafix "わたしでも むりです。",newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHGUY_DENTURES:
kanafix "*おお",newLine
kanafix "いればを さがしてくれたおれいに ",newLine
kanafix "ながいきのひけつをおしえてやろう。",newLine
.byte   pauseText
kanafix "*うがいを よく することじゃ。",newLine
.byte   pauseText
kanafix "*カゼをひいたら うがいでなおせ。",newLine
.byte   pauseText
kanafix "*わしの とくせいの",newLine
kanafix "うがいぐすりを もっていきなさい。",newLine
kanafix "ホレ。",newLine
.byte   stopText

MSG_MISLAY_MOUTHWASHKID_TAKE:
kanafix "*また うがいぐすりですか?",newLine
kanafix "さぁ もっていきなさい。",newLine
.byte   pauseText
kanafix "*こんどは"
.byte   price
kanafix "ドル",newLine
kanafix "いただきますよ。",newLine
kanafix "ガラガラッ ペッ。",newLine
.byte   stopText

MSG_REINDEER_COLDGUY:
kanafix "*カゼがげんいんで",newLine
kanafix "しんじゃったやつも いるらしいぜ。",newLine
.byte   stopText

MSG_SPOOKANE_RUMORGUY:
kanafix "*ハロウィ-ンのまちの",newLine
kanafix "ゆうれいやしきの はなしは",newLine
kanafix "きいたかい?",newLine
.byte   stopText
MSG_SPOOKANE_RUMORGUY_ACCEPT:
kanafix "*だれもいないやしきから",newLine
kanafix "ピアノの メロディ-が",newLine
kanafix "きこえてくるんだってな。",newLine
.byte   stopText
MSG_SPOOKANE_RUMORGUY_DECLINE:
kanafix "*しらなきゃ しらないほうがいい。",newLine
.byte   stopText

MSG_SPOOKANE_HOTELBELLHOP:
kanafix "*ふっふっふっふふふ。",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_NOBODYHERE:
kanafix "*だれも いないよ。 くっくっく。",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_WORSTNIGHTMARE:
kanafix "*これは あくむ。",newLine
kanafix "さめることのない わるいゆめ‥‥",newLine
kanafix "ひっひっひ。",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_TURNBACK:
kanafix "*か  え  れ",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_AGH:
kanafix "*ギャ-----ッ!",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_NEVERMAKEIT:
kanafix "*"
.byte   partyLead
kanafix "! しぬぞ。",newLine
kanafix "ひっひっひっひっひっひっひっひっ",newLine
kanafix "‥‥くくくくく。",newLine
.byte   stopText

MSG_ROSEMARYHOUSE_MOUSE:
kanafix "*あっしは",newLine
kanafix "あやしい ねずみじゃありやせん。",newLine
.byte   pauseText
kanafix "*ピアノのあるへや‥‥",newLine
kanafix "へっへっへ。",newLine
.byte   stopText

MSG_SPOOKANE_ROSEMARYGUY:
kanafix "*ゆうれいやしきは",newLine
kanafix "ロ-ズマリ-さんの ものだ。",newLine
.byte   stopText

MSG_SPOOKANE_SMALLGUY:
kanafix "*おれのうちも",newLine
kanafix "ゆうれいがでるように",newLine
kanafix "なったんだけどさ。",newLine
.byte   pauseText
kanafix "*うさぎごやみたいに せまいから",newLine
kanafix "イヤだって でてったよ。",newLine
.byte   stopText

MSG_SPOOKANE_HINTGIRL:
kanafix "*わたしは",newLine
kanafix "このまちの にんげんというよりは",newLine
kanafix "ゲ-ムのアシスタントなの。",newLine
.byte   pauseText
kanafix "*あなた メモしわすれていること",newLine
kanafix "あるんじゃない?",newLine
.byte   pauseText
kanafix "*ひとつのヒントを",newLine
.byte   price
kanafix "ドルで おしえるけど",newLine
kanafix "かう?",newLine
.byte   stopText
MSG_SPOOKANE_HINTGIRL_DECLINE:
kanafix "*あら ずいぶん じしんがあるのね。",newLine
kanafix "じゃ もう あわないようにするわ。",newLine
.byte   stopText
MSG_SPOOKANE_HINTGIRL_ACCEPT:
kanafix "*ヒントは3つまでよ。",newLine
kanafix "あとは‥‥  ひ.み.つ。",newLine
.byte   stopText

MSG_SPOOKANE_CLOWN:
kanafix "*このハロウィ-ンのまちで",newLine
kanafix "いちばんの ひょうきんものが",newLine
kanafix "おれさ。",newLine
.byte   pauseText
kanafix "*ほかのやつらって",newLine
kanafix "なんか インキだろ?",newLine
.byte   stopText
MSG_SPOOKANE_CLOWN_ACCEPT:
kanafix "*そうなんだよな。",newLine
kanafix "おれも ほんとは あかるいほうでも",newLine
kanafix "ないんだ‥‥",newLine
.byte   stopText
MSG_SPOOKANE_CLOWN_DECLINE:
kanafix "*そうかなぁ。",newLine
.byte   pauseText
kanafix "*おれ",newLine
kanafix "じぶんが くらいのかも",newLine
kanafix "しれないな。",newLine
.byte   stopText

MSG_SPOOKANE_MRSROSEMARY:
kanafix "*うちのやしきが",newLine
kanafix "ばけもののすみかに",newLine
kanafix "なってしまって‥‥",newLine
.byte   pauseText
kanafix "*わしらは こんなところでくらして",newLine
kanafix "いるですよ。",newLine
.byte   stopText

MSG_TWINKLE_LABLLOYD:
kanafix "*"
.byte   lloydName
kanafix " ",newLine
kanafix "「きみの もってる",newLine
kanafix "ロケットの ねんりょうは",newLine
kanafix "ほらっ ぼくのもってる この‥‥",newLine
.byte   pauseText
kanafix "*すっごいだろ。 あっ!」",newLine
.byte   stopText

MSG_MTITOI_GIEGUEPRISON_GUY1:
kanafix "*くらくて よくみえないが",newLine
kanafix "あんた"
.byte   unk4
kanafix "は もしかすると",newLine
.byte   pauseText
kanafix "*スノ-マンまちの きょうかいの",newLine
kanafix "むすめさん"
.byte   unk4
kanafix "だな‥‥ たしか",newLine
.byte   anaName
kanafix "ちゃん‥‥ とかいう。",newLine
.byte   pauseText
kanafix "*おかあさんは ずっとおくのへやに",newLine
kanafix "とじこめられて いるはずだ。",newLine
.byte   pauseText
kanafix "*しかし わたしたちを",newLine
kanafix "いま たすけるのは むりだ。",newLine
.byte   pauseText
kanafix "*とにかく あの マザ-シップを",newLine
kanafix "なんとか できなければ‥‥",newLine
.byte   stopText

MSG_TWINKLE_SCIENTISTROCKET3:
kanafix "*おお!",newLine
kanafix "うちゅうくうかんへと とびさった。",newLine
kanafix "あるいみで だいせいこうだ。",newLine
.byte   stopText

MSG_SPOOKANE_MRSROSEMARY_KEY:
kanafix "*まぁ あなたって ほんとうに",newLine
kanafix "すてきなかた‥‥",newLine
.byte   pauseText
kanafix "*いつまでも",newLine
kanafix "みつめていたいくらい‥‥",newLine
.byte   pauseText
kanafix "*あなたなら きっと あのやしきを",newLine
kanafix "とりもどして くれるわね‥‥",newLine
.byte   pauseText
kanafix "*ハイ これが あのいえのカギよ。",newLine
kanafix "うふっ。",newLine
.byte   stopText

MSG_SPOOKANE_NINTENROSEMARY:
kanafix "*ぼくちゃん",newLine
.byte   nintenName
kanafix "っていうの。",newLine
.byte   pauseText
kanafix "*もとの なまえは",newLine
kanafix "バグエラ-.ロ-ズマリ-",newLine
kanafix "っていうんだ。",newLine
.byte   stopText

MSG_SPOOKANE_MRSROSEMARY1:
kanafix "*"
.byte   nintenName
kanafix "のバカ!",newLine
.byte   pauseText
kanafix "*いえ",newLine
kanafix "うちのこに いったんですのよ。",newLine
.byte   stopText
MSG_SPOOKANE_MRSROSEMARY2:
kanafix "*ゆうれいは",newLine
kanafix "まだ でるみたいだけど",newLine
.byte   pauseText
kanafix "あなたって ほんとうに",newLine
kanafix "ゆうかんなかた!",newLine
.byte   pauseText
kanafix "*わたし‥‥",newLine
kanafix "むすこに あなた"
.byte   unk4
kanafix "の なまえを",newLine
kanafix "いただきましたのよ。",newLine
.byte   stopText

MSG_SNOWMAN_TRAIN:
kanafix "*しゅうてんの スノ-マンえきだ。",newLine
.byte   stopText

MSG_SNOWMAN_YOUNGTOWNGUY:
kanafix "*イ-スタ-のまちでは",newLine
kanafix "じゅうみんが ぜんぶ",newLine
kanafix "かみかくしにあっちまったらしいよ。",newLine
.byte   stopText

MSG_SNOWMAN_TRAINDAUGHTER:
kanafix "*ママが イ-スタ-のまちに",newLine
kanafix "いってるの。",newLine
.byte   pauseText
kanafix "*なんにちも れんらくがないから",newLine
kanafix "パパとさがしにいくのよ。",newLine
.byte   stopText

MSG_SNOWMAN_SPOOKANEGUY:
kanafix "*ハロウィ-ンのまちの",newLine
kanafix "ゆうれいやしきには いったか?",newLine
.byte   stopText
MSG_SNOWMAN_SPOOKANEGUY_ACCEPT:
kanafix "*こんど ゆっくり",newLine
kanafix "はなしを きかせてくれ。",newLine
.byte   pauseText
kanafix "*おれは コワイはなしが",newLine
kanafix "だいすきなんだ。",newLine
.byte   stopText
MSG_SNOWMAN_SPOOKANEGUY_DECLINE:
kanafix "*おれは いきたくないけど",newLine
kanafix "おまえ いくといいぞ。",newLine
.byte   stopText

MSG_SNOWMAN_COLDGUY:
kanafix "*このスノ-マンのまちは",newLine
kanafix "さむいから カゼひくなよ。",newLine
.byte   pauseText
kanafix "*はみがきも しろよ。",newLine
.byte   pauseText
kanafix "*ゴホッ ゴホッ‥‥",newLine
.byte   stopText

MSG_SNOWMAN_LIFEGIRL:
kanafix "*じんせいは ゲ-ムよ。",newLine
kanafix "やすんだり もどったりも",newLine
kanafix "だいじなのよ。",newLine
.byte   stopText

MSG_SNOWMAN_SCHOOLGUY:
kanafix "*"
.byte   anaName
kanafix "が",newLine
kanafix "がっこうやすんでるから",newLine
kanafix "しんぱいでよう。",newLine
.byte   stopText
MSG_SNOWMAN_SCHOOLGUY2:
kanafix "*おれ "
.byte   anaName
kanafix "のことが",newLine
kanafix "しんぱいで しんぱいで",newLine
kanafix "よるも ねられねぇ。",newLine
.byte   stopText

MSG_ELLAY_JAILCOP_NOMONEY:
kanafix "*かねが たりないぜ。",newLine
.byte   stopText

MSG_SNOWMAN_NOSEGIRL:
kanafix "*あれあれ ハナミズがたれてるよ。",newLine
.byte   stopText

MSG_SNOWMAN_PHONE_2:
kanafix "*ちょっと このゲ-ムをしている",newLine
kanafix "プレイヤ- のかたに",newLine
kanafix "かわってくれないか。",newLine
.byte   stopText

MSG_SNOWMAN_PHONE_1:
kanafix "*だいじな ようじが あるんだ。",newLine
.byte   stopText

MSG_SNOWMAN_PHONE_3:
kanafix "*もしもし いつも "
.byte   nintenName
kanafix "が",newLine
kanafix "おせわになっております。",newLine
.byte   pauseText
kanafix "*わたくし そのこのちちで",newLine
kanafix "ございますが",newLine
.byte   pauseText
kanafix "*あなたさまの おなまえを",newLine
kanafix "きかせて いただこうと",newLine
kanafix "ぞんじまして‥‥",newLine
.byte   pauseText
kanafix "*よろしくおねがい いたします。",newLine
.byte   stopText

MSG_SNOWMAN_PHONE_END:
kanafix "*どうも おいそがしいところを",newLine
kanafix "ありがとうございました。",newLine
.byte   pauseText
kanafix "*わたくしも いそがしいので",newLine
kanafix "では これでしつれいいたします。",newLine
.byte   stopText

MSG_SNOWMAN_ANA_NINTEN:
kanafix "*"
.byte   partyLead
kanafix "‥‥でしょ?",newLine
.byte   stopText

MSG_SNOWMAN_ANA_SILLY:
kanafix "*ふざけないでね。",newLine
.byte   stopText

MSG_SNOWMAN_ANA_GO:
kanafix "*わたしが",newLine
kanafix "ママを さがしにいくために",newLine
.byte   pauseText
kanafix "あなた"
.byte   unk4
kanafix "の たすけが",newLine
kanafix "ひつようだったの。",newLine
kanafix "まっていたわ‥‥"
.byte   partyLead
kanafix "。",newLine
.byte   pauseText
kanafix "*まず イ-スタ-のまちへ",newLine
kanafix "いってみましょう。",newLine
.byte   stopText

MSG_SNOWMAN_ANA:
kanafix "*あなたに とってもよくにたひとを",newLine
kanafix "ゆめで みたことがあるわ。",newLine
.byte   stopText

MSG_MTITOI_ANA:
kanafix "*"
.byte   nintenName
kanafix "‥‥そばにいて?",newLine
.byte   stopText

MSG_MTITOI_ANA_NO:
kanafix "*いやっ!",newLine
kanafix "そばにいて‥‥おねがい。",newLine
.byte   stopText

MSG_MTITOI_ANA2:
kanafix "*しずかね。 おどりましょ?",newLine
.byte   stopText

MSG_MTITOI_ANALOVE_NO:
kanafix "*‥‥そうね。",newLine
kanafix "こんなことしてるときじゃないわね。",newLine
kanafix "ごめんなさい。",newLine
.byte   stopText

MSG_MTITOI_ANALOVE:
kanafix "*"
.byte   nintenName
kanafix "‥‥",newLine
kanafix "わたしのこと すき?",newLine
.byte   stopText

MSG_TWINKLE_LLOYDMATTER:
kanafix "*"
.byte   lloydName
kanafix "ったら どうしたの。",newLine
.byte   stopText

MSG_MAGICANT_DRAGON_NOWAKE:
kanafix "*ドラゴンは ねむっている。",newLine
.byte   pauseText
kanafix "*いまの "
.byte   partyLead
kanafix "には",newLine
kanafix "まだ ドラゴンを",newLine
kanafix "おこすことは できない。",newLine
.byte   stopText

MSG_MAGICANT_DRAGON_WAKE:
kanafix "*"
.byte   partyLead
kanafix "のけはいを かんじて",newLine
kanafix "ドラゴンが めをさました。",newLine
.byte   pauseText
kanafix "「ワタシヨリ ヨワイモノニ",newLine
kanafix "コノ ガクフヲ ワタスコトハ",newLine
kanafix "デキナイ。」",newLine
.byte   stopText

MSG_SNOWMAN_PRIEST:
kanafix "*むすめの"
.byte   anaName
kanafix "は",newLine
kanafix "おくびょうだけれど",newLine
.byte   pauseText
kanafix "やさしいこころと ふしぎなちからを",newLine
kanafix "もっている。",newLine
.byte   stopText

MSG_SNOWMAN_PRIEST_AFTER:
kanafix "*あなたがたは",newLine
kanafix "かならず しょうりする。",newLine
.byte   pauseText
kanafix "*わたしたちのいのりが",newLine
kanafix "きっと ちかいうちに",newLine
kanafix "ききとどけられるだろう。",newLine
.byte   pauseText
kanafix "*いまは おやすみ。",newLine
.byte   stopText

MSG_MERRYSVILLE_PASSTRIGGER:
kanafix "*"
.byte   partyLead
kanafix "は おとしものの",newLine
kanafix "つうこうきょかしょうを みつけた。",newLine
.byte   stopText

MSG_ELLAY_TOWER_ROCKET:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
kanafix "ロケットに のりこんだ。",newLine
.byte   stopText

MSG_SNOWMAN_YUCCAGIRL:
kanafix "*アドベントのさばくに",newLine
kanafix "おじいちゃんがいるの。",newLine
kanafix "もしあったら よろしくね。",newLine
.byte   stopText

MSG_YUCCA_NICEBONES:
kanafix "*わたしは",newLine
kanafix "よいひとの しかばねです。",newLine
.byte   pauseText
kanafix "*だから おそいかかったり",newLine
kanafix "しませんよ。",newLine
.byte   stopText

MSG_YUCCA_SIGNBONES:
kanafix "*わたし めじるしとして",newLine
kanafix "べんりでしょ。",newLine
.byte   stopText

MSG_YUCCA_BRAVEBONES:
kanafix "*したいに はなしかけるなんて",newLine
kanafix "どきょうのあるこどもだなぁ。",newLine
.byte   stopText

MSG_YUCCA_CAMELBONES:
kanafix "*わたしゃ ラクダのホネですが",newLine
kanafix "さばくでの あるきかたを",newLine
kanafix "しりたいですか?",newLine
.byte   stopText
MSG_YUCCA_CAMELBONES_ACCEPT:
kanafix "*みぎあしが しずみこむまえに",newLine
kanafix "ひだりあしを だす。",newLine
.byte   pauseText
kanafix "*ひだりあしが しずむまえに",newLine
kanafix "みぎあしを だす。",newLine
.byte   pauseText
kanafix "*これが わかるのに ひゃくねんも",newLine
kanafix "かかったです。",newLine
.byte   stopText
MSG_YUCCA_CAMELBONES_DECLINE:
kanafix "*おしえたいなぁ。 しりたいですか?",newLine
.byte   stopText

MSG_YUCCA_GAMEBONES:
kanafix "*このゲ-ムのなかで",newLine
kanafix "いちばん たいくつなのは",newLine
kanafix "このアドベントのさばくなんです。",newLine
.byte   pauseText
kanafix "*でも ほんとに ぢらいには",newLine
kanafix "きをつけてね。",newLine
.byte   stopText

MSG_YUCCA_SIGN:
kanafix "「アドベントさばく",newLine
kanafix "ゆうらんひこうは いかがかね?」",newLine
.byte   stopText

MSG_YUCCA_PILOT_MINE:
kanafix "*わしは まえのまえの",newLine
kanafix "せんそうのときに このさばくに",newLine
kanafix "ぢらいをうめたんじゃ。",newLine
.byte   pauseText
kanafix "*ぜんぶ ほりおこしたつもりだったが",newLine
kanafix "どうしても ひとつだけみつからん。",newLine
kanafix "きをつけてくれよ。",newLine
.byte   stopText
MSG_YUCCA_PILOT_RIDE:
kanafix "*おお ひこうきにのるか?",newLine
.byte   stopText
MSG_YUCCA_PILOT_RIDE_ACCEPT:
kanafix "*では みんなのぶんで",newLine
.byte   price
kanafix "ドルいただこうか。",newLine
.byte   pauseText
kanafix "*チケットの はんけんは",newLine
kanafix "なくさないようにな。",newLine
.byte   pauseText
kanafix "*すごいぞ。 このはんけんを",newLine
kanafix "10まいためると せんしゃに",newLine
kanafix "のれるのじゃ。",newLine
.byte   pauseText
kanafix "*うれしそうじゃな ハハハ。",newLine
.byte   stopText
MSG_YUCCA_PILOT_RIDE_DECLINE:
kanafix "*ねだんがたかいから むりもないか。",newLine
.byte   stopText

MSG_YUCCA_PILOT_TANK:
kanafix "*おお! 10まい たまったのか。",newLine
kanafix "よしよし せんしゃをかしてやろう。",newLine
.byte   pauseText
kanafix "*うれしそうじゃな ハハハ。",newLine
.byte   stopText

MSG_ELLAY_PILOT:
kanafix "*せんしゃを こわしたな。",newLine
kanafix "わしのだいじな せんしゃを‥‥",newLine
kanafix "オロオロ。",newLine
.byte   pauseText
kanafix "*せんしゃの しゅうりひを",newLine
kanafix "べんしょうしてくれ。",newLine
.byte   price
kanafix "ドルだぞ。",newLine
.byte   pauseText
kanafix "*いますぐはらうか?",newLine
.byte   stopText
MSG_ELLAY_PILOT_ACCEPT:
kanafix "*ああよかった。 いざ さらば。",newLine
.byte   stopText
MSG_ELLAY_PILOT_DECLINE:
kanafix "*わしは おこったぞ。",newLine
kanafix "うっうっうううう‥‥",newLine
.byte   stopText

MSG_YOUNGTOWN_PARENTGIRL:
kanafix "*パパいない。 ママいない。",newLine
.byte   stopText

MSG_YOUNGTOWN_GUARD:
kanafix "*ぼくわ もんばんだ。",newLine
kanafix "おまえわ だれだ。",newLine
.byte   stopText

MSG_YOUNGTOWN_GUARD2:
kanafix "*あ あやしいやつわ",newLine
kanafix "やっつけるぞ‥‥ブルブル。",newLine
.byte   stopText

MSG_YOUNGTOWN_BABYGIRL:
kanafix "*ガリクソンさんちの あかちゃんは",newLine
kanafix "なんかへん。 ぜったいへん。",newLine
kanafix "なんか すごいきがするわ。",newLine
.byte   stopText

MSG_YOUNGTOWN_MATHGUY:
kanafix "*え-と 2たす3は5。",newLine
kanafix "8ひく4は4‥‥ おれは",newLine
kanafix "いつも べんきょうしてるんだ。",newLine
.byte   stopText

MSG_YOUNGTOWN_MOMGIRL:
kanafix "*ママ-! さみしいよ-",newLine
.byte   stopText

MSG_YOUNGTOWN_DADGUY:
kanafix "*パパ-! さみしいよ-",newLine
.byte   stopText

MSG_YOUNGTOWN_SHIPGIRL:
kanafix "*でっかい そらとぶふねが",newLine
kanafix "おとなたちを みんな",newLine
kanafix "つれてっちゃったの。",newLine
.byte   stopText

MSG_YOUNGTOWN_GROWNUPGUY:
kanafix "*おとなたちが いなくて",newLine
kanafix "せいせいしたぜ グスン。",newLine
.byte   stopText

MSG_YOUNGTOWN_HOLDMEGIRL:
kanafix "*おねえちゃん オッパイ!",newLine
.byte   stopText

MSG_YOUNGTOWN_HOLDMEGUY:
kanafix "*ぼくも オッパイ!",newLine
.byte   stopText

MSG_YOUNGTOWN_HOLDMEGUY2:
kanafix "*オッパイ!",newLine
.byte   stopText

MSG_YOUNGTOWN_PLEASEGIRL:
kanafix "*パパや ママを つれもどして。",newLine
kanafix "おねがいします。",newLine
.byte   stopText

MSG_YOUNGTOWN_TOMGARRICKSON:
kanafix "*あ どうも。 ぼく",newLine
kanafix "トム.ガリクソンっていいます。",newLine
kanafix "しゅみは じこしょうかいです。",newLine
.byte   stopText

MSG_YOUNGTOWN_MYSTICGIRL:
kanafix "*このベビ-は ふしぎなちからを",newLine
kanafix "もっているって",newLine
kanafix "いつかママがいってたわ。",newLine
.byte   stopText

MSG_YOUNGTOWN_BABYTALK:
kanafix "*アプ- アプ- バブバブ。",newLine
.byte   stopText

MSG_YOUNGTOWN_BABY:
kanafix "*わたしは このベビ-の いしき。",newLine
kanafix "わたしも あなたたちと おなじ",newLine
kanafix "エスパ-だ。",newLine
.byte   pauseText
kanafix "*テレポ-トの ちからを",newLine
kanafix "もっている。",newLine
.byte   pauseText
kanafix "*あなたの しっている ところなら",newLine
kanafix "どこにでもいける。",newLine
.byte   pauseText
kanafix "*("
.byte   nintenName
.byte   unk4
kanafix "は",newLine
kanafix "ベビ-の いしきから",newLine
.byte   pauseText
kanafix "テレポ-テ-ションの PSIを",newLine
kanafix "うけついだ。)",newLine
.byte   stopText

MSG_YOUNGTOWN_VOICEGUY:
kanafix "*とうちゃんたちの こえが",newLine
kanafix "やまのほうで きこえたような",newLine
kanafix "きがするんだ。",newLine
.byte   pauseText
kanafix "*でも やまは バレンタインのまちの",newLine
kanafix "むこうなんだ。",newLine
kanafix "とおすぎて ぼくには いけない。",newLine
.byte   stopText

MSG_ELLAY_JAILCOP_NOROOM:
kanafix "*なんだよ。 もちきれないんじゃ",newLine
kanafix "やれないよ。",newLine
.byte   stopText

MSG_ELLAY_LHCOP_JAIL:
kanafix "*つきひは たったが",newLine
kanafix "おまえは まだ みせいねんだな。",newLine
.byte   stopText

MSG_ELLAY_BBGANGFAKE:
kanafix "*きをつけて あるきなよ",newLine
kanafix "おまえたち。",newLine
kanafix "へっへっへ‥‥",newLine
.byte   stopText

MSG_ELLAY_BBGANGWOMAN:
kanafix "*まったく ブラックブラッドだんの",newLine
kanafix "やつらときたひにゃ‥‥",newLine
.byte   stopText

MSG_ELLAY_BBGANGGIRL:
kanafix "*ブラックブラッドだんってなまえは",newLine
kanafix "ながいから みんなブラブラだんと",newLine
kanafix "よんでいるのよ。",newLine
.byte   stopText

MSG_ELLAY_BBGANGWOMAN2:
kanafix "*おまえ"
.byte   unk4,newLine
kanafix "ブラブラだんの なかまじゃ",newLine
kanafix "ないだろうね。",newLine
.byte   stopText

MSG_ELLAY_CLOUDGUY:
kanafix "*やまのうえに くろいくもが",newLine
kanafix "かかってからというものは",newLine
.byte   pauseText
kanafix "ひとも まちも",newLine
kanafix "おかしくなっちまったよ。",newLine
.byte   stopText

MSG_ELLAY_PEACEGUY:
kanafix "*よっ! よっ!",newLine
kanafix "そっちのおふたりさんは",newLine
kanafix "こいびとどうしかね?",newLine
.byte   stopText
MSG_ELLAY_PEACEGUY_DEFAULT:
kanafix "*あいしあってるかい。 イエ-。",newLine
.byte   stopText
MSG_ELLAY_PEACEGUY_DECLINE:
kanafix "*いいや こころのおくには",newLine
kanafix "あいが めばえちゃってるんじゃ",newLine
kanafix "ないの。",newLine
.byte   stopText

MSG_ELLAY_TICKETGUY:
kanafix "*ライブハウスのチケットあるよ。",newLine
.byte   price
kanafix "ドルで かうかね?",newLine
.byte   stopText
MSG_ELLAY_JAILCOP_HASWEAPON_ACCEPT:
kanafix "*ほれよ!",newLine
kanafix "デパ-トじゃ うりきれだもんな。",newLine
.byte   stopText
MSG_ELLAY_JAILCOP_HASWEAPON_DECLINE:
kanafix "*ケチンボなガキどもだぜ。",newLine
.byte   stopText

MSG_ELLAY_SECRETGIRL:
kanafix "*いいことおしえてあげるわよ。",newLine
kanafix "しりたい?",newLine
.byte   stopText
MSG_ELLAY_SECRETGIRL_ACCEPT:
kanafix "*ブラブラだんのボスの",newLine
.byte   teddyName
kanafix "って ほんみょうは",newLine
.byte   teddyName
kanafix "ざえもんっていうのよ。",newLine
.byte   pauseText
kanafix "*うわさだけどね。",newLine
.byte   stopText
MSG_ELLAY_SECRETGIRL_DECLINE:
kanafix "*きっと こうかいするわよ。",newLine
.byte   stopText

MSG_ELLAY_LHBACKROOMGUY:
kanafix "*がくやを のぞいちゃダメよ。",newLine
kanafix "どえらいめに あうからね。",newLine
.byte   stopText

MSG_ELLAY_LHDRINKGIRL_OFFER:
kanafix "*すいたらしい ひと。",newLine
kanafix "ふ-ん "
.byte   partyLead
kanafix "っていうの。",newLine
kanafix "ビ-ルをおごるわ。 のんで。",newLine
.byte   stopText
MSG_ELLAY_LHDRINKGIRL_OFFER_REFUSE:
kanafix "*おまわりが こわいのね。",newLine
kanafix "なさけないやつ‥‥",newLine
.byte   stopText
MSG_ELLAY_LHDRINKGIRL:
kanafix "*もうビ-ルは おごらないわ。",newLine
.byte   stopText

MSG_ELLAY_LHCOP_JAILSHAME:
kanafix "*はんせいしたか?",newLine
.byte   stopText
MSG_ELLAY_LHCOP_JAILSHAME_YES:
kanafix "*もう にどとしないなら",newLine
kanafix "かえってよろしい。",newLine
.byte   pauseText
kanafix "*あぶないものは",newLine
kanafix "あずかっておくからな。",newLine
.byte   stopText
MSG_ELLAY_LHCOP_JAILSHAME_NO:
kanafix "*じゃ もういちにち",newLine
kanafix "あたまをひやしていろ。",newLine
.byte   stopText

MSG_ELLAY_JAILCOP_HASWEAPON:
kanafix "*へっへっへ",newLine
kanafix "このあいだ "
.byte   item
kanafix "が",newLine
kanafix "てに はいったんだよ。",newLine
.byte   pauseText
kanafix "*"
.byte   price
kanafix "ドルで かわないか?",newLine
.byte   stopText

MSG_ELLAY_PILOT_NOMONEY:
kanafix "*おかねが たりないぞ。",newLine
kanafix "うっうっううう‥‥",newLine
.byte   stopText

MSG_ELLAY_LHTEDDYGIRL:
kanafix "*"
.byte   teddyName
kanafix "は",newLine
kanafix "やまのばけものに りょうしんを",newLine
kanafix "ころされてしまったの。",newLine
.byte   pauseText
kanafix "*それまではやさしくて",newLine
kanafix "ひょうきんなこだったのよ。",newLine
.byte   stopText

MSG_ELLAY_LHTEDDYGIRL2:
kanafix "*"
.byte   teddyName
kanafix "が むかしのように",newLine
kanafix "やさしくなってくれたら",newLine
kanafix "うれしいな。",newLine
.byte   stopText

MSG_ELLAY_LHBOUNCERGUY_OFFER:
kanafix "*あんた"
.byte   unk4
kanafix "も うたうかね。",newLine
.byte   stopText
MSG_ELLAY_LHBOUNCERGUY_OFFER_YES:
kanafix "*じゃあ けいきのいいやつを",newLine
kanafix "やってくれ。",newLine
.byte   stopText
MSG_ELLAY_LHBOUNCERGUY_OFFER_NO:
kanafix "*シャイな こだね。",newLine
.byte   stopText

MSG_ELLAY_LHCUTEGUY2:
kanafix "*"
.byte   anaName
kanafix "ちゃんっ!",newLine
kanafix "いやなに ぼうしに なまえが",newLine
kanafix "かいてあったからさ。",newLine
.byte   stopText
