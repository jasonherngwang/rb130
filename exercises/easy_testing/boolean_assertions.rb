require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class BooleanTest < Minitest::Test
  def test_value_odd_question
    value = 1
    # value = 2
    assert value.odd?, 'Value is not odd'
    assert_equal true, value.odd?, 'Value is not odd'
  end
end