require 'transaction_history'

describe TransactionHistory do
  # let(:amount) { 50 }
  let(:transaction) { double :transaction, amount: 50, type: 'credit', date: '15/05/2017', new_balance: 50}
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:transaction_history) { described_class.new(transaction_class: transaction_class) }

  describe '#add_transaction' do
    it 'creates a new transaction' do
      expect(transaction_class).to receive(:new).with(amount: transaction.amount, type: transaction.type, new_balance: transaction.new_balance)
      transaction_history.add_transaction(amount: transaction.amount, type: transaction.type, new_balance: transaction.new_balance)
    end

    it 'saves the transaction' do
      transaction_history.add_transaction(amount: transaction.amount, type: transaction.type, new_balance: transaction.new_balance)
      expect(transaction_history.transactions).to include(transaction)
    end
  end

  describe '#print' do
    # before do
    #   # let!(:second_transaction) { double :second_transaction, amount: 1000, type: 'credit'}
    #   # let!(:third_transaction) { double :third_transaction, amount: 500, type: 'debit'}
    #   transaction_history.transactions << transaction
    # end

    it 'prints a dated history of deposits and withdrawals' do
      transaction_history.transactions << transaction
      expect(transaction_history.print_transactions).to eq("date || credit || debit || balance\n#{transaction.date} || #{transaction.amount} || || #{transaction.new_balance}")
    end

  end

end
