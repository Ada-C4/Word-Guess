#REMEMBER to change guessed_letter array to only have correct letters!
#possible problem spots-
#might need return for make letter array
#does match mean true? (in regex part)
#in new_guess might need guessed_letter.dup
#could separate out checking guesses as a method from new_guess
#initializing @progress_array, variables found ok?
#progress array in right place
#defining art_array - where to put it?
#putting make_letter_array in initialize might mess it up
# require "colorize"
#don't forget to that the "a"s out of the words

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

MAX_TURNS = (ARTWORK.lines.length - 2)

GAME_WIN = :win
GAME_LOSE = :lose

WORDS = [
  "antelope",
  "potatoa",
  "sinkinga",
  "tangerinea",
  "juicea",
  "postmaster"
]

class Game

  attr_reader :guesses, :outcome, :answer_chararray, :progress_array, :art_array, :reassembled_art

  def initialize
    #initalize game state
    make_letter_array
    @answer_chararray = make_letter_array
    @guesses = []
    @progress_array = ("_" * @answer_chararray.length).split("")
    @art_array = []
    @reassembled_art = ARTWORK
    # puts @reassembled_art
    @outcome = :unknown
    # puts @progress_array
    # puts (@progress_array.join(" ")).to_s
  end


  #select a word from an array of possible words, at random
  #turn that word into an array of characters
  def make_letter_array
    chosen_word = WORDS.shuffle.pop
    chosen_word.split("")
  end

    @art_array = ARTWORK.lines
    def new_guess(guessed_letter)
      puts guessed_letter
      # this is definitely getting the guessed letter at this point.
      #save copy of guess and add it to an array of guesses
      @guesses.push(guessed_letter)
      #RIGHT NOW including right and wrong guesses here!
      #compare the two arrays (answer_chararray and guessed_letter)
      # print @answer_chararray #looks good

      # print @progress_array #works!
      # puts guessed_letter #works.

      i = 0
      @answer_chararray.each do |char|
        if guessed_letter == char
          print @progress_array #DOES NOT WORK
          #replace the "_" in @progress_array with the letter
          @progress_array[i].replace(char)
          i += 1
          print @progress_array #NOT HAPPENING
        else
          wrong_guess(guessed_letter)
        end
      end
    end


  def wrong_guess(guessed_letter)
    @art_array = ARTWORK.lines
    puts @art_array
    @art_array.delete_at(@art_array.length - 1)
    puts "Hi."
    puts @art_array
    reassemble_art(@art_array)
    #last element in the array is the one we want to KEEP unchanged
    #remove an element that is second to last
    #print that string

    #delete a line from the artwork
    #add wrong guess to an wrong_guess_array
    #give a message
    #pass progress_array to the Board
  end

  def reassemble_art(art_array)
    # puts @art_array
    art_array.each do |art_line|
    @reassembled_art = puts art_line
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

  def new_display(game)
    display = ""
    # show the artwork, in whatever state it now is in (depends on height of artwork, which determines max turns)
    # show the word_line in whatever status it is in (all blank, or filled or whatever)
    # show status messages about game outcome (win, lose, guess again)

    # first show artwork
    display += game.reassembled_art
    # puts display
    display += game.progress_array.join(" ")
    # puts game.progress_array.join(" ")

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

  print board.new_display(game)

  while !game.finished?
    print "Please enter a letter: "
    guessed_letter = gets

#OK SO FAR

    #sanitize input
    guessed_letter = guessed_letter.gsub(/\s+/, "").upcase
    puts guessed_letter
    #check to see that we did receive just one letter (no numbers, etc)
    if !guessed_letter.match(/^[A-Z]$/) #regex for one cap letter
      puts "Hey, that's not a letter!"
      next #skips ahead
    end

#THIS APPEARS TO BE WORKING, TOO, UNTIL THIS POINT

    #Pass it to the game object
    game.new_guess(guessed_letter)
#probably getting effed up here somewhere.

    print board.new_display(game)

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
