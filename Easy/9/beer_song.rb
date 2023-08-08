require 'pry'

class BeerSong
  def self.verses(start, stop)
    result = []
    start.downto(stop) do |bottle|
      result << verse(bottle)
    end
    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.verse(bottle_amt)
    case bottle_amt      
    when 2
      two_left(bottle_amt)
    when 1
      one_left(bottle_amt)
    when 0
      no_more(bottle_amt)
    else
      main_song(bottle_amt)
    end
  end

  def self.main_song(bottle)
    "#{bottle} bottles of beer on the wall, #{bottle} bottles of beer.\n" \
    "Take one down and pass it around, #{bottle - 1} bottles of beer on the wall.\n"
  end

  def self.two_left(bottle_amt)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.one_left(bottle)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.no_more(bottle)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
