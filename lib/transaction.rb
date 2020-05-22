# frozen_string_literal: true

class Transaction
  attr_reader :type, :date, :balance, :value
  def initialize(type:, date:, balance:, value:)
    @type = type
    @date = date
    @balance = balance
    @value = value
  end
end
