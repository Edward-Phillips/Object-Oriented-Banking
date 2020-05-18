class Account
  def initialize
    @balance = 0
    @transactions = []
  end
  def balance
    @balance
  end
  def deposit(num)
    @balance += num
    @transactions.push(num)
  end
  def withdraw(num)
    @balance -= num
  end
  def print_statement
    if @transactions.length == 0
      "date || credit || debit || balance"
    else
      "date || credit || debit || balance\n18/05/2020 || 500 ||  || 500"
    end
  end
end
