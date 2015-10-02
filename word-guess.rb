require "./pacman"
# Game Constants
MAX_WRONG = 8

WORDS = %w(flower pancake caterpillar avocado dragon sushi kitten monkey football crazy mango pineapple developer engineer waffle toast penguin)

class Game
  def initialize
    @answer = generate_answer
    @answer_array = generate_answer_array
    @guess_array = []
    @wrong_guesses = []
    @correct_guesses = []
    @turn_array = []
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
        @guess_array.push(letter)
      else
        print "_"
      end
    end
    puts "\nWrong guesses:\n#{@wrong_guesses}"

   @turn_array = @guess_array
   @guess_array = []
  end

  def check_guess(guess)
    if !@answer.include?(guess)
      @wrong_guesses.push(guess)
    else
      @correct_guesses.push(guess)
    end
  end

  def image
    if wrong_guesses.length == 0
      puts pacman
    end
  end

  def new_guess(guess)
  end

  def play_game
    puts PACMAN8
    until game_lost? || game_won?
      guess = gets.chomp.upcase

      check_guess(guess)
      print_board(guess)

      puts "\nYour guess was #{guess}."

    end
    if game_lost?
      puts "GAME OVER: You lost :("
    else
      puts "GAME OVER: YOU WON! :)"
    end
  end

  def game_lost?
    MAX_WRONG == @wrong_guesses.length
  end

  def game_won?
    @turn_array == @answer_array
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
ZZZZZZZZZZZZZZZZOI     NMMM       MNMM       MMNM      MMMM      MMMM      MMMM       MMM       NNM
ZZZZZZZZZZZZZZZ?      MMNMMM     MMNMNN     MMMMMM    NMMMMM    MMMMMM    MMMMMM     MMNMM     NMMMM
ZZZZZZZZZZZZZZZOOI     MMMM       MMNM       MNMN      MNNM      MNMM      NMMM       MMM       MNM
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

a = Game.new
puts "Welcome to Word Guess!"
puts "Enter letters to guess the secret word before pacman eats everything!"
puts "What is your guess?"

a.play_game
