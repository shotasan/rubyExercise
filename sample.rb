#プレイヤーの手を選択する
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー"
    puts "1:チョキ"
    puts "2:パー"
    check = gets.chomp #文字列の入力を排除
    case check
    when "0"
      @player_hand = check.to_i
    when "1"
      @player_hand = check.to_i
    when "2"
      @player_hand = check.to_i
    else
      puts "0〜2の数字を入力してください。"
      hand()
    end
    return @player_hand
  end
end

#相手が手を選択する
class Enemy
  def hand
    @enemy_hand = rand(3)
    return @enemy_hand
  end
end


class Janken
  #プレイヤーと相手の手を比較する
  def pon(player_hand,enemy_hand)
    @result = (player_hand - enemy_hand + 3) % 3

    #相手の手を表示
    case enemy_hand
    when 0
      print "相手の手はグーです。"
    when 1
      print "相手の手はチョキです。"
    when 2
      print "相手の手はパーです。"
    end
  
    #勝負結果を表示
    case @result
    when 0
      puts "あいこです。"

      player = Player.new
      enemy = Enemy.new
      janken = Janken.new

      janken.pon(player.hand, enemy.hand)
    when 1
      puts "あなたの負けです"
    when 2 
      puts "あなたの勝ちです"
    end

  end
end

player = Player.new #playerクラスをインスタンス化し、handメソッドを使用

enemy = Enemy.new

janken = Janken.new #Jankenクラスをインスタンス化しponメソッドを使用。引数としてプレイヤーの手と相手の手を渡す

janken.pon(player.hand, enemy.hand)