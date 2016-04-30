class Player

  attr_reader :lives, :score
  attr_accessor :name

  def initialize
    @lives = 3
    @score = 0
    @name = ""
  end

  def increase_score
    @score += 1
  end

  def lose_life
    @lives -= 1
  end

end

