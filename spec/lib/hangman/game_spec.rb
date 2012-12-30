require "hangman/game"

describe Game do

  context "Creates a game from the dictionary array" do
    let(:word) { "word" }
    let(:game) { Game.new([word]) }

    it "will pick a random word" do
      game.word.should == word
    end
    
    it "show underscores for untested letters" do
      game.guessed_word.should == "____"
    end

    it "formatted wod should have spaces" do
      game.formatted_word.should == "_ _ _ _"
      game.guess!("w")
      game.formatted_word.should == "w _ _ _"
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
          game.guessed_word.should == "w___"
        end
      end

      context "Player guess is incorrect" do
        before{ game.guess!("q") }

        it "will be added into used_letters" do
          game.used_letters.size.should == 1
        end

        it "will not change remaining_guesses" do
          game.remaining_guesses.should == 4
        end

        it "will show in guessed_word in correct position" do
          game.guessed_word.should == "____"
        end
      end

      context "Player guess is invalid" do
        before{ game.guess!("w") }

        it "letter was already used" do
          expect { game.guess!("w") }.to raise_error(Game::AlreadyPlayed)
        end

        it "player enters invalid input" do
          expect {game.guess!("wo")}.to raise_error(Game::InvalidInput)          
          expect {game.guess!("")}.to raise_error(Game::InvalidInput)
        end
      end
    end

    it "will show used letters" do
      game.guess!("w")
      game.guess!("q")
      game.played_letters.should == "w,q"
    end

    context "game is over" do
      it "will show when player wins" do
        game.guess!("w")
        game.guess!("o")
        game.guess!("r")
         expect {game.guess!("d")}.to raise_error(Game::PlayerWins)
      end

      it "will show when player loses" do
        game.guess!("a")
        game.guess!("s")
        game.guess!("e")
        game.guess!("f")
        expect {game.guess!("q")}.to raise_error(Game::PlayerLoses)
      end
    end
  end



end
