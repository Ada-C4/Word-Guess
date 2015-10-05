require "colorize"

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
REPEAT = :repeat

WORDS = [
  "ANTELOPE",
  "POTATO",
  "SINKING",
  "TANGERINE",
  "JUICE",
  "POSTMASTER",
  "DELICATESSEN",
  "CAMOUFLAGE",
  "OBNOXIOUS",
  "ZAMBONI"
]

class Game

  attr_reader :guesses, :outcome, :answer_chararray, :progress_array, :art, :resultfromguess, :wrong_guess_array, :right_guess_array

  def initialize
    #initalize game state
    make_letter_array
    @answer_chararray = make_letter_array
    @progress_array = ("_" * @answer_chararray.length).split("")
    @art = ARTWORK.lines
    @outcome = :unknown
    @resultfromguess = :unknown
    @wrong_guess_array = []
    @right_guess_array = []
    puts "\n\nWelcome to Word Guess!"
  end


  #select a word from an array of possible words, at random
  #turn that word into an array of characters
  def make_letter_array
    chosen_word = WORDS.shuffle.pop
    chosen_word.split("")
  end

  def new_guess(guessed_letter)
    check_letter(@progress_array, @answer_chararray, guessed_letter)
  end


  def check_letter(progress_array, answer_chararray, guessed_letter)
    i = 0
    right_answer_indicator = 0
    answer_chararray.each do |char|
      if guessed_letter == char
        progress_array[i].replace(char)
        right_answer_indicator += 1
      end
    i += 1
    end

    right_answer = right_answer_indicator != 0
    repeated_right_answer = right_guess_array.include?(guessed_letter)
    repeated_wrong_answer = wrong_guess_array.include?(guessed_letter)

    #what to do if the answer is correct
    if right_answer
      if repeated_right_answer
        @resultfromguess = REPEAT
      else #non repeated right answer
        @resultfromguess = CORRECT
        @right_guess_array.push(guessed_letter)
        puts @resultfromguess
        if !progress_array.include?("_")
          @outcome = GAME_WIN
        end
      end
    else #wrong_answer
      if repeated_wrong_answer
        @resultfromguess = REPEAT
      else #non repeated wrong answer
        #change the art to reflect the wrong answer
        @art.delete_at(@art.length - 3)
        @resultfromguess = INCORRECT
        @wrong_guess_array.push(guessed_letter)
        if @art.length == 3
          @outcome = GAME_LOSE
        end
      end
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
    # first show artwork
    display += @game.art.join
    display += "\n"
    # Then show the game progress (how filled in the word is)
    display += @game.progress_array.join(" ")
    display += "\n\n"
    #Then show the wrong guesses thus far
    display += "Wrong guesses: #{@game.wrong_guess_array.join(" ")}\n\n"

    if !@game.finished?
      case @game.resultfromguess
      when CORRECT
        display += "Great guess! Your ship is afloat for now\n\n"
      when INCORRECT
        display += "Whoops. Wrong guess. Your ship is sinking!\n\n"
      when REPEAT
        display += "You already guessed that letter. Guess again.\n\n"
      end

    else
      case @game.outcome
      when GAME_WIN
        display += "You Won! :)\n"
      when GAME_LOSE
        display += "You Lost. :(\n"
      end
      display += "\n"
    end
    return display
  end
end



def play_wordguess
  game = Game.new
  board = Board.new(game)

  print board.new_display

  while !game.finished?
    print "Please enter a letter: "
    guessed_letter = gets
    #sanitize input
    guessed_letter = guessed_letter.gsub(/\s+/, "").upcase
    #check to see that we did receive just one letter (no numbers, etc)
    if !guessed_letter.match(/^[A-Z]$/) #regex for one cap letter
      puts "Hey, that's not a letter!"
      next
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
