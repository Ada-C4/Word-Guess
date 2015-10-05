# images.rb is a file containing the constant IMAGES_CHASE and IMAGES_CHASE, which are arrays of ASCII art
require "./images"
# different word options to be pulled from in the random word generator method
WORD_LIST = ["aspen", "slush", "fauna", "lasso", "tower", "gusty", "elbow", "fancy", "shark", "nifty", "sassy"]
# each object of Game class represents a new game of Word Guess
class Game
# when a new Game object is initialized: an empty array (guess_history) is created to store all the guesses
# made throughout a given game, a random_word is generated from the WORD_LIST constant, and two arrays are populated:
#     (1) the unsolved_array starts as an array of each character of the random_word;
#     (2) the solved_array starts as an array of "_" characters; there is one element for each character
#         in the random_word
# the idea is that as correct letter guesses are made, those letters are removed from the unsolved_array
# (replaced with "_") and moved to the solved_array where they replace the "_" in the corresponding index position(s)
# image_index starts a 0; this will increment with each wrong answer to determine which image from  IMAGES_CHASE gets displayed
# num_unique letters is set equal to the number of unique characters in the random word
# max_guesses is equal to the number of unique characters + 3. This will keep the difficulty of the game somewhat constant.  For exmaple,
# the word "sassy" only has 3 unique characters, so the user will only have 6 letter guesses.
# num_guess is set equal to max_guesses to start. This will decrement with each guess.
# attr_reader makes it so we can access the value of these variables for a given Game object from the Board class
  attr_reader :random_word, :image_index, :solved_array, :guess_history, :num_guess, :max_guesses

  def initialize
    @guess_history = []
    @random_word = WORD_LIST[rand(0...WORD_LIST.length)]
    @solved_array = Array.new(@random_word.length, "__")
    @unsolved_array = @random_word.each_char.to_a
    @image_index = 0
    @num_unique_letters = @random_word.each_char.to_a.uniq.length
    @max_guesses = @num_unique_letters + 3
    @num_guess = @max_guesses
  end

  # the guess method determines if there's a match between the guess and the unsolved_array
  # if there is a match, it replaces the letter(s) in the unsolved_array with "_" in the appropriate index position(s);
  #   it also replaces the "_" in the corresponding index position(s) of the solved_array with the correctly guessed letter
  # if there is no match, image_index increments by 1 (so that the next image in the IMAGE_CHASE array will get displayed)
  # each time the guess method is called, num_guess decrements 1 and the guess is added to the guess_history array
  def guess(guess)
    @guess_history.push(guess)
    @num_guess -= 1
    if guess == @random_word
      @solved_array = @random_word.each_char.to_a
    elsif @unsolved_array.include?(guess)
      while @unsolved_array.include?(guess)
        index = @unsolved_array.index(guess)
        @solved_array[index] = @unsolved_array[index]
        @unsolved_array[index] = "_"
      end
    else
      @image_index += 1
    end
  end

  # a lost game (meaning lost? will return true) defined the number of guesses reaching 0
  def lost?
    if @num_guess == 0
      true
    else
      false
    end
  end

  # a victory (meaning won? returns true) is defined by a match between the random_word and
  # the solved_array
  def won?
    if @solved_array.join == @random_word
      true
    else
      false
    end
  end
end

# the Board class is used to control the display of the game
# it receives a game object as a parameter so it can access the methods defined in Game above
class Board
  def initialize(game)
    @game = game
  end
  # this method defines the display while the game is still ongoing
  def display_chase
    #nothing will happen if the game is lost or won
    unless @game.lost? || @game.won?
      # display image based on current value of image_index
      puts IMAGES_CHASE[@game.image_index]
      # display the solved_array as a string separated by two spaces between each element;
      # any letters are made uppercase
      puts " " + @game.solved_array.join("  ").upcase
      # if it's the very first guess, display this message
      if @game.num_guess == @game.max_guesses
        puts
        puts "You have #{@game.max_guesses} letter guesses to save the fish!"
        puts "If you think you know the word, you can also type out the word in full."
        puts "Make sure any word guesses are exactly #{@game.random_word.length} letters long!"
      # otherwise, display this message:
      else
        puts
        puts "Guesses so far: #{@game.guess_history.join(", ")}"
        puts "Guesses remaining: #{@game.num_guess}"
      end
    end
  end
  # this method defines the display once the game has been lost or won
  def display_outcome
    line_width = 30
    # if won? is true, display the second image from IMAGES_OUTCOME and the VICTORY! message
    if @game.won?
      puts IMAGES_OUTCOME[1]
      puts "**************".center(line_width)
      puts "😻  VICTORY! 😻 ".center(line_width)
      puts "**************".center(line_width)
      puts
    # if the game was lost, display the first image from IMAGES_OUTCOME and the GAME OVER message
    else
      puts IMAGES_OUTCOME[0]
      puts "***************".center(line_width)
      puts "😭  GAME OVER 😭 ".center(line_width)
      puts "***************".center(line_width)
      puts
      puts "Answer: #{@game.random_word.upcase}"
      puts
    end
  end
end

# the play_game method initiates a new Board and Game object and operates the guess loop
def play_game
  game = Game.new
  board = Board.new(game)
  puts "Hello, welcome to Word Guess!!"
  # this calls the display_chase method from the Board class
  # since this is the first guess, it will display the first message in the if..then statement of display_chase
  board.display_chase
  # this until loop will keep going until either lost? or won? retrn true (as defined above)
  until game.lost? || game.won?
    puts "Enter a guess:"
    guess = gets.chomp
    # this until loop is for input santization; it will keep prompting the user for input
    # until it receives a single character that is a letter (no numbers or symbols)
    until (guess.gsub(/\W+/, '').length == 1 || guess.gsub(/\W+/, '').length == game.random_word.length) && guess.to_i.to_s != guess
      puts "You must either guess ONE *LETTER* or a word with a length of #{game.random_word.length}! Try again:"
      guess = gets.chomp
    end
    # this calls the guess method from the Game class; it sends the user input as the parameter
    game.guess(guess)
    # this calls the display_chase method from the Board class; since it is no longer the first guess,
    # it will display the second message from the if..then statement until the program escapes this loop (due to a win or loss)
    board.display_chase
  end
  # the loop is escaped when lose? or win? returns true;
  # this calls the display_outcome method from the Board class.  The specific display is based on the outcome of the game.
  board.display_outcome
end

# calls the play_game method
play_game
