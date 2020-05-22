# frozen_string_literal: true

class Statement
  COLUMN_TITLES = 'date || credit || debit || balance'
  def print_statement(transaction_history = [])
    lines = transaction_history.map do |transaction|
      transaction_line(transaction)
    end
    lines.push(COLUMN_TITLES)
    lines.reverse.join("\n")
  end

  private

  def transaction_line(transaction)
    credit, debit = format_transaction(transaction)
    transaction.type == 'credit' ? credit : debit
  end

  def format_transaction(transaction)
    balance, value, date = format_values(transaction)
    credit = "#{date} || #{value} ||  || #{balance}"
    debit = "#{date} ||  || #{value} || #{balance}"
    [credit, debit]
  end

  def format_values(transaction)
    balance = format_number(transaction.balance)
    value = format_number(transaction.value)
    date = format_date(transaction.date)
    [balance, value, date]
  end

  def format_number(number)
    format('%.2f', number)
  end

  def format_date(time)
    time.strftime('%d/%m/%Y')
  end
end
