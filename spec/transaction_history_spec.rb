require 'transaction_history'

describe TransactionHistory do
  let(:transaction) { double :transaction, amount: 50, type: 'credit'}
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:transaction_history) { described_class.new(transaction_class: transaction_class) }

  describe '#add_transaction' do
    it 'creates a new transaction' do
      expect(transaction_class).to receive(:new).with(amount: 50, type: 'credit')
      transaction_history.add_transaction(amount: 50, type: 'credit')
    end

    it 'saves the transaction' do
      transaction_history.add_transaction(transaction)
      expect(transaction_history.transactions).to include(transaction)
    end
  end

end
