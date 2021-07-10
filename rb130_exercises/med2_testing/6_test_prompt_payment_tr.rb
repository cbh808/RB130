# Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly.

require 'minitest/autorun'
# require_relative 'cash_register'
require_relative 'transaction'


class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(100)
    input = StringIO.new("150\n")
    transaction.prompt_for_payment(input: input)
    assert_equal(150, transaction.amount_paid)
  end
end
