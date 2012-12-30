class Guesser
	
	def self.guess(word, guessed_word, guessed_letter)
      combine(guessed_word, match(word,guessed_letter), guessed_letter)
		
	end

    def self.match(word,letter)
      word.split("").map{|l| l == letter}
    end

    def self.combine(word,key,new_letter)
      word_array = word.split('')
      result = ""
      word_array.each_with_index do |old_letter,index|
        if key[index]
          result += new_letter
        else
          result += old_letter
        end
      end
      result
    end
end
