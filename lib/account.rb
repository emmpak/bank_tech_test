require_relative './transaction_history'
require_relative './transaction'

class Account
  attr_reader :balance

  def initialize(transaction_history: TransactionHistory.new)
    @balance = 0
    @transaction_history = transaction_history
  end

  def deposit(amount)
    update_balance(amount)
    transaction_history.add_transaction(amount: amount, type: 'credit', new_balance: self.balance)
  end

  def withdraw(amount)
    update_balance(-amount)
    transaction_history.add_transaction(amount: amount, type: 'debit', new_balance: self.balance)
  end

  def print_statement
    puts transaction_history.print_transactions
  end

  private

  attr_reader :transaction_history
  attr_writer :balance

  def update_balance(amount)
    self.balance += amount
  end
end
