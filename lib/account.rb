# frozen_string_literal: true

# this is the Account class, it tracks the balance
class Account
  COLUMN_TITLES = 'date || credit || debit || balance'
  attr_reader :balance
  def initialize
    @balance = 0
    @transactions = [COLUMN_TITLES]
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
    @transactions.join("\n")
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
    if num.positive?
      @transactions.push("#{date} || #{amount} ||  || #{nice_balance}")
    else
      @transactions.push("#{date} ||  || #{amount} || #{nice_balance}")
    end
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def format_number(num)
    format('%.2f', num)
  end
end
