# Setting global variables

class Game
attr_reader :answer, :guesses, :scores, :guess_index, :slots

  def initialize
    @answer = [] # Will pull a new word each game
    @guesses = [] # No guesses yet in the array
    #@scores = :unknown # Will be determined at the end of the game
    #@display = Board.new
    @slots = []
    @guess_index = 0
    @max_wrong = 0
  end

  def play
    welcome_message
    generate_answer
    generate_slots
    game_play
    #game_end
  end


  def welcome_message
    puts "Welcome. So you want to play a game? I'm going to choose a word, and you guess the word one letter at a time."
    puts "RULES"
  end

  def generate_answer
    possible_words = ["beef", "onion", "boot", "shoe", "dog", "cat", "fireball", "mandrake"]
    @answer = possible_words.sample.split("")
  end

  def generate_slots
    @answer.each do |x|
      x = "_"
      @slots.push(x)
    end
  end

  def game_play
    # loop until game end
    until @max_wrong == 10 || @slots == @answers
      # print board
      print @slots
      puts @guesses.sort
      puts "Pick a letter: "
      input = gets.chomp.downcase
      letter_match(input)
      #print %x{clear} # Clears the terminal screen
    end
  end


  def letter_match(guess)
    answer_copy = Array.new(@answer)
    num_match = 0
    while answer_copy.include?(guess)
      @guess_index = answer_copy.find_index(guess)
      @slots[@guess_index + num_match] = answer_copy[@guess_index]
      answer_copy.remove![@guess_index]
      num_match += 1
    end
    if @slots.include?(guess) == false
      puts "Wrong"
      @max_wrong += 1
      puts "#{@max_wrong} wrong guesses so far."
      #moving ASCII art
    end
  end

  #
  # def letter_match(guess)
  #   @answer.each do |l|
  #     if guess == l
  #       @guess_index = @answer.find_index(l)
  #       @slots[@guess_index] = @answer[@guess_index]
  #       puts "Good job! You found a match."
  #       puts @answer
  #       puts @slots
  #     end
  #     end
  #     if @slots.include?(guess) == false
  #       puts "Wrong"
  #       @max_wrong += 1
  #       puts "#{@max_wrong} wrong guesses so far."
  #       #moving ASCII art
  #     end
  # end

  def game_end

  end

end

class Board
attr_reader :slots

  def initalize

  end

end
