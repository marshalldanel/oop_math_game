
class Player

  attr_accessor :name, :lives

  def initialize(name, lives = 3)
    @name = name
    @lives = lives
  end
  
  def lose_life
    @lives -= 1
  end

  def show_life
    "#{name}: #{lives} Remaining Lives"
  end
    
end
