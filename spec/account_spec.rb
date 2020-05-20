# frozen_string_literal: true
require 'account'

describe Account do
  describe 'basic account function' do
    it ' should have an account balance' do
      expect(subject.balance).to be_kind_of Numeric
    end
    it ' should have a deposit method that increases the balance' do
      transaction = class_double('Transaction')
      allow(transaction).to receive(:new).with(any_args)
      subject = Account.new(transaction_class: transaction)

      n = 500
      expect { subject.deposit(n) }.to change { subject.balance }.from(0).to(n)
    end
    it ' should have a withdraw method that reduces the balance' do
      transaction = class_double('Transaction')
      allow(transaction).to receive(:new).with(any_args)
      subject = Account.new(transaction_class: transaction)

      n = 500
      subject.deposit(n)
      expect { subject.withdraw(n) }.to change { subject.balance }.from(n).to(0)
    end
    it 'should be able to produce a statement' do
      expected_output = 'date || credit || debit || balance'
      expect(subject.print_statement).to eq(expected_output)
    end
  end

  describe 'statement details' do
    it ' should show a previously made deposit on the statement' do
      
      transaction = class_double('Transaction')
      date = Time.now.strftime('%d/%m/%Y')
      tx = instance_double(
        'Transaction', 
        {
          type: "credit",
          date: date,
          balance: "500.00",
          value: "500.00"
        }
      )
      allow(transaction).to receive(:new).with({
        :type => "credit",
        :date => date,
        :balance => "500.00",
        :value => "500.00"
      }).and_return(tx)
      subject = Account.new(transaction_class: transaction)

      n = 500
      subject.deposit(n)
      expected_output = "date || credit || debit || balance\n#{date} || 500.00 ||  || 500.00"
      expect(subject.print_statement).to eq(expected_output)
    end
    it ' should show a previously made withdrawal on the statement' do
      allow(subject).to receive(:date) {"18/05/2020"}
      transaction = class_double('Transaction')
      date = "18/05/2020"
      tx = instance_double(
        'Transaction', 
        {
          type: "credit",
          date: date,
          balance: "500.00",
          value: "500.00"
        }
      )
      tx2 = instance_double(
        'Transaction', 
        {
          type: "debit",
          date: date,
          balance: "0.00",
          value: "500.00"
        }
      )
      date = Time.now.strftime('%d/%m/%Y')
      allow(transaction).to receive(:new).with(hash_including(
        :type => "credit",
        :date => date,
        :balance => "500.00",
        :value => "500.00"
      )).and_return(tx)
      allow(transaction).to receive(:new).with(hash_including(
        :type => "debit",
        :date => date,
        :balance => "0.00",
        :value => "500.00"
      )).and_return(tx2)
      subject = Account.new(transaction_class: transaction)

      n = 500
      subject.deposit(n)
      subject.withdraw(n)
      expected_output = "date || credit || debit || balance\n18/05/2020 ||  || 500.00 || 0.00\n18/05/2020 || 500.00 ||  || 500.00"
      expect(subject.print_statement).to eq(expected_output)
    end
  end
  describe ' edge cases' do
    it ' should not allow non-numeric deposits' do
      error_msg = 'Error: Invalid request'
      expect { subject.deposit('LOADSAMONEY') }.to raise_error(error_msg)
    end
    it ' should not allow negative deposits' do
      n = -500
      error_msg = 'Error: Cannot make negative transaction'
      expect { subject.deposit(n) }.to raise_error(error_msg)
    end
    it ' should not allow deposits with more than 2 decimal places' do
      n = 5.005
      expect { subject.deposit(n) }.to raise_error('Error: Invalid request')
    end
    it ' should not allow a deposit without any deposit value passed' do
      expect { subject.deposit }.to raise_error('Error: Invalid request')
    end
  end

  it ' should not allow non-numeric withdrawals' do
    bad_input = 'LOADSAMONEY'
    error_msg = 'Error: Invalid request'
    expect { subject.withdraw(bad_input) }.to raise_error(error_msg)
  end
  it ' should not allow negative withdrawals' do
    n = -500
    error_msg = 'Error: Cannot make negative transaction'
    expect { subject.withdraw(n) }.to raise_error(error_msg)
  end
  it ' should not allow withdrawals with more than 2 decimal places' do
    n = 5.005
    expect { subject.withdraw(n) }.to raise_error('Error: Invalid request')
  end
  it ' should not allow a withdrawal without any deposit value passed' do
    expect { subject.withdraw }.to raise_error('Error: Invalid request')
  end
  it ' should not allow a withdrawal greater than the account balance' do
    n = 100
    expect { subject.withdraw(n) }.to raise_error('Error: Insufficent funds')
  end
end
