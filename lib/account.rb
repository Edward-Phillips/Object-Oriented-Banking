# frozen_string_literal: true

require 'transaction'
require 'statement'

# this is the Account class, it tracks the balance
class Account
  attr_reader :balance
  def initialize(transaction_class: Transaction, statement_class: Statement)
    @balance = 0
    @statement = statement_class.new
    @transaction_class = transaction_class
  end

  def deposit(num = '')
    validate_input(num)

    @balance += num
    store_transaction(num)
  end

  def withdraw(num = '')
    validate_input(num)
    raise 'Error: Insufficent funds' if num > @balance

    @balance -= num
    store_transaction(-num)
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

  def decimals(num)
    decimals = 0
    number = num
    while number != number.to_i
      decimals += 1
      number *= 10
    end
    decimals
  end

  def store_transaction(num)
    amount = format_number(num.abs)
    nice_balance = format_number(@balance)
    type = num.positive? ? 'credit' : 'debit'
    transaction = @transaction_class.new(
      type: type,
      date: date,
      balance: nice_balance,
      value: amount
    )
    @statement.transactions.push(transaction)
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_number(num)
    format('%.2f', num)
  end
end
