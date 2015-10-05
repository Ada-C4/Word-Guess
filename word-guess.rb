require "./pacman"
# Game Constants
MAX_WRONG = 8

WORDS = %w(flower pancake caterpillar avocado dragon sushi kitten monkey football crazy mango pineapple developer engineer waffle toast penguin)

class Game
  def initialize
    @answer = generate_answer
    @answer_array = generate_answer_array
    @guess_array = []
    @wrong_guesses = []
    @correct_guesses = []
    @turn_array = []
    @image = print_image
  end

  def generate_answer
    answer = WORDS[rand(0..(WORDS.length - 1))].upcase
    return answer
  end

  def generate_answer_array
    answer_array = @answer.split("")
    return answer_array
  end

  def print_board(guess)
    2.times {puts}
    print_image
    print "\n\n\nWord: "
    @answer_array.each do |letter|
      if letter == guess || @correct_guesses.include?(letter)
        print letter
        @guess_array.push(letter)
      else
        print "_"
      end
    end
    puts "\n\Wrong guesses:\n#{@wrong_guesses.join(" ")}"
    puts "\nPlease enter another letter:"
   @turn_array = @guess_array
   @guess_array = []
  end

  def check_guess(guess)
    if !@answer.include?(guess)
      @wrong_guesses.push(guess)
    else
      @correct_guesses.push(guess)
    end
  end

  def print_image
    if @wrong_guesses.length == 0
      puts PACMAN8
    elsif @wrong_guesses.length == 1
      puts PACMAN7
    elsif @wrong_guesses.length == 2
      puts PACMAN6
    elsif @wrong_guesses.length == 3
      puts PACMAN5
    elsif @wrong_guesses.length == 4
      puts PACMAN4
    elsif @wrong_guesses.length == 5
      puts PACMAN3
    elsif @wrong_guesses.length == 6
      puts PACMAN2
    elsif @wrong_guesses.length == 7
      puts PACMAN1
    else
      puts PACMAN
    end
  end

  def new_guess(guess)
  end

  def play_game
    start_game
    until game_lost? || game_won?
      guess = gets.chomp.upcase
      check_guess(guess)
      print_board(guess)
    end
    if game_lost?
      puts "GAME OVER"
    else
      puts "GAME OVER: YOU WON! :)"
    end
  end

  def game_lost?
    MAX_WRONG == @wrong_guesses.length
  end

  def game_won?
    @turn_array == @answer_array
  end

  def start_game
    puts "Welcome to Word Guess!"
    puts "Enter letters to guess the secret word before pacman eats everything!"
    puts "What is your guess?"
  end

end

a = Game.new
a.play_game
