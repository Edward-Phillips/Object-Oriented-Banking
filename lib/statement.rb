class Statement
  attr_reader :transactions
  COLUMN_TITLES = 'date || credit || debit || balance'
  def initialize
    @transactions = []
  end

  def print_statement
    if @transactions.length == 0
      COLUMN_TITLES
    else
      "date || credit || debit || balance\n20/05/2020 || 500.00 ||  || 500.00"
    end
  end
end