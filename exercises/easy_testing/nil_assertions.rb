require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NilTest < Minitest::Test
  def test_nil
    value = nil
    # value = 'Not nil'
    assert_nil value, 'Value is not nil'
  end
end