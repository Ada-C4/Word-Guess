# Setting global variables

class Game
attr_reader :answer, :guesses, :guess_index, :slots

  def initialize
    @answer = [] # Will pull a new word each game
    @guesses = [] # No guesses yet in the array
    # @display = Board.new
    @slots = []
    @guess_index = 0
    @max_wrong = 0
  end

  def play
    welcome_message
    generate_answer
    generate_slots
    game_play
    game_end
  end


  def welcome_message
    puts "Welcome. So you want to play a game? I'm going to choose a word, and you guess the word one letter at a time."
    puts "RULES"
  end

  def generate_answer
    @possible_words = ["beef", "onion", "cupcake", "taco", "boot", "shoe", "dog", "cat", "fireball", "mandrake", "enrage", "visceral", "vibrate", "ennervate"]
    @answer_whole = @possible_words.sample
    @answer = @answer_whole.split("")
  end

  def generate_slots
    @answer.each do |x|
      x = "_"
      @slots.push(x)
    end
  end

  def game_play
    # loop until game end
    until @max_wrong == 10 || @slots == @answer
      # print board
      #print %x{clear} # Clears the terminal screen
      print @slots
      puts
      puts
      puts "These are the letters you've already guessed: #{@guesses.sort}"
      puts
      puts "Pick a new letter: "
      input = gets.chomp.downcase
      puts
      @guesses.push(input)
      letter_match(input)
      puts
      puts
      end
  end


  def letter_match(guess)
    answer_copy = Array.new(@answer)
    num_match = 0
    while answer_copy.include?(guess)
      @guess_index = answer_copy.find_index(guess)
      @slots[@guess_index + num_match] = guess
      answer_copy.delete_at(@guess_index)
      num_match += 1
    end
    if @guesses.include?(guess)
    puts "You already guessed that letter, silly."
    elsif @slots.include?(guess) == false
      puts "Wrong!"
      @max_wrong += 1
      puts "#{@max_wrong} wrong guesses so far."
      #moving ASCII art
    end
  end

  def game_end
    if @slots == @answer
      puts "The word was #{@answer_whole}!"
      puts "YOU WIN! GOLD STAR FOR YOU!"
    elsif @max_wrong == 10
      puts "YOU SUCK. YOU KILLED THE MOUSE."
      puts "By the way, the word was #{@answer_whole}"
    end
  end

end

# class Board
# attr_reader
#
#   def initalize
#     @board =
#   end
#
# end
