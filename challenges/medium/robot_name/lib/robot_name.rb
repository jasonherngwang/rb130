class Robot
  @@all_names = []

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @@all_names.delete @name
    @name = generate_name
    @@all_names << @name
  end

  private

  def generate_name
    new_name = ''
    2.times { new_name << [*'A'..'Z'].sample }
    3.times { new_name << [*'0'..'9'].sample }
    @@all_names.include?(new_name) ? generate_name : new_name
  end
end