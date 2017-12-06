require './player'
require './turn'
require './question'

class MathGame

  def self.main
    game = MathGame.new
    game.start
  end

  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @current_player = 0
  end

  def current_player
    @players[@current_player]
  end

  def start
    greet_players
    t = Turn.new(@players[@current_player])
    t.new_turn
    until game_over? do
      puts "----- NEW TURN -----"
      t = Turn.new(@players[@current_player])
      t.new_turn
      swap_players
      print_scores
    end
    puts "----- GAME OVER -----"
    puts "Good Bye"
  end

  def game_over?
    @players.any? { |player| player.lives <= 0}
  end

  def decrease_lives
      current_player.decrease_lives
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def greet_players
    @players.each do |player|
      puts "Hello #{player.name}"
      puts 'Would you like to change your name? (y/N) '
      if gets.chomp == 'y'
        puts 'Enter your new name: '
        player.name = gets.chomp
        puts "Your new name is: #{player.name}"
      end
    end
  end

  def print_scores
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
  end

end

MathGame.main