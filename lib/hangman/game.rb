class Game
  attr_accessor :word, :guessed_word, :remaining_guesses, :used_letters

  def initialize(words)
    @words = words
    @word = words.shuffle.first
    @remaining_guesses = 5
    @guessed_word = "_ " * @word.size
    @used_letters = []
  end

  def guess!(guessed_letter)
  	@used_letters << guessed_letter
  end
end