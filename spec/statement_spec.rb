require 'statement'

describe Statement do
  it 'is initialized with an empty array to hold transactions' do
    expect(subject.transactions.class).to eq(Array)
  end
  it 'prints correct headers in statement' do
    expect(subject.print_statement).to eq('date || credit || debit || balance')
  end
end