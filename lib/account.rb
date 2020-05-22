# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'


class Account
  attr_reader :balance
  def initialize(
    transaction_class: Transaction,
    statement_class: Statement
  )
    @balance = 0
    @statement = statement_class.new
    @transaction_class = transaction_class
    @transaction_history = []
  end

  def deposit(number = nil)
    validate_input(number)

    @balance += number
    store_transaction(number, 'credit')
    nil
  end

  def withdraw(number = nil)
    validate_input(number)
    raise 'Error: Insufficent funds' if number > @balance

    @balance -= number
    store_transaction(number, 'debit')
    nil
  end

  def print_statement
    print @statement.print_statement(@transaction_history)
  end

  private

  def validate_input(number)
    raise 'Error: Invalid request' unless number.is_a? Numeric
    raise 'Error: Cannot make transaction of 0.00 or lower' if number <= 0
    raise 'Error: Invalid request' unless decimals(number)
  end

  def decimals(number)
    pennies = number * 100
    pennies == pennies.to_i
  end

  def store_transaction(number, type)
    transaction = @transaction_class.new(
      type: type,
      date: Time.now,
      balance: @balance,
      value: number.abs
    )
    @transaction_history.push(transaction)
  end
end
