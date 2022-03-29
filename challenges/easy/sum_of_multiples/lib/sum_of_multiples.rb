class SumOfMultiples
  def initialize(*args)
    @num_set = args.empty? ? [3, 5] : args
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end
  
  def to(num)
    @num_set.flat_map { |n| multiples_less_than(num, n) }.uniq.sum
  end

  private

  def multiples_less_than(limit, n)
    return [] if n >= limit
    n.step(to: limit - 1, by: n).to_a
  end
end