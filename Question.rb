class Question
  attr_accessor :question, :answer
  def initialize
    @num1 = rand(1..30)
    @num2 = rand(1..30)
    @question = "What does #{@num1} + #{@num2} equal?"
    @answer = @num1 + @num2
  end
end
