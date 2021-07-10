# Write a test for the #accept_money method.

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    transaction.amount_paid = 100

    initial_amount = register.total_money
    register.accept_money(transaction)
    final_amount = register.total_money

    assert_equal(initial_amount + 100, final_amount )
  end
end