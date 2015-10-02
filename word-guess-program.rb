possible_words = []

# generate answer
# pull answer from array of possible_answers

game_word = possible_answers.sample

# print ascii art


# print start menu
puts "Let's play a game! I'm going to choose a word, and you have to guess a letter each turn."


past_choices = []
# Get user input and put into user array
user_choice = gets.chomp
# Push user choice into array for past choices
past_choices.push(user_choice)

if user_choice == game_word.include?
  # switch space for letter
  # puts something to tell them
elsif user_choice != game_word.include?
  # change ASCII art
  # tell them something
end

# display past choices
puts "You've already chosen these letters: #{past_choices}"

# check against answer
#
# new display
#    shows answers if correct
#    change hockey player if wrong
# regardless displays correct answers
#
# loop until win or lose
#
# decide

# of wrong guesses
# how to pick words
