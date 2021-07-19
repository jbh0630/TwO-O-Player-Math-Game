class Question
  attr_accessor :sum

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = @num1 + @num2
  end

  def question_for_player(player)
    puts "#{player}: What does #{@num1} plus #{@num2} equal?"
    print "> "
  end
end