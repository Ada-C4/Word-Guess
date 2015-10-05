require "colorize"
MAX_ERRORS = 7

class Game
  attr_accessor :answer, :right_guesses, :user_array

def initialize
  @answer_array = []
  @user_array = []
  @right_guesses = 0
end

# Choose a random word and turn it into array
def choose_word (array_words)
  answer = array_words[rand(array_words.length-1)]
  @answer_array = answer.split("")
  return @answer_array
end

# make a new array of underscores - in the same length of the answer
def answer_to_array (answer)
  (answer.length).times do
    @user_array.push("_")
  end
end

# Check if the guess is correct - boolean
# and update the _array
def check_guess (guess)
  check = false
  n = 0 # just counting
   @answer_array.each do |letter|
     if (letter === guess) && (@user_array[n] != guess)
       @right_guesses += 1
       @user_array[n] = guess
       check = true
     end
     n += 1
  end
   return check
end

# print _array
def print_user_array
  puts
  print " #{@user_array}".to_s.center(70).blue
end


#check if the player won- true. false - continue
def won?
  if @right_guesses == @answer_array.length
    puts "Yay!! you won the game and saved the fish"
    return true
  else
    return false
  end
end

end

class Game_display

  attr_accessor :guess, :num_errors, :words, :game, :guessed_letter_array, :fish

  def initialize
    @guess = ""
    @num_errors = 0
    @words = ["door"]
    @game = Game.new
    @game.answer_to_array(@game.choose_word(@words))
    @guessed_letter_array = []
    @fish = create_fish

  end

#  def print_fish
#    print @fish[@num_errors]
#  end



  def play
    print @fish[0]
    @game.print_user_array
    while @num_errors < MAX_ERRORS
      puts
      puts
      puts "Choose a letter"
      @guess = gets.chomp  # needs a check for valid letter
     if @game.check_guess(@guess)
         puts "Good job! #{@fish.length}"
         print @fish[@num_errors]
         @game.print_user_array
         if @game.won?
           break # picture?
         end
         display_guessed_letters
     else
        puts "Sorry '#{@guess}' in not in that word! Try again #{@num_errors}"
        @num_errors += 1
        print @fish[@num_errors]
        @game.print_user_array
        display_guessed_letters
     end
    end
  end

  def display_guessed_letters
    #after each turn, the previous letter should be added to this array, then the array should be displayed on the screen
    guessed_letter_array.push(@guess)
    puts
    puts
    puts " Letters that you've already guessed"
    print guessed_letter_array
  end

def create_fish
  @fish = ["""
                ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                          ~                            ~
                          \\   '    o      '
                          /\\ o       \\  o
                        >=)'>    '   /\\ '
                          \\/   \\   >=)'>        ~
                          /    /\\    \\/
                   ~         >=)'>   /     .
                               \\/                   )
                               /
                               \\   '    o      '
                               /\\ o       \\  o
                             >=)'>    '   /\\ '
                               \\/   \\   >=)'>        ~
                               /    /\\    \\/
                        ~         >=)'>   /     .
                                    \\/                   )
                                    /                   (
                                          ~          )   )
                          }     ~              (    (   (
                         {                      )    )   )
                          }  }         .       (    (   (
                         {  {               /^^^^^^^^^^^^jgs
                        ^^^^^^^^^\         /
                                  ^^^^^^^^^
                                  """,
                """
                ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                          ~                            ~
                          \\   '    o      '
                          /\\ o       \\  o
                        >=)X>    '   /\\ '
                          \\/   \\   >=)'>        ~
                          /    /\\    \\/
                   ~         >=)'>   /     .
                               \\/                   )
                               /
                               \\   '    o      '
                               /\\ o       \\  o
                             >=)'>    '   /\\ '
                               \\/   \\   >=)'>        ~
                               /    /\\    \\/
                        ~         >=)'>   /     .
                                    \\/                   )
                                    /                   (
                                          ~          )   )
                          }     ~              (    (   (
                         {                      )    )   )
                          }  }         .       (    (   (
                         {  {               /^^^^^^^^^^^^jgs
                        ^^^^^^^^^\         /
                                  ^^^^^^^^^
                                  """, """
                ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                          ~                            ~
                          \\   '    o      '
                          /\\ o       \\  o
                        >=)X>    '   /\\ '
                          \\/   \\   >=)X>        ~
                          /    /\\    \\/
                   ~         >=)'>   /     .
                               \\/                   )
                               /
                               \\   '    o      '
                               /\\ o       \\  o
                             >=)'>    '   /\\ '
                               \\/   \\   >=)'>        ~
                               /    /\\    \\/
                        ~         >=)'>   /     .
                                    \\/                   )
                                    /                   (
                                          ~          )   )
                          }     ~              (    (   (
                         {                      )    )   )
                          }  }         .       (    (   (
                         {  {               /^^^^^^^^^^^^jgs
                        ^^^^^^^^^\         /
                                  ^^^^^^^^^ """, """
                ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                          ~                            ~
                          \\   '    o      '
                          /\\ o       \\  o
                        >=)X>    '   /\\ '
                          \\/   \\   >=)X>        ~
                          /    /\\    \\/
                   ~         >=)X>   /     .
                               \\/                   )
                               /
                               \\   '    o      '
                               /\\ o       \\  o
                             >=)'>    '   /\\ '
                               \\/   \\   >=)'>        ~
                               /    /\\    \\/
                        ~         >=)'>   /     .
                                    \\/                   )
                                    /                   (
                                          ~          )   )
                          }     ~              (    (   (
                         {                      )    )   )
                          }  }         .       (    (   (
                         {  {               /^^^^^^^^^^^^jgs
                        ^^^^^^^^^\         /
                                  ^^^^^^^^^ """,
                                  """

                ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                          ~                            ~
                          \\   '    o      '
                          /\\ o       \\  o
                        >=)X>    '   /\\ '
                          \\/   \\   >=)X>        ~
                          /    /\\    \\/
                   ~         >=)X>   /     .
                               \\/                   )
                               /
                               \\   '    o      '
                               /\\ o       \\  o
                             >=)X>    '   /\\ '
                               \\/   \\   >=)'>        ~
                               /    /\\    \\/
                        ~         >=)'>   /     .
                                    \\/                   )
                                    /                   (
                                          ~          )   )
                          }     ~              (    (   (
                         {                      )    )   )
                          }  }         .       (    (   (
                         {  {               /^^^^^^^^^^^^jgs
                        ^^^^^^^^^\         /
                                  ^^^^^^^^^
                                  """,
                                  """
              ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                        ~                            ~
                        \\   '    o      '
                        /\\ o       \\  o
                      >=)X>    '   /\\ '
                        \\/   \\   >=)X>        ~
                        /    /\\    \\/
                 ~         >=)X>   /     .
                             \\/                   )
                             /
                             \\   '    o      '
                             /\\ o       \\  o
                           >=)X>    '   /\\ '
                             \\/   \\   >=)'>        ~
                             /    /\\    \\/
                      ~         >=)X>   /     .
                                  \\/                   )
                                  /                   (
                                        ~          )   )
                        }     ~              (    (   (
                       {                      )    )   )
                        }  }         .       (    (   (
                       {  {               /^^^^^^^^^^^^jgs
                      ^^^^^^^^^\         /
                                ^^^^^^^^^ """,
                                  """
                ~^~^~^~^~^~^~^~^~^~^~^^~^~^~^~^~^~
                          ~                            ~
                          \\   '    o      '
                          /\\ o       \\  o
                        >=)X>    '   /\\ '
                          \\/   \\   >=)X>        ~
                          /    /\\    \\/
                   ~         >=)X>   /     .
                               \\/                   )
                               /
                               \\   '    o      '
                               /\\ o       \\  o
                             >=)X>    '   /\\ '
                               \\/   \\   >=)X>        ~
                               /    /\\    \\/
                        ~         >=)X>   /     .
                                    \\/                   )
                                    /                   (
                                          ~          )   )
                          }     ~              (    (   (
                         {                      )    )   )
                          }  }         .       (    (   (
                         {  {               /^^^^^^^^^^^^jgs
                        ^^^^^^^^^\         /
                                  ^^^^^^^^^ """
]
end


# new file

game_board = Game_display.new

game_board.play




end
