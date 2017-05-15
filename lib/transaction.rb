class Transaction

  attr_reader :amount, :type, :date, :new_balance

  def initialize(amount, type, balance)
    @amount = amount
    @type = type
    @date = Time.now
    @new_balance = balance
  end
end

# @date = Time.now.strftime("%d/%m/%Y")
