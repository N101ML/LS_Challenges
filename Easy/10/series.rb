require 'pry'

class Series
  attr_reader :str_digits

  def initialize(str_digits)
    @str_digits = str_digits
  end

  # def slices(slice_size)
  #   raise ArgumentError if slice_size > str_digits.size
  #   start = 0
  #   result = []

  #   loop do
  #     temp = str_digits.slice(start, slice_size)
  #     arr = convert(temp)
  #     break if temp.size < slice_size
  #     result << arr
  #     start += 1
  #   end
  #   result
  # end

  # Solution above is before realizing we could use each_cons (and looking at given solution)

  def slices(slice_size)
    raise ArgumentError if slice_size > str_digits.size
    result = []
    str_digits.chars.each_cons(slice_size) { |el| result << el.map(&:to_i) }
    result
  end

  def convert(str_arr)
    str_arr.chars.map do |char|
      char.to_i
    end
  end
end
