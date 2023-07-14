class Anagram
  attr_reader :word, :sorted_word
  def initialize(word)
    @word = word
    @sorted_word = word.downcase.chars.sort
  end

  def match(array)
    result = []

    array.each do |check_word|
      if check_word.downcase.chars.sort == sorted_word
        result << check_word unless check_word.downcase == word
      end
    end

    result
  end
end
