require 'account'

describe 'depositing, withdrawing and printing statement' do
  it ' should be able to make a deposit, withdraw that deposit and show the statement' do
    account = Account.new
    account.deposit(50)
    account.withdraw(10)
    expect(account.print_statement).to eq("date || credit || debit || balance\n19/05/2020 || 50.00 ||  || 50.00\n19/05/2020 ||  || 10.00 || 40.00")
  end
end