class Triangle
  def initialize(side_1, side_2, side_3)
      @sides = [side_1, side_2, side_3].sort
      raise ArgumentError if sides.any? { |side| side <= 0 } || total_lengths_invalid?
  end

  def kind
    if equilateral?
      "equilateral"
    elsif isosceles?
      "isosceles"
    elsif scalene?
      "scalene"
    end
  end

  private

  attr_reader :sides

  def total_lengths_invalid?
    sides[0..1].sum <= sides[2]
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end

  def scalene?
    sides.uniq.size == 3
  end
end
