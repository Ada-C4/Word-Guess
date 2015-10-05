require "colorize"
require "lolcat"


GAME_WIN = :win
GAME_LOSE = :lose

MAX_TURNS = 6

class Game

  attr_reader :guesses, :scores, :outcome

  #initialize method
  def initialize
    @answer = ""
    @guesses = []
    @scores = []
    @outcome = :unknown
    @dash_array = []
    @bad_guesses = []
  end

  #method that picks a random word and splits it into a character array
  def generate_answer(diff_level)
    word_array_easy = ["BABY","ADA","RUBY","CAT","DOG","WORD","ATOM"]
    word_array_medium = ["GUESS","DRAGON","PLANET","CODING","METHOD","FUNCTION"]
    word_array_hard = ["INITIALIZE","VARIABLE","ATTRIBUTE","CONDITIONAL","DEBUGGING"]
    if diff_level == "easy"
      @answer = word_array_easy[rand(word_array_easy.length)].split("")
    elsif diff_level == "medium"
      @answer = word_array_medium[rand(word_array_medium.length)].split("")
    elsif diff_level == "hard"
      @answer = word_array_hard[rand(word_array_hard.length)].split("")
    end
    # answer = ["D","R","A","G","O","N"]
    # make array of dashes that is the same length as the answer array
  end

  def generate_dash_array
    dash_array = []
    @answer.each do
      dash_array.push("_")
    end

    @dash_array = dash_array
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
  puts @dash_array.join(" ")
  puts

  if !@answer.include? letter
    @bad_guesses.push(letter)
  end

    if @dash_array == @answer
      @outcome = GAME_WIN
      puts "You win!"
    elsif @bad_guesses.length == MAX_TURNS
      # Player loses if they reach the maximum number of turns
      @outcome = GAME_LOSE
      puts "You lose!"
    end

  end

  def finished?
    @outcome == GAME_WIN || @outcome == GAME_LOSE
  end

  def bad_guesses
    return @bad_guesses
  end

end

class Board
  #initialize method
  def initialize(game)
    @game = game
  end

  def new_display
# row_1 = ["  ,;'@@';,  ".colorize(:red) , "  ,;'@@';,  ", "  ,;'@@';,  " , " |',_@@_,'| ", " |',_@@_,'| ", " |',_@@_,'| ", " |        | ", " |        | ", " |        | ", "  '.____.'  ", "  '.____.'  ", "  '.____.'  "]


row_1 = ["  ,;'" ,
  "@@".colorize(:red),
  "';,  ",
  "  ,;'" ,
  "@@".colorize(:red),
  "';,  ",
  "  ,;'" ,
  "@@".colorize(:red),
  "';,  ", #end top row
  " |',_" ,
  "@@".colorize(:red),
  "_,'| ",
  " |',_" ,
  "@@".colorize(:red),
  "_,'| ",
  " |',_" ,
  "@@".colorize(:red),
  "_,'| ",
  " |        | ".colorize(:green),
  " |        | ".colorize(:green),
  " |        | ".colorize(:green),
  "  '.____.'  ".colorize(:green),
  "  '.____.'  ".colorize(:green),
  "  '.____.'  ".colorize(:green)]


    if @game.bad_guesses.length == 0
      # print 9 sushi
      new_display = %Q(
      #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]} #{row_1[6]}#{row_1[7]}#{row_1[8]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]} #{row_1[15]}#{row_1[16]}#{row_1[17]}
      #{row_1[18]} #{row_1[19]} #{row_1[20]}
      #{row_1[21]} #{row_1[22]} #{row_1[23]}

      #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]} #{row_1[6]}#{row_1[7]}#{row_1[8]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]} #{row_1[15]}#{row_1[16]}#{row_1[17]}
      #{row_1[18]} #{row_1[19]} #{row_1[20]}
      #{row_1[21]} #{row_1[22]} #{row_1[23]}
      )


      # %Q(
      #   #{row_1[0]} #{row_1[1]} #{row_1[2]}
      #   #{row_1[3]} #{row_1[4]} #{row_1[5]}
      #   #{row_1[6]} #{row_1[7]} #{row_1[8]}
      #   #{row_1[9]} #{row_1[10]} #{row_1[11]}
      #
      #   #{row_1[0]} #{row_1[1]} #{row_1[2]}
      #   #{row_1[3]} #{row_1[4]} #{row_1[5]}
      #   #{row_1[6]} #{row_1[7]} #{row_1[8]}
      #   #{row_1[9]} #{row_1[10]} #{row_1[11]}
      #   )
        #{row_1[0]} #{row_1[1]} #{row_1[2]}
        #{row_1[3]} #{row_1[4]} #{row_1[5]}
        #{row_1[6]} #{row_1[7]} #{row_1[8]}
        #{row_1[9]} #{row_1[10]} #{row_1[11]}

      puts new_display
    elsif @game.bad_guesses.length == 1
    # takes one away
    new_display = %Q(
    #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]} #{row_1[6]}#{row_1[7]}#{row_1[8]}
    #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]} #{row_1[15]}#{row_1[16]}#{row_1[17]}
    #{row_1[18]} #{row_1[19]} #{row_1[20]}
    #{row_1[21]} #{row_1[22]} #{row_1[23]}

    #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]}
    #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]}
    #{row_1[18]} #{row_1[19]}
    #{row_1[21]} #{row_1[22]}
    )

      #{row_1[0]} #{row_1[1]}
      #{row_1[3]} #{row_1[4]}
      #{row_1[6]} #{row_1[7]}
      #{row_1[9]} #{row_1[10]}
      puts new_display
    elsif @game.bad_guesses.length == 2

      new_display = %Q(
      #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]} #{row_1[6]}#{row_1[7]}#{row_1[8]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]} #{row_1[15]}#{row_1[16]}#{row_1[17]}
      #{row_1[18]} #{row_1[19]} #{row_1[20]}
      #{row_1[21]} #{row_1[22]} #{row_1[23]}

      #{row_1[0]}#{row_1[1]}#{row_1[2]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]}
      #{row_1[18]}
      #{row_1[21]}
      )

    elsif @game.bad_guesses.length == 3

      new_display = %Q(
      #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]} #{row_1[6]}#{row_1[7]}#{row_1[8]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]} #{row_1[15]}#{row_1[16]}#{row_1[17]}
      #{row_1[18]} #{row_1[19]} #{row_1[20]}
      #{row_1[21]} #{row_1[22]} #{row_1[23]}
      )

    elsif @game.bad_guesses.length == 4

      new_display = %Q(
      #{row_1[0]}#{row_1[1]}#{row_1[2]} #{row_1[3]}#{row_1[4]}#{row_1[5]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]} #{row_1[12]}#{row_1[13]}#{row_1[14]}
      #{row_1[18]} #{row_1[19]}
      #{row_1[21]} #{row_1[22]}
      )

    elsif @game.bad_guesses.length == 5

      new_display = %Q(
      #{row_1[0]}#{row_1[1]}#{row_1[2]}
      #{row_1[9]}#{row_1[10]}#{row_1[11]}
      #{row_1[18]}
      #{row_1[21]}
      )

    elsif @game.bad_guesses.length == 6
      new_display = %Q(
        Totoro ate all your sushi!!!
               !         !
              ! !       ! !
             ! . !     ! . !
                ^^^^^^^^^ ^
              ^             ^
            ^  (0)       (0)  ^
           ^        ""         ^
          ^   ***************    ^
        ^   *                 *   ^
       ^   *   /\\   /\\   /\\    *    ^
      ^   *                     *    ^
     ^   *   /\\   /\\   /\\   /\\   *    ^
    ^   *                         *    ^
    ^  *                           *   ^
    ^  *                           *   ^
     ^ *                           *  ^
      ^*                           * ^
       ^ *                        * ^
       ^  *                      *  ^
         ^  *       ] [         * ^
             ^^^^^^^^ ^^^^^^^^^
      )
    end

  end

end


# end Board class


def play_word_guess
  game = Game.new
  board = Board.new(game)

  puts "Welcome to Word Guess! What difficulty level would you like to play? Please choose easy, medium, or hard:"
  diff_level = gets.chomp.downcase
  while diff_level != "easy" && diff_level != "medium" && diff_level != "hard"
    puts "That's not a difficulty level! Please choose easy, medium, or hard:"
    diff_level = gets.chomp.downcase
  end
  game.generate_answer(diff_level)
  game.generate_dash_array

  print board.new_display
  letters_array = ("A".."Z").to_a

  while !game.finished?
    # do validation later - did you put in a number, have you already guessed that letter, etc
    puts "Guess a letter:"
    if game.guesses != []
      puts "You have already guessed: #{game.guesses}"
      puts
    end
    letter = gets.chomp.upcase
    while !letters_array.include? letter
      puts "That's not a letter! Please enter a single letter:"
      letter = gets.chomp.upcase
    end
    puts
    puts "You guessed #{letter}"
    puts
    while game.guesses.include? letter
      puts "You already guessed that letter! Please try another letter:"
      letter = gets.chomp.upcase
    end
    puts
    game.new_guess(letter)
    # print game.bad_guesses
    print board.new_display
    #redraw the board and return the letter
    # if the letter is right, it shows the letter, if not, remove a sushi
    # decrement guess count
    # while loop - while game is not finished, prompt user to guess again

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

play_word_guess
