# word list is from http://www.desiquintans.com/nounlist
# "wordlist.txt" is saved in the same directory as this ruby file
words = open("wordlist.txt")


array_of_words = words.readlines

array_of_words.map! do |word|
  word.strip
end

rando = array_of_words[rand(0...array_of_words.length)]

while rando.length < 5 || rando.length > 7
  rando = array_of_words[rand(0...array_of_words.length)]
end

puts rando
words.close

mouse = """
.--,       .--,
( (  \\.---./ ) )
'.__/o   o\\__.'
   {=  ^  =}
    >  -  <
   /       \\
  //       \\\\
 //|   .   |\\\\
 \"'\\       /'\"_.-~^`'-.
    \\  _  /--'         `
  ___)( )(___
 (((__) (__)))
 """
puts mouse

cheese = """
   ____
  /|o  |
 /o|  o|
/o_|_o_|
"""

cheeses = [cheese, cheese]
puts cheese.class
