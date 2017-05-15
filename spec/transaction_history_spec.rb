require 'transaction_history'

describe TransactionHistory do
  let(:transaction) { double :transaction, amount: nil, date: Time.now }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:transaction_history) { described_class.new(transaction_class: transaction_class) }

  describe '#add_transaction' do
    it 'adds a transaction with amount and date' do
      expect(transaction_class).to receive(:new).with(50)
      transaction_history.add_transaction(50)
    end
  end

end
