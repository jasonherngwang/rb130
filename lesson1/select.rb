array = [1, 2, 3, 4, 5]

# p array.select { |num| num.odd? }       # => [1, 3, 5]
# p array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# p array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true


def select(array)
  counter = 0
  filtered_array = []

  while counter < array.size
    filtered_array << array[counter] if yield(array[counter])
    counter += 1
  end

  filtered_array
end

# Using Array#each
# def select(array)
#   counter = 0
#   filtered_array = []
#   array.each do |elem|
#     filtered_array << elem if yield(elem)
#   end

#   filtered_array
# end

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true