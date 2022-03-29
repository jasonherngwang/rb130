=begin
Write a method called count that behaves similarly for an arbitrarily long list 
of arguments. It should take 0 or more arguments and a block, and then return 
the total number of arguments for which the block returns true.

If the argument list is empty, count should return 0.
=end

def count(*items)
  total = 0
  items.each { |item| total += 1 if yield(item) }
  total
end

def count(*items)
  items.each_with_object([]) { |item, arr| arr << item if yield(item) }.size
end

def count(*items)
  items.inject(0) { |total, item| total + (yield(item) ? 1 : 0) }
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3