class TransactionHistory

  attr_reader :transaction_class, :transactions

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def add_transaction(amount, type)
    self.transactions << transaction_class.new(amount, type)
  end

  def print_transactions
    statement = "date || credit || debit || balance\n"
    self.transactions.reverse.each do |transaction|
      p transaction.amount
      if transaction.type == 'credit'
        statement += "#{transaction.date} || #{transaction.amount} || || #{transaction.new_balance}"
      else
        statement += "#{transaction.date} || || #{transaction.amount} || #{transaction.new_balance}"
      end
    end
    statement
  end
end
