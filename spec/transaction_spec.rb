require 'transaction'

describe Transaction do
  describe 'deposits' do
    it ' knows that it is a deposit' do
      tx = Transaction.new(type: "credit", date:"18/05/2020", balance: 100, value: 100)
      expect(tx.type).to eq("credit")
    end
  end
end