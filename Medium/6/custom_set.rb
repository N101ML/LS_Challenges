require 'pry'

class CustomSet
  attr_reader :data

  def initialize(data=[])
    @data = data.uniq
  end

  def empty?
    data.empty?
  end

  def contains?(el)
    !data.select { |x| x == el }.empty?
  end

  def subset?(other_set)
    other_set.data.permutation(data.size).select { |arr| arr == data }.flatten == data
  end

  def disjoint?(other_set)
    other_set.data.none? { |val| data.include?(val) }
  end

  def eql?(other_set)
    data.sort == other_set.data.sort
  end

  def add(val)
    data << val unless data.include?(val)
    self
  end

  def ==(other_set)
    data.sort == other_set.data.sort
  end

  def intersection(other_set)
    ret_arr = other_set.data.select { |el| data.include?(el) }
    CustomSet.new(ret_arr)
  end

  def difference(other_set)
    CustomSet.new(data - other_set.data)
  end

  def union(other_set)
    CustomSet.new(data + other_set.data)
  end
end
