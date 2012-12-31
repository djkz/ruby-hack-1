#!/usr/bin/env ruby
require_relative "game"

def main
	game = Game.new(load_words)

	while true
		puts ""
		game_state(game)
		print "enter letter: "
		letter = gets.chomp
		puts ""

		begin
			game.guess!(letter)
		rescue Game::AlreadyPlayed 
		  	puts "This letter has already been played"
		rescue Game::InvalidInput 
		  	puts "Please enter a single letter"
		rescue Game::PlayerWins
			puts "---------------------------"
		  	puts "CONGRATULATIONS, YOU WIN!!!"
		  	puts "You guessed #{ game.word }"
		  	puts "---------------------------"
		  	break unless play_again
		  	game = Game.new(load_words)

		rescue Game::PlayerLoses
			puts "---------------------------"
			puts "Sorry, you lose :/"
		  	puts "The word was #{ game.word }"
			puts "---------------------------"
			break unless play_again
			game = Game.new(load_words)
		end

	end
end

def play_again
	puts ""
	print "Would you like to play again? (y)"
	play_again = gets.chomp
	play_again == "" or play_again == "y"
	
end

def load_words
  words = []
  word_file = File.open("words.txt","r") do |line|
    while (word = line.gets)
      words << word
    end
  end
  words
end


def game_state(game)
  puts " "
	puts game.formatted_word
	puts "letters played :: " + game.played_letters
	puts "guesses remaining :: " + game.remaining_guesses.to_s
end


# -- call main and get us going -- #
main
