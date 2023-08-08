require 'pry'

class Clock
  attr_reader :time
  attr_accessor :total_minutes

  def initialize(total_minutes, time)
    @total_minutes = total_minutes
    @time = time
  end

  def self.at(hour, minutes=0)
    total_minutes = (hour * 60) + minutes
    new(total_minutes, "#{sprintf('%.2d', hour)}:#{sprintf('%.2d', minutes)}")
  end

  def +(added_min)
    self.total_minutes += added_min
    self.total_minutes = convert_pos(total_minutes) if total_minutes >= 1440
    hours, minutes = total_minutes.divmod(60)
    Clock.at(hours, minutes)
  end

  def -(sub_min)
    self.total_minutes -= sub_min
    self.total_minutes = convert_neg(total_minutes) if total_minutes < 0
    hours, minutes = total_minutes.divmod(60)
    Clock.at(hours, minutes)
  end

  def convert_pos(mins)
    mins % 1440
  end

  def convert_neg(mins)
    mins += 1440 until mins > 0
    mins
  end

  def to_s
    time
  end

  def ==(other_clock)
    time == other_clock.time
  end
end
