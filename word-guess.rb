require "./pacman"
require "colorize"
# Game Constants
MAX_WRONG = 8
WORDS = %w(flower pancake caterpillar avocado dragon sushi kitten monkey football crazy mango
 pineapple developer engineer waffle toast penguin diamond coffee magenta breakfast croissant
 sweater potato watermelon slug canteloupe grapefruit soggy thunder computer program puppy sausage
 library llama octopus manatee dolphin narwhal unicorn rainbow cardigan muffin juice refridgerator
 awesome noodles dinosaur)

class Game
  def initialize
    @answer = generate_answer
    @answer_array = generate_answer_array
    @guess_array = []
    @wrong_guesses = []
    @correct_guesses = []
    @turn_array = []
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
    print %x{clear}
    puts "\n\n"
    print_image
    print "\n\n\nWord: ".light_magenta
    @answer_array.each do |letter|
      if letter == guess || @correct_guesses.include?(letter)
        print letter.light_magenta
        @guess_array.push(letter)
      else
        print "_".light_magenta
      end
    end
    puts "\nWrong guesses:\n#{@wrong_guesses.join(" ")}".light_magenta
   @turn_array = @guess_array
   @guess_array = []
  end

  def check_valid(input)
    alphabet =  ('A'..'Z').to_a
    while !alphabet.include?(input) || @wrong_guesses.include?(input) || @correct_guesses.include?(input)
      if !alphabet.include?(input)
        puts "That is not a valid guess. Please enter a letter.".red
        input = gets.chomp.upcase
      else
        puts "You've already guessed #{input}. Please enter a different letter.".red
        input = gets.chomp.upcase
      end
    end
    return input
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
      puts PACMAN8.light_yellow
    elsif @wrong_guesses.length == 1
      puts PACMAN7.light_yellow
    elsif @wrong_guesses.length == 2
      puts PACMAN6.light_yellow
    elsif @wrong_guesses.length == 3
      puts PACMAN5.light_yellow
    elsif @wrong_guesses.length == 4
      puts PACMAN4.light_yellow
    elsif @wrong_guesses.length == 5
      puts PACMAN3.light_yellow
    elsif @wrong_guesses.length == 6
      puts PACMAN2.light_yellow
    elsif @wrong_guesses.length == 7
      puts PACMAN1.light_yellow
    else
      puts PACMAN.light_yellow
    end
  end

  def play_game
    start_game
    until game_lost? || game_won?
      input = gets.chomp.upcase
      guess = check_valid(input)
      check_guess(guess)
      print_board(guess)
      if !game_lost? && !game_won?
        puts "\nPlease enter another letter:".light_cyan
      end
    end
    if game_lost?
      puts "The secret word was: #{@answer}".light_magenta
    else
      print %x{clear}
      puts "The secret word was: #{@answer}\n\n".light_magenta
      puts PACMAN_WIN.light_yellow
    end
  end

  def game_lost?
    MAX_WRONG == @wrong_guesses.length
  end

  def game_won?
    @turn_array == @answer_array
  end

  def start_game
    puts "Welcome to Word Guess!".bold.light_green
    puts "Enter letters to guess the secret word before pacman eats everything!\n\n".light_green
    print_image
    puts "\nWhat is your guess?".light_cyan
  end

end

a = Game.new
a.play_game
