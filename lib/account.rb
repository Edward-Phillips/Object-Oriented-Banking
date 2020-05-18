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
end
