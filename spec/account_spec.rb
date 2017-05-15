require 'account'

describe Account do
  let(:transaction_history) { double :transaction_history }
  subject(:account) { described_class.new(transaction_history: transaction_history) }

  it 'has an initial balance of 0' do
    expect(account.balance).to eq(0)
  end


  describe '#deposit' do
    before { allow(transaction_history).to receive(:add_transaction) }

    it 'adds a credit transaction to the transaction_history' do
      expect(transaction_history).to receive(:add_transaction).with(50)
      account.deposit(50)
    end

    it 'increses the balance' do
      account.deposit(50)
      expect(account.balance).to eq 50
    end
  end
end
