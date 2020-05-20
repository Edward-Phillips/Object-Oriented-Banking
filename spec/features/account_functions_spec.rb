# frozen_string_literal: true

require 'account'

describe 'depositing, withdrawing and printing statement' do
  it ' should be able to make a deposit, withdrawal & show the statement' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    account.deposit(50)
    account.withdraw(10)
    res = "date || credit || debit || balance
#{date} ||  || 10.00 || 40.00
#{date} || 50.00 ||  || 50.00"
    expect(account.print_statement).to eq(res)
  end
end
