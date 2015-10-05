class Game
  words = ["cat", "dog", "tree", "apple", "bird"]
  _array =[]
  #fish_images = [fish1, fish2, fish3, fish4, fish5, fish6]
  answer = words[rand(words.length-1)]
  fish1 = "I am a 6-alive-fish image"

puts "Hi! welcome to the Guess words game"
puts "The fish will be fed only after you win"
puts "Save the fish!!!"
  puts fish1
(answer.length).times do
    _array.push("_")
    print "_ "
  end

answer_array = answer.split("")



count = 0
puts
puts "Guess a letter"
@guess = gets.chomp




#while count < 7
#@check = true #  if check is true -> you won (no underscores)
# loop that edit the _array

answer_array.each_with_index do |n , i|
  print n, i
    if @guess === answer_array[i]
      _array[i] = @guess
    end

# check if you won
  _array.each do |n|
    if n === "_"
      @check = false
    end
  end

   if @check
     puts "Yay!!! you saved the fish!!!"
     break
   else
     "Guess another letter"
     @guess = gets.chomp

  count +=1
  end

end





end

puts answer_array[0]
