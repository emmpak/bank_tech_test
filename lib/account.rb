require_relative './transaction_history'

class Account
  attr_reader :balance, :transaction_history

  def initialize(transaction_history: TransactionHistory.new)
    @balance = 0
    @transaction_history = transaction_history
  end

  def deposit(amount)
    transaction_history.add_transaction(amount, 'credit')
    update_balance(amount)
  end

  def withdraw(amount)
    transaction_history.add_transaction(amount, 'debit')
    update_balance(-amount)
  end

  def print_statement
    transaction_history.print_transactions
  end

  private
  attr_writer :balance

  def update_balance(amount)
    self.balance += amount
  end
end
