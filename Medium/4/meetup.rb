require 'pry'
require 'Date'

=begin
# input:
# output:
# rules:
  # 
# examples:
# data structure:
  #
# algorithm:
  #
=end

class Meetup
  SCHEDULE = {'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5, 'teenth' => (13..19)}
  DAYS = {1 => 'monday', 2 => 'tuesday', 3 => 'wednesday', 4 => 'thursday',
         5 => 'friday', 6 => 'saturday', 7 => 'sunday'}
  TEENTH = (13..19).to_a

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    count = 1
    day = 1
    loop do
      break if check_one(count, day, weekday, schedule) || check_two(count, day, weekday, schedule) || check_three(count, day, weekday, schedule)
      count += 1 if DAYS[check_day(day).cwday] == weekday.downcase
      day += 1
      return nil if Date.valid_date?(year, month, day) == false
    end
    Date.new(year, month, day)
  end

  def check_one(count, day, weekday, schedule)
    DAYS[check_day(day).cwday] == weekday.downcase && SCHEDULE[schedule.downcase] == count
  end

  def check_two(count, day, weekday, schedule)
    schedule.downcase == 'teenth' && TEENTH.include?(day) && DAYS[check_day(day).cwday] == weekday.downcase
  end

  def check_three(count, day, weekday, schedule)
    schedule.downcase == 'last' && DAYS[check_day(day).cwday] == weekday.downcase && Date.valid_date?(year, month, (day + 7)) == false
  end

  def check_day(day)
    Date.new(year, month, day)
  end
end
