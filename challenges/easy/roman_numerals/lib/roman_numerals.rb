class RomanNumeral
  NUMERALS_ONES      = %w(I II III IV V VI VII VIII IX)
  NUMERALS_TENS      = %w(X XX XXX XL L LX LXX LXXX XC)
  NUMERALS_HUNDREDS  = %w(C CC CCC CD D DC DCC DCCC CM)
  NUMERALS_THOUSANDS = %w(M MM MMM)

  def initialize(num)
    @num = num
  end

  def to_roman
    ones, tens, hundreds, thousands = @num.digits.map { |n| n == 0 ? nil : n }
    ones      &&= NUMERALS_ONES[ones - 1]
    tens      &&= NUMERALS_TENS[tens - 1]
    hundreds  &&= NUMERALS_HUNDREDS[hundreds - 1]
    thousands &&= NUMERALS_THOUSANDS[thousands - 1]
    "#{thousands}#{hundreds}#{tens}#{ones}"
  end
end
