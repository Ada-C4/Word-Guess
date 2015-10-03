require "colorize"

class Game
  attr_accessor :number_of_guesses_left, :game_state, :previous_guesses, :answer

  def initialize(choice_level)
      @number_of_guesses_left = 8
      @previous_guesses = []
      @easy_words = %w(told too took train tree truck try use very walk want warm wash way best bike bill bird black blue boat both meat men met mile milk mine miss moon bed big book box boy but came can car cat come cow dad day did stop sun best bike bill bird black blue boat both bring over page park part pay pick plant playing pony post pull put rabbit rain read rest riding road rock room lake land last late lay left leg light)
      @medium_words = %w(today reindeer rhinoceros rooster scorpion seal shark sheep shrimp snail snake sparrow spider squid squirrel swallow swan tiger toad tortoise turtle vulture walrus weasel whale wolf zebra happiest happiness important interest piece through usually sentence several special spoon spatula steam strainer timer sausage blubber pencil cloud moon water computer school network hammer walking violently mediocre literature racket table late media desktop flipper club flying smooth monster purple guardian bold hyperlink presentation world hunter forest foraging silently stretch wrong trust month shadow choice ocean noise radio crowd kitchen library judge knock follow chase enough angry remove usual vacation laugh satellite surprise alphabet knife forecast geography twelve ticket borrow knot scratch pencil central serve charge answer voyage annoy fudge width amount naughty gentle celery terrible position insist throat school paint because space worry trouble hurry please climb smell should earth sugar  early corner learn large whole family twice quick never almost point watch speak wrong scare place neighbor bright young coin proud build stairs choose teacher special afraid below enjoy quiet spring continue adventure gracious drought disaster chemical surgery knowledge pursue serious orchestra believe legible establish cooperate obedience necessary identical coincidence vacuum grocery horrible prefer resemble scissors government ignore column science responsible character schedule rhythm conscience imaginary sentence companion fasten inquire author century scholar cousin whistle forfeit prediction possible silence choir evidence disguise percent recommend pleasure official stomach exercise instruction restaurant success piano decide future shoulder distance familiar wrinkle disease journey doubt breathe equal discourage tournament achieve sweater attitude cereal similar reduce pleasant memorable jealous police repetition average nervous electric guitar wreathe celebration museum dangerous pronounce vacant initial easiest damage concern loathe)
      @diffcult_words = %w(auxiliary deprivation equation hideous nausea reservoir studious reputable antidote chronic benediction credential altercation grotesque poignant authentic convenience sabotage camouflage tedious expedient hallucination flexibility mesmerize stringent lustrous feasibility mediator tutorial perjury constitution generosity economic endeavor cylinder abbreviate picturesque molecular amateur unique mischievous approximate descendant epidemic communicate scheme substitute acknowledge gigantic contagious legislature rehearsal prosperous tragedy sanctuary necessary customary aerial category definite benevolent politician vocalize threaten priority intercept alternate ceramic essential sustain poisonous ingredient frequency desolate apology deceitful concept durable environment sympathy imagination recognize committee collaborate strength nonsense opportunity enormous accomplish disappear familiar beneath location innocent guarantee ancient receipt engineer tongue specific misery stingy collection ordinary headache foreign interior civilization entrance variety congratulate happiness investigate astonish original personality estimate graduate dialogue inferior incredible stereo chemistry fatigue envelope vehicle function partial declaration askew axiom azure bagpipes bandwagon banjo bayou bikini blitz bookworm boxcar boxful buckaroo buffalo buffoon cobweb croquet daiquiri disavow duplex dwarves equip exodus fishhook fixable foxglove galaxy galvanize gazebo gizmo glowworm guffaw haiku haphazard hyphen icebox injury ivory ivy jaundice jawbreaker jaywalk jazzy jigsaw jiujitsu jockey jovial joyful juicy jumbo kazoo keyhole khaki kilobyte kiosk kiwifruit knapsack larynx luxury marquis megahertz microwave mystify nightclub nowadays numbskull ovary oxidize oxygen pajama peekaboo pixel pizazz pneumonia polka quartz quiz quorum razzmatazz rhubarb rickshaw schizophrenia sphinx spritz squawk subway swivel topaz unknown unworthy unzip uptown vaporize vixen vodka vortex walkway waltz wavy waxy wheezy whiskey whomever wimpy wizard woozy xylophone yachtsman yippee youthful zephyr zigzag zilch zodiac zombie)
    if choice_level.downcase == "medium"
      @answer = @medium_words[rand(@medium_words.length)]
      puts "#{@answer}"
    elsif choice_level.downcase == "easy"
      @answer = @easy_words[rand(@easy_words.length)]
    else
      @answer = @diffcult_words[rand(@diffcult_words.length)]
    end
    @game_state = []
    @answer.length.times do
      @game_state.push ("_")
    end
  end

  def check_letters(letter_guess)
    while is_letters(letter_guess) != true
      puts "That's not a letter! Try again: "
      letter_guess = gets.chomp
    end
    if letter_guess.length == @answer.length
      if letter_guess == @answer
        show_results
        exit
      else
        puts "NOT IT!"
        @number_of_guesses_left -= 1
      end
    elsif @previous_guesses.include?(letter_guess)
      puts "This letter has already been guessed"
    else
      @previous_guesses.push(letter_guess)
      correct_guess = false
      @answer.length.times do |i|
        if letter_guess == @answer[i]
          @game_state[i] = letter_guess
          correct_guess = true
        end
      end
      if !correct_guess
        @number_of_guesses_left -= 1
          puts  "Nope!"
      end
    end
  end

  def show_results
    if @number_of_guesses_left > 0
      puts "You won! Your word was #{@answer}.".blue
      print """
  ／＼
 ∠＿__ゝ　
)|’ー’|(
||||||||
    """.blue.blink
    else
      puts "You lost :("
      puts "#{@answer} was the right answer."
    end
  end
end

class Board
  def initialize(game)
    @game = game
    @colors = [:red, :green, :magenta, :cyan, :light_red, :yellow, :light_blue, :light_green, :light_cyan, :light_magenta]
  end

  def print_art
    rando_color = @colors[rand(@colors.length)]
    print """
  ／＼
 ∠＿__ゝ　
)|’ー’|(
""".colorize(rando_color)
    @game.number_of_guesses_left.times do
      print "|".colorize(rando_color)
    end
    puts "\n"
  end

  def print_board
    @game.game_state.each do |char|
      print char + " "
    end
    puts "\nAlready guessed: #{@game.previous_guesses.sort.join(", ")}"
    puts "\n\n"
  end
end

def is_letters(str)
  str[/[a-zA-Z]+/]  == str
end

def intro_message
  puts "Hello! Get ready to play..."
  puts "WORD GUESS".blue.blink
end

def play_game
  intro_message
  puts "What difficulty level would you like? Easy? Medium? Difficult?"
  choice_level = gets.chomp
  while choice_level.downcase != "easy" && choice_level.downcase != "medium" && choice_level.downcase != "difficult"
    puts "I didn't get that. Plese choose Easy, Medium, or Difficult!"
    choice_level = gets.chomp
  end
  g = Game.new(choice_level)
  board = Board.new(g)
  while g.number_of_guesses_left > 0 && g.game_state.include?("_")
    board.print_art
    board.print_board
    puts "Guess a letter or guess the entire word: "
    letter_guess = gets.chomp
    g.check_letters(letter_guess)
  end
  g.show_results
end

play_game
