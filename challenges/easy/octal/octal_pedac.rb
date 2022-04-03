=begin
Problem
------------------------------------------
Octal (Base-8) to Decimal Conversion
Convert octal to decimal by performing a linear combination of powers of 8.
Sum the following, by starting at the right and moving left:
- Rightmost digit * 1
- Next digit * 8
- Next digit * 8^2
- Next digit * 8^3
...
- nth digit * 8^(n-1)

Inputs: 1 String representing an octal number
Outputs: 1 Integer representing a decimal number

Rules/Requirements
- Invalid input => Input of octal 0
  - Check if all characters in input are numbers 0-7

Clarifying Questions
- 

Examples, Test Cases
------------------------------------------


Data Structure, Algorithm
------------------------------------------
Input validation
- If any characters in input octal string are NOT 0-7, return 0.
- Convert string to integer.
- Split integer into array of digits.
- Iterate through the array, keeping track of the index. Perform transformation:
  - Transform each element to the product of itself and 8^index
- Sum the array

=end

def octal_to_decimal(str)
  return 0 if str =~ /[^0-7]/
  str.to_i.digits.map.with_index { |x, i| x * 8 ** i }.sum
end