# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

# this is the Account class, it tracks the balance
class Account
  attr_reader :balance
  def initialize(
    transaction_class: Transaction,
    statement_class: Statement,
    time: Time
  )
    @balance = 0
    @statement = statement_class.new
    @transaction_class = transaction_class
    @time = time
  end

  def deposit(num = '')
    validate_input(num)

    @balance += num
    store_transaction(num, 'credit')
  end

  def withdraw(num = '')
    validate_input(num)
    raise 'Error: Insufficent funds' if num > @balance

    @balance -= num
    store_transaction(-num, 'debit')
  end

  def print_statement
    @statement.print_statement
  end

  private

  def validate_input(num)
    raise 'Error: Invalid request' unless num.is_a? Numeric
    raise 'Error: Cannot make negative transaction' if num.negative?
    raise 'Error: Invalid request' if decimals(num) > 2
  end

  def decimals(number)
    decimals = 0
    while number != number.to_i
      decimals += 1
      number *= 10
    end
    decimals
  end

  def store_transaction(num, type)
    transaction = @transaction_class.new(
      type: type,
      date: @time.now,
      balance: @balance,
      value: num.abs
    )
    @statement.transactions.push(transaction)
  end
end
