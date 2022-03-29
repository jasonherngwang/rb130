def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute_with_arg(arg)
  block_given? ? yield(arg) : "No block given!"
end

p compute_with_arg('abc') { |str| "I know my #{str}s" } == "I know my abcs"
p compute_with_arg(99) { |num| num + 1 } == 100
p compute_with_arg(5) == "No block given!"
