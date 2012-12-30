require "hangman/guesser"

describe Guesser do

  context "will take word, guessed_word and a letter" do

    it "will return array of true/false value for matching letters" do
      Guesser.match("word","w").should == [true,false,false,false]
    end

    it "will combine array of booleans with a word using letter" do
      Guesser.combine("____",[true,false,false,false],"w").should == "w___"
    end

    it "letter is in the word once" do
      Guesser.guess("word","____", "w").should == "w___"
    end

    it "letter is not in the word" do
    end

    it "letter is in the word multiple times" do
    end
  end

end
