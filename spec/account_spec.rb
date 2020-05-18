require "account"

describe Account do
  it " should have an account balance" do
    expect(subject.balance).to be_an_instance_of Numeric
  end
end