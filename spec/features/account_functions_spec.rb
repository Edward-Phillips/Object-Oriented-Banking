# frozen_string_literal: true

require 'account'

describe 'depositing, withdrawing and printing statement' do
  it ' should be able to make a deposit, withdrawal & show the statement' do
    account = Account.new
    date = Time.now.strftime('%d/%m/%Y')
    account.deposit(50)
    account.withdraw(10)
    expected_headers = 'date || credit || debit || balance'
    statement_line_1 = "#{date} ||  || 10.00 || 40.00"
    statement_line_2 = "#{date} || 50.00 ||  || 50.00"
    result = [expected_headers,statement_line_1,statement_line_2].join("\n")
    expect { account.print_statement }.to output(result).to_stdout
  end
end
