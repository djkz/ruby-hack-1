require "hangman/game"

def main
	game = Game.new(["hello","world","tima"])
	game_state
end

def game_state
	puts game.formatted_word
	puts "letters played :: " + game.played_letters
	puts "guesses remaining :: " + game.remaining_guesses
end

main

