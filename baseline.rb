word_array = ["DRAGON","PLANET","BABY","ADA","RUBY","CODING"]

answer = word_array[rand(6)].split("")


puts "Let's play! Guess a letter"
letter = gets.chomp

answer.each do |char|
  if letter == char
    puts "You guessed a letter!"
  else
    puts "Try again!"
  end
end
