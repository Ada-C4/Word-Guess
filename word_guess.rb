require 'colorize'
# If user hasn't guessed the word after 10 turns, they loose
MAX_ERRORS = 10

WORDS = ["harry", "ron", "hermione", "sirius", "hagrid", "neville", "dumbledore", "snape", "norbs", "ginny", "fred", "george", "bill"]

# will the .length methos work?? Make a reagular variable, because it's not a constant.
NUM_WORD = WORDS.length # Do I need an equivalent of NUM_PEGS?? It would be variable depending on word

# game outcomes. Not sure why I need to clafiry this.
GAME_WIN = :win
GAME_LOSE = :lose

# This class represents a single game. The following will be managed in this class:
# - whether the game has been won, lost, or needs to continue on.
# - the winning word
# - the player's guesses (or none on first turn)
# Class will include methods for accepting new guesses
# and will generate new word.
class Game

  attr_reader :guesses, :outcome, :matches, :errors

  def initialize
    @answer = WORDS[rand(WORDS.length)]
    @guesses = [] # starts with no guesses
    @matches = ["_"] * @answer.length
    @outcome = :playing
    @errors = 0
  end

# this method gets user input, checks to see if letter matches any in word,
  def new_guess
    print "Choose a letter: "
    guess = gets.chomp # gets user input. removes line break so I can easily check answer.
    letters = @answer.split("") # puts the individual letters into strings and puts them in an array.
    index = 0
    error = true
    letters.each do |l| # goes through each letter in the word
        if l == guess # and if a letter matches the guessed word, print it.
          @matches[index] = guess
          error = false
          puts "Good guess!".red
        end
        index += 1
    end
    if error == true
      @errors += 1
      @guesses.push(guess) # if not, puts it in the @guesses array
      puts "Incorrect guess".blue
    end
  end

  def check_status
    if @errors == MAX_ERRORS
      puts "Game Over. It was #{@answer.capitalize}"
      @outcome = GAME_LOSE
    elsif !@matches.include?("_")
      puts "YOU'RE A WINNER! It was #{@answer.capitalize}!".green
      @outcome = GAME_WIN
    end
  end
end

class Board
  def initialize(game)
    @game = game
  end

  def new_display
    @game.matches.each do |l|
        print l + " "
    end
    puts
    print "Incorrect guesses: "
    @game.guesses.each do |l|
      print l + " "
    end
    puts
  end
end

def play_game
  g = Game.new
  b = Board.new(g)
  while g.outcome != GAME_LOSE && g.outcome != GAME_WIN
    g.new_guess
    g.check_status
    b.new_display
  end
end

play_game
