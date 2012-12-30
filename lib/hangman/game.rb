class Game
  attr_accessor :word, :guessed, :guesses

  def initialize(words)
    @words = words
    @word = words.shuffle.first
    @guesses = 5
    @guessed = "_ " * @word.size
  end
end


