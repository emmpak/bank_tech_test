describe TransactionHistory do
  let(:transaction) { double :transaction, date: Time.now }
  let(:transaction_class) { double :transactio_class, new: transaction }
  subject(:transaction_history) { described_class.new(transaction_class: transaction_class) }

  describe '#add_transaction' do
    it 'adds a transaction with amount and date' do
      expect(transaction_class).to receive(:new).with(amount: amount)
      transaction_history.add_transaction(amount)
    end
  end

end
