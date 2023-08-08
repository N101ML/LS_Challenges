require 'pry'

class Diamond
  ALPHA = ('A'..'Z').to_a

  def self.make_diamond(letter)
    idx = 0
    result = ""
    diamond_size = (ALPHA.index(letter) * 2) + 1
    middle = 1
    result << first_row(diamond_size)
    return result if diamond_size == 1

    loop do
      idx += 1
      str = middle_section(idx, middle)
      result << place_row(str, diamond_size)
      break if middle == diamond_size - 2
      middle += 2
    end

    loop do
      break if middle == 1
      idx -= 1
      middle -= 2
      str = middle_section(idx, middle)
      result << place_row(str, diamond_size)
    end
    result << first_row(diamond_size)
    result
  end

  class << self
    private

    def middle_section(idx, middle)
      "#{ALPHA[idx]}#{" " * middle}#{ALPHA[idx]}"
    end

    def first_row(diamond_size)
      "#{ALPHA[0].center(diamond_size)}\n"
    end

    def place_row(str, diamond_size)
      "#{str.center(diamond_size)}\n"
    end
  end
end
