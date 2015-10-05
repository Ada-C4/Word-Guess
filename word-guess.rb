# This will be our Mouse Party Game. By Jenna and Daphne.
require "colorize"
# In this class we will control the workings of the game

MOUSE = """
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
YOU_WIN = """
        ________________________
       < Félicitations! You win! >
        ------------------------
     """

YOU_LOSE = """
      __________
    <  you lose! >
      ----------
  """

class Game

  attr_accessor :word, :guess_list, :strikes_left

  def initialize
    @guess_list = [] # the letters that the player has guessed, starts at none
    @language = choose_language
    @word = word_gen
    @strikes_left = difficulty
  end

  def word_gen
    # word list is from http://www.desiquintans.com/nounlist
    # "wordlist.txt" is saved in the same directory as this ruby file
    if @language == :english
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

    elsif @language == :french
      words = open("frenchwordlist.txt")
      array_of_words = words.readlines
      array_of_words.map! do |word|
        word.strip
      end
      rando = array_of_words[rand(0...array_of_words.length)]
      while rando.length < 4 || rando.length > 6
        rando = array_of_words[rand(0...array_of_words.length)]
      end
      words.close
      return rando.upcase
    end
  end

  def choose_language
    print "Would you like to play the game in English or French? "

    while true
      language = gets.chomp
      case language.downcase
      when 'english'
        return :english
      when 'french'
        return :french
      else
        print "Pick a language: "
      end
    end
  end

  def difficulty

    puts MOUSE.colorize(:light_black)
    puts "Bonjour! Je suis Monsieur Le Mouse."
    puts "You're here to win some of my precious fromage, n'est-ce pas? Allons-y!"
    puts "\nHere are ze rules:"
    puts "Zees iz a word-guess game. Guess the word I give you, either one letter at a time or the whole word at once."
    puts "If you guess individual letters correctly, they will be shown on the board."
    puts "But if you guess wrong, I take away ze cheese!"
    puts "\nYou get the most guesses in Easy mode and the fewest in Hard."
    puts "Bonne chance!"
    puts "\n1. Easy"
    puts "2. Medium"
    puts "3. Hard\n\n"

    print "Select ze difficulty level: "

    while true
      difficulty_level = gets.chomp
      case difficulty_level.downcase
      when '1', '1.', 'easy'
        return @word.length + 5
      when '2', '2.', 'medium'
        return @word.length + 2
      when '3', '3.', 'hard'
        return @word.length
      else
        print "Pick a difficulty: "
      end
    end
  end

  def play_again
    while true
      print "Would you like to play ze game again? (y/n) "
      game_again = gets.chomp
      case game_again.downcase
      when 'y'
        play_mouse_party
      when 'n'
        exit
      end
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

    puts MOUSE.colorize(:light_black)

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

  puts "The word is #{game.word}"   # prints the word, useful for testing

  while game.strikes_left > 0
    if !board.blanks.include?("_ ")
      puts YOU_WIN
      puts "\t   #{game.strikes_left} cheeses".colorize(:yellow) + " for you!\n\n"

      game.play_again
    end


    guess = ''
    until /^[[:alpha:]]+$/.match(guess) # matches strings that consist of only 1 or more letters
      print "Give me a letter to guess? "
      guess = gets.chomp.upcase.strip
    end

    if guess == game.word.upcase && guess.length > 1
      puts YOU_WIN
      puts "\t   #{game.strikes_left} cheeses".colorize(:yellow) + " for you!\n\n"

      game.play_again
    elsif guess.length > 1
      game.strikes_left -= 1
    end

    if word_array.include?(guess)
      word_array.length.times do |i|
        if word_array[i] == guess
          board.blanks[i] = guess
        end
      end
    else
      if !game.guess_list.include?(guess) && guess.length == 1
        game.strikes_left -= 1
      end
    end

    if !game.guess_list.include?(guess)
      game.guess_list.push(guess)
    end

    board.display
    puts "You've already guessed: #{game.guess_list.join(", ")}\n\n"
  end

  puts YOU_LOSE
  puts "Monsieur Le Mouse says: the word was #{game.word}."
  puts "No cheeses".colorize(:yellow) + " for you. Tant pis!\n\n"

  game.play_again

end


play_mouse_party
