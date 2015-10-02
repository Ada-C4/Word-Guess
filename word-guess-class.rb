# Setting global variables

class Game
attr_reader :answer, :guesses, :scores, :guess_index, :slots,

  def initialize
    @answer = [] # Will pull a new word each game
    @guesses = [] # No guesses yet in the array
    @scores = :unknown # Will be determined at the end of the game
    @display = Board.new
    @slots = []
    @guess_index = 0
  end

  def play
    welcome_message
    generate_answer
    generate_slots
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

  # def play
  #   welcome_message
  #
  # end

  def letter_match(guess)
    @answer.each do |l|
      if guess == l
        @guess_index = @answer.find_index(l)
        @slots[@guess_index] = @answer[@guess_index]
      else
        puts "wrong answer"
      end
    end
  end


end

class Board
attr_reader :slots,

  def initalize
    @slots = []
  end

  def number_of_slots(answer_length)
    (answer_length).times do
    @slots.push("_")
    end
  end

end
