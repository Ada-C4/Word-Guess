# This will be our Mouse Party Game. By Jenna and Daphne.

# In this class we will control the workings of the game
class Game

  attr_accessor :word, :guess_list

  def initialize
    @word = word_gen
    @guess_list = [] # the letters that the player has guessed, starts at none
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
    return rando
  end

end


class Board
  attr_accessor :strikes, :blanks

  def initialize(game)
      @strikes = 6
      @game = game
      @blanks = []
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

    puts mouse
    cheese_print
  end

  def cheese_print

    cheese_1 = "   ____  "
    cheese_2 = "  /|o  | "
    cheese_3 = " /o|  o| "
    cheese_4 = "/o_|_o_| "


    puts cheese_1 * @strikes
    puts cheese_2 * @strikes
    puts cheese_3 * @strikes
    puts cheese_4 * @strikes
    puts ""
    underscores
  end

  def underscores
    @game.word.length.times do
      @blanks.push("_ ")
    end

    puts @blanks.join(" ")
    puts ""
  end

end


# Where the game is run from
def play_mouse_party
  game = Game.new
  board = Board.new(game)
  print board.display
  puts "The length of the random word is #{game.word.length}"
  puts "The word was #{game.word}"

# while board.strikes > 0
#     print "Give me a letter to guess? "
#     guess = gets.chomp
#     game.guess_list.push(guess)
#     puts "You've guessed the folloing letters: #{game.guess_list}"
#     # update number of cheese to print
#     print board.display
end


play_mouse_party
