class Transaction

  attr_reader :amount, :type, :date, :new_balance

  def initialize(amount:, type:, new_balance:)
    @amount = amount
    @type = type
    @date = Time.now
    @new_balance = new_balance
  end
end

# @date = Time.now.strftime("%d/%m/%Y")
