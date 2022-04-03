=begin
Internal and External Iteration

Problem
Create a new Enumerator object.
- Define what values are iterated on.
- Iterate over an infinite list of factorials.
- Print first 7 factorials, starting with 0 factorial. Use external iterator.
- Print next 3 factorials (will be incorrect)
- Use #rewind to reset Enumerator.
- Print 7 more factorials.

Terms
- Factorial: Product of sequential integers from n down to 1.
  - 0! == 1
  - 1! == 1
=end

factorial = Enumerator.new do |yielder|
  number = 0
  accumulator = 1
  loop do
    accumulator = number.zero? ? 1 : number
    yielder << accumulator
    number += 1
  end
end

# External iterators
p factorial.take(7)
p factorial.next
p factorial.next
p factorial.next
factorial.rewind
p factorial.next
p factorial.next
p factorial.next
p factorial.next
p factorial.next
p factorial.next
p factorial.next

# Internal iterator
factorial.each_with_index do |value, num|
  puts "#{num}! == #{value}"
  break if num >= 5
end

# Define internal iterator each_with_index
def each_with_index(enumerator)
  enumerator.rewind
  index = 0

  loop do
    yield(enumerator.next, index)
    index += 1
    break if index >= 5
  end

  enumerator.rewind
end

each_with_index(factorial) { |x, i| puts "#{i}! == #{x}"}
p factorial.next