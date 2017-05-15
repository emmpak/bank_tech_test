
class Account
  attr_reader :balance, :transaction_history

  def initialize(transaction_history)
    @balance = 0
    @transaction_history = transaction_history
  end

  def deposit(amount)
    transaction_history.add_transaction(amount)
  end
end
