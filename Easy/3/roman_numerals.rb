require 'pry'

ROMAN_NUMERALS = {1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I'}

class RomanNumeral
  def initialize(current_num)
    @current_num = current_num
  end

  def to_roman
    result = ""
    temp_num = current_num
    ROMAN_NUMERALS.each.with_index do |(roman_numerical, roman_letter), idx|
      count, remainder = temp_num.divmod(roman_numerical)

      if count > 0
        result << (roman_letter * count)
      end

      if count >= 4
        skip_value = roman_next(result, roman_numerical, idx)
        result = skip(result, roman_numerical, idx, skip_value)
      end
      temp_num = remainder
    end

    result
  end

  private

  attr_accessor :current_num

  def roman_next(result, roman_numerical, idx)
    next_temp_roman = ROMAN_NUMERALS.keys[idx - 1]
    result[-5] == ROMAN_NUMERALS[next_temp_roman] ? -1 : 0
  end

  def skip(result, roman_numerical, idx, skip_value)
    new_value = ROMAN_NUMERALS.keys[(idx - 1) + skip_value]
    result = result[0..(-5 + skip_value)]
    result << ROMAN_NUMERALS[roman_numerical]
    result << ROMAN_NUMERALS[new_value]
  end
end
