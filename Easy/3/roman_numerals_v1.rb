require 'pry'

ROMAN_NUMERALS = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}

class RomanNumeral
  def initialize(current_num)
    @current_num = current_num
  end

  def to_roman
    result = ""
    temp_num = current_num.clone
    idx = 0
    loop do
      temp_roman = ROMAN_NUMERALS.keys.reverse[idx]
      count = 0
      loop do
        break if temp_num / temp_roman > 0 == false
        result << ROMAN_NUMERALS[temp_roman]
        count += 1
        temp_num -= temp_roman
        if count > 3
          result = result.chars[0..-5].join
          if ROMAN_NUMERALS.keys.reverse[idx - 2] - ((temp_roman * 4) + ROMAN_NUMERALS.keys.reverse[idx - 1]) == 1
            result = result[0..-2]
            result << ROMAN_NUMERALS[temp_roman]
            check = ROMAN_NUMERALS.keys.reverse[idx - 2]
            result << ROMAN_NUMERALS[check]
            break
          end
          result << ROMAN_NUMERALS[temp_roman]
          tester = ROMAN_NUMERALS.keys.reverse[idx - 1]
          result << ROMAN_NUMERALS[tester]
        end        
      end         
      idx += 1

      break if idx > ROMAN_NUMERALS.size - 1
    end

    result
  end

  private

  attr_reader :current_num
end

num = RomanNumeral.new(4)
p num.to_roman
