class Game
  attr_accessor :number_of_guesses_left, :game_state, :previous_guesses, :answer

  def initialize
    @number_of_guesses_left = 8
    @previous_guesses = []
    @answer = "plant"
    @game_state = []
    @answer.length.times do
      @game_state.push ("_")
    end
  end

end

class Board
  def initialize(game)
    @game = game
  end

  def print_art
    @game.number_of_guesses_left.times do
      print "leg"
    end
    puts ""
  end

  def print_board
    @game.game_state.each do |char|
      print char + " "
    end
    puts ""
  end
end

def play_game
  g = Game.new
  board = Board.new(g)
 #  @game_state = ["​_", "_​", "​_", "_​", "_"]
  while g.number_of_guesses_left > 0 && g.game_state.include?("_")
    board.print_board
    board.print_art
    puts "Guess a letter: "
    letter_guess = gets.chomp
      #if letter_guess != ACII

      #end
      if g.previous_guesses.include?(letter_guess)
        puts "This letter has already been guessed"
      else
        g.previous_guesses.push(letter_guess)
        correct_guess = false
        g.answer.length.times do |i|
          if letter_guess == g.answer[i]
            g.game_state[i] = letter_guess
            correct_guess = true
          end
      end
      if !correct_guess
        g.number_of_guesses_left -= 1
          puts  "Nope!"
      end
      end
  end
  if g.number_of_guesses_left > 0
    puts "You won!"
  else
    puts "You lost :("
    puts "#{g.answer}"
  end
end

play_game
