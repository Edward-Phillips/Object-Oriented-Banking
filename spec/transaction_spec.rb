# frozen_string_literal: true
require 'transaction'

describe Transaction do
  describe 'deposits' do
    it ' knows that it is a credit' do
      tx = Transaction.new(type: "credit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.type).to eq("credit")
    end
    it ' knows the date a deposit was made' do
      tx = Transaction.new(type: "credit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.date).to eq("18/05/2020")
    end
    it ' knows the balance when a deposit is made' do
      tx = Transaction.new(type: "credit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.balance).to eq(100)
    end
    it ' knows the deposit value when a deposit is made' do
      tx = Transaction.new(type: "credit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.value).to eq(100)
    end
  end
  describe 'withdrawals' do
    it ' knows that it is a debit' do
      tx = Transaction.new(type: "debit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.type).to eq("debit")
    end
    it ' knows the date a withdrawal was made' do
      tx = Transaction.new(type: "debit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.date).to eq("18/05/2020")
    end
    it ' knows the balance when a withdrawal is made' do
      tx = Transaction.new(type: "debit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.balance).to eq(100)
    end
    it ' knows the deposit value when a withdrawal is made' do
      tx = Transaction.new(type: "debit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.value).to eq(100)
    end
  end
end