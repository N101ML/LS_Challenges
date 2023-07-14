SCRABBLE_VALUES = {['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1, ['D', 'G'] => 2,
                   ['B', 'C', 'M', 'P'] => 3, ['F', 'H', 'V', 'W', 'Y'] => 4, ['K'] => 5,
                   ['J', 'X'] => 8, ['Q', 'Z'] => 10}

class Scrabble
  attr_reader :word
  attr_accessor :total
  def initialize(word)
    @word = word ? word.upcase : ""
    @total = 0
  end

  def score
    word.chars.each do |letter|
      SCRABBLE_VALUES.each do |letter_array, letter_score|
        self.total += letter_score if letter_array.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
