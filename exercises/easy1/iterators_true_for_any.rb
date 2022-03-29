=begin
Write a method called any? that behaves similarly for Arrays. It should take an 
Array as an argument, and a block. It should return true if the block returns 
true for any of the element values. Otherwise, it should return false.
=end

require 'set'

def any?(collection)
  collection.each do |elem|
    return true if yield(elem)
  end
  false
end


p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

p any?({a: 1, b: 3, c: 5}) { |k, v| v.even? } == false

p any?(Set[1, 3, 5]) { |value| value.odd? } == true
p any?(Set[1, 3, 5]) { |value| value.even? } == false