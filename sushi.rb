row_1 = ["  ,;'@@';,  " , "  ,;'@@';,  ", "  ,;'@@';,  " , " |',_@@_,'| ", " |',_@@_,'| ", " |',_@@_,'| ", " |        | ", " |        | ", " |        | ", "  '.____.'  ", "  '.____.'  ", "  '.____.'  "]


# puts "#{row_1[0]} #{row_1[3]} #{row_1[6]} #{row_1[9]}"

if @guesses.length == 0
# print 9 sushi
  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

elsif @guesses.length == 1
# takes one away
  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

  puts "#{row_1[0]} #{row_1[1]}"
  puts "#{row_1[3]} #{row_1[4]}"
  puts "#{row_1[6]} #{row_1[7]}"
  puts "#{row_1[9]} #{row_1[10]}"


elsif @guesses.length == 2

  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

  puts "#{row_1[0]} #{row_1[1]} #{row_1[2]}"
  puts "#{row_1[3]} #{row_1[4]} #{row_1[5]}"
  puts "#{row_1[6]} #{row_1[7]} #{row_1[8]}"
  puts "#{row_1[9]} #{row_1[10]} #{row_1[11]}"
  puts

  puts "#{row_1[0]}"
  puts "#{row_1[3]}"
  puts "#{row_1[6]}"
  puts "#{row_1[9]}"

end



# later
puts "#{row_1[0]}"
puts "#{row_1[3]}"
puts "#{row_1[6]}"
puts "#{row_1[9]}"
