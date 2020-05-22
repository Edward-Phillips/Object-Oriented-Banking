# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'prints correct headers in statement' do
    headers = 'date || credit || debit || balance'
    expect(subject.print_statement).to eq(headers)
  end
  it 'prints a deposit transaction' do
    time = Time.now
    date = time.strftime('%d/%m/%Y')
    transaction = instance_double(
      'Transaction',
      {
        type: 'credit',
        date: time,
        balance: '500.00',
        value: '500.00'
      }
    )
    headers = 'date || credit || debit || balance'
    line_one = "#{date} || 500.00 ||  || 500.00"
    result = [headers,line_one].join("\n")

    transaction_array = [transaction]
    expect(subject.print_statement(transaction_array)).to eq(result)
  end
  it ' prints a withdrawal transaction' do
    time = Time.now
    date = time.strftime('%d/%m/%Y')
    transaction = instance_double(
      'Transaction',
      {
        type: 'debit',
        date: time,
        balance: '500.00',
        value: '500.00'
      }
    )
    headers = 'date || credit || debit || balance'
    line_one = "#{date} ||  || 500.00 || 500.00"
    result = [headers,line_one].join("\n")
    transaction_array = [transaction]
    expect(subject.print_statement(transaction_array)).to eq(result)
  end
end
