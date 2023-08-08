# input: integers (either given or default of 3 and 5)
# output: integer
# rules:
  # to method takes in a single integer
  # 
# examples:
# data structure:
# algo:

require 'pry'

class SumOfMultiples
  attr_accessor :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(nat_num)
    result = []
    multiples.each do |mult_num|
      (1...nat_num).to_a.each do |nat_num|
        result << nat_num if nat_num % mult_num == 0
      end
    end
    result.uniq.sum
  end

  def self.to(nat_num)
    result = []
    [3, 5].each do |mult_num|
      (1...nat_num).to_a.each do |nat_num|
        result << nat_num if nat_num % mult_num == 0
      end
    end
    result.uniq.sum
  end
end

p SumOfMultiples.to(100)
