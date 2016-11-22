require "colorize"
require "./word_guess_art.rb"

LINE_WIDTH = 70

class WordGuess
	def initialize
		@words = ["terminate", "robot", "bot", "binary", "computer", "algorithm", 
							"keyboard", "logic", "laptop", "QWERTY", "memory", "unix",
							"encrypt", "bandwidth", "malware", "security", "dalek", "email",
							"motherboard", "interface", "ram", "firewall", "git", "web"
							]
		@hidden_word = @words[rand(@words.length)].upcase
		@hidden_word_array = @hidden_word.upcase.split('')
		@right_answers = []
		@wrong_answers = []
		@count_wrong = 0
		@blank_row = "_ " * @hidden_word.length
		@answer_array = @blank_row.split(' ')
	
		introduction = <<YES
	The robots are coming to 'TERMINATE' mankind!
	Please help us guess the word before we all perish.\n
	We have given you blank spaces to make things easier.
	We hear humans like to do it the easy way.

YES

		puts introduction.colorize(:red)
		puts @blank_row.center(LINE_WIDTH)
		puts user_input
	end

	def user_input

		while @count_wrong < 6 && @hidden_word != @user_guess && @hidden_word_array != @answer_array
			puts ascii_art

			puts "Enter a letter to guess. Try not to guess wrong."

			@user_guess = gets.chomp.upcase # The first time we initialize this, why!?!?

			puts sanitize_input

			if @right_answers.include?(@user_guess)
				print %x{clear}
				puts "Really, human? You already guessed that!".center(LINE_WIDTH)
				puts
			elsif @hidden_word_array.include?(@user_guess)
				@right_answers << @user_guess

				@hidden_word_array.each_index do |letter|
					if @hidden_word_array[letter] == @user_guess
						@answer_array[letter] = @user_guess
					end
					print %x{clear}
				end
			elsif @wrong_answers.include?(@user_guess)
				print %x{clear}
				puts "Really, human? You already guessed that!".center(LINE_WIDTH)
				puts
			else
				@count_wrong += 1
				@wrong_answers << @user_guess
				print %x{clear}
				puts "Nope! That's not right!"
			end

			puts "Right guesses: #{@right_answers}"
			puts "Wrong guesses: #{@wrong_answers}\n"
			puts @answer_array.join(' ').center(LINE_WIDTH)
		end
		print %x{clear}
		
		if @count_wrong == 6 
			puts "Stupid human! The word was '#{@hidden_word.upcase}'!".center(LINE_WIDTH)
			puts
			puts ASCII_6.colorize(:red).blink.center(LINE_WIDTH + 30)
		else
			puts ASCII_WIN.colorize(:green).blink
			puts "NOOOOOOO YOU BESTED THE ROBOTS! TOO BAD FOR ROBOTS".colorize(:green).blink.center(LINE_WIDTH + 20)
		end
	end

	def sanitize_input
		# Check to see if this is a number or a letter or what it is
		# Maybe update this to take regex? 
		while @user_guess[/^[a-zA-Z]+/] != @user_guess
			puts "Please put a valid input! Robots don't like invalid inputs."
			@user_guess = gets.chomp.upcase
		end
	end

	def ascii_art
		case @count_wrong
		when 0
			puts ASCII_0.center(LINE_WIDTH).colorize(:red)
		when 1
			puts ASCII_1.colorize(:yellow).center(LINE_WIDTH)
		when 2
			puts ASCII_2.colorize(:yellow).center(LINE_WIDTH)
		when 3
			puts ASCII_3.colorize(:magenta).center(LINE_WIDTH)
		when 4
			puts ASCII_4.colorize(:magenta).center(LINE_WIDTH)
		when 5
			puts ASCII_5.colorize(:red).center(LINE_WIDTH)
		end
	end
end

keep_playing = true 

while keep_playing == true
	WordGuess.new
	print "Would you like to play again? > ".colorize(:yellow)
	response = gets.chomp.upcase
	print %x{clear}

	case response
	when "Y", "YES", "SURE"
	else 
		keep_playing = false
	end
	# Ask for input, if no keep_playing is false, and exit
end