class Transaction

  attr_reader :amount, :type, :date

  def initialize(amount: amount, type: type)
    @amount = amount
    @type = type
    @date = Time.now
  end
end

# @date = Time.now.strftime("%d/%m/%Y")
