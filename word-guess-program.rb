# Setting global variables
$max_wrong = 0

class Game
attr_reader :answer, :guesses, :guess_index, :slots

  def initialize
    @answer = [] # Will pull a new word each game
    @guesses = [] # Array of past guesses
    # @display = Board.new
    @slots = [] # Array of slots for game display
    @guess_index = 0
    # @max_wrong = 0
  end

  def play
    welcome_message
    generate_answer
    generate_slots
    game_play
    game_end
  end


  def welcome_message
    puts "Welcome. So you want to play a game? I'm going to choose a word, and you guess the word one letter at a time."
    puts "RULES"
    @mouse = Board.new
  end

  def generate_answer
    @possible_words = ["beef", "onion", "cupcake", "taco", "boot", "shoe", "dog", "cat", "fireball", "mandrake", "enrage", "visceral", "vibrate", "ennervate"]
    @answer_whole = @possible_words.sample
    @answer = @answer_whole.split("")
  end

  def generate_slots
    @answer.each do |x|
      x = "_"
      @slots.push(x)
    end
  end

  def game_play
    # loop until game end
    until $max_wrong == 10 || @slots == @answer
      # print current ASCII art
      print @mouse.move_board
      # print slots array
      print @slots
      puts
      puts
      # print array of letters already guessed
      puts "These are the letters you've already guessed: #{@guesses.sort}"
      puts
      # get user input for new gues
      puts "Pick a new letter: "
      input = gets.chomp.downcase
      puts
      # Checking to make sure input is an integer
      letters = ("a".."z").to_a
      while letters.include?(input) != true
        puts "I don't think that was a letter. Try again."
        input = gets.chomp
      end
      letter_match(input)
      @guesses.push(input)
      puts
      puts " ------------------------------ "
      end
  end

  def letter_match(guess)
    # Setting up copy array to test for multiple instances of a single letter
    answer_copy = Array.new(@answer)
    num_match = 0
    # Make sure they aren't penalized for guessing the same letter again
    if @guesses.include?(guess)
    puts "You already guessed that letter, silly."
    end
    while answer_copy.include?(guess)
      @guess_index = answer_copy.find_index(guess)
      @slots[@guess_index + num_match] = guess
      answer_copy.delete_at(@guess_index)
      num_match += 1
    end
    if @slots.include?(guess) != true
      puts "Wrong!"
      $max_wrong += 1
      puts "#{$max_wrong} wrong guesses so far."
    end
  end

  def game_end
    if @slots == @answer
      puts "The word was #{@answer_whole}!"
      puts "YOU WIN! GOLD STAR FOR YOU!"
    elsif $max_wrong == 10
      puts "YOU SUCK. YOU KILLED THE MOUSE."
      puts "By the way, the word was #{@answer_whole}"
    end
  end

end


class Board
attr_reader

  def initialize
    @board_array = [mouse_1, mouse_2, mouse_3, mouse_4, mouse_5, mouse_6, mouse_7, mouse_8, mouse_9, dead_mouse]
  end

  def move_board
    puts @board_array[$max_wrong]
  end
  def mouse_1
    puts <<-eos

    _   _
   (,\\_/,)
    | " |   .-'
    )\\g/(  (                                                                                  .----------.-----------.
   /(   )\\  )                                                                                /   .=====;..   .-.    //
  |\\)   (/|/                                                                                / .=//    ((()  |.o'\\""//
  \\   '   /                                                                                /   //    ((()~~/_o_O("//
   (/---\\)                                                                                /   '=====((()    """""//
                                                                                         /___________'__________//
                                                                                        `----------'----------'`
  eos
  end

  def mouse_2
    puts <<-eos
          _   _
         (,\\_/,)
          | " |   .-'
          )\\g/(  (                                                                            .----------.-----------.
         /(   )\\  )                                                                          /   .=====;..   .-.    //
        |\\)   (/|/                                                                          / .=//    ((()  |.o'\\""//
        \\   '   /                                                                          /   //    ((()~~/_o_O("//
         (/---\\)                                                                          /   '=====((()    """""//
                                                                                         /___________'__________//
                                                                                         `----------'----------'`
  eos
  end
  def mouse_3
    return <<-eos

                _   _
               (,\\_/,)
                | " |   .-'
                )\\g/(  (                                                                      .----------.-----------.
               /(   )\\  )                                                                    /   .=====;..   .-.    //
              |\\)   (/|/                                                                    / .=//    ((()  |.o'\\""//
              \\   '   /                                                                    /   //    ((()~~/_o_O("//
               (/---\\)                                                                    /   '=====((()    """""//
                                                                                         /___________'__________//
                                                                                         `----------'----------'`
   eos
  end

  def mouse_4
    return <<-eos
                        _   _
                       (,\\_/,)
                        | " |   .-'
                        )\\g/(  (                                                              .----------.-----------.
                       /(   )\\  )                                                            /   .=====;..   .-.    //
                      |\\)   (/|/                                                            / .=//    ((()  |.o'\\""//
                      \\   '   /                                                            /   //    ((()~~/_o_O("//
                       (/---\\)                                                            /   '=====((()    """""//
                                                                                         /___________'__________//
                                                                                         `----------'----------'`
   eos
  end

  def mouse_5
   return <<-eos


                                _   _
                               (,\\_/,)
                                | " |   .-'
                                )\\g/(  (                                                      .----------.-----------.
                               /(   )\\  )                                                    /   .=====;..   .-.    //
                              |\\)   (/|/                                                    / .=//    ((()  |.o'\\""//
                              \\   '   /                                                    /   //    ((()~~/_o_O("//
                               (/---\\)                                                    /   '=====((()    """""//
                                                                                         /___________'__________//
                                                                                         `----------'----------'`
   eos
  end
  def mouse_6
   return <<-eos

                                        _   _
                                       (,\\_/,)
                                        | " |   .-'
                                        )\\g/(  (                                             .----------.-----------.
                                       /(   )\\  )                                           /   .=====;..   .-.    //
                                      |\\)   (/|/                                           / .=//    ((()  |.o'\\""//
                                      \\   '   /                                           /   //    ((()~~/_o_O("//
                                       (/---\\)                                           /   '=====((()    """""//
                                                                                        /___________'__________//
                                                                                        `----------'----------'`
  eos
  end

  def mouse_7
    return <<-eos

                                                 _   _
                                                (,\\_/,)
                                                 | " |   .-'
                                                 )\\g/(  (                                  .----------.-----------.
                                                /(   )\\  )                                /   .=====;..   .-.    //
                                               |\\)   (/|/                                / .=//    ((()  |.o'\\""//
                                               \\   '   /                                /   //    ((()~~/_o_O("//
                                                (/---\\)                                /   '=====((()    """""//
                                                                                      /___________'__________//
                                                                                      `----------'----------'`
  eos
  end

  def mouse_8
    return <<-eos
                                                      _   _
                                                     (,\\_/,)
                                                      | " |   .-'
                                                      )\\g/(  (                               .----------.-----------.
                                                     /(   )\\  )                             /   .=====;..   .-.    //
                                                    |\\)   (/|/                             / .=//    ((()  |.o'\\""//
                                                    \\   '   /                             /   //    ((()~~/_o_O("//
                                                     (/---\\)                             /   '=====((()    """""//
                                                                                        /___________'__________//
                                                                                        `----------'----------'`
  eos
  end

  def mouse_9
    return <<-eos
                                                                _   _
                                                               (,\\_/,)
                                                                | " |   .-
                                                                )\\g/(  (               .----------.-----------.
                                                               /(   )\\  )             /   .=====;..   .-.    //
                                                              |\\)   (/|/             / .=//    ((()  |.o'\\""//
                                                              \\   '   /             /   //    ((()~~/_o_O("//
                                                               (/---\\)             /   '=====((()    """""//
                                                                                  /___________'__________//
                                                                                  `----------'----------'`
  eos
  end

  def dead_mouse
    return <<-eos




                                            .-"-.        .-:-.        .-"-.
                                           / RIP \\      / RIP \\      / RIP \\
                                           |     |      |     |      |     |
                                           |_____|      |_____|      |_____|
  eos
  end
end
