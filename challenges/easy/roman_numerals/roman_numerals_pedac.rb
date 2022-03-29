=begin
Problem
------------------------------------------
Write a program that converts modern decimal numbers to their Roman number 
equivalent.
Roman numerals are are written by expressing each digit separately starting 
with the left most digit and skipping any digit with a value of zero.

1-3:  I, II, III
4,5:  IV, V
10:   X
50:   L
100:  C
500:  D
1000: M

No more than 3 of the same numeral are placed in order to represent a number.
One or more smaller numerals before a larger numeral indicates subtraction.

Inputs: 1 Integer
Outputs: 1 String, the Roman numeral representation of the input number.

Rules/Requirements
- Accommodate a max input of 3000

Clarifying Questions
- 

Examples, Test Cases
------------------------------------------
1990: MXMXC
1000: M
900:  CM
90:   XC

369: CCCLXIX
300: CCC
60:  LX
9:   IX

Data Structure, Algorithm
------------------------------------------
- Create a hash to lookup the Roman numeral for each number "place".
- Find thousands, hundreds, tens, and ones by examining the number's digits.
  - Store each in a variable.
- Substitute each of the four variables with the Roman numeral.
  - Use empty if number is 0.
- Join all numerals.

Helper function: Convert integer into Roman numeral
- If number < 5
  - 

=end

NUMERALS_ONES      = %w(I II III IV V VI VII VIII IX)
NUMERALS_TENS      = %w(X XX XXX XL L LX LXX LXXX XC)
NUMERALS_HUNDREDS  = %w(C CC CCC CD D DC DCC DCCC CM)
NUMERALS_THOUSANDS = %w(M MM MMM)

def roman_numeral(num)
  ones, tens, hundreds, thousands = num.digits.map { |n| n == 0 ? nil : n }
  ones      &&= NUMERALS_ONES[ones - 1]
  tens      &&= NUMERALS_TENS[tens - 1]
  hundreds  &&= NUMERALS_HUNDREDS[hundreds - 1]
  thousands &&= NUMERALS_THOUSANDS[thousands - 1]
  "#{thousands}#{hundreds}#{tens}#{ones}"
end

# Less brute force
ROMAN_NUMERALS = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_numeral(number)
  roman = ''
  ROMAN_NUMERALS
    .sort_by { |_, value| value }
    .reverse
    .each do |numeral, value|
      if value <= number
        quotient, number = number.divmod(value)
        roman << numeral * quotient
      end
    end
  roman
end

puts roman_numeral(1)
puts roman_numeral(42)
puts roman_numeral(402)
puts roman_numeral(575)
puts roman_numeral(911)
puts roman_numeral(1024)
puts roman_numeral(1337)
puts roman_numeral(3000)