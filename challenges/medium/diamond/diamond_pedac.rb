=begin
Problem
------------------------------------------
Diamond
Print a diamond where the letter advances in alphabetical order from the top to 
the midpoint, then descends in reverse alphabetical order from the midpoint to 
the bottom.
- The midpoint letters are the input letter.

Inputs: 1 String, a single letter
Outputs: Print a diamond shape.

Rules/Requirements
- Symmetric horizontally and vertically.
- Hollow
- Square shape

Examples, Test Cases
------------------------------------------
Input: 'C'
Output: 
  A
 B B
C   C
 B B
  A

Data Structures, Classes, Modules
------------------------------------------
Class: Diamond

No instance methods

Algorithm and Sub-Problems
------------------------------------------
Class method: make_diamond(char)
- Create an Array from 'A' or 'a' to the input character, depending on case.
- Initialize local variable `square_length` to (2 * array.size - 1)
- Create an Array from 1 to `square_length`, stepping by 2.
  This represents the width of each diamond row.
- Iterate through the number array, transforming it. Keep track of the index.
  For each element:
  - Determine the current char using the first Array and index.
  - Construct a string
    - Content: char + ' ' * (width - 2) + char
    - Truncate to 1 char if width == 1.
  - Pad and center the string to length of `square_length`.
- If array size > 1, take all except the last element, reverse it, and append 
  to the array.
- Print the array

=end

# Create top and reverse for bottom
# def make_diamond(char)
#   start_char = char =~ /[A-Z]/ ? 'A' : 'a'
#   alpha_array = [*start_char..char]
  
#   square_width = alpha_array.size * 2 - 1
#   row_widths = (1..square_width).step(2).to_a

#   diamond_top = row_widths.zip(alpha_array).map do |width, char|
#     padding = [0, width - 2].max
#     string = char + ' ' * padding + char
#     string = string.chr if width == 1
#     string.center(square_width)
#   end

#   puts diamond_top + diamond_top[0...-1].reverse
# end

# Inside-out method
# def make_diamond(letter)
#   rows = []
#   start_letter = letter =~ /[A-Z]/ ? 'A' : 'a'
#   square_width = [*start_letter..letter].size * 2 - 1
#   row_widths = (square_width - 2..1).step(-2).to_a
  
#   row_widths.each_with_index do |row_width, idx|
#     if idx == 0
#       rows << format_row(letter, square_width)
#     end
#     current_letter = (letter.ord - idx - 1).chr
#     row = format_row(current_letter, row_width).center(square_width)
#     rows.unshift row
#     rows.push    row
#   end
  
#   rows
# end

def create_row(letter, row_width)
  return letter if row_width == 1
  "#{letter}#{' ' * (row_width - 2)}#{letter}"
end

def make_diamond(char)
  start_char = char =~ /[A-Z]/ ? 'A' : 'a'
  alpha_array = [*start_char..char]
  alpha_array += alpha_array[0...-1].reverse
  diamond_height = alpha_array.size

  row_widths = (1..diamond_height).step(2).to_a
  row_widths += row_widths[0...-1].reverse

  alpha_array.zip(row_widths).map do |letter, width|
    create_row(letter, width).center(diamond_height) + "\n"
  end
end

p make_diamond('A')
p make_diamond('B')
p make_diamond('C')
p make_diamond('E')