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
    store_transaction(num)
  end
  def withdraw(num)
    @balance -= num
    store_transaction(-num)
  end
  def print_statement
    @transactions.join("\n")
  end
  def store_transaction(num)
    if num > 0
      @transactions.push("18/05/2020 || #{num} ||  || #{@balance}")
    else
      @transactions.push("18/05/2020 ||  || #{num} || #{@balance}")
    end
  end
end
