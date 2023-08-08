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

# class Octal
#   attr_reader :string_num
#   attr_accessor :num

#   def initialize(string_num)
#     @num = string_num
#   end

#   def to_decimal
#     return 0 unless valid?
#     result = []
#     digits_num = num.to_i.digits
#     length = 0

#     digits_num.each do |arr_num|
#       result << (8 ** length) * arr_num
#       length += 1
#     end

#     result.sum
#   end

#   def valid?
#     num.chars.all? { |n| n =~ /[0-7]/}
#   end
# end

# Solution below comes from LS Challenges:

class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?(number)

    arr_digits = number.to_i.digits

    new_number = 0
    arr_digits.each_with_index do |num, exponent|
      new_number += (num * (8 ** exponent))
    end

    new_number
  end

  private

  def valid_octal?(num)
    binding.pry
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end

p Octal.new("7777").to_decimal
