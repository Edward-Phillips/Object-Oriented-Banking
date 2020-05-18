class Account
  COLUMN_TITLES = "date || credit || debit || balance"
  def initialize
    @balance = 0
    @transactions = [COLUMN_TITLES]
  end
  def balance
    @balance
  end
  def deposit(num)
    @balance += num
    @transactions.push("18/05/2020 || #{num} ||  || #{@balance}")
  end
  def withdraw(num)
    @balance -= num
  end
  def print_statement
    @transactions.join("\n")
  end
end
