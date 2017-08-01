
class Question

  attr_reader :answer

  def initialize
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    @question = rand(1..4)

    case @question
    when 1
      @answer = @first_num - @second_num
      @operator = '-'
    when 2
      @answer = @first_num + @second_num
      @operator = '+'
    else
      @answer = @first_num * @second_num
      @operator = '*'
    end
  end

  def ask
    "What is #{@first_num} #{@operator} #{@second_num}?"
  end

  def right_answer?(user_input)
    user_input == @answer
  end

end