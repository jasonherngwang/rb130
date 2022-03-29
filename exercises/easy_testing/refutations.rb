require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RefutationTest < Minitest::Test
  def test_xyz_not_in_list
    list = ['abc']
    # list = ['abc', 'xyz']
    refute_includes list, 'xyz'
  end
end