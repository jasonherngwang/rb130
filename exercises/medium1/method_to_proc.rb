def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc   # .to_proc not necessary since Method has instance method #to_proc which is invoke when using &
# Equivalent to:
# Proc.new { |n| n.to_s(8).to_i }

# & converts base8_proc from proc to block
p [8, 10, 12, 14, 16, 33].map(&base8_proc)
# Equivalent to:
# p [8, 10, 12, 14, 16, 33].map({ |n| n.to_s(8).to_i })

# This is not allowed because #convert_to_base_8 is not a method of Integer.
# It is a method of main.
# p [8, 10, 12, 14, 16, 33].map(&:convert_to_base_8)

# => [10, 12, 14, 16, 20, 41]


# Exploration of &

def my_method(n)
  n
end

# Wrap method #my_method in a Method object.
# & invokes Method#to_proc on the Method object
# Returned proc is converted to a block
# { |n| n }
p [1, 2, 3].map(&method(:my_method))

# & invokes Symbol#to_proc on method #my_method
# Behavior of Symbol#to_proc is different from that of Method#to_proc
# The resulting block invokes the method on the parameter.
# Compare to Method#to_proc which invokes the method as defined.
# Returned proc is converted to a block
# { |n| n.my_method }
# Integer does not have method #my_method
# p [1, 2, 3].map(&:my_method)           # => NoMethodError

p [1, 2, 3].map(&:to_s)