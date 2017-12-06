class Question
  attr_reader :num_one, :num_two, :answer, :question

  def initialize(player)
    @num_one = rand(1..20)
    @num_two = rand(1..20)
    @answer = @num_one + @num_two
    @player = player
  end

  def ask_question
    puts "#{@player.name}: What does #{@num_one} plus #{@num_two} equal?"
  end

  def compare_answer
    if gets.chomp.to_i == @answer
      puts "#{@player.name}: Yes! You are correct."
      return true
    else
      puts "#{@player.name}: Seriously? No!"
      return false
    end
  end

end