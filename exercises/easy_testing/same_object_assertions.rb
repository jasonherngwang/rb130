require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def initialize(array)
    @array = array
  end

  def process
    self
    # [1, 2, 3]
  end
end

class SameObjectTest < Minitest::Test
  def test_same_list
    list = List.new([1, 2, 3])
    assert_same list, list.process
  end
end