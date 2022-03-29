def each_cons(array)
  (0..array.size - 2).each do |i|
    yield(array[i], array[i + 1])
  end
  nil
end

def each_cons(array)
  array.each_with_index do |elem, i|
    break if i + 1 >= array.size
    yield(elem, array[i + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil