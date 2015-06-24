class MasterMind
	def initialize
		colors = %w{red blue green yellow brown black}
		@combo = colors.sample(4).each do |color| end
		@turn = 1
	end


	def player_answer
		player_answer = gets.chomp.downcase.split
		@player_combo = player_answer.each do |color| end
		puts "\n=>Your guess:\n**************#{@player_combo}\n"
		if @combo == @player_combo then puts "\n( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)\n\nYou Win! *In Mario's voice from Mario Kart 64* Congratulations!\n\n( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)"
			play_again
		else compare
		end
	end


	def compare
			colors_wrong_spot = @combo & @player_combo
			length_colors_wrong_spot = colors_wrong_spot.length
			show_answer = @combo.zip(@player_combo).map {|x, y| x == y}
			random_show_answer = show_answer.sample(4)

				puts "\n=>Looks like you guessed **#{length_colors_wrong_spot}** colors that are in the secret combination. Let's check to see if you got any in the correct position below.\n"
				puts "\n=>True means you put a color in the correct position but you don't know which position beacuse the true/false is randomized! \n=>#{random_show_answer}\n"
	end


	def play
		while @turn <= 10
			puts "\n=>This is turn #{@turn} of 10. Colors to choose from: red, blue, green, yellow, brown, black."
			@turn += 1
			player_answer
		end
			game_over
	end


	def game_over
		puts "\nGame!....Over. The correct combination was #{@combo}. Want to play again? y/n"
		if gets.chomp == "y"
			new_game = MasterMind.new
			new_game.start
		else
			puts "\nAll your base are belong to us... (╬ ಠ益ಠ)"
			exit
		end
	end


	def play_again
		puts "\nWould you like to play again? y/n"
		if gets.chomp == "y"
			new_game = MasterMind.new
			new_game.start
		else
			puts "\nAll your base are belong to us... (╬ ಠ益ಠ)"
			exit
		end
	end


	def start
		puts "\n=>Welcome to MasterMind written in Ruby! Let's play a game!"
		puts "=>There is a secret combination of 4 colors to be discovered!"
		puts "=>You need to type in 4 colors from this list on each turn and try to guess the correct order: red, blue, green, yellow, brown, and black."
		puts "=>When inputting your answer just type the color's name and a space between each color. NO COMMAS!"
		puts "=>Oh, and did I mention you only get 10 tries? Best of luck!"
		play
	end


end

new_game = MasterMind.new
new_game.start
