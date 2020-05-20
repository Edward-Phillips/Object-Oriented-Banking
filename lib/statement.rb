# frozen_string_literal: true

# this is the statement class, it stores and prints transactions
class Statement
  attr_reader :transactions
  COLUMN_TITLES = 'date || credit || debit || balance'
  def initialize
    @transactions = []
  end

  def print_statement
    lines = []
    @transactions.each do |transaction|
      lines.push(transaction_line(transaction))
    end
    lines.push(COLUMN_TITLES)
    lines.reverse.join("\n")
  end

private
  def transaction_line(transaction)
    balance = format_num(transaction.balance)
    value = format_num(transaction.value)
    credit = "#{transaction.date} || #{value} ||  || #{balance}"
    debit = "#{transaction.date} ||  || #{value} || #{balance}"
    transaction.type == 'credit' ? credit : debit
  end

  def format_num(num)
    format('%.2f', num)
  end
end
