require 'account'

describe Account do
  it ' should have an account balance' do
    expect(subject.balance).to be_instance_of Integer
  end
  it ' should have a deposit method that increases the balance' do
    n = 500
    expect { subject.deposit(n) }.to change { subject.balance }.from(0).to(n)
  end
  it ' should have a withdraw method that reduces the balance' do
    n = 500
    subject.deposit(n)
    expect { subject.withdraw(n) }.to change { subject.balance }.from(n).to(0)
  end
  it 'should be able to print a statement to the console' do
    expect(subject.print_statement).to output('date || credit || debit || balance').to_stdout
  end
end
