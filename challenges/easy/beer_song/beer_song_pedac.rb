=begin
Problem
------------------------------------------
Beer Song
Write a program that can generate the lyrics of the 99 Bottles of Beer song.

99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

...

3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.

2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.

Inputs: None
Outputs: Print 100 pairs of Strings, separated by newline

Rules/Requirements
- Use singular "bottle" when referencing 1 bottle of beer.
- Last output is significantly different from the previous 99.

Clarifying Questions
- 

Examples, Test Cases
------------------------------------------


Data Structure, Algorithm
------------------------------------------
Helper method: Determine how to output 'n bottles of beer'.
- Input: 1 Integer, `n`
- If > 1, return 'n bottles' (plural)
- If 1, return 'n bottle' (singular)
- If 0, return 'no more bottles'

Main method
- Initialize variable num_bottles to a Range from 99 down to 0
- Start a loop.
  - Take the next value from the Range: `n`
  - Print:
      n bottles of beer on the wall, n bottles of beer.
      Take one down and pass it around, n-1 bottles of beer on the wall.
    - Use helper method to choose the correct form of 'n bottles of beer'.
=end

def verse(n)
  action = "Take one down and pass it around"
  bottles = "#{n} bottles"
  
  if n > 2
    bottles_left = "#{n - 1} bottles"
  elsif n == 2
    bottles_left = "1 bottle"
  elsif n == 1
    bottles = "#{n} bottle"
    bottles_left = "no more bottles"
    action = "Take it down and pass it around"
  else
    bottles = "no more bottles"
    action = "Go to the store and buy some more"
    bottles_left = "99 bottles"
  end

  "#{bottles.capitalize} of beer on the wall, #{bottles} of beer.\n" +
  "#{action}, #{bottles_left} of beer on the wall.\n"
end

def verses(start_num, end_num)
  (start_num..end_num).step(-1).map { |n| verse(n) }.join("\n")
end

def lyrics
  verses(99, 0)
end

puts lyrics