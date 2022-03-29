=begin
Write your own version of zip that does the same type of operation. It should 
take two Arrays as arguments, and return a new Array (the original Arrays 
should not be changed). Do not use the built-in Array#zip method. You may 
assume that both input arrays have the same number of elements.
=end

def zip(arr1, arr2)
  result = []
  arr1.size.times do |i|
    result << [arr1[i], arr2[i]]
  end
  result
end

def zip(arr1, arr2)
  result = []
  arr1.each_index do |i|
    result << [arr1[i], arr2[i]]
  end
  result
end

def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(elem, i), result|
    result << [elem, arr2[i]]
  end
end

def zip(arr1, arr2)
  (0...arr1.size).map { |i| [arr1[i], arr2[i]] }
end

def zip(*arrays)
  (0...arrays.first.size).map do |i|
    arrays.map { |arr| arr[i] }
  end
end


p zip([1, 2, 3], [4, 5, 6])# == [[1, 4], [2, 5], [3, 6]]
# p zip([1, 2, 3], [4, 5, 6], [7, 8, 9])# == [[1, 4], [2, 5], [3, 6]]