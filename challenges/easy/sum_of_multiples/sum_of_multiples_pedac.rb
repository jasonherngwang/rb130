=begin
Problem
------------------------------------------

Inputs:
- 1 Integer
- 1 Array of one or more Integers
Outputs: 1 Integer

Rules/Requirements
- No duplicates included in the sum
- Default set is [3, 5]

Clarifying Questions
- 

Examples, Test Cases
------------------------------------------
- Number: 15
- Array: [4, 6]
- Multiples of 4: [4, 8, 12]
- Multiples of 6: [6, 12]
- Unique multiples: [4, 6, 8, 12]
- Sum of multiples: 30

Data Structure, Algorithm
------------------------------------------
- Set default value of the number set to [3, 5].
- Iterate through the set, performing transformation
  - Use the helper method to transform each element to and array of its multiples.
- Flatten the array.
- Filter out duplicates.
- Sum the array.

Helper method: Find all multiples of `a` which are less than `b`.
- Initialize an empty result array.
- Initialize a variable `multiple` and assign to `a`.
- If a >= b, return empty array.
- Begin a loop. While `multiple` < `b`:
  - Add `multiple` to the result array.
  - Increment `multiple` by `a`
- Return the result array.

=end

# def multiples_less_than(target_num, num_to_multiply)
#   result = []
#   return result if num_to_multiply >= target_num
#   multiple = num_to_multiply
#   while multiple < target_num
#     result << multiple
#     multiple += num_to_multiply
#   end
#   result
# end

def multiples_less_than(target, num)
  return [] if num >= target
  num.step(to: target - 1, by: num).to_a
end

def to(num, set=[3,5])
  set.flat_map { |n| multiples_less_than(num, n) }.uniq.sum
end

p to(10_000, [43, 47])