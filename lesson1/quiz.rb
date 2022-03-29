# 12
# def call_chunk(code_chunk)
#   code_chunk.call
# end

# say_color = Proc.new {puts "The color is #{color}"}
# color = "blue"
# call_chunk(say_color)


# 15
ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do |x|
  # block body
  puts x
end