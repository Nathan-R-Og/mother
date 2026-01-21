MSG_B_UNK:
.byte set_pos 8, 6
.byte repeatTile " ", 16
.byte set_pos 8, 7
.byte repeatTile " ", 16
.byte stopText

MSG_B_APPROACH:
.byte   attacker
kanafix "がおそいかかった!"
.byte   stopText

MSG_B_ATTACK:
.byte   attacker
kanafix "の こうげき!"
.byte   stopText

MSG_B_TANKGUN:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "せんしゃほうを うった!"
.byte   stopText

MSG_B_BITE:
.byte   attacker
kanafix "は"
.byte   newLine
.byte   beingAttacked
kanafix "に かみついた!"
.byte   stopText

MSG_B_SCRATCH:
.byte   attacker
kanafix "は"
.byte   newLine
.byte   beingAttacked
kanafix "を ひっかいた!"
.byte   stopText

MSG_B_CHARGE:
.byte   attacker
kanafix "は"
.byte   newLine
.byte   beingAttacked
kanafix "に のしかかった!"
.byte   stopText

MSG_B_OUT_OF_CONTROL:
.byte   attacker
kanafix "は ぼうそうした!"
.byte   stopText

MSG_B_FINAL_ATTACK:
.byte   attacker
kanafix "の"
.byte   newLine
kanafix "さいごの いちげき!!!"
.byte   stopText

MSG_B_GIEGUE_ATTACK:
.byte   attacker
kanafix "からの"
.byte   newLine
kanafix "こうげきのしょうたいが つかめない!"
.byte   stopText

MSG_B_SPIT:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ねんえきを はきかけた!"
.byte   stopText

MSG_B_BIND:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "しばられている‥‥"
.byte   stopText

MSG_B_STRANGE_CRY:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ふしぎなさけびごえをあげた!"
.byte   stopText

MSG_B_SMILE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ふてきに ほほえんだ"
.byte   stopText

MSG_B_RAGE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "かっとなった!"
.byte   stopText

MSG_B_CONFUSE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "いしきを かきみだした!"
.byte   stopText

MSG_B_CALL:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "なかまを よんだ!"
.byte   stopText

MSG_B_SOW:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "たねを まいた!"
.byte   stopText

MSG_B_LAUGH:
.byte   attacker
kanafix "は わらいだした!"
.byte   stopText

MSG_B_THREATEN:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "こわいことばを なげつけた!"
.byte   stopText

MSG_B_DIRTYWORDS:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "きたないことばを なげつけた!"
.byte   stopText

MSG_B_GRIN:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "けはいを ころしている"
.byte   stopText

MSG_B_CONFUSED:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "わけがわからなくなっている"
.byte   stopText

MSG_B_ASLEEP:
.byte   attacker
kanafix "は ねむっている‥"
.byte   stopText

MSG_B_FLOW_ENERGY:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "エネルギ-を ちゅうにゅうした!"
.byte   stopText

MSG_B_RUN_AWAY:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "にげだした!"
.byte   stopText

MSG_B_DIDNT_WORK:
kanafix " ‥‥だめでした"
.byte   stopText

MSG_B_TRIP:
.byte   attacker
kanafix "は ころんだ"
.byte   stopText

MSG_B_CANT_MOVE:
.byte   attacker
kanafix "は うごけない‥‥"
.byte   stopText

MSG_B_SELF_STONE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "いしになっている‥‥"
.byte   stopText

MSG_B_PUFF:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "はいきガスを ふきかけた!"
.byte   stopText

MSG_B_ASTHMA_WHEEZE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ぜんそくの ほっさがでた"
.byte   newLine
kanafix " ‥‥ゴホ ゴホ ゴホ"
.byte   stopText

MSG_B_MEDITATE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "おいのりをしている"
.byte   stopText

MSG_B_GROUCHOFUNNY:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "あいさつをして とおりすぎた"
.byte   stopText

MSG_B_READY:
.byte   attacker
kanafix "は みがまえている"
.byte   stopText

MSG_B_GIEGUE_SING:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "うたを うたった!"
.byte   stopText

MSG_B_GUARD:
.byte   attacker
kanafix "は ガ-ドしている"
.byte   stopText

MSG_B_APPROACH_SLOWLY:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "にじりよってきた!"
.byte   stopText

MSG_B_USED:
.byte   attacker
kanafix "は"
.byte   newLine
.byte   attackResult
kanafix "を つかった!"
.byte   stopText

MSG_B_TRIED:
.byte   attacker
kanafix "は"
.byte   newLine
.byte   attackResult
kanafix "を こころみた!"
.byte   stopText

MSG_B_CANT_USE:
.byte   attacker
kanafix "は"
.byte   newLine
.byte   attackResult
kanafix "を"
.byte   newLine
kanafix "つかうことが できない!"
.byte   stopText

MSG_B_CIRCUMSTANCES:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "たちばを かんがえた‥"
.byte   stopText

MSG_B_DO_STRANGE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "なにか あやしいことをした"
.byte   stopText

MSG_B_DREAMING:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ぼ-っとしている"
.byte   stopText

MSG_B_CHECK:
.byte   attacker
kanafix "は "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix "チェックした"
.byte   stopText

MSG_B_WICKED_SEED:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "デ-モンシ-ドをつかった!"
.byte   stopText

MSG_B_GAS:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "まひガスをつかった!"
.byte   stopText

MSG_B_STEAL:
.byte   attacker
kanafix "は "
.byte   beingAttacked
kanafix "の"
.byte   newLine
.byte   attackResult
kanafix "を うばった!"
.byte   stopText

MSG_B_ESCAPE_ROPE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "ロ-プから ぬけだした"
.byte   stopText

MSG_B_AWAKE:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "めをさました"
.byte   stopText

MSG_B_ZAP:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "くうかんを きりさいた!"
.byte   stopText

MSG_B_CONTINUOUS_ATTACK:
kanafix "れんぞくこうげき!"
.byte   stopText

MSG_B_YOU_WIN:
;the "YOU WIN" text uses a different w. this makes my job a lot harder
.charmap $57, $79 ;W == $79
.byte   newLine
.byte "     YOU WIN!"
.byte   newLine
.byte   stopText
.charmap $57, $57 ;W == $57

MSG_B_YOU_LOST:
.byte   newLine
.byte   partyLead
.byte   unk4
kanafix "は"
.byte   newLine
kanafix "たたかいに やぶれた"
.byte   newLine
.byte   stopText

MSG_B_INDETERMINATE_BATTLE_END:
.byte   newLine
kanafix "しょうぶが つかない"
.byte   newLine
.byte   stopText

MSG_B_BROKEN_TANK:
kanafix "せんしゃは こわれてしまった"
.byte   stopText

MSG_B_CHECK_STRONGFIRE:
kanafix "> ねつにつよい"
.byte   stopText

MSG_B_CHECK_STRONGFREEZE:
kanafix "> さむさにつよい"
.byte   stopText

MSG_B_CHECK_STRONGTHUNDER:
kanafix "> かみなりにつよい"
.byte   stopText

MSG_B_CHECK_STRONGBEAM:
kanafix "> ひかりにつよい"
.byte   stopText

MSG_B_CHECK_WEAKSPRAYS:
kanafix "> スプレ-によわい"
.byte   stopText

MSG_B_CHECK_OFEENSE:
kanafix "> オフェンス  "
.byte   damageAmount
.byte   stopText

MSG_B_CHECK_DEFENSE:
kanafix "> ディフェンス "
.byte   defenseStat
.byte   stopText

MSG_B_GIEGUE_SPEECH:
kanafix "「"
.byte   nintenName
kanafix "!"
.byte   newLine
kanafix "あなたの いちぞくには ほんとうに"
.byte   newLine
.byte   pauseText
kanafix "おせわになっています」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH2:
kanafix "「おさない わたしを そだててくれた"
.byte   newLine
kanafix "ジョ-ジのつま‥‥マリア」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH3:
kanafix "「わたしたちのほしから たいせつな"
.byte   newLine
kanafix "じょうほうを ぬすみだして"
.byte   newLine
.byte   pauseText
kanafix "わたしたちに はむかおうとした‥‥"
.byte   newLine
kanafix "ジョ-ジ」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH4:
kanafix "「そして そのふうふの しそん"
.byte   newLine
kanafix "また わたしたちの けいかくを"
.byte   newLine
.byte   pauseText
kanafix "じゃましようとしている‥‥"
.byte   newLine
.byte   nintenName
kanafix "! あなたのことだ」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH5:
kanafix "「もう おかえりなさい みにくい"
.byte   newLine
kanafix "ちきゅうじんたちと ともに"
.byte   newLine
.byte   pauseText
kanafix "ほろびてください」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH6:
kanafix "「その むしけらのような ちからでは"
.byte   newLine
kanafix "どうすることも できない」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH7:
kanafix "「"
.byte   nintenName
kanafix "‥‥あなただけ"
.byte   newLine
kanafix "ひとりなら たすけてあげてもよい"
.byte   newLine
.byte   pauseText
kanafix "わたしと ともに マザ-シップに"
.byte   newLine
kanafix "のりなさい」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH8:
kanafix "「‥‥ならば ともだちや みにくい"
.byte   newLine
kanafix "ちきゅうじんと いっしょに ここに"
.byte   newLine
.byte   pauseText
kanafix "ねむりなさい」"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_GIEGUE_SPEECH9:
kanafix "「うたうのを やめなさい」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH10:
kanafix "「うたを‥‥やめろ」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH11:
kanafix "「う うたを やめろ!」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH12:
kanafix "「うたを やめるんだ!」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH13:
kanafix "「ちきゅうの むしけらども!"
.byte   newLine
kanafix "だまれ! うたうな!」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH14:
kanafix "「うたを‥‥」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH15:
kanafix "「やめろ!」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH16:
kanafix "「!!!」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH17:
kanafix "「や‥‥」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH18:
kanafix "「!!!!」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH19:
kanafix "「‥‥‥‥‥」"
.byte   stopText
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH20:
kanafix "「ナゼ コノワタシガ コンナウタニ"
.byte   newLine
kanafix "ヤブレタノダ‥‥」"
.byte   newLine
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH21:
kanafix "「ワタシハ カナラズ オマエタチヲ"
.byte   newLine
kanafix "‥‥‥‥マタ‥‥イツカ‥‥」"
.byte   newLine
.byte   pauseText,waitThenOverwrite

MSG_B_GIEGUE_SPEECH22:
kanafix "「"
.byte   nintenName
kanafix "! また あおう!」"
.byte   newLine
.byte   newLine
.byte   pauseText,waitThenOverwrite

MSG_B_DODGED:
.byte   beingAttacked2
.byte   newLine
kanafix " すばやく よけた"
.byte   stopText

MSG_B_SMAAAAASH:
kanafix " "
.byte SMAAAAASH
.byte   stopText

MSG_B_DAMAGED:
.byte   beingAttacked2
.byte   newLine
kanafix " "
.byte   damageAmount
kanafix "の ダメ-ジをうけた"
.byte   stopText

MSG_B_DEFEATED:
kanafix " "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix " やっつけた!"
.byte   stopText

MSG_B_HURT_AND_BEATEN:
.byte   beingAttacked2
.byte   newLine
kanafix " きずつきたおれた"
.byte   stopText

MSG_B_ALREADY_GONE:
kanafix " しかし "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " すでにいなかった"
.byte   stopText

MSG_B_NO_EFFECT:
kanafix " "
.byte   beingAttacked
kanafix "には"
.byte   newLine
kanafix " こうかがなかった"
.byte   stopText

MSG_B_EXHAUSTED:
kanafix " "
.byte   attacker
kanafix "は ちからつきた"
.byte   stopText

MSG_B_BARRIER:
.byte   beingAttacked2
.byte   newLine
kanafix " バリアに つつまれた"
.byte   stopText

MSG_B_BULLHORN_1:
kanafix " 「おまえの おかあさんは"
.byte   newLine
kanafix " ないているぞ!」"
.byte   stopText

MSG_B_GOT_STONED:
kanafix " "
.byte   beingAttacked
kanafix "は いしになった"
.byte   stopText

MSG_B_GOT_BLINDED:
.byte   beingAttacked2
.byte   newLine
kanafix " めがみえなくなった!"
.byte   stopText


MSG_B_EXPLODED:
kanafix " "
.byte   attacker
kanafix "は"
.byte   newLine
kanafix " ばくはつした!"
.byte   stopText

MSG_B_FLAMEBURST:
kanafix " "
.byte   attacker
kanafix "は"
.byte   newLine
kanafix " もえあがった!"
.byte   stopText

MSG_B_OFFENSE_INCREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " オフェンスが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

MSG_B_OFFENSE_DECREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " オフェンスが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

MSG_B_DEFENSE_INCREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ディフェンスが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

MSG_B_SPEED_INCREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " スピ-ドが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

MSG_B_FIGHT_DECREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ファイトが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

MSG_B_DEFENSE_DECREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ディフェンスが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

MSG_B_FIGHT_INCREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ファイトが "
.byte   damageAmount
kanafix "あがった"
.byte   stopText

MSG_B_SPEED_DECREASE:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " スピ-ドが "
.byte   damageAmount
kanafix "さがった"
.byte   stopText

MSG_B_GROUCHOFUNNY2:
kanafix " なぜか "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " けいけんちが あがった"
.byte   stopText

MSG_B_BULLHORN_SUCCEED:
kanafix " せっとくに せいこうした"
.byte   stopText

MSG_B_BULLHORN_FAIL:
kanafix " せっとくに しっぱいした"
.byte   stopText

MSG_B_BULLHORN_BACKFIRE:
kanafix " "
.byte   beingAttacked
kanafix "を おこらせた"
.byte   stopText

MSG_B_CRITICAL:
.byte   beingAttacked2
.byte   newLine
kanafix " ききてきじょうたいに おちいった"
.byte   stopText

MSG_B_LOST_SENSES:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " わけがわからなくなった"
.byte   stopText

MSG_B_SLEEP:
kanafix " "
.byte   beingAttacked
kanafix "を ねむらせた"
.byte   stopText

MSG_B_PP_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " PPが "
.byte   damageAmount
kanafix "かいふくした!"
.byte   stopText

MSG_B_HP_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " HPが "
.byte   damageAmount
kanafix "かいふくした!"
.byte   stopText

MSG_B_CALL_FAIL:
kanafix " しかし だれもきてくれなかったのだ"
.byte   stopText

MSG_B_CALL_FAIL2:
kanafix " し-ん‥‥‥"
.byte   stopText

MSG_B_CALL_SUCCEED:
kanafix " "
.byte   beingAttacked
kanafix "が くわわった!"
.byte   stopText

MSG_B_PP_STEAL:
kanafix " "
.byte   beingAttacked
kanafix "の PPを"
.byte   newLine
kanafix " "
.byte   damageAmount
kanafix "うばった"
.byte   stopText

MSG_B_PARALYZED:
.byte   beingAttacked2
.byte   newLine
kanafix " うごけなくなった"
.byte   stopText

MSG_B_POISONED:
.byte   beingAttacked2
.byte   newLine
kanafix " どくに おかされた"
.byte   stopText

MSG_B_DEHYDRATED:
.byte   beingAttacked2
.byte   newLine
kanafix " すいぶんを すいとられた"
.byte   stopText

MSG_B_PSI_BLOCK:
.byte   beingAttacked2
.byte   newLine
kanafix " ちょうのうりょくを ふうじられた"
.byte   stopText

MSG_B_BOUND:
kanafix " "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix " ロ-プで しばった"
.byte   stopText

MSG_B_SHIELD:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " シ-ルドに つつまれた"
.byte   stopText

MSG_B_MISS:
kanafix " からぶり-っ!"
.byte   stopText

MSG_B_BUT_PSI_BLOCK:
kanafix " しかし ちょうのうりょくは"
.byte   newLine
kanafix " ふうじられていた"
.byte   stopText

MSG_B_FRANKLIN_BOUNCE:
kanafix " しかし "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " フランクリンバッヂが"
.byte   newLine
kanafix " こうせんを はねかえした!"
.byte   stopText

MSG_B_BOUNCE:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " こうげきを はねかえした!"
.byte   stopText

MSG_B_NOT_ENOUGH_PP:
kanafix " PPが たりない"
.byte   stopText

MSG_B_NO_EFFECT2:
kanafix " "
.byte   beingAttacked
kanafix "には"
.byte   newLine
kanafix " こうかが なかった"
.byte   stopText

MSG_B_POISON_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " からだのどくが きえた"
.byte   stopText

MSG_B_PUZZLED_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " われに かえった"
.byte   stopText

MSG_B_ITCHY:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " かゆみに もだえた"
.byte   stopText

MSG_B_PARALYSIS_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " うごきを とりもどした"
.byte   stopText

MSG_B_ASLEEP_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " めをさました"
.byte   stopText

MSG_B_REVIVE:
kanafix " "
.byte   beingAttacked
kanafix "を"
.byte   newLine
kanafix " カムバックさせた!!!"
.byte   stopText

MSG_B_BREAK_SHIELD:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " シ-ルドを はかいした"
.byte   stopText

MSG_B_ASTHMA_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "の"
.byte   newLine
kanafix " ぜんそくがなおった"
.byte   stopText

MSG_B_NOLONGER_STONED:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " やわらかくなった"
.byte   stopText

MSG_B_WORDS_O_LOVE:
kanafix " 「すき」"
.byte   stopText

MSG_B_SWEAR_WORDS:
kanafix " 「きらい」"
.byte   stopText

MSG_B_ASTHMA:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " ぜんそくの ほっさがでた"
.byte   stopText

MSG_B_FULL_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " われにかえった!"
.byte   stopText

MSG_B_BEATEN_1:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " おとなしくなった!"
.byte   stopText

MSG_B_BEATEN_2:
kanafix " "
.byte   beingAttacked
kanafix "を たおした!"
.byte   stopText

MSG_B_BEATEN_3:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " はかいされた!"
.byte   stopText

MSG_B_BEATEN_4:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " つちにかえった!"
.byte   stopText

MSG_B_BEATEN_5:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " もう うごかない"
.byte   stopText

MSG_B_BEATEN_6:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " ポンコツになった!"
.byte   stopText

MSG_B_BEATEN_7:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " かきけされた!"
.byte   stopText

MSG_B_CONFUSE_RECOVER:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine
kanafix " こんらんから たちなおった"
.byte   stopText

MSG_B_BUT_NO_EFFECT:
kanafix " しかし こうかが なかった"
.byte   stopText

MSG_B_BREAK_ITEM:
kanafix " "
.byte   attackResult
kanafix "は"
.byte   newLine
kanafix " こわれてしまった‥‥"
.byte   stopText

MSG_B_STONED:
kanafix " "
.byte   attackResult
kanafix "は"
.byte   newLine
kanafix " ただの いしになった‥‥"
.byte   stopText

MSG_B_BIG_BAG_EMPTY:
kanafix " "
.byte   attackResult
kanafix "は"
.byte   newLine
kanafix " からになった‥‥"
.byte   stopText

MSG_B_ATTACKEDNAME:
kanafix " "
.byte   beingAttacked
kanafix "は"
.byte   newLine

MSG_B_STATUP:
.byte   attacker
kanafix "は"
.byte   newLine
kanafix "レベルが あがった!"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_HP:
kanafix " さいだいHPが "
.byte   lvHPPPinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_PP:
kanafix " さいだいPPが "
.byte   lvHPPPinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_FIGHT:
kanafix " ファイトが "
.byte   lvFIGinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_SPEED:
kanafix " スピ-ドが "
.byte   lvSPDinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_WISDOM:
kanafix " かしこさが "
.byte   lvWISinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_STRENGTH:
kanafix " たいりょくが "
.byte   lvSTRinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite
MSG_B_STATUP_FORCE:
kanafix " フォ-スが "
.byte   lvFORinc
kanafix " UP"
.byte   newLine
.byte   pauseText,waitThenOverwrite

MSG_B_STATUP_NEW_PSI:
.byte   attacker
kanafix "は たたかいのなかで"
.byte   newLine
kanafix "PSIを おぼえた!"
.byte   newLine
.byte   pauseText,waitThenOverwrite

MSG_B_STATUP_GET_ITEM:
.byte   item
kanafix "を ひろった!"
.byte   stopText

MSG_B_NULL:
.byte stopText