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
    generate_answer
  end

  def generate_answer
    possible_words = ["beef", "onion", "boot", "shoe", "dog", "cat", "fireball", "mandrake"]
    @answer = possible_words.sample.split("")
  end

  def generate_slots
    (@answer.length).times do
    @slots.push("_")
    end
  end

  # def play
  #   welcome_message
  #
  # end

  def welcome_message
    puts "WELCOME"
    puts "RULES"
  end

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
