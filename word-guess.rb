
# Game Constants
MAX_WRONG = 8

GAME_WIN = :win
GAME_LOSE = :lose

WORDS = %w(flower pancake caterpillar avocado dragon sushi)

class Game
  def initialize
    @answer = generate_answer
  end

  def generate_answer
    answer = WORDS[rand(0..(WORDS.length - 1))]
    return answer
  end

  def new_guess(guess)

  end

end

class Board

end

puts "Welcome to Word Guess!"
puts "Enter letters to guess the secret word before pacman eats everything!"
puts "What is your guess?"

guess = gets.chomp

puts "Your guess was #{guess}."
