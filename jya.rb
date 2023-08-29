def main
 #勝敗が決まらない限りループ 
 loop do !MainResult()
 end
end

def MainResult
 jankenResult = JankenResult()
 if jankenResult == 2
   puts "あいこで.."
   return false
 end

 if !HoiResult()
   puts "またまたじゃんけん..."
   return false
 end

 if jankenResult == 1
   puts "やったー！勝った！"
 else
   puts "残念..負けたー"
 end
 return true
end
 #じゃんけん 
def JankenResult
 puts "じゃんけん..."
 choices = ["グー", "チョキ", "パー"]
 ShowStartMessage(choices)

 player_hand = gets.to_i
 program_hand = rand(choices.size)
 ShowChoiceInfo(choices[player_hand], choices[program_hand])

 result = 0 #負け :0, 勝ち:1, あいこ:2
 if player_hand == program_hand
   result = 2
 elsif ((player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0))
   result = 1
 end
 return result
end
 #あっち向いてホイ 
def HoiResult
 puts "あっち向いて〜"
 choices = ["上", "下", "左", "右"]
 ShowStartMessage(choices)

 player_direction = gets.to_i
 program_direction = rand(choices.size)
 ShowChoiceInfo(choices[player_direction], choices[program_direction])

 return (player_direction == program_direction)
end

def ShowStartMessage(choices)
 numChoices = choices.size
 for i in 0..(numChoices-1) do
   puts i.to_s + "(" + choices[i] + ")"
 end
end

def ShowChoiceInfo(playerChoice, programChoice)
 puts "ホイ！"
 separator = "------------------------"
 puts separator
 puts "あなた：#{playerChoice}"
 puts "相手：#{programChoice}"
 puts separator
end

main()