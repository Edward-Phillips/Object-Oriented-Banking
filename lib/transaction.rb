# frozen_string_literal: true

# this is the Transaction class, it stores the details of each transaction
class Transaction
  attr_reader :type
  def initialize(type:, date:, balance:, value:)
    @type = type
  end
end