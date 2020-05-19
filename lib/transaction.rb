# frozen_string_literal: true
 
# this is the Transaction class, it stores the details of each transaction
class Transaction
  attr_reader :type, :date, :balance, :value
  def initialize(type:, date:, balance:, value:)
    @type = type
    @date = date
    @balance = balance
    @value = value
  end
end
