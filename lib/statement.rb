class Statement
  attr_reader :transactions
  COLUMN_TITLES = 'date || credit || debit || balance'
  def initialize
    @transactions = []
  end

  def print_statement
    COLUMN_TITLES
  end

  
end