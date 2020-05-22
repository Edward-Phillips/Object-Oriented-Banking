# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe 'deposits' do
    it ' knows that it is a credit' do
      credit_transaction = Transaction.new(
        type: 'credit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(credit_transaction.type).to eq('credit')
    end
    it ' knows the date a deposit was made' do
      credit_transaction = Transaction.new(
        type: 'credit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(credit_transaction.date).to eq('18/05/2020')
    end
    it ' knows the balance when a deposit is made' do
      credit_transaction = Transaction.new(
        type: 'credit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(credit_transaction.balance).to eq(100)
    end
    it ' knows the deposit value when a deposit is made' do
      credit_transaction = Transaction.new(
        type: 'credit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(credit_transaction.value).to eq(100)
    end
  end
  describe 'withdrawals' do
    it ' knows that it is a debit' do
      debit_transaction = Transaction.new(
        type: 'debit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(debit_transaction.type).to eq('debit')
    end
    it ' knows the date a withdrawal was made' do
      debit_transaction = Transaction.new(
        type: 'debit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(debit_transaction.date).to eq('18/05/2020')
    end
    it ' knows the balance when a withdrawal is made' do
      debit_transaction = Transaction.new(
        type: 'debit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(debit_transaction.balance).to eq(100)
    end
    it ' knows the withdrawal value when a withdrawal is made' do
      debit_transaction = Transaction.new(
        type: 'debit',
        date: '18/05/2020',
        balance: 100,
        value: 100
      )
      expect(debit_transaction.value).to eq(100)
    end
  end
end
