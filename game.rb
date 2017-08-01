class Game

  @round = true
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

  while @round

    def whose_turn
      case @turn
      when 0
        print "#{p1.name}: "
      else 
        print "#{p2.name}: "
      end
    end

    question = Question.new
    
    puts question.ask
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
    puts p1.show_life
    puts p2.show_life
    puts

    if p1.lives < 1 || p2.lives < 1
      puts 'Game over!'
      puts
      if p1.lives < 1
        puts "The winner is #{p2.name}"
      elsif p2.lives < 1
        puts "The winner is #{p2.name}"
      end

      puts "The final score is: "
      puts p1.show_life
      puts p2.show_life

      @round = false
    end

  end

end
