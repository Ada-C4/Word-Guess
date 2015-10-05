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
  print @user_array
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
       n += 1
       check = true
     end
  end
   return check
end

# print _array
def print_user_array
  print @user_array
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

  attr_accessor :guess, :num_errors, :words, :game

  def initialize
    @guess = ""
    @num_errors = 0
    @words = ["cat", "door"]
    @game = Game.new
    @game.answer_to_array(@game.choose_word(@words))

  end

  def play
    while @num_errors < MAX_ERRORS
      puts "Choose a letter"
      @guess = gets.chomp  # needs a check for valid letter
     if @game.check_guess(@guess)
         puts "Good job!"
         if @game.won?
           break # picture?
         end
     else
        puts "No '#{@guess}' in that word! Try again"
        @num_errors += 1
     end
    end
  end



# new file

 game_board = Game_display.new


game_board.play



end
