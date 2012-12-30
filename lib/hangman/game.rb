class Game
  require_relative "guesser"
  attr_accessor :word, :guessed_word, :remaining_guesses, :used_letters

  def initialize(words)
    @words = words
    @word = words.shuffle.first.downcase
    @remaining_guesses = 6
    @guessed_word = "_" * @word.size
    @used_letters = []
  end

  def guess!(guessed_letter)
    guessed_letter = guessed_letter.downcase
    raise AlreadyPlayed if @used_letters.include?(guessed_letter)
    raise InvalidInput if guessed_letter.length != 1

  	@used_letters << guessed_letter
    
    g = @guessed_word
    @guessed_word = Guesser.guess(@word, @guessed_word, guessed_letter)

    if g == @guessed_word
      @remaining_guesses -= 1
    end

    raise PlayerWins if @guessed_word == @word

    raise PlayerLoses if @remaining_guesses == 0

  end

  def formatted_word
    @guessed_word.split("").join(" ")
  end

  def played_letters
    @used_letters.join(",")
  end

  ##############################
  # EXCEPTIONS
  class AlreadyPlayed < Exception

  end

  class InvalidInput < Exception

  end

  class PlayerWins < Exception

  end

  class PlayerLoses < Exception

  end
end