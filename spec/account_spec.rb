# frozen_string_literal: true

require 'account'
describe Account do

    describe '#deposit' do
      it ' should have a deposit method that increases the balance' do
        transaction = class_double('Transaction')
        allow(transaction).to receive(:new).with(any_args)
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 500
        expect { account.deposit(n) }.to change { account.balance }.from(0).to(n)
      end

      it ' should not allow non-numeric deposits' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 500
        bad_input = 'LOADSAMONEY'
        error_message = 'Error: Invalid request'
        expect { account.deposit(bad_input) }.to raise_error(error_message)
      end

      it ' should not allow negative deposits' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = -500
        error_message = 'Error: Cannot make transaction of 0.00 or lower'
        expect { account.deposit(n) }.to raise_error(error_message)
      end

      it ' should not allow deposits with more than 2 decimal places' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 5.005
        error_message = 'Error: Invalid request'
        expect { account.deposit(n) }.to raise_error(error_message)
      end

      it ' should not allow a deposit without any deposit value passed' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        error_message = 'Error: Invalid request'
        expect { account.deposit }.to raise_error(error_message)
      end
    end

    describe '#withdraw' do
      it ' should have a withdraw method that reduces the balance' do
        transaction = class_double('Transaction')
        allow(transaction).to receive(:new).with(any_args)
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 500
        account.deposit(n)        
        expect { account.withdraw(n) }.to change { account.balance }.from(n).to(0)
      end

      it ' should not allow non-numeric withdrawals' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 500
        bad_input = 'LOADSAMONEY'
        error_message = 'Error: Invalid request'
        expect { account.withdraw(bad_input) }.to raise_error(error_message)
      end

      it ' should not allow negative withdrawals' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = -500
        error_message = 'Error: Cannot make transaction of 0.00 or lower'
        expect { account.withdraw(n) }.to raise_error(error_message)
      end

      it ' should not allow withdrawals with more than 2 decimal places' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 5.005
        error_message = 'Error: Invalid request'
        expect { account.withdraw(n) }.to raise_error(error_message)
      end

      it ' should not allow a withdrawal without any withdrawal value passed' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        error_message = 'Error: Invalid request'
        expect { account.withdraw }.to raise_error(error_message)
      end

      it ' should not allow a withdrawal greater than the account balance' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        allow(statement).to receive(:new)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        n = 100
        error_message = 'Error: Insufficent funds'
        expect { account.withdraw(n) }.to raise_error(error_message)
      end
    end

    describe '#print_statement' do
      it ' should be able to produce a statement' do
        transaction = class_double('Transaction')
        statement = class_double('Statement')
        statement_instance = instance_double('Statement')
        allow(statement).to receive(:new).with(any_args).and_return(statement_instance)
        account = Account.new(
          transaction_class: transaction,
          statement_class: statement
        )
        expect(statement_instance).to receive(:print_statement)
        
        account.print_statement
      end
    end
end