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
  it 'should be able to produce a statement' do
    expect(subject.print_statement).to eq("date || credit || debit || balance")
  end
  describe 'statement details' do
    it ' should show a previously made deposit on the statement' do
      n = 500
      subject.deposit(n)
      expect(subject.print_statement).to eq("date || credit || debit || balance\n18/05/2020 || 500.00 ||  || 500.00")
    end
    it ' should show a previously made withdrawal on the statement' do
      n = 500
      subject.deposit(n)
      subject.withdraw(n)
      expect(subject.print_statement).to eq("date || credit || debit || balance\n18/05/2020 || 500.00 ||  || 500.00\n18/05/2020 ||  || 500.00 || 0.00")
    end
  end
end
