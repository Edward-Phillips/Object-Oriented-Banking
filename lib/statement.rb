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
      lines = []
      for tx in @transactions do
        if tx.type =='credit'
          lines.push("#{tx.date} || #{tx.value} ||  || #{tx.balance}")
        else
          lines.push("#{tx.date} ||  || #{tx.value} || #{tx.balance}")
        end          
      end
      lines.push(COLUMN_TITLES)
      lines.reverse.join("\n")
    end
  end
  
end

