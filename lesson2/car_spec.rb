# Expectation syntax (spec-style syntax) is a DSL

require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do               # it = Individual Test
    car = Car.new
    _(car.wheels).must_equal 4       # Expectation
  end
end