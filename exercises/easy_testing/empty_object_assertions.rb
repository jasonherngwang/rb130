require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyObjectTest < Minitest::Test
  def test_empty_array
    list = []
    # list = [1]
    assert_empty list, 'List is not empty'
  end
end