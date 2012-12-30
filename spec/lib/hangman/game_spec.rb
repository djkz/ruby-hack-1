require "hangman/game"

describe Game do

  context "Creates a game from the dictionary array" do
    let(:word) { "word" }
    let(:game) { Game.new([word]) }

    it "will pick a random word" do
      game.word.should == word
    end
    
    it "show underscores for untested letters" do
      game.guessed_word.should == "_ _ _ _ "
    end

    it "will start with 5 remaining_guesses" do
      game.remaining_guesses.should == 5
    end

    it "will start with 0 used letters" do
      game.used_letters.size.should == 0 
    end
    context "Player takes a guess" do
      
      context "Player guess is correct" do
        before{ game.guess!("w") }

        it "will be added into used_letters" do
          game.used_letters.size.should == 1
        end

        it "will not change remaining_guesses" do
          game.remaining_guesses.should == 5
        end

        it "will show in guessed_word in correct position" do
          game.guessed_word.should == "w _ _ _ "
        end

        it "will show in guessed_word in muliple positions"

      end

      context "Player guess is incorrect" do

      end

      context "Player guess is invalid" do
        
      end



    end
    it "will let user guess the letter"

    it "will show used letters"

    it "will show guessed_word letters"

    it "will show when game is over"
  end



end
