class Account
  def initialize
    @balance = 0
  end
  def balance
    @balance
  end
  def deposit(num)
    @balance += num
  end
  def withdraw(num)
    @balance -= num
  end
  def print_statement
    "date || credit || debit || balance"
  end
end
