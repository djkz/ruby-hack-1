require "hangman/guesser"

describe Guesser do

  context "will take word, guessed_word and a letter" do

		it "letter is in the word once" do
          Guesser.guess("word","_ _ _ _", w).should eq "w _ _ _"
		end

		it "letter is not in the word" do
		end

		it "letter is in the word multiple times" do
		end
	end

end
