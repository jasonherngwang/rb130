# p ([1, 2, 3].reduce do |acc, num|
#   p acc
#   p num
#   acc + num
#   # acc + num if num.odd?
# end)

# => 6

array = [1, 2, 3, 4, 5]

def reduce(array, acc = nil)
  return nil if array.empty?

  index = 0

  if acc.nil?
    acc = array[0]
    array = array[1..-1]
    index += 1
  end

  array.each do |elem|
    acc = yield(acc, elem)
  end

  acc
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass