# input: string
# output float output
# treat invalid input as octal 0
# algo:
  # find length for number - 1 = n
  # convert input string to an array of integers
  # initialize result arr
  # iterate through array
    # (8 ** n) + current_val and place in arr
    # n-= 1
  # sum result arr

require 'pry'

class Octal
  attr_reader :string_num
  attr_accessor :num

  def initialize(string_num)
    @num = string_num
  end

  def to_decimal
    return 0 unless valid?
    result = []
    digits_num = num.to_i.digits
    length = 0

    digits_num.each do |arr_num|
      result << (8 ** length) * arr_num
      length += 1
    end

    result.sum
  end

  def valid?
    num.chars.all? { |n| n =~ /[0-7]/}
  end
end
