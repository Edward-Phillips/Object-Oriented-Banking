# frozen_string_literal: true

require 'account'

describe 'basic account function' do
  before(:each) do
    @transaction = class_double('Transaction')
    allow(@transaction).to receive(:new).with(any_args)
    @statement = class_double('Statement')
    @stment = instance_double('Statement')
    allow(@stment).to receive(:transactions).and_return([])
    allow(@statement).to receive(:new).with(any_args).and_return(@stment)
    @acc = Account.new(transaction_class: @transaction, statement_class: @statement)
    @n = 500
  end
  it ' should have an account balance' do
    expect(@acc.balance).to be_kind_of Numeric
  end
  it ' should have a deposit method that increases the balance' do
    expect { @acc.deposit(@n) }.to change { @acc.balance }.from(0).to(@n)
  end
  it ' should have a withdraw method that reduces the balance' do
    @acc.deposit(@n)
    expect { @acc.withdraw(@n) }.to change { @acc.balance }.from(@n).to(0)
  end
  it 'should be able to produce a statement' do
    expect(@stment).to receive(:print_statement)
    @acc.print_statement
  end
end

describe ' edge cases' do
  before(:each) do
    @acc = Account.new
    @bad_input = 'LOADSAMONEY'
    @error_msg = 'Error: Invalid request'
  end
  it ' should not allow non-numeric deposits' do
    expect { @acc.deposit(@bad_input) }.to raise_error(@error_msg)
  end
  it ' should not allow negative deposits' do
    n = -500
    error_msg = 'Error: Cannot make negative transaction'
    expect { @acc.deposit(n) }.to raise_error(error_msg)
  end
  it ' should not allow deposits with more than 2 decimal places' do
    n = 5.005
    expect { @acc.deposit(n) }.to raise_error(@error_msg)
  end
  it ' should not allow a deposit without any deposit value passed' do
    expect { @acc.deposit }.to raise_error(@error_msg)
  end
  it ' should not allow non-numeric withdrawals' do
    expect { @acc.withdraw(@bad_input) }.to raise_error(@error_msg)
  end
  it ' should not allow negative withdrawals' do
    n = -500
    error_msg = 'Error: Cannot make negative transaction'
    expect { @acc.withdraw(n) }.to raise_error(error_msg)
  end
  it ' should not allow withdrawals with more than 2 decimal places' do
    n = 5.005
    expect { @acc.withdraw(n) }.to raise_error('Error: Invalid request')
  end
  it ' should not allow a withdrawal without any deposit value passed' do
    expect { @acc.withdraw }.to raise_error(@error_msg)
  end
  it ' should not allow a withdrawal greater than the account balance' do
    n = 100
    expect { @acc.withdraw(n) }.to raise_error('Error: Insufficent funds')
  end
end
