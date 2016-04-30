require_relative 'player.rb'

class Question

attr_reader :question_hash

@@question_hash = {
  "1": "+",
  "2": "-",
  "3": "*"
  }

 def generate_q
    @x, @y, @rand_question = rand(1..20), rand(1..20), rand(1..3)
    puts "What is #{@x} #{@@question_hash[@rand_question.to_s.to_sym]} #{@y}?"
  end

  def generate_a
  @answer = @x.send(@@question_hash[@rand_question.to_s.to_sym],@y)
  end

  def get_a(player)
    input = gets.chomp
    /\d+/.match(input) ? input = input.to_i : input = false
    if input == @answer 
      puts "Correct!".colorize(:green)
      player.increase_score
    else
      puts "Incorrect!".colorize(:light_red)
      player.lose_life
    end
  end

end