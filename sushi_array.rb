#        ,;'@@';,    ,;'@@';,    ,;'@@';,
#       |',_@@_,'|  |',_@@_,'|  |',_@@_,'|
#       |        |  |        |  |        |
#        '.____.'    '.____.'    '.____.'
#
#
#        ,;'OO';,    ,;'OO';,    ,;'OO';,
#       |',_OO_,'|  |',_OO_,'|  |',_OO_,'|
#       |        |  |        |  |        |
#        '.____.'    '.____.'    '.____.'
#
#
#        ,;'O@';,    ,;'O@';,    ,;'O@';,
#       |',_@H_,'|  |',_@H_,'|  |',_@H_,'|
#       |        |  |        |  |        |
#        '.____.'    '.____.'    '.____.'
#
#
# row_1 = ["  ,;'@@';,  " , "  ,;'@@';,  ", "  ,;'@@';,  " , "  |',_@@_,'|  ", "  |',_@@_,'|  ", "  |',_@@_,'|  ", "  |        |  ", "  |        |  ", "  |        |  ", "  '.____.'  ", "  '.____.'  ", "  '.____.'  "]


# puts row_1[0] row_1

GAME_WIN = :win
GAME_LOSE = :lose

MAX_TURNS = 9

class Game

  attr_reader :guesses, :scores, :outcome

  #initialize method
  def initialize
    @answer = generate_answer
    @guesses = []
    @scores = []
    @outcome = :unknown
    @dash_array = generate_dash_array
  end

  #method that picks a random word and splits it into a character array
  def generate_answer
    word_array = ["DRAGON","PLANET","BABY","ADA","RUBY","CODING"]
    answer = word_array[rand(6)].split("")
    # answer = ["D","R","A","G","O","N"]
    # make array of dashes that is the same length as the answer array
    return answer
  end

  def generate_dash_array
    dash_array = []
    @answer.each do
      dash_array.push("_")
    end

    return dash_array
  end


  def new_guess(letter)
   @guesses.push(letter.dup)
   # guesses = ["A"]
   # puts "The dash array is #{@dash_array}"
   # puts "The answer is #{@answer}"
  # check guesses array to see if any of the previous guesses should be printed because they are correct
  # print correct previous guesses but don't print incorrect guesses

  # checking to see if the letter you entered this turn is in the word
  # print letter if it is in the word but don't print if it isn't in the word
  # answer = ["D","R","A","G","O","N"]
  # dash_array = ["_","_","_","_","_","_"]
  # letter = "D"
  @answer.length.times do |index|
    if letter == @answer[index]
      @dash_array[index] = @answer[index]
    end
  end
  puts @dash_array
  puts

    if @dash_array == @answer
      @outcome = GAME_WIN
      puts "You win!"
    elsif @guesses.length == MAX_TURNS
      # Player loses if they reach the maximum number of turns
      @outcome = GAME_LOSE
      puts "You lose!"
    end

  end

  def finished?
    @outcome == GAME_WIN || @outcome == GAME_LOSE
  end

end

class Board
  #initialize method
  def initialize(game)
    @game = game
  end

  def new_display
    display = "This is the new display"
    # ASCII art goes here
  end

  #play method

end


# end Board class


def play_word_guess
  game = Game.new
  board = Board.new(game)

  print board.new_display

  while !game.finished?
    # do validation later - did you put in a number, have you already guessed that letter, etc.
    puts "Guess a letter."
    letter = gets.chomp
    puts
    puts "You guessed #{letter}"
    puts
    if game.guesses != []
      puts "You have already guessed: #{game.guesses}"
      puts
    end
    game.new_guess(letter)
    #redraw the board and return the letter
    # if the letter is right, it shows the letter, if not, remove a sushi
    # decrement guess count
    # while loop - while game is not finished, prompt user to guess again
    # repeat until game ends

    # max number of guesses reached is the end of the game OR entire word revealed
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

puts "Did this run?"
