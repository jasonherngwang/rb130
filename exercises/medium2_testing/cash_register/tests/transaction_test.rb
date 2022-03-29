require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(10)
  end
  
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, @transaction.amount_paid
  end

  def test_prompt_for_payment_over
    input = StringIO.new("5\n50\n")
    output = StringIO.new

    expected = <<~OUTPUT
    You owe $10.
    How much are you paying?
    That is not the correct amount. Please make sure to pay the full cost.
    You owe $10.
    How much are you paying?
    OUTPUT

    # Output should be empty since it is consumed.
    assert_output('') { @transaction.prompt_for_payment(input: input, output: output) }
    assert_equal 50, @transaction.amount_paid
    assert_equal expected, output.string
    # puts output.string
  end
end