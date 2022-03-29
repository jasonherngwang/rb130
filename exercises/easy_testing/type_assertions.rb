require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TypeAssertionTest < Minitest::Test
  def test_numeric_type
    value = Numeric.new
    # value = 'string'
    assert_instance_of Numeric, value
  end
end