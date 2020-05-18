require "account"

describe Account do
  it " should have an account balance" do
    expect(subject.balance).to be_instance_of Integer
  end
  it " should have a deposit method that increases the balance" do
    expect{ subject.deposit(500) }.to change { subject.balance }.from(0).to(500)
  end
end