class PerfectNumber
  def self.classify(num)
    raise StandardError, 'Please enter a positive number.' if num < 1

    aliquot = positive_divisors(num).sum

    if aliquot == num
      'perfect'
    elsif aliquot > num
      'abundant'
    else
      'deficient'
    end
  end

  # class << self opens the definition body of the anonymous singleton class of PerfectNumber.
  # Invoke #private on the PerfectNumber class's own class (metaclass).
  class << self
    private

    def positive_divisors(num)
      divisors = []

      (1..Math.sqrt(num)).each do |x|
        divisors << x << num / x if num % x == 0
      end

      divisors.uniq.sort - [num]
    end
  end
end
