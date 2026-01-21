.segment        "PRG18": absolute

.byte 0

MSG_MYHOME_MINNIE_INVASION:
kanafix "*おにいちゃん こわい。"
.byte   newLine
kanafix "でんきスタンドが くるったように"
.byte   newLine
kanafix "あばれだしたの。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT:
kanafix "*おにいちゃ-ん!"
.byte   newLine
kanafix "おうちが こわれちゃうよう!"
.byte   newLine
.byte   stopText
MSG_MYHOME_MINNIE_INVASION_FIGHT_2:
kanafix "*ウェ-ン。"
.byte   newLine
.byte   stopText

MSG_MYHOME_JUICE:
kanafix "*はい おにいちゃん ジュ-ス。"
.byte   newLine
kanafix "おなかすいたでしょ。"
.byte   newLine
.byte   stopText

kanafix "*こわ-い!"
.byte   newLine
kanafix "おにんぎょうが あばれだしたの!"
.byte   newLine
.byte   stopText

MSG_MYHOME_MIMMIE_INVASION_FIGHT:
kanafix "*こわかったぁ。"
.byte   newLine
kanafix "あっ! おにんぎょうのなかに"
.byte   newLine
kanafix "なにかあるみたい。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MIMMIE:
kanafix "*わたし ミミ-よ。"
.byte   newLine
kanafix "ミニ-と まちがえちゃいや。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MOM_INVASION:
kanafix "*だいじょうぶだった?"
.byte   newLine
.byte   nintenName
kanafix " "
.byte   newLine
.byte   pauseText
kanafix "*このいえは いったい"
.byte   newLine
kanafix "どうなっているのかしら。"
.byte   newLine
kanafix "オロオロ。"
.byte   newLine
.byte   pauseText
kanafix "*こんなときに パパがいてくれたら"
.byte   newLine
kanafix "いいのかもしれないけど‥‥"
.byte   newLine
.byte   stopText

MSG_MYHOME_MOM:
kanafix "*あなたって おもってたより"
.byte   newLine
kanafix "ずっと ゆうかんなこだったのね。"
.byte   newLine
.byte   pauseText
kanafix "*‥‥でも あなたを"
.byte   newLine
kanafix "つらいたびに だしたくないわ。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MOM_HURT:
kanafix "*まぁ ずいぶんきずついて‥‥"
.byte   newLine
.byte   stopText

MSG_PHONE_NEXTLVL:
kanafix "*え-と つぎのレベルまで‥‥"
.byte   newLine
.byte   stopText

MSG_MYHOME_MOM_EAT:
kanafix "*また"
.byte   newLine
.byte   favFood
kanafix "が たべたくなったら"
.byte   newLine
kanafix "かえってくるのよ。"
.byte   newLine
.byte   stopText

MSG_MYHOME_PHONE:
kanafix "*ふむふむ‥‥ そうか"
.byte   newLine
kanafix "それは ラップげんしょうだな。"
.byte   newLine
.byte   pauseText
kanafix "*どうすればいいのかは‥‥"
.byte   newLine
kanafix "パパにもわからないな。"
.byte   newLine
.byte   pauseText
kanafix "*しかし ひいおじいさんが"
.byte   newLine
kanafix "PSIの けんきゅうを"
.byte   newLine
kanafix "していたはずだ。"
.byte   newLine
.byte   pauseText
kanafix "*ちかしつをさがせば"
.byte   newLine
kanafix "なにか わかるかもしれない。"
.byte   newLine
.byte   pauseText
kanafix "*ちかしつのカギは‥‥"
.byte   newLine
kanafix "どこかに つけておいたんだが‥‥"
.byte   newLine
.byte   pauseText
kanafix "*わすれた。"
.byte   newLine
.byte   pauseText
kanafix "*とにかく おまえだけがたよりだ。"
.byte   newLine
kanafix "いまこそ ぼうけんのときだ。"
.byte   newLine
kanafix "すすめ "
.byte   nintenName
kanafix "!"
.byte   newLine
.byte   pauseText
kanafix "*みんなを まもってくれ。"
.byte   newLine
.byte   stopText

MSG_PHONE_END:
kanafix "*ガチャン ツ-ツ-ツ-"
.byte   newLine
.byte   stopText
MSG_PHONE_INTRO:
kanafix "*あ パパだ。"
.byte   newLine
.byte   stopText
MSG_PHONE_NEWMONEY:
kanafix "*"
.byte   nintenName
kanafix "の ぎんこうこうざに"
.byte   newLine
.byte   cashDeposit
kanafix "ドル"
.byte   newLine
kanafix "ふりこんでおいたからね。"
.byte   newLine
.byte   pauseText
kanafix "*おまえ"
.byte   unk4
kanafix "が"
.byte   newLine
kanafix "つかったぶんと さしひきで"
.byte   newLine
.byte   pauseText
.byte   currentCash;correct
kanafix "ドル"
.byte   newLine
kanafix "ぎんこうに はいっているはずだ。"
.byte   newLine
.byte   pauseText
kanafix "*だいじに つかいなさい。"
.byte   newLine
.byte   stopText

MSG_PHONE_RESETPROMPT:
kanafix "*おせっかいかもしれないが"
.byte   newLine
kanafix "ちょっと きゅうけいしては"
.byte   newLine
kanafix "どうかね。"
.byte   newLine
.byte   stopText

MSG_PHONE_SAVE_YES:
kanafix "*そうか。"
.byte   newLine
kanafix "じゃ きろくしとくよ。"
.byte   newLine
.byte   stopText

MSG_PHONE_SAVE_NO:
kanafix "*そうか。"
.byte   newLine
kanafix "ま ちきゅうの ききだからな。"
.byte   newLine
.byte   stopText

MSG_PHONE_SAVED_RESETPROMPT:
kanafix "*そうか。"
.byte   newLine
kanafix "パパも もう きょうは"
.byte   newLine
kanafix "やすもうと おもってたところだ。"
.byte   newLine
.byte   pauseText
kanafix "*たたかいのきろくは"
.byte   newLine
kanafix "つけといたよ。"
.byte   newLine
.byte   pauseText
kanafix "*おやすみ‥‥"
.byte   newLine
.byte   stopText
MSG_PHONE_RESET_YES:
kanafix "*おたがい よくやったよな。"
.byte   newLine
.byte   pauseText
kanafix "*それじゃ リセットボタンを"
.byte   newLine
kanafix "おしながら でんげんを OFFに"
.byte   newLine
kanafix "しなさい。 わかったね。"
.byte   newLine
.byte   stopText
MSG_PHONE_RESET_NO:
kanafix "*"
.byte   partyLead
kanafix "も ママににて"
.byte   newLine
kanafix "がんばりやだなぁ。"
.byte   newLine
.byte   pauseText
kanafix "*むりするなよ。"
.byte   newLine
.byte   stopText
MSG_PHONE_SAVEPROMPT:
kanafix "*それはそうと なんのようだい?"
.byte   newLine
.byte   stopText
MSG_PHONE_GOODLUCK:
kanafix "*がんばれよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_THANKS:
kanafix "*こんにちは。"
.byte   newLine
kanafix "わたしも ピッピも"
.byte   newLine
kanafix "すっごく げんきよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CEMETERYGUY1:
kanafix "*おまえ まさか"
.byte   newLine
kanafix "みなみの はかばから"
.byte   newLine
kanafix "きたんじゃないだろうな。"
.byte   newLine
.byte   stopText
MSG_PODUNK_CEMETERYGUY2:
kanafix "*おまえ すごいな。"
.byte   newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY1:
kanafix "*おまえ まさか"
.byte   newLine
kanafix "ゾンビじゃないだろうな。"
.byte   newLine
kanafix "ゾンビか?"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY2:
kanafix "*ゾ ゾ ゾンビの‥‥"
.byte   newLine
kanafix "バカッ! ヒャ--"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY3:
kanafix "*ほんとに にんげんか?"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY4:
kanafix "*よく ここまで こられたな。"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY5:
kanafix "*やっぱりな‥‥"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY6:
kanafix "*おれ  こわくて"
.byte   newLine
kanafix "おもらししそうだよ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY7:
kanafix "*こわかったよなぁ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_ZOMBIE:
kanafix "*ゾンビ-!"
.byte   newLine
.byte   stopText
MSG_PODUNK_ZOMBIE2:
kanafix "*フフフフフ‥‥"
.byte   newLine
kanafix "おまえも ゾンビに なれ!"
.byte   newLine
.byte   stopText

MSG_PODUNK_NECROMANCERWOMAN1:
kanafix "*ししゃたちを うごかしている"
.byte   newLine
kanafix "なにものかが いるらしい。"
.byte   newLine
.byte   stopText
MSG_PODUNK_NECROMANCERWOMAN2:
kanafix "*おわかいの やるではないか。"
.byte   newLine
.byte   stopText

MSG_PODUNK_WARYGUY:
kanafix "*このまちも ゾンビに"
.byte   newLine
kanafix "せんりょうされてしまうのか。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL1:
kanafix "*あら カナリアのヒナね。"
.byte   newLine
kanafix "カナリアむらで てにいれたの?"
.byte   newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL2:
kanafix "*へ-え。"
.byte   newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL3:
kanafix "*カナリアむらの ことりなら"
.byte   newLine
kanafix "きれいなうたを"
.byte   newLine
kanafix "うたうはずだものね。"
.byte   newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL4:
kanafix "*わたし カナリアむらの"
.byte   newLine
kanafix "おじさんに あこがれてるのよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAYORGUY:
kanafix "*ちょうちょうさんは"
.byte   newLine
kanafix "ゆうきのある すけっとを"
.byte   newLine
kanafix "さがしておられる。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CONCERNEDGUY:
kanafix "*はかばに こどもが"
.byte   newLine
kanafix "まよいこんだっていうけど"
.byte   newLine
kanafix "たすかったのかなぁ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY1:
kanafix "*おまえ‥‥"
.byte   newLine
kanafix "ほんとに はかばに いくつもりか?"
.byte   newLine
.byte   stopText
MSG_PODUNK_SENSIBLEGUY2:
kanafix "*じょうしきを わきまえた"
.byte   newLine
kanafix "こどもだと おもったな オレは。"
.byte   newLine
.byte   stopText

MSG_PODUNK_EVENTGIRL1:
kanafix "*どうぶつたちは"
.byte   newLine
kanafix "くるって あばれだすし"
.byte   newLine
.byte   pauseText
kanafix "*しにんは"
.byte   newLine
kanafix "ゾンビになっておそってくるし‥‥"
.byte   newLine
.byte   pauseText
kanafix "*どうすればいいのよ。"
.byte   newLine
kanafix "ヒ-ヒ-‥‥"
.byte   newLine
.byte   stopText
MSG_PODUNK_EVENTGIRL2:
kanafix "*あなたって スゴイ!"
.byte   newLine
.byte   stopText

MSG_PODUNK_POLTERGUY:
kanafix "*おまえんち ポルタ-ガイストに"
.byte   newLine
kanafix "みまわれなかったか?"
.byte   newLine
kanafix "おれんちなんか たいへんだったぜ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_ZOOGUY:
kanafix "*どうぶつえんは"
.byte   newLine
kanafix "くるったどうぶつが これいじょう"
.byte   newLine
kanafix "にげださないよう"
.byte   newLine
kanafix "かんぜんに へいさしたそうだぜ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_BREADGIRL:
kanafix "*パンは たべることもできるけれど"
.byte   newLine
kanafix "ちぎって パンくずにすると"
.byte   newLine
kanafix "めじるしに なるんじゃないかな。"
.byte   newLine
.byte   pauseText
kanafix "*‥‥おせっかい ですけどね。"
.byte   newLine
.byte   stopText

MSG_MAYOR_HELPTOWN:
kanafix "*きみでは むりかなぁ。"
.byte   newLine
kanafix "きたいしてるんだけどなぁ。"
.byte   newLine
.byte   stopText

MSG_MAYOR_PIPPIQUEST:
kanafix "*いやなに‥‥"
.byte   newLine
kanafix "はかばに こどもがまよいこんでね。"
.byte   newLine
.byte   pauseText
kanafix "*つぎの ちょうちょうせんきょも"
.byte   newLine
kanafix "ちかいし‥‥"
.byte   newLine
kanafix "‥‥たすけてチョ-ダイ!"
.byte   newLine
.byte   stopText

MSG_MAYOR_PIPPIQUESTYES:
kanafix "*えっ いってくれるか。"
.byte   newLine
kanafix "たすけだして くれるってか。"
.byte   newLine
.byte   stopText

MSG_MAYOR_RETURNPIPPI:
kanafix "*そのこが まいごになった"
.byte   newLine
kanafix "ピッピちゃんかね。"
.byte   newLine
.byte   pauseText
kanafix "*いやいや すばらしい。"
.byte   newLine
.byte   pauseText
kanafix "*みどころのあるしょうねんだと"
.byte   newLine
kanafix "おもって いたが。"
.byte   newLine
.byte   pauseText
kanafix "*はくしゅ パチパチパチ‥‥"
.byte   newLine
.byte   pauseText
kanafix "*よかったねぇ"
.byte   newLine
kanafix "かわいいピッピちゃん。"
.byte   newLine
.byte   pauseText
kanafix "*ママに ちょうちょうさんに"
.byte   newLine
kanafix "たすけてもらったと"
.byte   newLine
kanafix "ちゃんというんだよ。"
.byte   newLine
.byte   pauseText
kanafix "*"
.byte   partyLead
kanafix "くんにも"
.byte   newLine
kanafix "しょうきんを "
.byte   price
kanafix "ドル"
.byte   newLine
kanafix "あげよう。 ホレッ。"
.byte   newLine
.byte   stopText

MSG_MAYOR_SEE_ZOO:
kanafix "*ところで"
.byte   newLine
kanafix "ついでといっては なんだが"
.byte   newLine
.byte   pauseText
kanafix "*どうぶつえんの じけんのほうも"
.byte   newLine
kanafix "ひとがんばりしてみちゃ"
.byte   newLine
kanafix "くれないかね?"
.byte   newLine
.byte   stopText

MSG_MAYOR_SEE_ZOO_ACCEPT:
kanafix "*そうか やっぱりいってくれるか!"
.byte   newLine
.byte   partyLead
kanafix "くん きみも"
.byte   newLine
kanafix "ほんとに ゲ-ムずきだねぇ。"
.byte   newLine
.byte   pauseText
kanafix "*どうぶつえんの カギは"
.byte   newLine
kanafix "じょやくの アボットから"
.byte   newLine
kanafix "もらいなさい。"
.byte   newLine
.byte   stopText

MSG_ABBOTT_GET_KEY:
kanafix "*はい"
.byte   newLine
kanafix "これが どうぶつえんのカギです。"
.byte   newLine
.byte   stopText

MSG_MAYOR_HERO:
kanafix "*いきてかえって きみは えいゆう!"
.byte   newLine
kanafix "からだのぐあいさえよければ"
.byte   newLine
kanafix "わたしも いくんだけど‥‥"
.byte   newLine
.byte   stopText

MSG_MAYOR_POST_ZOO:
kanafix "*おお"
.byte   newLine
kanafix "えいゆうの "
.byte   partyLead
kanafix "くん。"
.byte   newLine
kanafix "ふくに とらのふんがついているよ。"
.byte   newLine
.byte   pauseText
kanafix "*あ うそ うそ。"
.byte   newLine
kanafix "こんどは なにも"
.byte   newLine
kanafix "あげるものがないが‥‥"
.byte   newLine
kanafix "ワハハハハハ。"
.byte   newLine
.byte   stopText

MSG_SECRETARY_ANA:
kanafix "*ふしぎな しょうじょの"
.byte   newLine
kanafix "うわさは きいてるかしら?"
.byte   newLine
.byte   pauseText
kanafix "*きっと きみの たびを"
.byte   newLine
kanafix "たすけてくれると おもうの。"
.byte   newLine
.byte   stopText

MSG_ABBOTT_NEWKEY:
kanafix "*どうぶつえんのカギくらい"
.byte   newLine
kanafix "いくらでもあります。"
.byte   newLine
kanafix "はい またひとつあげましょう。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_INTRO:
kanafix "*みてのとおり どうぶつたちは"
.byte   newLine
kanafix "みんなにげだしちまった。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_INTRO2:
kanafix "*いるのは カナリアのヒナだけだ。"
.byte   newLine
kanafix "かうかね?"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_PITCH:
kanafix "*じゃ "
.byte   price
kanafix "ドルで かうかね?"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_DECLINE:
kanafix "*うたをしらないカナリアだからなぁ。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_ACCEPTPITCH:
kanafix "*かわいがってね。 ありがとさん。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_DECLINEPITCH:
kanafix "*ただでも いらないかね?"
.byte   newLine
kanafix "もっていきな。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR_CANARYCHECK:
kanafix "*カナリアは まだ げんきかね。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR2_BRAINWASH:
kanafix "*どうぶつたちは きっと なにかに"
.byte   newLine
kanafix "あやつられていると おもうの。"
.byte   newLine
.byte   stopText

MSG_PETVENDOR2_CUTEPETS:
kanafix "*どうぶつは かわいいわよね。"
.byte   newLine
.byte   stopText

MSG_PODUNK_PIPPI_MEET_NOYES:
kanafix "*うふっ。"
.byte   newLine
.byte   stopText

MSG_TWINKLE_LLOYDBULLY2_LLOYD:
kanafix "*バ-カ!"
.byte   newLine
.byte   stopText

MSG_RETURNS_INTRO:
kanafix "*いらっしゃいませ。"
.byte   newLine
kanafix "また ごへんぴんですね。"
.byte   newLine
.byte   stopText

MSG_REINDEER_DRAGONGIRL_CHECK:
kanafix "*"
.byte   partyLead
kanafix "の こころに"
.byte   newLine
kanafix "なにかが といかけてきている。"
.byte   newLine
.byte   stopText

MSG_RETURNS_DECLINE:
kanafix "*ああ よかった。"
.byte   newLine
.byte   stopText

MSG_RETURNS_ACCEPT:
kanafix "*これからも とうデパ-トを"
.byte   newLine
kanafix "よろしくおひきたてくださいませね。"
.byte   newLine
kanafix "うっふん。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CASHCARDWOMAN:
kanafix "*デパ-トの 1かいに"
.byte   newLine
kanafix "ちょきんを おろせる きかいが"
.byte   newLine
kanafix "できたのは いいんだけどね。"
.byte   newLine
.byte   pauseText
kanafix "*キャなんとかカ-ドが ないと"
.byte   newLine
kanafix "おろせないってのが ふべんね。"
.byte   newLine
.byte   stopText

MSG_CANARY_MAN:
kanafix "*いいてんきじゃ。 しかし"
.byte   newLine
kanafix "それがどうしたと いうのだろう。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_BABY:
kanafix "*ありゃ きみのカナリアは"
.byte   newLine
kanafix "うたひめロ-ラのこどもじゃないか。"
.byte   newLine
kanafix "ロ-ラに とどけてやっておくれ。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_BABY_NO:
kanafix "*きみは なにか たいせつなことを"
.byte   newLine
kanafix "わすれているな。 かなしいことだ。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_BABY_YES:
kanafix "*ロ-ラは どこにいたかな‥‥"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_MELODY:
kanafix "*うたひめロ-ラが うたを"
.byte   newLine
kanafix "おもいだしてくれたようだ。"
.byte   newLine
kanafix "きみも メロディ-をおぼえたかい?"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_NO:
kanafix "*だ-めだ そりゃ。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_YES:
kanafix "*うたは ちからなり‥‥"
.byte   newLine
kanafix "まことに そのとおりじゃ。"
.byte   newLine
.byte   stopText

MSG_GRAVEYARD_PIPPI:
kanafix "*わたしは まいごのピッピだよ。"
.byte   newLine
kanafix "あなたって ゆうき あるね。"
.byte   newLine
.byte   stopText

MSG_PODUNK_PIPPI_BRAVE_YES:
kanafix "*この おちょうしもの。 ハハハ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_BRAVE_NO:
kanafix "*ゆうきあるわよ。"
.byte   newLine
kanafix "また いつか どこかで"
.byte   newLine
kanafix "あえるといいね?"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_YES:
kanafix "*うれしい。 このバッヂは"
.byte   newLine
kanafix "やくそくのしるしよ。"
.byte   newLine
kanafix "ハイ うけとって。"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_NO:
kanafix "*すきなひとがいるのね。"
.byte   newLine
kanafix "きっと‥‥"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAYORPIPPI:
kanafix "*じゃ ここでバイバイ。"
.byte   newLine
.byte   pauseText
kanafix "*わたしの もっている グッズは"
.byte   newLine
kanafix "あとで わたしのうちに"
.byte   newLine
kanafix "とりにきてね。"
.byte   newLine
.byte   pauseText
kanafix "*ところで‥‥"
.byte   newLine
kanafix "わたしのくつした みじかすぎる?"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAYORPIPPI_YES:
kanafix "*こたえなくてもよかったのに。"
.byte   newLine
kanafix "かわいいひと‥‥"
.byte   newLine
.byte   stopText

MSG_ZOO_GATEMONKEY:
kanafix "*キャッキャッキャッ"
.byte   newLine
kanafix "(おまえの かあさんでべそ!)"
.byte   newLine
.byte   stopText

MSG_MAGICAVE_SHELLQUESTION:
kanafix "*"
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "「かみのしっぽは どこにある。」"
.byte   newLine
kanafix "という こえをきいた。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_CLOTHINGMAN:
kanafix "*ありゃりゃ。 かわったふくを"
.byte   newLine
kanafix "きているな おめぇ。"
.byte   newLine
.byte   pauseText
kanafix "*そんなにめだつふくを きてると"
.byte   newLine
kanafix "まものが よってくるだよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN:
kanafix "*しあわせは あるいてこない。"
.byte   newLine
kanafix "だども ふしあわせも"
.byte   newLine
kanafix "あるいちゃこねぇよなぁ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_YES:
kanafix "*さいなんに であいたくなかったら"
.byte   newLine
kanafix "いっぽも あるかねぇこった。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_NO:
kanafix "*そうか"
.byte   newLine
kanafix "ふしあわせは あるくか‥‥"
.byte   newLine
kanafix "しらなんだ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_AFTER:
kanafix "*おらの センスを みとめただか。"
.byte   newLine
kanafix "おめぇも カッコイイあだなが"
.byte   newLine
kanafix "ほしいだな?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_AFTER_YES:
kanafix "*できた。"
.byte   newLine
kanafix "いまから おめぇは"
.byte   newLine
kanafix "うすのろぶた "
.byte   partyLead
kanafix "だ。"
.byte   newLine
.byte   pauseText
kanafix "*おしゃれな ム-ドになったぞ。"
.byte   newLine
.byte   stopText

MSG_TRAIN_DECLINE:
kanafix "*そうか。 ざんねんだな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NICKNAMEMAN_QUEST:
kanafix "*やぁ うすのろぶた"
.byte   partyLead
kanafix "。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN:
kanafix "*しあわせについて"
.byte   newLine
kanafix "てつがくしてるやつに あったか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN_YES:
kanafix "*やつは"
.byte   newLine
kanafix "あだなをつける めいじんなんだ。"
.byte   newLine
kanafix "さいこうに センスが いいんだぜ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_PHILOSOPHYMAN_NO:
kanafix "*あわなきゃ わかれもないわけだ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN:
kanafix "*あわなきゃ わかれもないっていう"
.byte   newLine
kanafix "かんがえのおとこに あったか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN_YES:
kanafix "*おれも そんなかんがえかた"
.byte   newLine
kanafix "してるんだ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_CANNOTPARTMAN_NO:
kanafix "*あったほうが ためになるぞ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_STRENGTHMAN:
kanafix "*クイ-ンマリ-の いずみで"
.byte   newLine
kanafix "すっかり げんきになったわ。"
.byte   newLine
.byte   stopText

kanafix "*クイ-ンマリ-のいずみは"
.byte   newLine
kanafix "とおいのが つらいわよねぇ。"
.byte   newLine
kanafix "わかりにくい ばしょにあるし。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_EARRINGGIRL:
kanafix "*この こわれたイヤリングを"
.byte   newLine
kanafix "いずみにもっていって まほうの"
.byte   newLine
kanafix "イヤリングにするの。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FOUNTAINMAN:
kanafix "*いずみのふしぎなおとを きくと"
.byte   newLine
kanafix "それだけで おちつくよなぁ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_RESTROOMBOY:
kanafix "*もっと みなみ。"
.byte   newLine
kanafix "みちにまよったのかい。"
.byte   newLine
.byte   pauseText
kanafix "*ごめん ごめん"
.byte   newLine
kanafix "いま おしえたのは"
.byte   newLine
kanafix "トイレのばしょだった。"
.byte   newLine
.byte   pauseText
kanafix "*クイ-ンマリ-の いずみなら"
.byte   newLine
kanafix "おしろから にしに いくんだよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNBOY:
kanafix "*スプ-ンを まげちゃったら"
.byte   newLine
kanafix "ごはんが たべにくいや。"
.byte   newLine
kanafix "おにいちゃんもとに もどせる?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNBOY_YES:
kanafix "*はやく もどして。"
.byte   newLine
.byte   pauseText
kanafix "*("
.byte   nintenName
kanafix "は"
.byte   newLine
kanafix "PSIのちからで スプ-ンを"
.byte   newLine
kanafix "もとに もどしてやった。)"
.byte   newLine
.byte   pauseText
kanafix "*あんがと。"
.byte   newLine
kanafix "パクパク モシャモシャ。"
.byte   newLine
kanafix "うちにこんやは とまっていきなよ?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNBOY_NO:
kanafix "*どうしてぇ!?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_STRANGEGIRL:
kanafix "*あなた へんなかんじの かたね。"
.byte   newLine
kanafix "でも にくめないタイプ‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNBOY_STAY:
kanafix "*よかった。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNBOY_NOSTAY:
kanafix "*うぇ-ん。 ひとのしんせつは"
.byte   newLine
kanafix "うけるものだよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER1:
kanafix "*あら たびのかた"
.byte   newLine
kanafix "うちで おしょくじしていったら?"
.byte   newLine
.byte   pauseText
kanafix "*さぁ"
.byte   newLine
kanafix "きょうのメニュ-は なんでしょう?"
.byte   newLine
kanafix "わかる?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER1_NO:
kanafix "*まぁ どうしてわからないのかしら。"
.byte   newLine
kanafix "あやしいひと!"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER2:
kanafix "*そう "
.byte   favFood
kanafix "。"
.byte   newLine
.byte   pauseText
kanafix "*あなたのこころを よんで"
.byte   newLine
.byte   favFood
kanafix "にしたのよ。"
.byte   newLine
kanafix "おいしい?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MUSICVENDOR:
kanafix "*うちは がっきや だったんだけど"
.byte   newLine
kanafix "ちゅうもんした オカリナが"
.byte   newLine
kanafix "ぜんぜん できてこないの。"
.byte   newLine
.byte   pauseText
kanafix "*もう あきらめた-っと。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER2_NO:
kanafix "*あら そう。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNKEEPER3:
kanafix "*ありがとう"
.byte   newLine
kanafix "ベッドのよういも できてるわ。"
.byte   newLine
kanafix "ゆっくりおやすみ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_INNBOY_AGAINNO:
kanafix "*えんりょしないで"
.byte   newLine
kanafix "また とまっていきなよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_STRANGERBOY:
kanafix "*おまえ"
.byte   newLine
kanafix "なんか このくにに なじまない"
.byte   newLine
kanafix "かおしてるなぁ?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN:
kanafix "*きぼうのオカリナができたんだ。"
.byte   newLine
.byte   pauseText
kanafix "*きみのしってる メロディ-が"
.byte   newLine
kanafix "ながれるんだよ。"
.byte   newLine
.byte   pauseText
kanafix "*ほしいか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN_YES:
kanafix "*すなおな しょうねんだな。"
.byte   newLine
kanafix "はい どうぞ。 アハハハハ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN_NO:
kanafix "*ほしいって かおに かいてあるよ。"
.byte   newLine
kanafix "アハハハハ もっていきな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_OCARINAMAN_AFTER:
kanafix "*よっ ぼうず げんきか。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NOEXITBOY:
kanafix "*マジカントのくにに"
.byte   newLine
kanafix "でぐちなんてものが あるものかね。"
.byte   newLine
kanafix "アハハハ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_OUTSIDEMAN:
kanafix "*そと?"
.byte   newLine
kanafix "そとのせかいって なんのこったね?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_HOLEGIRL:
kanafix "*あなが あったら"
.byte   newLine
kanafix "はいりたいですわ。"
.byte   newLine
kanafix "もし あったら だけどね。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GOODSKEEPER:
kanafix "*わたしは ふしぎな"
.byte   newLine
kanafix "にもつあずかりにん。"
.byte   newLine
.byte   pauseText
kanafix "*ごようですか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MIMICKER:
kanafix "*ぼく ものまねが うまいんだぜ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_HOLEMAN:
kanafix "*まちの ひがしのほうに"
.byte   newLine
kanafix "あなが たくさんあるんだ。"
.byte   newLine
.byte   pauseText
kanafix "*どの あなか わからないんだけど"
.byte   newLine
kanafix "べつの せかいの おとが"
.byte   newLine
kanafix "きこえてくるんだ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_REDWEEDGIRL:
kanafix "*あかいくさを ひっこぬいて"
.byte   newLine
kanafix "いずみにつければ なんと"
.byte   newLine
kanafix "マジックハ-ブになるだよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_ASK:
kanafix "*でっかいふくろは いるかね?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_CARD:
kanafix "*じゃ あんたのキャッシュカ-ドを"
.byte   newLine
kanafix "しばらくかしてくれんかね。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_ASK_NO:
kanafix "*マジックハ-ブが 30たんいも"
.byte   newLine
kanafix "はいっているんだぜ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_RETURN2:
kanafix "*ありがとう かならず かえすよ。"
.byte   newLine
kanafix "なんか"
.byte   newLine
kanafix "カッコイイな とおもってね。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_CARD_NO:
kanafix "*あんたは にんげんを"
.byte   newLine
kanafix "うたがうことを しっとるな。"
.byte   newLine
kanafix "そのほうが いいかもしれんが‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_RETURN1:
kanafix "*ああ キャッシュカ-ドを"
.byte   newLine
kanafix "かえさなきゃな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_SICKNESSGUY:
kanafix "*クイ-ンは いま ちょっと"
.byte   newLine
kanafix "からだの ぐあいがわるいの。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GUARD1:
kanafix "*あやしい かおだな。"
.byte   newLine
kanafix "わしのナゾナゾがわかったら"
.byte   newLine
kanafix "ここをとおして やるけどな‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GUARD2:
kanafix "*そうでした。"
.byte   newLine
kanafix "こたえは わに にひき。"
.byte   newLine
.byte   pauseText
kanafix "*もんだいは"
.byte   newLine
kanafix "まだ かんがえてなかったんだよ"
.byte   newLine
kanafix "ヘヘヘ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GUARD_BYE:
kanafix "*ごきげんよう。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_QUEENGUY:
kanafix "*クイ-ンの うたを"
.byte   newLine
kanafix "また ききたいな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GUITARIST_UNDER:
kanafix "*ハロ-!"
.byte   newLine
kanafix "おれは てつがくしていたところだ。"
.byte   newLine
.byte   pauseText
kanafix "*ギタ-のおとが じゃまで ものを"
.byte   newLine
kanafix "かんがえられないよ。"
.byte   newLine
.byte   pauseText
kanafix "*あっ!"
.byte   newLine
kanafix "じぶんが ギタ-をひいていたのか。"
.byte   newLine
kanafix "まいった まいった。"
.byte   newLine
.byte   pauseText
kanafix "*‥‥‥‥‥‥‥‥"
.byte   newLine
.byte   pauseText
kanafix "*ここからの はなしは"
.byte   newLine
kanafix "ぜったいに ないしょなんだが"
.byte   newLine
.byte   pauseText
kanafix "すっごく つよくなったら"
.byte   newLine
kanafix "おれに あいにこい。"
.byte   newLine
.byte   pauseText
kanafix "*それと このことは"
.byte   newLine
kanafix "ぜったいに わすれないように"
.byte   newLine
kanafix "メモなんか しとくと いいぞ。"
.byte   newLine
.byte   stopText

MSG_MTITOI_HEALERFAIL:
kanafix "*おれを むししようとしたな。"
.byte   newLine
kanafix "さみしいもんだぜ。"
.byte   newLine
kanafix "こんなところで ひとりぼっちでさ。"
.byte   newLine
.byte   pauseText
kanafix "*できることなら なんでもするぜ。"
.byte   newLine
kanafix "ホラッ!"
.byte   newLine
.byte   stopText

MSG_MTITOI_HEALER:
kanafix "*うれしいよな-"
.byte   newLine
kanafix "おまえらが きてくれて。"
.byte   newLine
.byte   pauseText
kanafix "*わかってるって"
.byte   newLine
kanafix "やってほしいことは。"
.byte   newLine
kanafix "ホラッ!"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GUITARMAN_SONG:
kanafix "*おれ ついに うたをつくったんだ。"
.byte   newLine
kanafix "きけ!"
.byte   newLine
kanafix "おんがくずきの ぼうけんか"
.byte   unk4
kanafix "よ。"
.byte   newLine
.byte   pauseText
kanafix "「キュ-ピ-にんぎょう なぜなくの"
.byte   newLine
kanafix "それは カナリアが なくからよ"
.byte   newLine
.byte   pauseText
kanafix "サルが うたえば ピアノもうたう"
.byte   newLine
kanafix "ピアノは おばけが ひくのかな"
.byte   newLine
.byte   pauseText
kanafix "さばくのサボテン さみしそう"
.byte   newLine
kanafix "ひとりで よなよな うたってる"
.byte   newLine
.byte   pauseText
kanafix "ドラゴンたおれて おんぷがのこる"
.byte   newLine
kanafix "イヴが さいごに うたうとき"
.byte   newLine
kanafix "クイ-ンマリ-に じかんが もどる"
.byte   newLine
.byte   pauseText
kanafix "ラララ ふしぎなララバイよ"
.byte   newLine
kanafix "ララバイ バイバイ さようなら」"
.byte   newLine
.byte   pauseText
kanafix "*いいうただろ。"
.byte   newLine
kanafix "いいうただよなぁ‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_GUITARGIRL:
kanafix "*もりのおくに こどくをあいする"
.byte   newLine
kanafix "ギタ-ひきが いるの。"
.byte   newLine
.byte   pauseText
kanafix "*ちょっといいおとこで‥‥"
.byte   newLine
kanafix "しかも すっごく しじんなの。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_1:
kanafix "*ゆうじょうの ゆびわ ほしい?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_2:
kanafix "*じゃ あなたは わたしの"
.byte   newLine
kanafix "おともだちになるのよ。"
.byte   newLine
kanafix "いい?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_3:
kanafix "*‥‥そんなきが‥‥したわ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FRIENDSHIPRINGGIRL_4:
kanafix "*わたしのこと わすれちゃだめよ。"
.byte   newLine
kanafix "ぜったいに。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NORMALMONKEY:
kanafix "*おれは うたわないサルだ。"
.byte   newLine
.byte   pauseText
kanafix "*でも ふつうサルってのは"
.byte   newLine
kanafix "うたわないもんだ。"
.byte   newLine
kanafix "しつもんは あるか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NORMALMONKEY_YES:
kanafix "*ぐもんだね‥‥どうせ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NORMALMONKEY_NO:
kanafix "*よかった。"
.byte   newLine
kanafix "つっこんだ しつもんをされたら"
.byte   newLine
kanafix "どうしようと おもってたんだ。"
.byte   newLine
.byte   pauseText
kanafix "*それにしても おまえ"
.byte   newLine
kanafix "クイ-ンマリ-に かおが"
.byte   newLine
kanafix "にてるなぁ。"
.byte   newLine
.byte   pauseText
kanafix "*どうしてだろ。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_TRAINWOMAN:
kanafix "*あんた"
.byte   unk4
kanafix "に あったら"
.byte   newLine
kanafix "いおうと おもってたんだ。"
.byte   newLine
.byte   pauseText
kanafix "*せんろが なおって"
.byte   newLine
kanafix "でんしゃが"
.byte   newLine
kanafix "とおれるように なったってね。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARYGIRL:
kanafix "*わたし"
.byte   newLine
kanafix "いっしょうに いちどでいいから"
.byte   newLine
kanafix "おしろに はいって"
.byte   newLine
.byte   pauseText
kanafix "*マリ-さまの おかおを"
.byte   newLine
kanafix "はいけんしたいわ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_NIGHTMAREGUY:
kanafix "*たまに クイ-ンマリ-は"
.byte   newLine
kanafix "うなされてるんだ。"
.byte   newLine
.byte   pauseText
kanafix "*わるいこを しかりつけるような"
.byte   newLine
kanafix "ことをいって"
.byte   newLine
.byte   pauseText
kanafix "*こわい こわい となきさけぶのさ。"
.byte   newLine
.byte   pauseText
kanafix "*そして"
.byte   newLine
kanafix "うたを うたいはじめるんだ。"
.byte   newLine
kanafix "ほんのすこしだけ‥‥"
.byte   newLine
.byte   pauseText
kanafix "*で おもいだせないって"
.byte   newLine
kanafix "くるしがってさ。 あせびっしょり"
.byte   newLine
kanafix "かいて めざめるわけさ。"
.byte   newLine
.byte   pauseText
kanafix "*クイ-ンマリ-は むかし"
.byte   newLine
kanafix "よっぽど かなしい"
.byte   newLine
kanafix "ひどいめに あったのかな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_ANACAT_GIRLS:
kanafix "*でも"
.byte   newLine
kanafix "おんなのこにしか あげないよ。"
.byte   newLine
.byte   stopText

MSG_MTITOI_TEDDY_SLEEP:
kanafix "*ぐ-ぐ-ぐ-‥‥"
.byte   newLine
.byte   stopText

kanafix "*うそつきめ!"
.byte   newLine
.byte   stopText

MSG_MAGICANT_LOVEGUY_ONYXHOOK:
kanafix "*あなた"
.byte   unk4
kanafix "が このくにのひとで"
.byte   newLine
kanafix "ないことは みんなしってるわ。"
.byte   newLine
kanafix "でも なかまだと おもっているの。"
.byte   newLine
.byte   pauseText
kanafix "*めのうのつりばり さえあれば"
.byte   newLine
kanafix "いつでもかえってこられるはず。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_LOVEGUY:
kanafix "*きっと また かえってくるのよ。"
.byte   newLine
kanafix "くるしいときに ここに‥‥"
.byte   newLine
.byte   pauseText
kanafix "*みんな あなた"
.byte   unk4
kanafix "を"
.byte   newLine
kanafix "すきなんだから。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA:
kanafix "*ようこそ "
.byte   partyLead
kanafix "。"
.byte   newLine
.byte   pauseText
kanafix "*このマジカントこくでは みんなが"
.byte   newLine
kanafix "ともだちになれるし ほしいものは"
.byte   newLine
kanafix "すきなだけ えられるのですよ。"
.byte   newLine
.byte   pauseText
kanafix "*えっ"
.byte   newLine
kanafix "わたしのうたが ききたいの?"
.byte   newLine
.byte   pauseText
kanafix "*ごめんなさい。"
.byte   newLine
kanafix "どうしても おもいだせない。"
.byte   newLine
.byte   pauseText
kanafix "*いつか きっと"
.byte   newLine
kanafix "おもいだして うたえるはず‥‥"
.byte   newLine
.byte   pauseText
kanafix "*あのうたを うたえたときに"
.byte   newLine
kanafix "そう‥‥なにかが おこるの。"
.byte   newLine
.byte   stopText

MSG_CANARY_GENERIC:
kanafix "*‥‥。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA1:
kanafix "*あなた"
.byte   unk4
kanafix "の おぼえてきたうたを"
.byte   newLine
kanafix "わたしに きかせて。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA2:
kanafix "*そう。 そう‥‥このうただった。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_MARIA3:
kanafix "*ああ‥‥ギ-グ‥‥"
.byte   newLine
.byte   stopText

MSG_MAGICANT_VANISHGIRL:
kanafix "*わたし このマジカントこくが"
.byte   newLine
kanafix "きえて なくなっちゃう"
.byte   newLine
kanafix "ゆめをみたのよ。"
.byte   newLine
.byte   pauseText
kanafix "*まだ"
.byte   newLine
kanafix "しんぞうが ドキドキしてるわ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_ANACAT1:
kanafix "*ぼくは ぢめんを およぐねこ。"
.byte   newLine
kanafix "ぼくの てのなかに"
.byte   newLine
kanafix "はいってるものを あててごらん。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_ANACAT2:
kanafix "*ぼくの てのなかに"
.byte   newLine
kanafix "はいっているものが みえたかい?"
.byte   newLine
.byte   pauseText
kanafix "*そう。 リボン。"
.byte   newLine
kanafix "ふしぎなちからのわくリボンさ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_ANACAT3:
kanafix "*おんなのこには"
.byte   newLine
kanafix "このふしぎなリボンを あげようね。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT:
kanafix "*おれは およぐ ねこ。"
.byte   newLine
.byte   pauseText
kanafix "*よわいこに ゆうきと ちからを"
.byte   newLine
kanafix "あたえる キャンディを"
.byte   newLine
kanafix "しってるかい?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT_NOLLOYD:
kanafix "*そうか。 でも きみは"
.byte   newLine
kanafix "つよいこだから いらないな。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT_NO:
kanafix "*そっちの メガネのこは"
.byte   newLine
kanafix "よわそうだから あげような。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_LLOYDCAT_AFTER:
kanafix "*キャンディ おいしかっただろ?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTBOY:
kanafix "*おたすけじいさんを"
.byte   newLine
kanafix "よびたかったら"
.byte   newLine
kanafix "マリ-の いずみに ゆくのだ。"
.byte   newLine
.byte   pauseText
kanafix "*こころの さけびで やってくる。"
.byte   newLine
kanafix "こころの さけびだ!"
.byte   newLine
.byte   stopText

MSG_ELLAY_LHBOUNCERGUY_STONE:
kanafix "*(おきゃくは さわいだ。)"
.byte   newLine
.byte   pauseText
kanafix "*あの ぼうしかぶった いしは"
.byte   newLine
kanafix "なんなんだよ! ブ-ブ-。"
.byte   newLine
.byte   stopText

MSG_MCAVE_QUICKMONKEY_CAUGHT:
kanafix "*よんだか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_NO:
kanafix "*そうか。 さいなら。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_YES:
kanafix "*どうして ほしい?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_AFTER:
kanafix "*やくにたってるかい?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_DO_CURE:
kanafix "*そうか。"
.byte   newLine
kanafix "ちょっと あらりょうじだが"
.byte   newLine
kanafix "しんぼうするか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_DO_CURE2:
kanafix "*えいやっ ホカホカ。"
.byte   newLine
kanafix "なおった。 さいなら。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BENEVOLENTOLDMAN_LEAVE:
kanafix "*しんでしまうのも"
.byte   newLine
kanafix "ひとつのたのしみかも しれんな。"
.byte   newLine
kanafix "さいなら。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN1:
kanafix "*おれは わすれられたおとこ"
.byte   newLine
kanafix "いないも どうぜん。"
.byte   newLine
.byte   pauseText
kanafix "*きづいてくれなくても"
.byte   newLine
kanafix "よかったのに‥‥"
.byte   newLine
.byte   pauseText
kanafix "*おれのことなんか"
.byte   newLine
kanafix "むしして いいんだ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN2:
kanafix "*おれは どこにもいないおとこ"
.byte   newLine
kanafix "やさしいことばなんて"
.byte   newLine
kanafix "かけてくれたら こまっちゃうぜ。"
.byte   newLine
.byte   pauseText
kanafix "*ひとこいしく なったら"
.byte   newLine
kanafix "いきていけない。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN3:
kanafix "*おれのことばは"
.byte   newLine
kanafix "いつも ひとりごと。"
.byte   newLine
.byte   pauseText
kanafix "*うまれたときから きょうまで"
.byte   newLine
kanafix "ずっと ひとりでいたおとこ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN4:
kanafix "*うんがいいとか わるいとか。"
.byte   newLine
kanafix "そんなことは おれには"
.byte   newLine
kanafix "かんけいないね。"
.byte   newLine
.byte   pauseText
kanafix "*いきをするのに せいいっぱいさ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN5:
kanafix "*なぜ そんなにしつこく"
.byte   newLine
kanafix "おれに はなしかけるんだ。"
.byte   newLine
.byte   pauseText
kanafix "*おまえも"
.byte   newLine
kanafix "わすれられたおとこなのか?"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN5_YES:
kanafix "*うそを つけ。"
.byte   newLine
kanafix "おまえを まってる おんなのこの"
.byte   newLine
kanafix "ところへ かえれ!!"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN6:
kanafix "*そうさ。 そうだよな。"
.byte   newLine
kanafix "そうなんだ。"
.byte   newLine
.byte   pauseText
kanafix "*おまえも はやく おれのことを"
.byte   newLine
kanafix "むししろよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_FORGOTTENMAN7:
kanafix "*そうだ。 ありがとうよ。"
.byte   newLine
.byte   stopText

MSG_MAGICANT_BIGBAGGUY_NOROOM2:
kanafix "*もちきれないようだな。"
.byte   newLine
kanafix "また でなおしておいで。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_RUMORGUY1:
kanafix "*マザ-ズデイのあたりは なんか"
.byte   newLine
kanafix "とんでもない じけんが"
.byte   newLine
kanafix "おこってるらしいな。"
.byte   newLine
.byte   stopText
MSG_MERRYSVILLE_RUMORGUY2:
kanafix "*ゾンビが ゆうかいされて"
.byte   newLine
kanafix "どうぶつが どうしたとか‥‥"
.byte   newLine
kanafix "めちゃくちゃらしいな。"
.byte   newLine
.byte   stopText

MSG_MERRYSVILLE_HOSPITALSIGN:
kanafix "「サンクスギビングのまちに"
.byte   newLine
kanafix "          ようこそ!!"
.byte   newLine
kanafix " "
.byte   newLine
kanafix "CM--"
.byte   newLine
kanafix "やすくて はやくて いいおとこ。"
.byte   newLine
.byte   pauseText
kanafix "いしゃは ビッグベン.ケ-シ-に"
.byte   newLine
kanafix "かぎる。"
.byte   newLine
.byte   pauseText
kanafix "いまなら とくべつ "
.byte   newLine
kanafix "おおやすちりょう!!"
.byte   newLine
.byte   pauseText
kanafix "いのちは しんでもまもりたいもの」"
.byte   newLine
.byte   stopText