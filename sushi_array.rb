       ,;'@@';,    ,;'@@';,    ,;'@@';,
      |',_@@_,'|  |',_@@_,'|  |',_@@_,'|
      |        |  |        |  |        |
       '.____.'    '.____.'    '.____.'


       ,;'OO';,    ,;'OO';,    ,;'OO';,
      |',_OO_,'|  |',_OO_,'|  |',_OO_,'|
      |        |  |        |  |        |
       '.____.'    '.____.'    '.____.'


       ,;'O@';,    ,;'O@';,    ,;'O@';,
      |',_@H_,'|  |',_@H_,'|  |',_@H_,'|
      |        |  |        |  |        |
       '.____.'    '.____.'    '.____.'


row_1 = ["  ,;'@@';,  " , "  ,;'@@';,  ", "  ,;'@@';,  " , "  |',_@@_,'|  ", "  |',_@@_,'|  ", "  |',_@@_,'|  ", "  |        |  ", "  |        |  ", "  |        |  ", "  '.____.'  ", "  '.____.'  ", "  '.____.'  "]


puts row_1[0] row_1

GAME_WIN = :win
GAME_LOSE = :lose

MAX_TURNS = 9

word_array = ["DRAGON","PLANET","BABY","ADA","RUBY","CODING"]

class Game

  attr_reader :guesses, :scores, :outcome

  #initialize method
  def initialize()
    @answer = generate_answer
  #  @guesses = []
    @scores = []
    @outcome = :unknown
  end

  #method that picks a random word and splits it into a character array
  def generate_answer
    answer = word_array[rand(6)].split("")
    # answer = ["D","R","A","G","O","N"]
    # return answer
  end

  def new_guess(guess)
  #  @guesses.push(guess.dup)

    answer.each do |char|
      if letter == char
        puts letter
      else
        puts "_"
      end
    end


  end

  def finished?
    @outcome == GAME_WIN || @outcome == GAME_LOSE
  end

end

class Board
  #initialize method

  #play method
  # do validation later
  def play_word_guess
    game = Game.new
    board = Board.new(game)

    while !game.finished?
      puts "Let's play! Guess a letter"
      letter = gets.chomp
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

  #check to see if the letter matches or not

  #redraw the board and return the letter
  # if the letter is right, it shows the letter, if not, remove a sushi
  # decrement guess count
  # while loop - while game is not finished, prompt user to guess again
  # repeat until game ends

  # max number of guesses reached is the end of the game OR entire word revealed


end

# make list of words

Game.new()
Board.new()
