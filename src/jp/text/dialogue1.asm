.segment        "PRG18": absolute

.byte 0

MSG_MYHOME_MINNIE_INVASION:
kanafix "*おにいちゃん こわい。",newLine
kanafix "でんきスタンドが くるったように", newLine
kanafix "あばれだしたの。",newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT:
kanafix "*おにいちゃ-ん!",newLine
kanafix "おうちが こわれちゃうよう!",newLine
.byte   stopText
MSG_MYHOME_MINNIE_INVASION_FIGHT_2:
kanafix "*ウェ-ン。",newLine
.byte   stopText

MSG_MYHOME_JUICE:
kanafix "*はい おにいちゃん ジュ-ス。",newLine
kanafix "おなかすいたでしょ。",newLine
.byte   stopText

kanafix "*こわ-い!",newLine
kanafix "おにんぎょうが あばれだしたの!",newLine
.byte   stopText

MSG_MYHOME_MIMMIE_INVASION_FIGHT:
kanafix "*こわかったぁ。",newLine
kanafix "あっ! おにんぎょうのなかに",newLine
kanafix "なにかあるみたい。",newLine
.byte   stopText

MSG_MYHOME_MIMMIE:
kanafix "*わたし ミミ-よ。",newLine
kanafix "ミニ-と まちがえちゃいや。",newLine
.byte   stopText

MSG_MYHOME_MOM_INVASION:
kanafix "*だいじょうぶだった?",newLine
.byte   nintenName
kanafix " ",newLine
.byte   pauseText
kanafix "*このいえは いったい",newLine
kanafix "どうなっているのかしら。",newLine
kanafix "オロオロ。",newLine
.byte   pauseText
kanafix "*こんなときに パパがいてくれたら",newLine
kanafix "いいのかもしれないけど‥‥",newLine
.byte   stopText

MSG_MYHOME_MOM:
kanafix "*あなたって おもってたより",newLine
kanafix "ずっと ゆうかんなこだったのね。",newLine
.byte   pauseText
kanafix "*‥‥でも あなたを",newLine
kanafix "つらいたびに だしたくないわ。",newLine
.byte   stopText

MSG_MYHOME_MOM_HURT:
kanafix "*まぁ ずいぶんきずついて‥‥",newLine
.byte   stopText

MSG_PHONE_NEXTLVL:
kanafix "*え-と つぎのレベルまで‥‥",newLine
.byte   stopText

MSG_MYHOME_MOM_EAT:
kanafix "*また",newLine
.byte   favFood
kanafix "が たべたくなったら",newLine
kanafix "かえってくるのよ。",newLine
.byte   stopText

MSG_MYHOME_PHONE:
kanafix "*ふむふむ‥‥ そうか",newLine
kanafix "それは ラップげんしょうだな。",newLine
.byte   pauseText
kanafix "*どうすればいいのかは‥‥",newLine
kanafix "パパにもわからないな。",newLine
.byte   pauseText
kanafix "*しかし ひいおじいさんが",newLine
kanafix "PSIの けんきゅうを",newLine
kanafix "していたはずだ。",newLine
.byte   pauseText
kanafix "*ちかしつをさがせば",newLine
kanafix "なにか わかるかもしれない。",newLine
.byte   pauseText
kanafix "*ちかしつのカギは‥‥",newLine
kanafix "どこかに つけておいたんだが‥‥",newLine
.byte   pauseText
kanafix "*わすれた。",newLine
.byte   pauseText
kanafix "*とにかく おまえだけがたよりだ。",newLine
kanafix "いまこそ ぼうけんのときだ。",newLine
kanafix "すすめ ",nintenName,"!",newLine
.byte   pauseText
kanafix "*みんなを まもってくれ。",newLine
.byte   stopText

MSG_PHONE_END:
kanafix "*ガチャン ツ-ツ-ツ-",newLine
.byte   stopText
MSG_PHONE_INTRO:
kanafix "*あ パパだ。",newLine
.byte   stopText
MSG_PHONE_NEWMONEY:
kanafix "*"
.byte   nintenName
kanafix "の ぎんこうこうざに",newLine
.byte   cashDeposit
kanafix "ドル",newLine
kanafix "ふりこんでおいたからね。",newLine
.byte   pauseText
kanafix "*おまえ"
.byte   unk4
kanafix "が",newLine
kanafix "つかったぶんと さしひきで",newLine
.byte   pauseText
.byte   currentCash;correct
kanafix "ドル",newLine
kanafix "ぎんこうに はいっているはずだ。",newLine
.byte   pauseText
kanafix "*だいじに つかいなさい。",newLine
.byte   stopText

MSG_PHONE_RESETPROMPT:
kanafix "*おせっかいかもしれないが",newLine
kanafix "ちょっと きゅうけいしては",newLine
kanafix "どうかね。",newLine
.byte   stopText

MSG_PHONE_SAVE_YES:
kanafix "*そうか。",newLine
kanafix "じゃ きろくしとくよ。",newLine
.byte   stopText

MSG_PHONE_SAVE_NO:
kanafix "*そうか。",newLine
kanafix "ま ちきゅうの ききだからな。",newLine
.byte   stopText

MSG_PHONE_SAVED_RESETPROMPT:
kanafix "*そうか。",newLine
kanafix "パパも もう きょうは",newLine
kanafix "やすもうと おもってたところだ。",newLine
.byte   pauseText
kanafix "*たたかいのきろくは",newLine
kanafix "つけといたよ。",newLine
.byte   pauseText
kanafix "*おやすみ‥‥",newLine
.byte   stopText
MSG_PHONE_RESET_YES:
kanafix "*おたがい よくやったよな。",newLine
.byte   pauseText
kanafix "*それじゃ リセットボタンを",newLine
kanafix "おしながら でんげんを OFFに",newLine
kanafix "しなさい。 わかったね。",newLine
.byte   stopText
MSG_PHONE_RESET_NO:
kanafix "*"
.byte   partyLead
kanafix "も ママににて",newLine
kanafix "がんばりやだなぁ。",newLine
.byte   pauseText
kanafix "*むりするなよ。",newLine
.byte   stopText
MSG_PHONE_SAVEPROMPT:
kanafix "*それはそうと なんのようだい?",newLine
.byte   stopText
MSG_PHONE_GOODLUCK:
kanafix "*がんばれよ。",newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_THANKS:
kanafix "*こんにちは。",newLine
kanafix "わたしも ピッピも",newLine
kanafix "すっごく げんきよ。",newLine
.byte   stopText

MSG_PODUNK_CEMETERYGUY1:
kanafix "*おまえ まさか",newLine
kanafix "みなみの はかばから",newLine
kanafix "きたんじゃないだろうな。",newLine
.byte   stopText
MSG_PODUNK_CEMETERYGUY2:
kanafix "*おまえ すごいな。",newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY1:
kanafix "*おまえ まさか",newLine
kanafix "ゾンビじゃないだろうな。",newLine
kanafix "ゾンビか?",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY2:
kanafix "*ゾ ゾ ゾンビの‥‥",newLine
kanafix "バカッ! ヒャ--",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY3:
kanafix "*ほんとに にんげんか?",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY4:
kanafix "*よく ここまで こられたな。",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY5:
kanafix "*やっぱりな‥‥",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY6:
kanafix "*おれ  こわくて",newLine
kanafix "おもらししそうだよ。",newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY7:
kanafix "*こわかったよなぁ。",newLine
.byte   stopText

MSG_PODUNK_ZOMBIE:
kanafix "*ゾンビ-!",newLine
.byte   stopText
MSG_PODUNK_ZOMBIE2:
kanafix "*フフフフフ‥‥",newLine
kanafix "おまえも ゾンビに なれ!",newLine
.byte   stopText

MSG_PODUNK_NECROMANCERWOMAN1:
kanafix "*ししゃたちを うごかしている",newLine
kanafix "なにものかが いるらしい。",newLine
.byte   stopText
MSG_PODUNK_NECROMANCERWOMAN2:
kanafix "*おわかいの やるではないか。",newLine
.byte   stopText

MSG_PODUNK_WARYGUY:
kanafix "*このまちも ゾンビに",newLine
kanafix "せんりょうされてしまうのか。",newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL1:
kanafix "*あら カナリアのヒナね。",newLine
kanafix "カナリアむらで てにいれたの?",newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL2:
kanafix "*へ-え。",newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL3:
kanafix "*カナリアむらの ことりなら",newLine
kanafix "きれいなうたを",newLine
kanafix "うたうはずだものね。",newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL4:
kanafix "*わたし カナリアむらの",newLine
kanafix "おじさんに あこがれてるのよ。",newLine
.byte   stopText

MSG_PODUNK_MAYORGUY:
kanafix "*ちょうちょうさんは",newLine
kanafix "ゆうきのある すけっとを",newLine
kanafix "さがしておられる。",newLine
.byte   stopText

MSG_PODUNK_CONCERNEDGUY:
kanafix "*はかばに こどもが",newLine
kanafix "まよいこんだっていうけど",newLine
kanafix "たすかったのかなぁ。",newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY1:
kanafix "*おまえ‥‥",newLine
kanafix "ほんとに はかばに いくつもりか?",newLine
.byte   stopText
MSG_PODUNK_SENSIBLEGUY2:
kanafix "*じょうしきを わきまえた",newLine
kanafix "こどもだと おもったな オレは。",newLine
.byte   stopText

MSG_PODUNK_EVENTGIRL1:
kanafix "*どうぶつたちは",newLine
kanafix "くるって あばれだすし",newLine
.byte   pauseText
kanafix "*しにんは",newLine
kanafix "ゾンビになっておそってくるし‥‥",newLine
.byte   pauseText
kanafix "*どうすればいいのよ。",newLine
kanafix "ヒ-ヒ-‥‥",newLine
.byte   stopText
MSG_PODUNK_EVENTGIRL2:
kanafix "*あなたって スゴイ!",newLine
.byte   stopText

MSG_PODUNK_POLTERGUY:
kanafix "*おまえんち ポルタ-ガイストに",newLine
kanafix "みまわれなかったか?",newLine
kanafix "おれんちなんか たいへんだったぜ。",newLine
.byte   stopText

MSG_PODUNK_ZOOGUY:
kanafix "*どうぶつえんは",newLine
kanafix "くるったどうぶつが これいじょう",newLine
kanafix "にげださないよう",newLine
kanafix "かんぜんに へいさしたそうだぜ。",newLine
.byte   stopText

MSG_PODUNK_BREADGIRL:
kanafix "*パンは たべることもできるけれど",newLine
kanafix "ちぎって パンくずにすると",newLine
kanafix "めじるしに なるんじゃないかな。",newLine
.byte   pauseText
kanafix "*‥‥おせっかい ですけどね。",newLine
.byte   stopText

MSG_MAYOR_HELPTOWN:
kanafix "*きみでは むりかなぁ。",newLine
kanafix "きたいしてるんだけどなぁ。",newLine
.byte   stopText

MSG_MAYOR_PIPPIQUEST:
kanafix "*いやなに‥‥",newLine
kanafix "はかばに こどもがまよいこんでね。",newLine
.byte   pauseText
kanafix "*つぎの ちょうちょうせんきょも",newLine
kanafix "ちかいし‥‥",newLine
kanafix "‥‥たすけてチョ-ダイ!",newLine
.byte   stopText

MSG_MAYOR_PIPPIQUESTYES:
kanafix "*えっ いってくれるか。",newLine
kanafix "たすけだして くれるってか。",newLine
.byte   stopText

MSG_MAYOR_RETURNPIPPI:
kanafix "*そのこが まいごになった",newLine
kanafix "ピッピちゃんかね。",newLine
.byte   pauseText
kanafix "*いやいや すばらしい。",newLine
.byte   pauseText
kanafix "*みどころのあるしょうねんだと",newLine
kanafix "おもって いたが。",newLine
.byte   pauseText
kanafix "*はくしゅ パチパチパチ‥‥",newLine
.byte   pauseText
kanafix "*よかったねぇ",newLine
kanafix "かわいいピッピちゃん。",newLine
.byte   pauseText
kanafix "*ママに ちょうちょうさんに",newLine
kanafix "たすけてもらったと",newLine
kanafix "ちゃんというんだよ。",newLine
.byte   pauseText
kanafix "*"
.byte   partyLead
kanafix "くんにも",newLine
kanafix "しょうきんを "
.byte   price
kanafix "ドル",newLine
kanafix "あげよう。 ホレッ。",newLine
.byte   stopText

MSG_MAYOR_SEE_ZOO:
kanafix "*ところで",newLine
kanafix "ついでといっては なんだが",newLine
.byte   pauseText
kanafix "*どうぶつえんの じけんのほうも",newLine
kanafix "ひとがんばりしてみちゃ",newLine
kanafix "くれないかね?",newLine
.byte   stopText

MSG_MAYOR_SEE_ZOO_ACCEPT:
kanafix "*そうか やっぱりいってくれるか!",newLine
.byte   partyLead
kanafix "くん きみも",newLine
kanafix "ほんとに ゲ-ムずきだねぇ。",newLine
.byte   pauseText
kanafix "*どうぶつえんの カギは",newLine
kanafix "じょやくの アボットから",newLine
kanafix "もらいなさい。",newLine
.byte   stopText

MSG_ABBOTT_GET_KEY:
kanafix "*はい",newLine
kanafix "これが どうぶつえんのカギです。",newLine
.byte   stopText

MSG_MAYOR_HERO:
kanafix "*いきてかえって きみは えいゆう!",newLine
kanafix "からだのぐあいさえよければ",newLine
kanafix "わたしも いくんだけど‥‥",newLine
.byte   stopText

MSG_MAYOR_POST_ZOO:
kanafix "*おお",newLine
kanafix "えいゆうの "
.byte   partyLead
kanafix "くん。",newLine
kanafix "ふくに とらのふんがついているよ。",newLine
.byte   pauseText
kanafix "*あ うそ うそ。",newLine
kanafix "こんどは なにも",newLine
kanafix "あげるものがないが‥‥",newLine
kanafix "ワハハハハハ。",newLine
.byte   stopText

MSG_SECRETARY_ANA:
kanafix "*ふしぎな しょうじょの",newLine
kanafix "うわさは きいてるかしら?",newLine
.byte   pauseText
kanafix "*きっと きみの たびを",newLine
kanafix "たすけてくれると おもうの。",newLine
.byte   stopText

MSG_ABBOTT_NEWKEY:
kanafix "*どうぶつえんのカギくらい",newLine
kanafix "いくらでもあります。",newLine
kanafix "はい またひとつあげましょう。",newLine
.byte   stopText

MSG_PETVENDOR_INTRO:
kanafix "*みてのとおり どうぶつたちは",newLine
kanafix "みんなにげだしちまった。",newLine
.byte   stopText

MSG_PETVENDOR_INTRO2:
kanafix "*いるのは カナリアのヒナだけだ。",newLine
kanafix "かうかね?",newLine
.byte   stopText

MSG_PETVENDOR_PITCH:
kanafix "*じゃ "
.byte   price
kanafix "ドルで かうかね?",newLine
.byte   stopText

MSG_PETVENDOR_DECLINE:
kanafix "*うたをしらないカナリアだからなぁ。",newLine
.byte   stopText

MSG_PETVENDOR_ACCEPTPITCH:
kanafix "*かわいがってね。 ありがとさん。",newLine
.byte   stopText

MSG_PETVENDOR_DECLINEPITCH:
kanafix "*ただでも いらないかね?",newLine
kanafix "もっていきな。",newLine
.byte   stopText

MSG_PETVENDOR_CANARYCHECK:
kanafix "*カナリアは まだ げんきかね。",newLine
.byte   stopText

MSG_PETVENDOR2_BRAINWASH:
kanafix "*どうぶつたちは きっと なにかに",newLine
kanafix "あやつられていると おもうの。",newLine
.byte   stopText

MSG_PETVENDOR2_CUTEPETS:
kanafix "*どうぶつは かわいいわよね。",newLine
.byte   stopText

MSG_PODUNK_PIPPI_MEET_NOYES:
kanafix "*うふっ。",newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY2_LLOYD:
kanafix "*バ-カ!",newLine
.byte   stopText

MSG_RETURNS_INTRO:
kanafix "*いらっしゃいませ。",newLine
kanafix "また ごへんぴんですね。",newLine
.byte   stopText

MSG_REINDEER_DRAGONGIRL_CHECK:
kanafix "*"
.byte   partyLead
kanafix "の こころに",newLine
kanafix "なにかが といかけてきている。",newLine
.byte   stopText

MSG_RETURNS_DECLINE:
kanafix "*ああ よかった。",newLine
.byte   stopText

MSG_RETURNS_ACCEPT:
kanafix "*これからも とうデパ-トを",newLine
kanafix "よろしくおひきたてくださいませね。",newLine
kanafix "うっふん。",newLine
.byte   stopText

MSG_PODUNK_CASHCARDWOMAN:
kanafix "*デパ-トの 1かいに",newLine
kanafix "ちょきんを おろせる きかいが",newLine
kanafix "できたのは いいんだけどね。",newLine
.byte   pauseText
kanafix "*キャなんとかカ-ドが ないと",newLine
kanafix "おろせないってのが ふべんね。",newLine
.byte   stopText

MSG_CANARY_MAN:
kanafix "*いいてんきじゃ。 しかし",newLine
kanafix "それがどうしたと いうのだろう。",newLine
.byte   stopText
MSG_CANARY_MAN_BABY:
kanafix "*ありゃ きみのカナリアは",newLine
kanafix "うたひめロ-ラのこどもじゃないか。",newLine
kanafix "ロ-ラに とどけてやっておくれ。",newLine
.byte   stopText
MSG_CANARY_MAN_BABY_NO:
kanafix "*きみは なにか たいせつなことを",newLine
kanafix "わすれているな。 かなしいことだ。",newLine
.byte   stopText
MSG_CANARY_MAN_BABY_YES:
kanafix "*ロ-ラは どこにいたかな‥‥",newLine
.byte   stopText
MSG_CANARY_MAN_MELODY:
kanafix "*うたひめロ-ラが うたを",newLine
kanafix "おもいだしてくれたようだ。",newLine
kanafix "きみも メロディ-をおぼえたかい?",newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_NO:
kanafix "*だ-めだ そりゃ。",newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_YES:
kanafix "*うたは ちからなり‥‥",newLine
kanafix "まことに そのとおりじゃ。",newLine
.byte   stopText

MSG_GRAVEYARD_PIPPI:
kanafix "*わたしは まいごのピッピだよ。",newLine
kanafix "あなたって ゆうき あるね。",newLine
.byte   stopText

MSG_PODUNK_PIPPI_BRAVE_YES:
kanafix "*この おちょうしもの。 ハハハ。",newLine
.byte   stopText
MSG_PODUNK_PIPPI_BRAVE_NO:
kanafix "*ゆうきあるわよ。",newLine
kanafix "また いつか どこかで",newLine
kanafix "あえるといいね?",newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_YES:
kanafix "*うれしい。 このバッヂは",newLine
kanafix "やくそくのしるしよ。",newLine
kanafix "ハイ うけとって。",newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_NO:
kanafix "*すきなひとがいるのね。",newLine
kanafix "きっと‥‥",newLine
.byte   stopText

MSG_PODUNK_MAYORPIPPI:
kanafix "*じゃ ここでバイバイ。",newLine
.byte   pauseText
kanafix "*わたしの もっている グッズは",newLine
kanafix "あとで わたしのうちに",newLine
kanafix "とりにきてね。",newLine
.byte   pauseText
kanafix "*ところで‥‥",newLine
kanafix "わたしのくつした みじかすぎる?",newLine
.byte   stopText

MSG_PODUNK_MAYORPIPPI_YES:
kanafix "*こたえなくてもよかったのに。",newLine
kanafix "かわいいひと‥‥",newLine
.byte   stopText

MSG_ZOO_GATEMONKEY:
kanafix "*キャッキャッキャッ",newLine
kanafix "(おまえの かあさんでべそ!)",newLine
.byte   stopText

MSG_MAGICAVE_SHELLQUESTION:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は",newLine
kanafix "「かみのしっぽは どこにある。」",newLine
kanafix "という こえをきいた。",newLine
.byte   stopText

MSG_MAGICANT_CLOTHINGMAN:
kanafix "*ありゃりゃ。 かわったふくを",newLine
kanafix "きているな おめぇ。",newLine
.byte   pauseText
kanafix "*そんなにめだつふくを きてると",newLine
kanafix "まものが よってくるだよ。",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN:
kanafix "*しあわせは あるいてこない。",newLine
kanafix "だども ふしあわせも",newLine
kanafix "あるいちゃこねぇよなぁ。",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_YES:
kanafix "*さいなんに であいたくなかったら",newLine
kanafix "いっぽも あるかねぇこった。",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_NO:
kanafix "*そうか",newLine
kanafix "ふしあわせは あるくか‥‥",newLine
kanafix "しらなんだ。",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_AFTER:
kanafix "*おらの センスを みとめただか。",newLine
kanafix "おめぇも カッコイイあだなが",newLine
kanafix "ほしいだな?",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_AFTER_YES:
kanafix "*できた。",newLine
kanafix "いまから おめぇは",newLine
kanafix "うすのろぶた "
.byte   partyLead
kanafix "だ。",newLine
.byte   pauseText
kanafix "*おしゃれな ム-ドになったぞ。",newLine
.byte   stopText

MSG_TRAIN_DECLINE:
kanafix "*そうか。 ざんねんだな。",newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_QUEST:
kanafix "*やぁ うすのろぶた"
.byte   partyLead
kanafix "。",newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN:
kanafix "*しあわせについて",newLine
kanafix "てつがくしてるやつに あったか?",newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN_YES:
kanafix "*やつは",newLine
kanafix "あだなをつける めいじんなんだ。",newLine
kanafix "さいこうに センスが いいんだぜ。",newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN_NO:
kanafix "*あわなきゃ わかれもないわけだ。",newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN:
kanafix "*あわなきゃ わかれもないっていう",newLine
kanafix "かんがえのおとこに あったか?",newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN_YES:
kanafix "*おれも そんなかんがえかた",newLine
kanafix "してるんだ。",newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN_NO:
kanafix "*あったほうが ためになるぞ。",newLine
.byte   stopText

MSG_MAGICANT_STRENGTHMAN:
kanafix "*クイ-ンマリ-の いずみで",newLine
kanafix "すっかり げんきになったわ。",newLine
.byte   stopText

kanafix "*クイ-ンマリ-のいずみは",newLine
kanafix "とおいのが つらいわよねぇ。",newLine
kanafix "わかりにくい ばしょにあるし。",newLine
.byte   stopText

MSG_MAGICANT_EARRINGGIRL:
kanafix "*この こわれたイヤリングを",newLine
kanafix "いずみにもっていって まほうの",newLine
kanafix "イヤリングにするの。",newLine
.byte   stopText

MSG_MAGICANT_FOUNTAINMAN:
kanafix "*いずみのふしぎなおとを きくと",newLine
kanafix "それだけで おちつくよなぁ。",newLine
.byte   stopText

MSG_MAGICANT_RESTROOMBOY:
kanafix "*もっと みなみ。",newLine
kanafix "みちにまよったのかい。",newLine
.byte   pauseText
kanafix "*ごめん ごめん",newLine
kanafix "いま おしえたのは",newLine
kanafix "トイレのばしょだった。",newLine
.byte   pauseText
kanafix "*クイ-ンマリ-の いずみなら",newLine
kanafix "おしろから にしに いくんだよ。",newLine
.byte   stopText

MSG_MAGICANT_INNBOY:
kanafix "*スプ-ンを まげちゃったら",newLine
kanafix "ごはんが たべにくいや。",newLine
kanafix "おにいちゃんもとに もどせる?",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_YES:
kanafix "*はやく もどして。",newLine
.byte   pauseText
kanafix "*("
.byte   nintenName
kanafix "は",newLine
kanafix "PSIのちからで スプ-ンを",newLine
kanafix "もとに もどしてやった。)",newLine
.byte   pauseText
kanafix "*あんがと。",newLine
kanafix "パクパク モシャモシャ。",newLine
kanafix "うちにこんやは とまっていきなよ?",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_NO:
kanafix "*どうしてぇ!?",newLine
.byte   stopText

MSG_MAGICANT_STRANGEGIRL:
kanafix "*あなた へんなかんじの かたね。",newLine
kanafix "でも にくめないタイプ‥‥",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_STAY:
kanafix "*よかった。",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_NOSTAY:
kanafix "*うぇ-ん。 ひとのしんせつは",newLine
kanafix "うけるものだよ。",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER1:
kanafix "*あら たびのかた",newLine
kanafix "うちで おしょくじしていったら?",newLine
.byte   pauseText
kanafix "*さぁ",newLine
kanafix "きょうのメニュ-は なんでしょう?",newLine
kanafix "わかる?",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER1_NO:
kanafix "*まぁ どうしてわからないのかしら。",newLine
kanafix "あやしいひと!",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER2:
kanafix "*そう "
.byte   favFood
kanafix "。",newLine
.byte   pauseText
kanafix "*あなたのこころを よんで",newLine
.byte   favFood
kanafix "にしたのよ。",newLine
kanafix "おいしい?",newLine
.byte   stopText

MSG_MAGICANT_MUSICVENDOR:
kanafix "*うちは がっきや だったんだけど",newLine
kanafix "ちゅうもんした オカリナが",newLine
kanafix "ぜんぜん できてこないの。",newLine
.byte   pauseText
kanafix "*もう あきらめた-っと。",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER2_NO:
kanafix "*あら そう。",newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER3:
kanafix "*ありがとう",newLine
kanafix "ベッドのよういも できてるわ。",newLine
kanafix "ゆっくりおやすみ。",newLine
.byte   stopText

MSG_MAGICANT_INNBOY_AGAINNO:
kanafix "*えんりょしないで",newLine
kanafix "また とまっていきなよ。",newLine
.byte   stopText

MSG_MAGICANT_STRANGERBOY:
kanafix "*おまえ",newLine
kanafix "なんか このくにに なじまない",newLine
kanafix "かおしてるなぁ?",newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN:
kanafix "*きぼうのオカリナができたんだ。",newLine
.byte   pauseText
kanafix "*きみのしってる メロディ-が",newLine
kanafix "ながれるんだよ。",newLine
.byte   pauseText
kanafix "*ほしいか?",newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN_YES:
kanafix "*すなおな しょうねんだな。",newLine
kanafix "はい どうぞ。 アハハハハ。",newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN_NO:
kanafix "*ほしいって かおに かいてあるよ。",newLine
kanafix "アハハハハ もっていきな。",newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN_AFTER:
kanafix "*よっ ぼうず げんきか。",newLine
.byte   stopText

MSG_MAGICANT_NOEXITBOY:
kanafix "*マジカントのくにに",newLine
kanafix "でぐちなんてものが あるものかね。",newLine
kanafix "アハハハ。",newLine
.byte   stopText

MSG_MAGICANT_OUTSIDEMAN:
kanafix "*そと?",newLine
kanafix "そとのせかいって なんのこったね?",newLine
.byte   stopText

MSG_MAGICANT_HOLEGIRL:
kanafix "*あなが あったら",newLine
kanafix "はいりたいですわ。",newLine
kanafix "もし あったら だけどね。",newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER:
kanafix "*わたしは ふしぎな",newLine
kanafix "にもつあずかりにん。",newLine
.byte   pauseText
kanafix "*ごようですか?",newLine
.byte   stopText

MSG_MAGICANT_MIMICKER:
kanafix "*ぼく ものまねが うまいんだぜ。",newLine
.byte   stopText

MSG_MAGICANT_HOLEMAN:
kanafix "*まちの ひがしのほうに",newLine
kanafix "あなが たくさんあるんだ。",newLine
.byte   pauseText
kanafix "*どの あなか わからないんだけど",newLine
kanafix "べつの せかいの おとが",newLine
kanafix "きこえてくるんだ。",newLine
.byte   stopText

MSG_MAGICANT_REDWEEDGIRL:
kanafix "*あかいくさを ひっこぬいて",newLine
kanafix "いずみにつければ なんと",newLine
kanafix "マジックハ-ブになるだよ。",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_ASK:
kanafix "*でっかいふくろは いるかね?",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_CARD:
kanafix "*じゃ あんたのキャッシュカ-ドを",newLine
kanafix "しばらくかしてくれんかね。",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_ASK_NO:
kanafix "*マジックハ-ブが 30たんいも",newLine
kanafix "はいっているんだぜ。",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_RETURN2:
kanafix "*ありがとう かならず かえすよ。",newLine
kanafix "なんか",newLine
kanafix "カッコイイな とおもってね。",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_CARD_NO:
kanafix "*あんたは にんげんを",newLine
kanafix "うたがうことを しっとるな。",newLine
kanafix "そのほうが いいかもしれんが‥‥",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_RETURN1:
kanafix "*ああ キャッシュカ-ドを",newLine
kanafix "かえさなきゃな。",newLine
.byte   stopText

MSG_MAGICANT_SICKNESSGUY:
kanafix "*クイ-ンは いま ちょっと",newLine
kanafix "からだの ぐあいがわるいの。",newLine
.byte   stopText

MSG_MAGICANT_GUARD1:
kanafix "*あやしい かおだな。",newLine
kanafix "わしのナゾナゾがわかったら",newLine
kanafix "ここをとおして やるけどな‥‥",newLine
.byte   stopText

MSG_MAGICANT_GUARD2:
kanafix "*そうでした。",newLine
kanafix "こたえは わに にひき。",newLine
.byte   pauseText
kanafix "*もんだいは",newLine
kanafix "まだ かんがえてなかったんだよ",newLine
kanafix "ヘヘヘ。",newLine
.byte   stopText

MSG_MAGICANT_GUARD_BYE:
kanafix "*ごきげんよう。",newLine
.byte   stopText

MSG_MAGICANT_QUEENGUY:
kanafix "*クイ-ンの うたを",newLine
kanafix "また ききたいな。",newLine
.byte   stopText

MSG_MAGICANT_GUITARIST_UNDER:
kanafix "*ハロ-!",newLine
kanafix "おれは てつがくしていたところだ。",newLine
.byte   pauseText
kanafix "*ギタ-のおとが じゃまで ものを",newLine
kanafix "かんがえられないよ。",newLine
.byte   pauseText
kanafix "*あっ!",newLine
kanafix "じぶんが ギタ-をひいていたのか。",newLine
kanafix "まいった まいった。",newLine
.byte   pauseText
kanafix "*‥‥‥‥‥‥‥‥",newLine
.byte   pauseText
kanafix "*ここからの はなしは",newLine
kanafix "ぜったいに ないしょなんだが",newLine
.byte   pauseText
kanafix "すっごく つよくなったら",newLine
kanafix "おれに あいにこい。",newLine
.byte   pauseText
kanafix "*それと このことは",newLine
kanafix "ぜったいに わすれないように",newLine
kanafix "メモなんか しとくと いいぞ。",newLine
.byte   stopText

MSG_MTITOI_HEALERFAIL:
kanafix "*おれを むししようとしたな。",newLine
kanafix "さみしいもんだぜ。",newLine
kanafix "こんなところで ひとりぼっちでさ。",newLine
.byte   pauseText
kanafix "*できることなら なんでもするぜ。",newLine
kanafix "ホラッ!",newLine
.byte   stopText

MSG_MTITOI_HEALER:
kanafix "*うれしいよな-",newLine
kanafix "おまえらが きてくれて。",newLine
.byte   pauseText
kanafix "*わかってるって",newLine
kanafix "やってほしいことは。",newLine
kanafix "ホラッ!",newLine
.byte   stopText

MSG_MAGICANT_GUITARMAN_SONG:
kanafix "*おれ ついに うたをつくったんだ。",newLine
kanafix "きけ!",newLine
kanafix "おんがくずきの ぼうけんか"
.byte   unk4
kanafix "よ。",newLine
.byte   pauseText
kanafix "「キュ-ピ-にんぎょう なぜなくの",newLine
kanafix "それは カナリアが なくからよ",newLine
.byte   pauseText
kanafix "サルが うたえば ピアノもうたう",newLine
kanafix "ピアノは おばけが ひくのかな",newLine
.byte   pauseText
kanafix "さばくのサボテン さみしそう",newLine
kanafix "ひとりで よなよな うたってる",newLine
.byte   pauseText
kanafix "ドラゴンたおれて おんぷがのこる",newLine
kanafix "イヴが さいごに うたうとき",newLine
kanafix "クイ-ンマリ-に じかんが もどる",newLine
.byte   pauseText
kanafix "ラララ ふしぎなララバイよ",newLine
kanafix "ララバイ バイバイ さようなら」",newLine
.byte   pauseText
kanafix "*いいうただろ。",newLine
kanafix "いいうただよなぁ‥‥",newLine
.byte   stopText

MSG_MAGICANT_GUITARGIRL:
kanafix "*もりのおくに こどくをあいする",newLine
kanafix "ギタ-ひきが いるの。",newLine
.byte   pauseText
kanafix "*ちょっといいおとこで‥‥",newLine
kanafix "しかも すっごく しじんなの。",newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_1:
kanafix "*ゆうじょうの ゆびわ ほしい?",newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_2:
kanafix "*じゃ あなたは わたしの",newLine
kanafix "おともだちになるのよ。",newLine
kanafix "いい?",newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_3:
kanafix "*‥‥そんなきが‥‥したわ。",newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_4:
kanafix "*わたしのこと わすれちゃだめよ。",newLine
kanafix "ぜったいに。",newLine
.byte   stopText

MSG_MAGICANT_NORMALMONKEY:
kanafix "*おれは うたわないサルだ。",newLine
.byte   pauseText
kanafix "*でも ふつうサルってのは",newLine
kanafix "うたわないもんだ。",newLine
kanafix "しつもんは あるか?",newLine
.byte   stopText

MSG_MAGICANT_NORMALMONKEY_YES:
kanafix "*ぐもんだね‥‥どうせ。",newLine
.byte   stopText

MSG_MAGICANT_NORMALMONKEY_NO:
kanafix "*よかった。",newLine
kanafix "つっこんだ しつもんをされたら",newLine
kanafix "どうしようと おもってたんだ。",newLine
.byte   pauseText
kanafix "*それにしても おまえ",newLine
kanafix "クイ-ンマリ-に かおが",newLine
kanafix "にてるなぁ。",newLine
.byte   pauseText
kanafix "*どうしてだろ。",newLine
.byte   stopText

MSG_MERRYSVILLE_TRAINWOMAN:
kanafix "*あんた"
.byte   unk4
kanafix "に あったら",newLine
kanafix "いおうと おもってたんだ。",newLine
.byte   pauseText
kanafix "*せんろが なおって",newLine
kanafix "でんしゃが",newLine
kanafix "とおれるように なったってね。",newLine
.byte   stopText

MSG_MAGICANT_MARYGIRL:
kanafix "*わたし",newLine
kanafix "いっしょうに いちどでいいから",newLine
kanafix "おしろに はいって",newLine
.byte   pauseText
kanafix "*マリ-さまの おかおを",newLine
kanafix "はいけんしたいわ。",newLine
.byte   stopText

MSG_MAGICANT_NIGHTMAREGUY:
kanafix "*たまに クイ-ンマリ-は",newLine
kanafix "うなされてるんだ。",newLine
.byte   pauseText
kanafix "*わるいこを しかりつけるような",newLine
kanafix "ことをいって",newLine
.byte   pauseText
kanafix "*こわい こわい となきさけぶのさ。",newLine
.byte   pauseText
kanafix "*そして",newLine
kanafix "うたを うたいはじめるんだ。",newLine
kanafix "ほんのすこしだけ‥‥",newLine
.byte   pauseText
kanafix "*で おもいだせないって",newLine
kanafix "くるしがってさ。 あせびっしょり",newLine
kanafix "かいて めざめるわけさ。",newLine
.byte   pauseText
kanafix "*クイ-ンマリ-は むかし",newLine
kanafix "よっぽど かなしい",newLine
kanafix "ひどいめに あったのかな。",newLine
.byte   stopText

MSG_MAGICANT_ANACAT_GIRLS:
kanafix "*でも",newLine
kanafix "おんなのこにしか あげないよ。",newLine
.byte   stopText

MSG_MTITOI_TEDDY_SLEEP:
kanafix "*ぐ-ぐ-ぐ-‥‥",newLine
.byte   stopText

kanafix "*うそつきめ!",newLine
.byte   stopText

MSG_MAGICANT_LOVEGUY_ONYXHOOK:
kanafix "*あなた"
.byte   unk4
kanafix "が このくにのひとで",newLine
kanafix "ないことは みんなしってるわ。",newLine
kanafix "でも なかまだと おもっているの。",newLine
.byte   pauseText
kanafix "*めのうのつりばり さえあれば",newLine
kanafix "いつでもかえってこられるはず。",newLine
.byte   stopText

MSG_MAGICANT_LOVEGUY:
kanafix "*きっと また かえってくるのよ。",newLine
kanafix "くるしいときに ここに‥‥",newLine
.byte   pauseText
kanafix "*みんな あなた"
.byte   unk4
kanafix "を",newLine
kanafix "すきなんだから。",newLine
.byte   stopText

MSG_MAGICANT_MARIA:
kanafix "*ようこそ "
.byte   partyLead
kanafix "。",newLine
.byte   pauseText
kanafix "*このマジカントこくでは みんなが",newLine
kanafix "ともだちになれるし ほしいものは",newLine
kanafix "すきなだけ えられるのですよ。",newLine
.byte   pauseText
kanafix "*えっ",newLine
kanafix "わたしのうたが ききたいの?",newLine
.byte   pauseText
kanafix "*ごめんなさい。",newLine
kanafix "どうしても おもいだせない。",newLine
.byte   pauseText
kanafix "*いつか きっと",newLine
kanafix "おもいだして うたえるはず‥‥",newLine
.byte   pauseText
kanafix "*あのうたを うたえたときに",newLine
kanafix "そう‥‥なにかが おこるの。",newLine
.byte   stopText

MSG_CANARY_GENERIC:
kanafix "*‥‥。",newLine
.byte   stopText

MSG_MAGICANT_MARIA1:
kanafix "*あなた"
.byte   unk4
kanafix "の おぼえてきたうたを",newLine
kanafix "わたしに きかせて。",newLine
.byte   stopText

MSG_MAGICANT_MARIA2:
kanafix "*そう。 そう‥‥このうただった。",newLine
.byte   stopText

MSG_MAGICANT_MARIA3:
kanafix "*ああ‥‥ギ-グ‥‥",newLine
.byte   stopText

MSG_MAGICANT_VANISHGIRL:
kanafix "*わたし このマジカントこくが",newLine
kanafix "きえて なくなっちゃう",newLine
kanafix "ゆめをみたのよ。",newLine
.byte   pauseText
kanafix "*まだ",newLine
kanafix "しんぞうが ドキドキしてるわ。",newLine
.byte   stopText

MSG_MAGICANT_ANACAT1:
kanafix "*ぼくは ぢめんを およぐねこ。",newLine
kanafix "ぼくの てのなかに",newLine
kanafix "はいってるものを あててごらん。",newLine
.byte   stopText

MSG_MAGICANT_ANACAT2:
kanafix "*ぼくの てのなかに",newLine
kanafix "はいっているものが みえたかい?",newLine
.byte   pauseText
kanafix "*そう。 リボン。",newLine
kanafix "ふしぎなちからのわくリボンさ。",newLine
.byte   stopText

MSG_MAGICANT_ANACAT3:
kanafix "*おんなのこには",newLine
kanafix "このふしぎなリボンを あげようね。",newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT:
kanafix "*おれは およぐ ねこ。",newLine
.byte   pauseText
kanafix "*よわいこに ゆうきと ちからを",newLine
kanafix "あたえる キャンディを",newLine
kanafix "しってるかい?",newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT_NOLLOYD:
kanafix "*そうか。 でも きみは",newLine
kanafix "つよいこだから いらないな。",newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT_NO:
kanafix "*そっちの メガネのこは",newLine
kanafix "よわそうだから あげような。",newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT_AFTER:
kanafix "*キャンディ おいしかっただろ?",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTBOY:
kanafix "*おたすけじいさんを",newLine
kanafix "よびたかったら",newLine
kanafix "マリ-の いずみに ゆくのだ。",newLine
.byte   pauseText
kanafix "*こころの さけびで やってくる。",newLine
kanafix "こころの さけびだ!",newLine
.byte   stopText

MSG_ELLAY_LHBOUNCERGUY_STONE:
kanafix "*(おきゃくは さわいだ。)",newLine
.byte   pauseText
kanafix "*あの ぼうしかぶった いしは",newLine
kanafix "なんなんだよ! ブ-ブ-。",newLine
.byte   stopText

MSG_MCAVE_QUICKMONKEY_CAUGHT:
kanafix "*よんだか?",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_NO:
kanafix "*そうか。 さいなら。",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_YES:
kanafix "*どうして ほしい?",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_AFTER:
kanafix "*やくにたってるかい?",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_DO_CURE:
kanafix "*そうか。",newLine
kanafix "ちょっと あらりょうじだが",newLine
kanafix "しんぼうするか?",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_DO_CURE2:
kanafix "*えいやっ ホカホカ。",newLine
kanafix "なおった。 さいなら。",newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_LEAVE:
kanafix "*しんでしまうのも",newLine
kanafix "ひとつのたのしみかも しれんな。",newLine
kanafix "さいなら。",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN1:
kanafix "*おれは わすれられたおとこ",newLine
kanafix "いないも どうぜん。",newLine
.byte   pauseText
kanafix "*きづいてくれなくても",newLine
kanafix "よかったのに‥‥",newLine
.byte   pauseText
kanafix "*おれのことなんか",newLine
kanafix "むしして いいんだ。",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN2:
kanafix "*おれは どこにもいないおとこ",newLine
kanafix "やさしいことばなんて",newLine
kanafix "かけてくれたら こまっちゃうぜ。",newLine
.byte   pauseText
kanafix "*ひとこいしく なったら",newLine
kanafix "いきていけない。",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN3:
kanafix "*おれのことばは",newLine
kanafix "いつも ひとりごと。",newLine
.byte   pauseText
kanafix "*うまれたときから きょうまで",newLine
kanafix "ずっと ひとりでいたおとこ。",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN4:
kanafix "*うんがいいとか わるいとか。",newLine
kanafix "そんなことは おれには",newLine
kanafix "かんけいないね。",newLine
.byte   pauseText
kanafix "*いきをするのに せいいっぱいさ。",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN5:
kanafix "*なぜ そんなにしつこく",newLine
kanafix "おれに はなしかけるんだ。",newLine
.byte   pauseText
kanafix "*おまえも",newLine
kanafix "わすれられたおとこなのか?",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN5_YES:
kanafix "*うそを つけ。",newLine
kanafix "おまえを まってる おんなのこの",newLine
kanafix "ところへ かえれ!!",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN6:
kanafix "*そうさ。 そうだよな。",newLine
kanafix "そうなんだ。",newLine
.byte   pauseText
kanafix "*おまえも はやく おれのことを",newLine
kanafix "むししろよ。",newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN7:
kanafix "*そうだ。 ありがとうよ。",newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_NOROOM2:
kanafix "*もちきれないようだな。",newLine
kanafix "また でなおしておいで。",newLine
.byte   stopText

MSG_MERRYSVILLE_RUMORGUY1:
kanafix "*マザ-ズデイのあたりは なんか",newLine
kanafix "とんでもない じけんが",newLine
kanafix "おこってるらしいな。",newLine
.byte   stopText
MSG_MERRYSVILLE_RUMORGUY2:
kanafix "*ゾンビが ゆうかいされて",newLine
kanafix "どうぶつが どうしたとか‥‥",newLine
kanafix "めちゃくちゃらしいな。",newLine
.byte   stopText

MSG_MERRYSVILLE_HOSPITALSIGN:
kanafix "「サンクスギビングのまちに",newLine
kanafix "          ようこそ!!",newLine
kanafix " ",newLine
kanafix "CM--",newLine
kanafix "やすくて はやくて いいおとこ。",newLine
.byte   pauseText
kanafix "いしゃは ビッグベン.ケ-シ-に",newLine
kanafix "かぎる。",newLine
.byte   pauseText
kanafix "いまなら とくべつ ",newLine
kanafix "おおやすちりょう!!",newLine
.byte   pauseText
kanafix "いのちは しんでもまもりたいもの」",newLine
.byte   stopText