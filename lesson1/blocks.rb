def say(str)
  puts str
  yield if block_given?
end

# say('hello')
# say('hello') { puts 'hi' }


def greet(words)
  yield if block_given?
  puts words
end

# greet('Greetings sir') do
#   system 'clear'
# end

def increment(num)
  if block_given?
    yield                             # Lenient arity
    yield(num + 1)
    yield(num + 1, 100, 1000)
  end
  num + 1
end

# increment(5) do |num|
#   puts num
# end

# Without using a block
def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
          end
  puts "Before: #{str}"
  puts "After: #{after}"
end

# compare('hello', :upcase)
# compare('hello', :capitalize)

# Using yield
def compare(str)
  puts "Before: #{str}"
  puts "After: #{yield(str)}"
end

# p compare('hi') { |word| word.upcase }
# p compare('hello') { |word| word.slice(1..2) }
# p compare('hello') { |word| "Blah blah blah" }
# p compare('hello') { |word| puts 'hi' }

# Before and After (sandwich code)
def time_it
  time_before = Time.now
  yield if block_given?
  time_after = Time.now

  puts "Took #{time_after - time_before} sec."
end

# time_it { sleep(3) }

# Simple Proc
def test(&block)
  puts "What's &block? #{block}"
end

# p test { sleep(1) }

# Passing a Proc
def test2(block)
  puts 'hello'
  block.call('>>> ')
  puts 'good-bye'
end

def test(&block)
  puts '1'
  test2(block)
  puts '2'
end

# test { |prefix| puts prefix + 'xyz' }

# Closure scope
def sequence(num)
  counter = 0
  Proc.new do
    counter += 1
    puts counter
    num += 1
    puts num
  end
end

s1 = sequence(100)
s1.call
s1.call
s1.call
