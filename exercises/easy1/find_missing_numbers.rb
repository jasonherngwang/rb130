def missing(array)
  result = []
  array.each_cons(2) do |a, b|
    result += [*(a + 1)...b]
  end
  result
end

def missing(array)
  [*array.first..array.last] - array
end

def missing(array)
  (array.first..array.last).to_a.reject { |n| array.include? n }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []