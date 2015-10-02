# This will be our Mouse Party Game. By Jenna and Daphne.
require "colorize"
# In this class we will control the workings of the game
class Game

  attr_accessor :word, :guess_list, :strikes_left

  def initialize
    @word = word_gen
    @guess_list = [] # the letters that the player has guessed, starts at none
    @strikes_left = difficulty
  end

  def word_gen
    # word list is from http://www.desiquintans.com/nounlist
    # "wordlist.txt" is saved in the same directory as this ruby file
    words = open("wordlist.txt")
    array_of_words = words.readlines
    array_of_words.map! do |word|
      word.strip
    end
    rando = array_of_words[rand(0...array_of_words.length)]
    while rando.length < 5 || rando.length > 7
      rando = array_of_words[rand(0...array_of_words.length)]
    end
    words.close
    return rando.upcase
  end

  def difficulty
    puts "What difficulty would you like in the battle for the cheese against Monsieur Le Mouse?"
    puts "1. Easy"
    puts "2. Medium"
    puts "3. Hard\n\n"

    print " > "

    difficulty_level = gets.chomp

    case difficulty_level.downcase
      when '1', '1.', 'easy' then @word.length + 5
      when '2', '2.', 'medium' then @word.length + 2
      when '3', '3.', 'hard' then @word.length
    end
  end

end


class Board
  attr_accessor :blanks

  def initialize(game)
      @game = game
      @blanks = []

      @game.word.length.times do
        @blanks.push("_ ")
      end

  end

  def display
    mouse = """
    .--,       .--,
    ( (  \\.---./ ) )
    '.__/o   o\\__.'
       {=  ^  =}
        >  -  <
       /       \\
      //       \\\\
     //|   .   |\\\\
     \"'\\       /'\"_.-~^`'-.
        \\  _  /--'         `
      ___)( )(___
     (((__) (__)))
     """

    puts mouse.colorize(:light_black)

    cheese_1 = "   ____  "
    cheese_2 = "  /|o  | "
    cheese_3 = " /o|  o| "
    cheese_4 = "/o_|_o_| "


    puts cheese_1.colorize(:yellow) * @game.strikes_left
    puts cheese_2.colorize(:yellow) * @game.strikes_left
    puts cheese_3.colorize(:yellow) * @game.strikes_left
    puts cheese_4.colorize(:yellow) * @game.strikes_left
    puts ""

    puts @blanks.join(" ")
    puts ""
  end
end


# Where the game is run from
def play_mouse_party
  game = Game.new
  board = Board.new(game)
  print board.display
  # puts "The length of the random word is #{game.word.length}"
  # puts "The word is #{game.word}"

  word_array = game.word.split("")

  while game.strikes_left > 0
    if !board.blanks.include?("_ ")
      puts "You win! 😻"
      exit
    end

    print "Give me a letter to guess? "
    guess = gets.chomp.upcase
    game.guess_list.push(guess)

    if word_array.include?(guess)
      word_array.length.times do |i|
        if word_array[i] == guess
          board.blanks[i] = guess
        end
      end
    else
        game.strikes_left -= 1
    end

    board.display
    puts "You've already guessed: #{game.guess_list.join(", ")}\n\n"
  end

  puts "You lose 🙀 "
  puts "Monsieur Le Mouse says: the word was #{game.word}. Tant pis!"

end


play_mouse_party
