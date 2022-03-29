class BeerSong
  def self.verse(n)
    bottles = "#{n} bottles"
    action = "Take one down and pass it around"

    if n > 2
      bottles_left = "#{n - 1} bottles"
    elsif n == 2
      bottles_left = "1 bottle"
    elsif n == 1
      bottles = "1 bottle"
      action = "Take it down and pass it around"
      bottles_left = "no more bottles"
    else
      bottles = "no more bottles"
      action = "Go to the store and buy some more"
      bottles_left = "99 bottles"
    end

    "#{bottles.capitalize} of beer on the wall, #{bottles} of beer.\n"\
      "#{action}, #{bottles_left} of beer on the wall.\n"
  end

  def self.verses(start_num, end_num)
    (start_num..end_num).step(-1).map { |n| verse(n) }.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
