# frozen_string_literal: true

require 'statement'

describe Statement do
  it 'is initialized with an empty array to hold transactions' do
    expect(subject.transactions.class).to eq(Array)
  end
  it 'prints correct headers in statement' do
    expect(subject.print_statement).to eq('date || credit || debit || balance')
  end
  it 'prints a deposit transaction' do
    time = Time.now
    date = time.strftime('%d/%m/%Y')
    tx = instance_double(
      'Transaction',
      {
        type: 'credit',
        date: time,
        balance: '500.00',
        value: '500.00'
      }
    )
    res = "date || credit || debit || balance\n#{date} || 500.00 ||  || 500.00"
    subject.transactions.push(tx)
    expect(subject.print_statement).to eq(res)
  end
  it ' prints a witdhrawal transaction' do
    time = Time.now
    date = time.strftime('%d/%m/%Y')
    tx = instance_double(
      'Transaction',
      {
        type: 'debit',
        date: time,
        balance: '500.00',
        value: '500.00'
      }
    )
    res = "date || credit || debit || balance\n#{date} ||  || 500.00 || 500.00"
    subject.transactions.push(tx)
    expect(subject.print_statement).to eq(res)
  end
end
