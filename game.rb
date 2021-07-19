require './player'
require './question'

class Game
  def initialize
    @player_1 = Player.new('Player1')
    @player_2 = Player.new('Player2')
    @player = @player_1
  end

  def play_game
    while !game_over?
      question = Question.new()
      question.question_for_player(@player.name)
      if gets.chomp.to_i != question.sum
        @player.lives -= 1
        puts "#{@player.name}: Seriously? No!"
        puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
        if @player == @player_1
          @player = @player_2
        else
          @player = @player_1
        end
      else
        puts "#{@player.name}: YES! You are correct."
        puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
        if @player == @player_1
          @player = @player_2
        else
          @player = @player_1
        end
      end
      if game_over?
        if @player_1.lives > 0
          puts "#{@player_1.name} wins with a score #{@player_1.lives}/3"
          puts "----- GAME OVER -----"
        elsif @player_2.lives > 0
          puts "#{@player_2.name} wins with a score #{@player_2.lives}/3"
          puts "----- GAME OVER -----"
        end
      else
      puts "----- NEW TURN -----"
      end
    end
  end    
    
  def game_over?
    @player_1.lives <= 0 || @player_2.lives <= 0
  end
end