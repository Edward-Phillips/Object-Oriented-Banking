require 'account'

describe Account do

  describe "basic account function" do
    it ' should have an account balance' do
      expect(subject.balance).to be_kind_of Numeric
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
  describe ' edge cases' do
    it ' should not allow non-numeric deposits' do
      expect { subject.deposit("LOADSAMONEY") }.to raise_error("Error: Invalid request")
    end
    it ' should not allow negative deposits' do
      n = -500
      expect { subject.deposit(n) }.to raise_error("Error: Cannot make negative transaction")
    end
    it ' should not allow deposits with more than 2 decimal places' do
      n = 5.005
      expect { subject.deposit(n) }.to raise_error("Error: Invalid request")
    end
    it ' should not allow a deposit without any deposit value passed' do
      expect { subject.deposit() }.to raise_error("Error: Invalid request")
    end
  end

  it ' should not allow non-numeric withdrawals' do
    expect { subject.withdraw("LOADSAMONEY") }.to raise_error("Error: Invalid request")
  end
  it ' should not allow negative withdrawals' do
    n = -500
    expect { subject.withdraw(n) }.to raise_error("Error: Cannot make negative transaction")
  end
  it ' should not allow withdrawals with more than 2 decimal places' do
    n = 5.005
    expect { subject.withdraw(n) }.to raise_error("Error: Invalid request")
  end
  it ' should not allow a withdrawal without any deposit value passed' do
    expect { subject.withdraw() }.to raise_error("Error: Invalid request")
  end
end
