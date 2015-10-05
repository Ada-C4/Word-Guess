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
    until $max_wrong == 9 || @slots == @answer
      # Get user input for new guess
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
      # print current ASCII art
      print @mouse.move_board
      # print slots array
      print @slots
      puts
      puts
      # Print array of letters already guessed
      puts "These are the letters you've already guessed: #{@guesses.sort}"
      puts
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
    # Iterating through each occurence of guess letter in answer array
    while answer_copy.include?(guess)
      @guess_index = answer_copy.find_index(guess)
      @slots[@guess_index + num_match] = guess
      answer_copy.delete_at(@guess_index)
      num_match += 1
    end
    # If wrong answer, add to max_wrong and print wrong guesses
    if @slots.include?(guess) != true
      puts "Wrong!"
      $max_wrong += 1
    end
    puts "#{$max_wrong} wrong guesses so far."
  end

  def game_end
    if @slots == @answer
      puts "The word was #{@answer_whole}!"
      puts "YOU WIN! GOLD STAR FOR YOU!"
    elsif $max_wrong == 9
      puts "YOU SUCK. YOU KILLED THE MOUSE."
      puts "By the way, the word was #{@answer_whole}"
    end
  end

end


class Board
attr_reader

  def initialize

  end

  def move_board
    if $max_wrong == 0
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

  if $max_wrong == 1
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

    if $max_wrong == 2
      puts <<-eos

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

    if $max_wrong == 3
      puts <<-eos
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

    if $max_wrong == 4
      puts <<-eos


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

    if $max_wrong == 5
      puts <<-eos

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

    if $max_wrong == 6
      puts <<-eos

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

    if $max_wrong == 7
      puts <<-eos
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

    if $max_wrong == 8
      <<-eos
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

    if $max_wrong == 9
      <<-eos




                                              .-"-.        .-:-.        .-"-.
                                             / RIP \\      / RIP \\      / RIP \\
                                             |     |      |     |      |     |
                                             |_____|      |_____|      |_____|
    eos
    end
  end
end
