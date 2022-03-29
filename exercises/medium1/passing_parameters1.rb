items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts "#{items.join(', ')}" }
gather(items) { |items| puts "I love #{items.first} and hate #{items.last}." }
gather(items) do |foods|
  foods.size.times do |num|
    puts "#{num + 1}. #{foods[num].capitalize}"
  end
end