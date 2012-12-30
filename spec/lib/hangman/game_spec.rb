require "hangman/game"

describe Game do

  context "Creates a game from the dictionary array" do
    let(:word) { "word" }
    let(:game) { Game.new([word]) }

    it "will pick a random word" do
      game.word.should == word
    end
    
    it "show underscores for untested letters" do
      game.guessed.should == "_ _ _ _ "
    end

    it "will start with 5 guesses" do
      game.guesses.should == 5
    end
  end

  context "Shows game state" do

    it "will let user guess the letter"

    it "will show used letters"

    it "will show guessed letters"

    it "will show when game is over"
  end



end
