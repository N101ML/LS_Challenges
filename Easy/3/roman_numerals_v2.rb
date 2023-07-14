require 'pry'

ROMAN_NUMERALS = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}

class RomanNumeral
  def initialize(current_num)
    @current_num = current_num
  end

  def to_roman
    result = ""
    idx = 0
    temp_num = current_num
    loop do
      temp_roman_value = ROMAN_NUMERALS.keys.reverse[idx]
      count = 0
      loop do
        break if temp_num / temp_roman_value > 0 == false
        count += 1
        result << ROMAN_NUMERALS[temp_roman_value]
        temp_num -= temp_roman_value
      end
      # Checks for values of 4. If so, checks if previous value is 1 or 2 numerals away and calls appropriate method
      if count >=4
        if roman_next(result, temp_roman_value, idx)
          result = skip_two(result, temp_roman_value, idx)
        else
          result = skip_one(result, temp_roman_value, idx)
        end
      end
      idx += 1

      break if idx > ROMAN_NUMERALS.size - 1
    end

    result
  end

  private

  attr_accessor :current_num

  def roman_next(result, temp_roman_value, idx)
    next_temp_roman = ROMAN_NUMERALS.keys.reverse[idx - 1]
    result[-5] == ROMAN_NUMERALS[next_temp_roman]
  end

  def skip_one(result, temp_roman_value, idx)
    new_value = ROMAN_NUMERALS.keys.reverse[idx - 1]
    result = result[0..-5]
    result << ROMAN_NUMERALS[temp_roman_value]
    result << ROMAN_NUMERALS[new_value]
  end

  def skip_two(result, temp_roman_value, idx)
    new_value = ROMAN_NUMERALS.keys.reverse[idx - 2]
    result = result[0..-6]
    result << ROMAN_NUMERALS[temp_roman_value]
    result << ROMAN_NUMERALS[new_value]
  end
end
