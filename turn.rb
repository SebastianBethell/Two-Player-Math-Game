require './question'
require './player'
# require './main'

class Turn
  def initialize(player)
    @q = Question.new(player)
    @player = player
  end

  def new_turn
    @q.ask_question
    if !@q.compare_answer
      # decrease_lives
      @player.decrease_lives
    end
  end
end
