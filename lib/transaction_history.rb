class TransactionHistory

  attr_reader :transaction_class, :transactions

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def add_transaction(amount:, type:, new_balance:)
    self.transactions << transaction_class.new(amount: amount, type: type, new_balance: new_balance)
  end

  def print_transactions
    statement = "date || credit || debit || balance\n"
    self.transactions.reverse.each do |transaction|
      if transaction.type == 'credit'
        statement += "#{transaction.date} || #{transaction.amount} || || #{transaction.new_balance}"
      else
        statement += "#{transaction.date} || || #{transaction.amount} || #{transaction.new_balance}"
      end
    end
    statement
  end
end
