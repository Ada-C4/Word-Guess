possible_words = []

# generate answer
# pull answer from array of possible_answers

game_word = possible_answers.sample


def split_word
  #create new array with one letter per slot
end

# print ascii art


# print start menu
puts "Let's play a game! I'm going to choose a word, and you have to guess a letter each turn."


past_guesses = []
# Get user input and put into user array
guess = gets.chomp
# Push user choice into array for past choices
past_guesses.push(user_choice)

if guess == game_word.include?
  # switch space for letter
  # puts something to tell them
elsif guess != game_word.include?
  # change ASCII art
  # tell them something
end

# display past choices
puts "You've already chosen these letters: #{past_choices}"

#
# new display
#
# loop until win or lose
GAME_WIN

if score.all? { |s| s == MATCH_EXACT }
  # Player wins if they have an exact match for every guess
  @outcome = GAME_WIN
elsif @guesses.length == MAX_TURNS
  # Player loses if they reach the maximum number of turns
  @outcome = GAME_LOSE
end
end
#
# decide number of wrong guesses
