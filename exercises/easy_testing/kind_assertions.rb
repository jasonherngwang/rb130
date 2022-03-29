require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class KindAssertionTest < Minitest::Test
  def test_numeric_kind
    value = 1
    # value = 'string'
    assert_kind_of Numeric, value
  end
end