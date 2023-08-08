class PerfectNumber
  def self.classify(num)
    raise(StandardError) if num < 1

    tester = (1...num).each_with_object([]) { |digit, arr| arr << digit if num % digit == 0 }.sum
    perfect_number(tester, num)
  end

  class << self
    private

    def perfect_number(sum, num)
      if sum < num
        'deficient'
      elsif sum > num
        'abundant'
      else
        'perfect'
      end
    end
  end
end
