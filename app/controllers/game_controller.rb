class GameController < ApplicationController

	require "game"

	def init
		game = Game.new(load_words)
		@word = game.word
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
