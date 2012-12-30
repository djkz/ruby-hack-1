#!/usr/bin/env ruby
require_relative "game"

def main
	game = Game.new(["hello","world","tima"])

	while true
		game_state(game)
		print "enter letter: "
		letter = gets.chomp

		begin
			game.guess!(letter)
		rescue Game::AlreadyPlayed 
		  	puts "This letter has already been played"
		rescue Game::InvalidInput 
		  	puts "Please enter a single letter"
		rescue Game::PlayerWins
		  	puts "CONGRATULATIONS, YOU WIN!!!"
		  	break
		rescue Game::PlayerLoses
			puts "Sorry, you lose :/"
			break
		end


	end
end

def game_state(game)
	puts game.formatted_word
	puts "letters played :: " + game.played_letters
	puts "guesses remaining :: " + game.remaining_guesses.to_s
end


# -- call main and get us going -- #
main
