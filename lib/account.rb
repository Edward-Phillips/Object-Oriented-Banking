class Account
  COLUMN_TITLES = "date || credit || debit || balance"

  def initialize
    @balance = 0
    @transactions = [COLUMN_TITLES]
  end

  def balance
    @balance
  end

  def deposit(num= '')
    valid_input(num)

    @balance += num
    store_transaction(num)
  end

  def withdraw(num='')
    valid_input(num)

    @balance -= num
    store_transaction(-num)
  end

  def print_statement
    @transactions.join("\n")
  end

  private

  def valid_input(num)
    if !num.is_a? Numeric
      raise "Error: Invalid request"
    end
    if num < 0
      raise "Error: Cannot make negative transaction"
    end
    if decimals(num) > 0
      raise "Error: Invalid request"
    end
  end

  def decimals(num)
    decimals = 0
    number = num
    while (number != number.to_i)
      decimals += 1
      number *= 10
    end
    return decimals
  end

  def store_transaction(num)
    amount = format_number(num.abs)
    nice_balance = format_number(@balance)
    if num > 0
      @transactions.push("#{date} || #{amount} ||  || #{nice_balance}")
    else
      @transactions.push("#{date} ||  || #{amount} || #{nice_balance}")
    end
  end

  def date
    Time.now.strftime("%d/%m/%Y")
  end

  def format_number(num)
    '%.2f' % num
  end
end
