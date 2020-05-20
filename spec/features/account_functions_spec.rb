require 'account'

describe 'depositing, withdrawing and printing statement' do
  it ' should be able to make a deposit, withdraw that deposit and show the statement' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    account.deposit(50)
    account.withdraw(10)
    expect(account.print_statement).to eq("date || credit || debit || balance\n#{date} ||  || 10.00 || 40.00\n#{date} || 50.00 ||  || 50.00")
  end
end