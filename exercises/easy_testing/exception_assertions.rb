require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def initialize(years_experience)
    @years_experience = years_experience
  end

  def hire
    raise NoExperienceError if @years_experience <= 0
    puts "Hired!"
  end
end

class ExceptionTest < Minitest::Test
  def setup
    @employee = Employee.new(0)
    # @employee = Employee.new(1)
  end

  def test_raises_no_experience_error
    assert_raises(NoExperienceError) { @employee.hire }
  end
end