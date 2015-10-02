# This will be our Mouse Party Game. By Jenna and Daphne.
# updated with no content

# In this class we will contain visual aspects, such as ASCII art

MAX_GUESSES = 6

# In this class we will control the workings of the game
class Game

  attr_accessor :word

  def initialize
    @word = word_gen
    @guesses = [] # the letters that the player has guessed, starts at none

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
  def initialize(game)
      @guesses = 6
      @game = game
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
    underscores

    cheese_1 = "   ____  "
    cheese_2 = "  /|o  | "
    cheese_3 = " /o|  o| "
    cheese_4 = "/o_|_o_| "


    puts cheese_1 * @guesses
    puts cheese_2 * @guesses
    puts cheese_3 * @guesses
    puts cheese_4 * @guesses
  end

  def underscores
    underscore = "\t\t\t" + "_ " * @game.word.length
    puts underscore
  end

end


# Where the game is run from
def play_mouse_party
  game = Game.new
  board = Board.new(game)

  print board.display
  print "Give me a letter to guess? "
  guess = gets.chomp
  puts guess
end

play_mouse_party
