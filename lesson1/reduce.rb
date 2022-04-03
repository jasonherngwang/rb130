# p ([1, 2, 3].reduce do |acc, num|
#   p acc
#   p num
#   acc + num
#   # acc + num if num.odd?
# end)

# => 6

def reduce(array, acc = nil)
  return nil if array.empty?

  if acc.nil?
    acc = array.first
    array.shift
  end

  array.each do |elem|
    acc = yield(acc, elem)
  end

  acc
end

p reduce([1, 2, 3, 4, 5])     { |acc, num| acc + num }        # => 15
p reduce([1, 2, 3, 4, 5], 10) { |acc, num| acc + num }        # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }       # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }   # => [1, 2, 'a', 'b']