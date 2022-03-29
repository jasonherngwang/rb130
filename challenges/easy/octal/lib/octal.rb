class Octal
  def initialize(octal_str)
    @octal_str = octal_str
  end

  def to_decimal
    return 0 if @octal_str =~ /[^0-7]/
    @octal_str.to_i.digits.map.with_index { |x, i| x * 8 ** i }.sum
  end
end