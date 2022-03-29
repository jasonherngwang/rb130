require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedObjectTest < Minitest::Test
  def test_list_includes_xyz
    list = ['xyz', 'abc', '123']
    # list = [1]
    assert_includes list, 'xyz', 'List is not empty'
    # assert_equal true, list.include?('xyz'), 'List is not empty'
  end
end