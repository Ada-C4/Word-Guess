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




GAME_WIN = :win
GAME_LOSE = :lose

MAX_TURNS = 6

class Game

  attr_reader :guesses, :scores, :outcome

  #initialize method
  def initialize
    @answer = generate_answer
    @guesses = []
    @scores = []
    @outcome = :unknown
    @dash_array = generate_dash_array
    @bad_guesses = []
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
row_1 = ["  ,;'@@';,  " , "  ,;'@@';,  ", "  ,;'@@';,  " , " |',_@@_,'| ", " |',_@@_,'| ", " |',_@@_,'| ", " |        | ", " |        | ", " |        | ", "  '.____.'  ", "  '.____.'  ", "  '.____.'  "]

    if @game.bad_guesses.length == 0
      # print 9 sushi
      new_display = %Q(
        #{row_1[0]} #{row_1[1]} #{row_1[2]}
        #{row_1[3]} #{row_1[4]} #{row_1[5]}
        #{row_1[6]} #{row_1[7]} #{row_1[8]}
        #{row_1[9]} #{row_1[10]} #{row_1[11]}

        #{row_1[0]} #{row_1[1]} #{row_1[2]}
        #{row_1[3]} #{row_1[4]} #{row_1[5]}
        #{row_1[6]} #{row_1[7]} #{row_1[8]}
        #{row_1[9]} #{row_1[10]} #{row_1[11]}
        )
        #{row_1[0]} #{row_1[1]} #{row_1[2]}
        #{row_1[3]} #{row_1[4]} #{row_1[5]}
        #{row_1[6]} #{row_1[7]} #{row_1[8]}
        #{row_1[9]} #{row_1[10]} #{row_1[11]}

      puts new_display
    elsif @game.bad_guesses.length == 1
    # takes one away
    new_display = %Q(
      #{row_1[0]} #{row_1[1]} #{row_1[2]}
      #{row_1[3]} #{row_1[4]} #{row_1[5]}
      #{row_1[6]} #{row_1[7]} #{row_1[8]}
      #{row_1[9]} #{row_1[10]} #{row_1[11]}

      #{row_1[0]} #{row_1[1]}
      #{row_1[3]} #{row_1[4]}
      #{row_1[6]} #{row_1[7]}
      #{row_1[9]} #{row_1[10]}
      )

      #{row_1[0]} #{row_1[1]}
      #{row_1[3]} #{row_1[4]}
      #{row_1[6]} #{row_1[7]}
      #{row_1[9]} #{row_1[10]}
      puts new_display
    elsif @game.bad_guesses.length == 2

      new_display = %Q(
        #{row_1[0]} #{row_1[1]} #{row_1[2]}
        #{row_1[3]} #{row_1[4]} #{row_1[5]}
        #{row_1[6]} #{row_1[7]} #{row_1[8]}
        #{row_1[9]} #{row_1[10]} #{row_1[11]}

        #{row_1[0]}
        #{row_1[3]}
        #{row_1[6]}
        #{row_1[9]}
        )

    elsif @game.bad_guesses.length == 3

      new_display = %Q(
        #{row_1[0]} #{row_1[1]} #{row_1[2]}
        #{row_1[3]} #{row_1[4]} #{row_1[5]}
        #{row_1[6]} #{row_1[7]} #{row_1[8]}
        #{row_1[9]} #{row_1[10]} #{row_1[11]}
          )

    elsif @game.bad_guesses.length == 4

      new_display = %Q(
        #{row_1[0]} #{row_1[1]}
        #{row_1[3]} #{row_1[4]}
        #{row_1[6]} #{row_1[7]}
        #{row_1[9]} #{row_1[10]}
          )

    elsif @game.bad_guesses.length == 5

      new_display = %Q(
        #{row_1[0]}
        #{row_1[3]}
        #{row_1[6]}
        #{row_1[9]}
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

  print board.new_display
  letters_array = ("A".."Z").to_a

  while !game.finished?
    # do validation later - did you put in a number, have you already guessed that letter, etc.
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
