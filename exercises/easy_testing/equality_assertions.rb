require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityTest < Minitest::Test
  def test_value_downcase
    value = 'xYz'
    # value = 'AbC'
    assert_equal 'xyz', value.downcase, 'Lowercase version of string is not xyz'
  end
end