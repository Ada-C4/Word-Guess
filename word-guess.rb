
# Game Constants
MAX_WRONG = 8

GAME_WIN = :win
GAME_LOSE = :lose

WORDS = %w(flower pancake caterpillar avocado dragon sushi kitten monkey football crazy mango pineapple developer engineer waffle toast)

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
    puts "Word = "
    @answer_array.each do |letter|
      if letter == guess || @correct_guesses.include?(letter)
        print letter
      else
        print "_"
      end
    end
    puts "\nWrong guesses:\n#{@wrong_guesses}"
  end

  def check_guess(guess)
    if !@answer.include?(guess)
      @wrong_guesses.push(guess)
    else
      @correct_guesses.push(guess)
    end
  end

  def image
  end

  def new_guess(guess)
  end

end


pacman =
<<-PACMAN
    OZZOZZZZO$ZZZO
,OZZZZZZZZZZZZZ$Z$ZOI
ZOOZZZZZZZZZZZZZZZZZ$ZO
8ZZZ$ZZZZZZZZZZZZZZZZO$Z$
ZZZZZZZZZZZZZZZZZZZZZZ$ZI
O$ZZZZZZZZZZZZZZZZZZZZZ=
ZZZZZZZZZZZZZZZZZ$$Z$O
ZZZZZZZZZZZZZZZZZZOZ
ZZZZZZZZZZZZZZZZOI       NMMM       MNMM       MMNM      MMMM      MMMM      MMMM       MMM       NNM
ZZZZZZZZZZZZZZZ?        MMNMMM     MMNMNN     MMMMMM    NMMMMM    MMMMMM    MMMMMM     MMNMM,    NMMMM
ZZZZZZZZZZZZZZZOOI       MMMM       MMNM       MNMN      MNNM      MNMM      NMMM       MMM       MNM
ZZZZZZZZZZZZZZZZZ$Z:
ZZZZZZZZZZZZZZZZZZZZZO
ZZZZZZZZZZZZZZZZZZZZZ$Z
ZZZZZZZZZZZZZZZZZZZZZZZZ
OZZZZZZZZZZZZZZZZZZZZZ$Z8
Z$Z$ZZZZZZZZZZZZZZZZO$Z
O$ZZZZZZZZZZZZZZZZ$7
+Z$ZZZZZZZ$ZZZZ
    ?7ZZZZZ$

PACMAN

puts pacman

a = Game.new
puts "Welcome to Word Guess!"
puts "Enter letters to guess the secret word before pacman eats everything!"
puts "What is your guess?"

while true
guess = gets.chomp.upcase

a.check_guess(guess)
a.print_board(guess)

puts "\nYour guess was #{guess}."
end
