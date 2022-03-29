=begin
Write a method called none? that behaves similarly for Arrays. It should take 
an Array as an argument, and a block. It should return true if the block 
returns false for all of the element values. Otherwise, it should return false.

=end

def none?(collection)
  collection.each { |elem| return false if yield(elem) }
  true
end

# Using #all?
def any?(collection)
  collection.each do |elem|
    return true if yield(elem)
  end
  false
end

def none?(collection, &block)
  !any?(collection, &block)
end


p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true