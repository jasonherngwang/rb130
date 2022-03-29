items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*produce, grains|
  puts produce.join(', ')
  puts grains
end

# 2
gather(items) do |fruits, *vegetables, grains|
  puts fruits
  puts vegetables.join(', ')
  puts grains
end

# 3
gather(items) do |fruits, *other_food|
  puts fruits
  puts other_food.join(', ')
end

# 4
gather(items) do |fruits, yellow_food, green_food, grains|
  puts "#{fruits}, #{yellow_food}, #{green_food}, and #{grains}"
end