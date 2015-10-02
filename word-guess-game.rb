# Word Guess Game by Jennie
require 'random_word_generator'
# Gem dependency: gem install random-word-generator
# from https://rubygems.org/gems/random-word-generator/versions/0.0.1
require 'colorize'
# Gem dependency: gem install colorize
# from https://github.com/fazibear/colorize

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

  def initialize(word_length)
    # Create random word using random word generator
    @secret_word = RandomWordGenerator.of_length(word_length).downcase
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
    end
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
  attr_reader :cakes
  def initialize(game)
    @game = game
    # Array of birthday cake ascii art
    # Original cake from http://www.myhairyass.com/ASCII/Art/?ID=20
    @cakes = ["""
                    0   0
                    |   |
                ____|___|____
             0  |~ ~ ~ ~ ~ ~|   0
             |  |           |   |
          ___|__|___________|___|__
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
      0   |       H a p p y       |   0
      |   |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|   |
    __|___|_______________________|___|__
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |                                   |
    |         B i r t h d a y! ! !      |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",

    """
                        0
                        |
                ________|____
             0  |~ ~ ~ ~ ~ ~|   0
             |  |           |   |
          ___|__|___________|___|__
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
      0   |       H a p p y       |   0
      |   |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|   |
    __|___|_______________________|___|__
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |                                   |
    |         B i r t h d a y! ! !      |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",

    """


                _____________
             0  |~ ~ ~ ~ ~ ~|   0
             |  |           |   |
          ___|__|___________|___|__
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
      0   |       H a p p y       |   0
      |   |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|   |
    __|___|_______________________|___|__
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |                                   |
    |         B i r t h d a y! ! !      |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",

    """


                _____________
                |~ ~ ~ ~ ~ ~|   0
                |           |   |
          ______|___________|___|__
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
      0   |       H a p p y       |   0
      |   |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|   |
    __|___|_______________________|___|__
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |                                   |
    |         B i r t h d a y! ! !      |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",
    """


                _____________
                |~ ~ ~ ~ ~ ~|
                |           |
          ______|___________|______
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
      0   |       H a p p y       |   0
      |   |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|   |
    __|___|_______________________|___|__
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |                                   |
    |         B i r t h d a y! ! !      |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",

    """


                _____________
                |~ ~ ~ ~ ~ ~|
                |           |
          ______|___________|______
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
          |       H a p p y       |   0
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|   |
    ______|_______________________|___|__
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |                                   |
    |         B i r t h d a y! ! !      |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",

    """


                _____________
                |~ ~ ~ ~ ~ ~|
                |           |
          ______|___________|______
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
          |       W O R S T       |
          |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    ______|_______________________|______
    |/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|
    |          B i r t h d a y          |
    |             E V E R!!!            |
    | ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ |
    |___________________________________|""",
    ]
  end

  def print_gameboard
    # Print how many errors are left in the form of birthday cake ascii art
    puts @cakes[@game.errors]
    puts
    # Print out the matched letters
    print "Secret word: ".colorize(:blue)
    @game.letters_matched.each do |letter|
      print letter + " "
    end
    puts
    puts
    # Print out the guesses so far
    print "Guesses so far: ".colorize(:blue)
    @game.guesses.each do |letter|
      print letter + " "
    end
    puts
    puts
  end
end


# This method should set up the game
def play_word_guess
  level = 'foo'
  while !['easy', 'medium', 'hard'].include?(level)
    puts "What level would you like to play? [EASY, MEDIUM, HARD]".colorize(:green)
    level = gets.chomp.downcase
    if !['easy', 'medium', 'hard'].include?(level)
      puts "Invalid level type."
    end
  end
  case level
  when "easy"
    word_length = 12
  when "medium"
    word_length = 9
  when "hard"
    word_length = 6
  end
  print %x{clear} # Clears the terminal screen
  game = Game.new(word_length)
  gameboard = Gameboard.new(game)
  outcome = PLAYING
  while outcome != GAME_WIN && outcome != GAME_LOSE
    print %x{clear} # Clears the terminal screen
    gameboard.print_gameboard
    # Get a new guess
    print "Enter your guess: ".colorize(:blue)
    guess = gets.chomp.downcase
    # Validate guess as input
    if game.guesses.include?(guess)
      puts "You have already entered that guess!"
      gets
    elsif !('a'..'z').include?(guess)
      puts "Invalid guess. Guesses must be a letter from a to z."
      gets
    else
      game.find_matches(guess)
      outcome = game.find_outcome
      if outcome == GAME_LOSE
        print %x{clear} # Clears the terminal screen
        puts gameboard.cakes[6]
        puts
        puts "Sorry, you ran out of turns.".colorize(:red)
        puts "The secret word was ".colorize(:red) + "#{game.secret_word.upcase}".colorize(:blue)
      elsif outcome == GAME_WIN
        puts "You correctly guessed the secret word: #{game.secret_word.upcase}!".colorize(:blue)
      end
    end
  end

  puts "Do you want to play again?".colorize(:green)
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
print %x{clear} # Clears the terminal screen
puts "Welcome to the Birthday Cake Word Guess Game!".colorize(:red)
puts "For each incorrect guess, you lose a candle.".colorize(:red)
puts "When you run out of candles, your birthday is ruined.".colorize(:red)
play_word_guess
