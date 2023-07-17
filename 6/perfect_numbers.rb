require 'pry'

class PerfectNumber
  def self.classify(num)
    raise(StandardError) if num < 0
    divsor_arr = []

    1.upto(num - 1) do |divsor_num|
      divsor_arr << divsor_num if num % divsor_num == 0
    end
    perfect_number(divsor_arr.sum, num)
  end

  def self.perfect_number(sum, num)
    if sum < num
      'deficient'
    elsif sum > num
      'abundant'
    else
      'perfect'
    end
  end
end
