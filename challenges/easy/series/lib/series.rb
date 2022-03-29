class Series
  def initialize(num_str)
    @num_str = num_str
  end

  def slices(length)
    error_msg = 'Specified length must be smaller than number string length.'
    raise ArgumentError, error_msg if length > @num_str.length
    @num_str.chars.map(&:to_i).each_cons(length).to_a
  end
end