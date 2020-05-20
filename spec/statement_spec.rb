require 'statement'

describe Statement do
  it 'is initialized with an empty array to hold transactions' do
    expect(subject.transactions.class).to eq(Array)
  end
end