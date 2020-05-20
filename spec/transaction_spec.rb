# frozen_string_literal: true

require 'transaction'

describe 'deposits' do
  before(:all) do
    @tx = Transaction.new(
      type: 'credit',
      date: '18/05/2020',
      balance: 100,
      value: 100
    )
  end
  it ' knows that it is a credit' do
    expect(@tx.type).to eq('credit')
  end
  it ' knows the date a deposit was made' do
    expect(@tx.date).to eq('18/05/2020')
  end
  it ' knows the balance when a deposit is made' do
    expect(@tx.balance).to eq(100)
  end
  it ' knows the deposit value when a deposit is made' do
    expect(@tx.value).to eq(100)
  end
end
describe 'withdrawals' do
  before(:all) do
    @tx = Transaction.new(
      type: 'debit',
      date: '18/05/2020',
      balance: 100,
      value: 100
    )
  end
  it ' knows that it is a debit' do
    expect(@tx.type).to eq('debit')
  end
  it ' knows the date a withdrawal was made' do
    expect(@tx.date).to eq('18/05/2020')
  end
  it ' knows the balance when a withdrawal is made' do
    expect(@tx.balance).to eq(100)
  end
  it ' knows the withdrawal value when a withdrawal is made' do
    expect(@tx.value).to eq(100)
  end
end
