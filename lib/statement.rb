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
    @transactions.each do |tx|
      credit = "#{tx.date} || #{tx.value} ||  || #{tx.balance}"
      debit = "#{tx.date} ||  || #{tx.value} || #{tx.balance}"
      lines.push(tx.type == 'credit' ? credit : debit)
    end
    lines.push(COLUMN_TITLES)
    lines.reverse.join("\n")
  end
end
