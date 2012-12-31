class GameController < ApplicationController

	require "game"

	def init
		game = Game.new(load_words)
		@word = game.word
		@remaining_guesses = game.remaining_guesses
		@guessed_word = game.formatted_word
		@used_letters = game.used_letters


		# not sure how to do this part yet

	end

	def load_words
	  words = []
	  word_file = File.open("lib/hangman/words.txt","r") do |line|
	    while (word = line.gets)
	      words << word
	    end
	  end
	  words
	end

end
