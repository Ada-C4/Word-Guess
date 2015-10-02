class Game
  words = ["cat", "dog", "tree", "apple"]
  _array =[]
  @under_num = 0

  #fish_images = [fish1, fish2, fish3, fish4, fish5, fish6]
  answer = words[rand(words.length-1)]
  fish1 = "I am a 6-alive-fish image"

  puts "Hi! welcome to the Guess words game"
  puts "The fish will be fed only after you win"
  puts "Save the fish!!!"
  puts fish1

  #creat new array of underscores
  (answer.length).times do
    _array.push("_")
    print "_ "
  end



  #creat new array of letters
  answer_array = answer.split("")


  puts
  puts "Guess a letter"
  @guess = gets.chomp
  count = 1
  @num = 0


  while count < 7
    answer_array.each do |n|
      if n === @guess
        _array[@num] = n
        @num +=1
        print _array
        if (@num == answer_array.length)
          puts
          puts "Yay! you won and saved the fish"
          exit
        end
      end
    end
      puts " Choose another letter"
      @guess = gets.chomp
    #   print _array

      puts

    count += 1
  end

end














# # check if you won
#   _array.each do |n|
#     if n === "_"
#
#     end
#   end
#   print _array
#   puts
#   print "Guess another letter"
#   @guess = gets.chomp
#
#    if @check
#      puts "Yay!!! you saved the fish!!!"
#      break
#    else
#      "Guess another letter"
#      @guess = gets.chomp
#
#   count +=1
#   end
#
# end
#
#
#
#
#
# end
#
# puts answer_array[0]
# end
