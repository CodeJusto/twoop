require_relative 'player.rb'
require_relative 'question.rb'
require 'colorize'
require 'pry'

def input_name(player)
  puts "Enter Player #{@currentPlayer+1}'s name."
  player.name = gets.chomp
  nextPlayer
end
 
def decide_winner
  puts "Thank you for playing!"
  winner = (@currentPlayer -1).abs
  puts "The winner is #{@allPlayers[winner].name} with a score of #{@allPlayers[winner].score}".colorize(:green)
end

def nextPlayer
  @currentPlayer = @currentPlayer == @allPlayers.length - 1 ? 0 : @currentPlayer + 1
  puts "It is now #{@allPlayers[@currentPlayer].name}'s turn." unless @allPlayers[@currentPlayer].name == ""
end

def start_game
  fresh_start
  @allPlayers.each do |player| 
  input_name(player)
  end
end

def display_score
  puts "\nRound: #{@round}".colorize(:black)
  puts "#{@allPlayers[0].name}: #{@allPlayers[0].score}"
  puts "#{@allPlayers[1].name}: #{@allPlayers[1].score}"
end

def fresh_start
  @allPlayers = [Player.new(), Player.new]
  @currentPlayer, @round = 0, 1
end

def play_again
  loop do
    puts "Do you want a rematch?"
    @response = gets.chomp.downcase
    if @response == "yes"
      fresh_start
      break
    elsif @response == "no"
      break
    else
      puts "Please answer either yes or no."
    end
  end
end

puts "Do you want to play a game?"
input = gets.chomp.downcase
if input == "yes"
  start_game
  while input == "yes"
    until @allPlayers[@currentPlayer].lives == 0
      question = Question.new
      @round += 1
      question.generate_q
      question.generate_a
      question.get_a(@allPlayers[@currentPlayer])
      display_score
      nextPlayer unless @allPlayers[@currentPlayer].lives == 0
    end
    decide_winner
    # binding.pry
    play_again
    input = @response
  end
end
puts "Thanks for playing!"

# use @allPlayers[@currentPlayer] to show the current player
