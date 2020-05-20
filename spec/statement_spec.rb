require 'statement'

describe Statement do
  it 'is initialized with an empty array to hold transactions' do
    expect(subject.transactions.class).to eq(Array)
  end
  it 'prints correct headers in statement' do
    expect(subject.print_statement).to eq('date || credit || debit || balance')
  end
  it 'prints a deposit transaction' do
    date = Time.now.strftime('%d/%m/%Y')
    tx = instance_double(
      'Transaction', 
      {
        type: "credit",
        date: date,
        balance: "500.00",
        value: "500.00"
      }
    )
    subject.transactions.push(tx)
    expect(subject.print_statement).to eq("date || credit || debit || balance\n#{date} || 500.00 ||  || 500.00")
  end
  it ' prints a witdhrawal transaction' do
    date = Time.now.strftime('%d/%m/%Y')
    tx = instance_double(
      'Transaction', 
      {
        type: "debit",
        date: date,
        balance: "500.00",
        value: "500.00"
      }
    )
    subject.transactions.push(tx)
    expect(subject.print_statement).to eq("date || credit || debit || balance\n#{date} ||  || 500.00 || 500.00")
  end
end