=begin
Enumerable#drop_while drops the first n elements for which the block returns 
true, and returns the remaining elements in an array.
=end

def drop_while(collection)
  collection.each_with_index do |elem, idx|
    return collection[idx..-1] unless yield(elem)
  end
  []
end

def drop_while(collection)
  while yield(collection.first) && collection.any?
    collection = collection.drop(1)
  end
  collection
end

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? }# == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? }# == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true }# == []
p drop_while([1, 3, 5, 6]) { |value| false }# == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 }# == [5, 6]
p drop_while([]) { |value| true }# == []