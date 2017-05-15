class TransactionHistory

  attr_reader :transaction_class, :transactions

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def add_transaction(amount, type)
    self.transactions << transaction_class.new(amount, type)
  end
end
