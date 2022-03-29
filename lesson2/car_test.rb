# Assertion syntax (assert-style syntax)

require 'minitest/autorun'      # Load files from minitest gem
require 'minitest/reporters'
Minitest::Reporters.use!


require_relative 'car'          # Specify local directory

class CarTest < Minitest::Test  # CarTest inherits all required testing methods.
  # setup
  def setup
    @car = Car.new              # Instance variable
  end

  # assert
  def test_car_exists
    assert(@car)                 # Is car a truthy object?
  end
  
  # assert_equal
  def test_wheels               # Instance method naming convention: test_*
    assert_equal(4, @car.wheels) # Inherited instance method #assert_equal
  end
  
  # assert_nil
  def test_name_is_nil
    assert_nil(@car.name)        # Uninitialized instance variable @name
  end

  # assert_raises
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(wheels: 100)
    end
  end

  # assert_instance_of
  def test_raise_instance_of_car
    assert_instance_of(Car, @car)
  end

  # assert_includes
  def test_includes_car_obj
    cars = [@car]
    assert_includes(cars, @car) # assert_includes invokes assert_equal
  end

  # assert_equal
  def test_compare_car_equality
    car1 = Car.new
    car2 = Car.new
    assert_equal(car1, car2)
  end

  # Skip
  # def test_bad_wheels
  #   skip "Skip bad wheels test" # Skip test and provide message.
  #   car = Car.new
  #   assert_equal(3, car.wheels) # Failing test
  # end

  # teardown: not required

end