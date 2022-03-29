class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError, 'Invalid triangle.' unless valid?
  end

  def kind
    if sides.all?(sides.first)
      "equilateral"
    elsif sides.uniq == sides
      "scalene"
    else
      "isosceles"
    end
  end

  private

  def valid?
    sides.all? { |s| s > 0 } &&
      sides.min(2).sum > sides.max
  end
end
