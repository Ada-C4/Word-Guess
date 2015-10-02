
# Game Constants
MAX_WRONG = 8

GAME_WIN = :win
GAME_LOSE = :lose

WORDS = %w(flower pancake caterpillar avocado dragon sushi)

class Game
  def initialize
    @answer = generate_answer
    @answer_array = generate_answer_array
    @wrong_guesses = []
    @correct_guesses = []
  end

  def generate_answer
    answer = WORDS[rand(0..(WORDS.length - 1))].upcase
    return answer
  end

  def generate_answer_array
    answer_array = @answer.split("")
    return answer_array
  end

  def print_board(guess)
    @answer_array.each do |letter|
      if guess == letter
        print letter
      else
        print "_"
      end
    end
  end

  def image
  end

  def new_guess(guess)
  end

  def check(guess)
    if @answer_array.include?(guess)
      puts "yay"
      puts @answer
    else
      puts "boo"
      @wrong_guesses.push(guess)
      puts @answer
    end
  end


end

a = Game.new
puts "Welcome to Word Guess!"
puts "Enter letters to guess the secret word before pacman eats everything!"
puts "What is your guess?"

guess = gets.chomp.upcase
a.print_board(guess)

puts "Your guess was #{guess}."
