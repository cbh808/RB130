# Write a test for the method, CashRegister#change.

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    transaction.amount_paid = 120

    assert_equal(20, register.change(transaction))
  end
end
