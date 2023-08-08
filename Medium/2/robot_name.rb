=begin
# input: N/A
# output:
# rules:
  # need a Robot#name method
  # Robot name must consist of two capital letters and 3 numbers at random
# examples:
# data structure:
  #
# algorithm:
  #
=end

require 'pry'

class Robot
  ALPHA = ('A'..'Z').to_a
  @@used_names = []
  attr_accessor :name

  def initialize
    @name = assign_name
    check_dupe
    @@used_names<< name
  end

  def assign_name
    new_name = ""
    2.times {new_name << ALPHA[rand(1..25)]}
    new_name << "#{rand(100..999)}"
    new_name
  end

  def reset
    @@used_names.delete(name)
    self.name = ""
    self.name = assign_name
  end

  def check_dupe
    reset if @@used_names.include?(name)
  end
end
