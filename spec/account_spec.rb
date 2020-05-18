require 'account'

describe Account do
  it ' should have an account balance' do
    expect(subject.balance).to be_instance_of Integer
  end
  it ' should have a deposit method that increases the balance' do
    n = 500
    expect { subject.deposit(n) }.to change { subject.balance }.from(0).to(n)
  end
end
