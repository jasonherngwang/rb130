
def reduce(array, acc=nil)
  return [] if array.empty?
  
  counter = 0
  
  if acc.nil?
    acc = array[0]
    array = array[1..-1]
    counter += 1
  end
  
  array.each do |elem|
    acc = yield(acc, elem)
  end
  
  acc
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']