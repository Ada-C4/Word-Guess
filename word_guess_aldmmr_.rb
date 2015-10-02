require "colorize"
          __    __    __
         |==|  |==|  |==|
       __|__|__|__|__|__|_
    __|___________________|___
 __|__[]__[]__[]__[]__[]__[]__|___
|.............................o.../
 \.............................../
 _,~')_,~')_,~')_,~')_,~')_,~')_,~')/,~')_

MAX_TURNS #we're going to try to have this depend on artwork, so it might become a variable at some point.

GAME_WIN = :win
GAME_LOSE = :lose

class Game
  def initialize
  end

  def select_word
    #select a word from an array of possible words, at random
  end

  def new_guess
  end

  def find_letter_matches
  end

  def finished?



class Board

  def initialize
    @game = game
  end

  def new_display
    display = ""
    # show the artwork, in whatever state it now is in (depends on height of artwork, which determines max turns)
    # show the word_line in whatever status it is in (all blank, or filled or whatever)
    # show status messages about game outcome (win, lose, guess again)

    # first show artwork
    current_artwork = ((#totalheightofart - #turnstaken) #take that value and print the top x lines of the orignial artwork)
    #PROBABLY get from method below (def artwork)

    word_line (#just puts it? If it is completed in game)

    case @game.outcome
    when GAME_WIN
      display += "\nYou Won!"
    when GAME_LOSE
      display += "\nYou lost. :("
    end
    display += "\n"
    return display
  end


    # WILL THIS GO IN GAME OR HERE??
    # def build_word_line (LIKELY BE IN GAME)
    #   # to get length of _ _ _ _ (game word display) will need to get .length of
    #   #an element (word) in an array
    #   # board will get access to that element from select_word in game
    # end
    #
    def artwork
      #MAKES SENSE MAYBE to build artwork here, and then concat it above into the display
    end
  end



def play_wordguess
#this is where we actually play the game
  game = Game.new
  board = Board.new

  print board.new_display

  while !game.finished?
    print "Please enter a letter: "
    guessed_letter = gets

    #sanitize input
    guessed_letter = guessed_letter.gsub(/\s+/, "").upcase

    #check to see that we did receive just one letter (no numbers, etc)
    if !guessed_letter.match(/^[A-Z]$/) #regex for one cap letter
      puts "Hey, that's not one letter!"
      next #skips ahead
    end

    #Pass it to the game object
    game.new_guessed_letter(guessed_letter)

    print board.new_display
  end

  puts "Do you want to play again?"
  response = gets.chomp.upcase
  case response
  when "1", "Y", "YES"
    play_wordguess
  else
    puts "Thanks for playing Word Guess!"
    exit
  end
end
