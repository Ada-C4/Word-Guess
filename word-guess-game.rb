# Word Guess Game by Jennie
require 'random_word_generator'
# Gem dependency: gem install random-word-generator
# from https://rubygems.org/gems/random-word-generator/versions/0.0.1

# Define constant variables
MAX_ERRORS = 6

GAME_WIN = :win
GAME_LOSE = :lose
PLAYING = :playing

# The game class includes the game logic
# Compare the guess to the word
# Keep track of the number of guesses

class Game
  attr_reader :secret_word, :guesses, :letters_matched, :errors

  def initialize
    # Create random word using random word generator
    @secret_word = RandomWordGenerator.of_length(8).downcase
    # Array of the guesses so far
    @guesses = []
    # Array of which letters have been correctly guessed in word
    @letters_matched = ["-"] * @secret_word.length
    # Number of errors
    @errors = 0
  end

  # The method will determine which letters in the secret word match the guess
  def find_matches(guess)
    # Add the guess to the array of guesses
    @guesses.push(guess)
    num_matches = 0
    word_copy = @secret_word.split("")
    while word_copy.include?(guess) do
      match_index = word_copy.index(guess)
      @letters_matched[match_index + num_matches] = guess
      word_copy.slice!(match_index)
      num_matches += 1
    end
    # Returns the number of matches
    # If there are no matches then add 1 to the number of errors
    if num_matches == 0
      @errors += 1
      return false # Indicates there was no match
    end
    return true # Indicates there was a match
  end

  def find_outcome
    if @errors == MAX_ERRORS
      return GAME_LOSE
    elsif !@letters_matched.include?("-")
      return GAME_WIN
    end
    return PLAYING
  end

end

# The Gameboard class does everything related to output
class Gameboard
  def initialize(game)
    @game = game
  end

  def print_gameboard
    # Print how many errors are left in the form of Xes
    print " x " * (MAX_ERRORS - @game.errors)
    puts
    # Print out the matched letters
    @game.letters_matched.each do |letter|
      print letter + " "
    end
    puts
    # Print out the guesses so far
    print "Your guesses so far: "
    @game.guesses.each do |letter|
      print letter + " "
    end
    puts

  end
end


# This method should set up the game
def play_word_guess
  game = Game.new()
  gameboard = Gameboard.new(game)
  outcome = PLAYING

  while outcome != GAME_WIN && outcome != GAME_LOSE
    gameboard.print_gameboard
    # Get a new guess
    print "Enter your letter guess: "
    guess = gets.chomp.downcase
    # Validate guess as input
    if game.guesses.include?(guess)
      puts "You have already entered that guess!"
    elsif !('a'..'z').include?(guess)
      puts "Invalid guess. Guesses must be a letter from a to z."
    else
      game.find_matches(guess)
      outcome = game.find_outcome
      if outcome == GAME_LOSE
        puts "Sorry, you ran out of turns."
        puts "The secret word was #{game.secret_word}"
      elsif outcome == GAME_WIN
        puts "You correctly guessed the secret word: #{game.secret_word.upcase}!"
      end
    end
  end

  puts "Do you want to play again?"
  response = gets.chomp.upcase
  case response
  when "1", "Y", "YES"
    play_word_guess
  else
    puts "Thanks for playing Word Guess!"
    exit
  end
end

# Start the game!
play_word_guess
