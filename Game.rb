class Game
  attr_accessor :current_player

  def initialize
    @player1 = Player.new("Robert")
    @player2 = Player.new("Alice")
    @current_player = @player1
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def scoreboard
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def turn_end
    scoreboard
    switch_player
    puts "\n----- NEW TURN -----"
  end

  def game_over
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    end
    if @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    end
    puts "\n----- GAME OVER -----"
    puts "\n----- Goodbye! -----" 
  end

  def play_game
    while @player1.lives > 0 && @player2.lives > 0
      new_question = Question.new
      puts "#{@current_player.name}: #{new_question.question}"
      player_answer = gets.chomp.to_i

      if player_answer != new_question.answer
        puts "\n#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      else
        puts "\n#{@current_player.name}: YES! You are correct!"
      end
      turn_end
    end
    game_over
  end
end

