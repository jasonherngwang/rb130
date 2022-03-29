# Implementing our own version of Integer#times

# 5.times do |num|
#   puts num
# end

# Implementer of generic method #times
def times(num)
  current_num = 0
  while current_num < num
    yield(current_num)
    current_num += 1
  end
  num
end

# User of #times, providing implementation refinements in a block
p (times(5) do |num|
  puts num
end)