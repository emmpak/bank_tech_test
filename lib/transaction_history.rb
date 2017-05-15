class TransactionHistory

  attr_reader :transaction_class

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
  end

  def add_transaction(amount)
    transaction_class.new(amount)
  end
end
