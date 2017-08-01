# require './round'
require_relative 'player'
require_relative 'question'

@round = true
# 0 = Player 1, 1 = Player 2
@turn = 0

puts 'Welcome to the Ruby Math Game'
puts 'Where the questions are randomly generated and the lives don\'t matter.'

print 'Player 1 name: '
@name = gets.chomp
p1 = Player.new(@name)

print 'Player 2 name: '
@name = gets.chomp
p2 = Player.new(@name)

puts
puts 'Each player answers a question.'
puts
puts 'If you get it right, fantastic.'
puts
puts 'If you get it wrong, you lose a life.'
puts
puts 'First to 0 loses the game and gets enrolled in math class.'
puts
puts 'Fight!'
puts

while @round
  
  question = Question.new
  
  case @turn
  when 0
    print "#{p1.name}: "
  else 
    print "#{p2.name}: "
  end
  
  puts question.to_s
  @user_input = gets.chomp.to_i

  if @turn == 0 && question.right_answer?(@user_input)
    puts 'Correct!'
    @turn += 1
  elsif @turn == 0 && !question.right_answer?(@user_input)
    puts 'Nope, better go review!'
    p1.lose_life
    @turn += 1
  elsif @turn == 1 && question.right_answer?(@user_input)
    puts 'Correct!'
    @turn -= 1
  elsif @turn == 1 && !question.right_answer?(@user_input)
    puts 'Nope, better go review!'
    p2.lose_life
    @turn -= 1
  end
  
  puts
  puts "#{p1.name}: #{p1.lives} Remaining Lives"
  puts "#{p2.name}: #{p2.lives} Remaining Lives"
  puts

  if p1.lives < 1 || p2.lives < 1
    puts 'Game overrrr'
    puts
    if p1.lives < 1
      puts "The winner is #{p2.name}"
    elsif p2.lives < 1
      puts "The winner is #{p2.name}"
    end

    puts
    puts "The final score is: 
        #{p1.name}: #{p1.lives} Remaining Lives
        #{p2.name}: #{p2.lives} Remaining Lives"

    @round = false
  end

end