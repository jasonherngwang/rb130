=begin
Problem
------------------------------------------
Aliquot sum: Sum of a number's positive divisors.

Number types:
Perfect:   Aliquot sum == Original
Abundant:  Aliquot sum >  Original
Deficient: Aliquot sum <  Original

Inputs: 
Outputs: 

Rules/Requirements
- 

Clarifying Questions
- 

Examples, Test Cases
------------------------------------------
Number: 24
Divisors: 1, 2, 3, 4, 6, 8, 12
Sum of divisors: 36
Type: Abundant

Data Structure, Algorithm
------------------------------------------
Helper method: Find all positive divisors less than a number.

Main method
- Use helper method to find all divisors
- Sum the divisors
- Use a conditional expression to determine the number type.
  - Return a String

=end

def positive_divisors(num)
  divisors = []
  (1..Math.sqrt(num)).each do |x|
    divisors << x << num / x if (num % x == 0)
  end
  divisors.uniq.sort - [num]
end

def classify(num)
  raise StandardError, 'Please enter a positive number.' if num < 1

  aliquot = positive_divisors(num).sum
  if aliquot == num
    'perfect'
  elsif aliquot > num
    'abundant'
  else
    'deficient'
  end
end