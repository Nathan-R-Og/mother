.include "../fontmap.asm"

MSG_MYHOME_MINNIE_INVASION:
kanjifix "*おにいちゃん こわい。"
.byte   newLine
kanjifix "でんきスタンドが くるったように"
.byte   newLine
kanjifix "あばれだしたの。"
.byte   newLine
.byte   stopText

MSG_MYHOME_MINNIE_INVASION_FIGHT:
kanjifix "*おにいちゃ-ん!"
.byte   newLine
kanjifix "おうちが こわれちゃうよう!"
.byte   newLine
.byte   stopText
MSG_MYHOME_MINNIE_INVASION_FIGHT_2:
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

MSG_PHONE_NEXTLVL:
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

MSG_PHONE_END:
kanjifix "*ガチャン ツ-ツ-ツ-"
.byte   newLine
.byte   stopText
MSG_PHONE_INTRO:
kanjifix "*あ パパだ。"
.byte   newLine
.byte   stopText
MSG_PHONE_NEWMONEY:
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
.byte   unk4
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

MSG_PHONE_SAVED_RESETPROMPT:
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
MSG_PHONE_RESET_YES:
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
MSG_PHONE_RESET_NO:
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
MSG_PHONE_SAVEPROMPT:
kanjifix "*それはそうと なんのようだい?"
.byte   newLine
.byte   stopText
MSG_PHONE_GOODLUCK:
kanjifix "*がんばれよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_PIPPIMOM_THANKS:
kanjifix "*こんにちは。"
.byte   newLine
kanjifix "わたしも ピッピも"
.byte   newLine
kanjifix "すっごく げんきよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CEMETERYGUY1:
kanjifix "*おまえ まさか"
.byte   newLine
kanjifix "みなみの はかばから"
.byte   newLine
kanjifix "きたんじゃないだろうな。"
.byte   newLine
.byte   stopText
MSG_PODUNK_CEMETERYGUY2:
kanjifix "*おまえ すごいな。"
.byte   newLine
.byte   stopText

MSG_PODUNK_SCAREDGUY1:
kanjifix "*おまえ まさか"
.byte   newLine
kanjifix "ゾンビじゃないだろうな。"
.byte   newLine
kanjifix "ゾンビか?"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY2:
kanjifix "*ゾ ゾ ゾンビの‥‥"
.byte   newLine
kanjifix "バカッ! ヒャ--"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY3:
kanjifix "*ほんとに にんげんか?"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY4:
kanjifix "*よく ここまで こられたな。"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY5:
kanjifix "*やっぱりな‥‥"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY6:
kanjifix "*おれ  こわくて"
.byte   newLine
kanjifix "おもらししそうだよ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_SCAREDGUY7:
kanjifix "*こわかったよなぁ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_ZOMBIE:
kanjifix "*ゾンビ-!"
.byte   newLine
.byte   stopText
MSG_PODUNK_ZOMBIE2:
kanjifix "*フフフフフ‥‥"
.byte   newLine
kanjifix "おまえも ゾンビに なれ!"
.byte   newLine
.byte   stopText

MSG_PODUNK_NECROMANCERWOMAN1:
kanjifix "*ししゃたちを うごかしている"
.byte   newLine
kanjifix "なにものかが いるらしい。"
.byte   newLine
.byte   stopText
MSG_PODUNK_NECROMANCERWOMAN2:
kanjifix "*おわかいの やるではないか。"
.byte   newLine
.byte   stopText

MSG_PODUNK_WARYGUY:
kanjifix "*このまちも ゾンビに"
.byte   newLine
kanjifix "せんりょうされてしまうのか。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CANARYGIRL1:
kanjifix "*あら カナリアのヒナね。"
.byte   newLine
kanjifix "カナリアむらで てにいれたの?"
.byte   newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL2:
kanjifix "*へ-え。"
.byte   newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL3:
kanjifix "*カナリアむらの ことりなら"
.byte   newLine
kanjifix "きれいなうたを"
.byte   newLine
kanjifix "うたうはずだものね。"
.byte   newLine
.byte   stopText
MSG_PODUNK_CANARYGIRL4:
kanjifix "*わたし カナリアむらの"
.byte   newLine
kanjifix "おじさんに あこがれてるのよ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_MAYORGUY:
kanjifix "*ちょうちょうさんは"
.byte   newLine
kanjifix "ゆうきのある すけっとを"
.byte   newLine
kanjifix "さがしておられる。"
.byte   newLine
.byte   stopText

MSG_PODUNK_CONCERNEDGUY:
kanjifix "*はかばに こどもが"
.byte   newLine
kanjifix "まよいこんだっていうけど"
.byte   newLine
kanjifix "たすかったのかなぁ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_SENSIBLEGUY1:
kanjifix "*おまえ‥‥"
.byte   newLine
kanjifix "ほんとに はかばに いくつもりか?"
.byte   newLine
.byte   stopText
MSG_PODUNK_SENSIBLEGUY2:
kanjifix "*じょうしきを わきまえた"
.byte   newLine
kanjifix "こどもだと おもったな オレは。"
.byte   newLine
.byte   stopText

MSG_PODUNK_EVENTGIRL1:
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
MSG_PODUNK_EVENTGIRL2:
kanjifix "*あなたって スゴイ!"
.byte   newLine
.byte   stopText

MSG_PODUNK_POLTERGUY:
kanjifix "*おまえんち ポルタ-ガイストに"
.byte   newLine
kanjifix "みまわれなかったか?"
.byte   newLine
kanjifix "おれんちなんか たいへんだったぜ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_ZOOGUY:
kanjifix "*どうぶつえんは"
.byte   newLine
kanjifix "くるったどうぶつが これいじょう"
.byte   newLine
kanjifix "にげださないよう"
.byte   newLine
kanjifix "かんぜんに へいさしたそうだぜ。"
.byte   newLine
.byte   stopText

MSG_PODUNK_BREADGIRL:
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

MSG_PODUNK_PIPPI_MEET_NOYES:
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

MSG_PODUNK_CASHCARDWOMAN:
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

MSG_CANARY_MAN:
kanjifix "*いいてんきじゃ。 しかし"
.byte   newLine
kanjifix "それがどうしたと いうのだろう。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_BABY:
kanjifix "*ありゃ きみのカナリアは"
.byte   newLine
kanjifix "うたひめロ-ラのこどもじゃないか。"
.byte   newLine
kanjifix "ロ-ラに とどけてやっておくれ。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_BABY_NO:
kanjifix "*きみは なにか たいせつなことを"
.byte   newLine
kanjifix "わすれているな。 かなしいことだ。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_BABY_YES:
kanjifix "*ロ-ラは どこにいたかな‥‥"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_MELODY:
kanjifix "*うたひめロ-ラが うたを"
.byte   newLine
kanjifix "おもいだしてくれたようだ。"
.byte   newLine
kanjifix "きみも メロディ-をおぼえたかい?"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_NO:
kanjifix "*だ-めだ そりゃ。"
.byte   newLine
.byte   stopText
MSG_CANARY_MAN_MELODY_YES:
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

MSG_PODUNK_PIPPI_BRAVE_YES:
kanjifix "*この おちょうしもの。 ハハハ。"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_BRAVE_NO:
kanjifix "*ゆうきあるわよ。"
.byte   newLine
kanjifix "また いつか どこかで"
.byte   newLine
kanjifix "あえるといいね?"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_YES:
kanjifix "*うれしい。 このバッヂは"
.byte   newLine
kanjifix "やくそくのしるしよ。"
.byte   newLine
kanjifix "ハイ うけとって。"
.byte   newLine
.byte   stopText
MSG_PODUNK_PIPPI_MEET_NO:
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
.byte   unk4
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

MSG_MTITOI_HEALERFAIL:
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

MSG_MTITOI_HEALER:
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
.byte   unk4
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
.byte   unk4
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

MSG_MTITOI_TEDDY_SLEEP:
kanjifix "*ぐ-ぐ-ぐ-‥‥"
.byte   newLine
.byte   stopText

kanjifix "*うそつきめ!"
.byte   newLine
.byte   stopText

kanjifix "*あなた"
.byte   unk4
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
.byte   unk4
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

MSG_CANARY_GENERIC:
kanjifix "*‥‥。"
.byte   newLine
.byte   stopText

kanjifix "*あなた"
.byte   unk4
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