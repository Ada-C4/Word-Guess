#to do monday- make it so that the game only tells you that you won or lose when that happens, and doesn't still give you a message about your guess.
#add better comments to make code clearer and cleaner


ARTWORK ="""
          __    __    __
         |==|  |==|  |==|
       __|__|__|__|__|__|_
    __|___________________|___
 __|__[]__[]__[]__[]__[]__[]__|___
|.............................o.../
 \.............................../
 _,~')_,~')_,~')_,~')_,~')_,~')_,~')/,~')_
 """

GAME_WIN = :win
GAME_LOSE = :lose

CORRECT = :correct
INCORRECT = :incorrect

WORDS = [
  "ANTELOPE",
  "APOTATOA",
  "ASINKINGA",
  "ATANGERINEA",
  "AJUICEA",
  "APOSTMASTER"
]

class Game

  attr_reader :guesses, :outcome, :answer_chararray, :progress_array, :art, :resultfromguess

  def initialize
    #initalize game state
    make_letter_array
    @answer_chararray = make_letter_array
    @guesses = []
    @progress_array = ("_" * @answer_chararray.length).split("")
    @art = ARTWORK.lines
    @outcome = :unknown
    @resultfromguess = :unknown
    puts "\nWelcome to Word Guess!"
  end


  #select a word from an array of possible words, at random
  #turn that word into an array of characters
  def make_letter_array
    chosen_word = WORDS.shuffle.pop
    chosen_word.split("")
  end

  def new_guess(guessed_letter)
    #save copy of guess and add it to an array of guesses
    @guesses.push(guessed_letter)
    #RIGHT NOW including right and wrong guesses here!
    check_letter(@progress_array, @answer_chararray, guessed_letter)
  end


  def check_letter(progress_array, answer_chararray, guessed_letter)
    i = 0
    right_answer_indicator = 0
    answer_chararray.each do |char|
      if guessed_letter == char
        progress_array[i].replace(char)
        right_answer_indicator += 1
        @resultfromguess = CORRECT
      end

      i += 1
      if !progress_array.include?("_")
        @outcome = GAME_WIN
      end
    end

    if right_answer_indicator == 0
      wrong_guess(guessed_letter)
    end
  end


  def wrong_guess(guessed_letter)
    #change the art to reflect the wrong answer
    @art.delete_at(@art.length - 3)
    @resultfromguess = INCORRECT
    if @art.length == 3
      @outcome = GAME_LOSE
    end
  end

  def finished?
    @outcome == GAME_WIN || @outcome == GAME_LOSE
  end
end

class Board

  def initialize(game)
    @game = game
  end

  def new_display
    display = ""
    # show the artwork, in whatever state it now is in (depends on height of artwork, which determines max turns)
    # show the word_line in whatever status it is in (all blank, or filled or whatever)
    # show status messages about game outcome (win, lose, guess again)

    # first show artwork
    display += @game.art.join
    display += "\n"
    # puts display
    display += @game.progress_array.join(" ")
    display += "\n"
    # puts game.progress_array.join(" ")

    case @game.resultfromguess
    when CORRECT
      display += "\nGreat guess! Your ship is afloat for now\n"
    when INCORRECT
      display += "\nWhoops. Wrong guess. Your ship is sinking!\n"
    end

    case @game.outcome
    when GAME_WIN
      display += "\nYou Won!"
    when GAME_LOSE
      display += "\nYou lost. :("
    end
    display += "\n"
    return display
  end
end



def play_wordguess
#this is where we actually play the game
  game = Game.new
  board = Board.new(game)

  print board.new_display

  while !game.finished?
    print "Please enter a letter: "
    guessed_letter = gets
#OK SO FAR
    #sanitize input
    guessed_letter = guessed_letter.gsub(/\s+/, "").upcase
    #check to see that we did receive just one letter (no numbers, etc)
    if !guessed_letter.match(/^[A-Z]$/) #regex for one cap letter
      puts "Hey, that's not a letter!"
      next #skips ahead
    end

    #Pass it to the game object
    game.new_guess(guessed_letter)

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
