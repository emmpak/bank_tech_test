require 'account'

describe Account do
  let(:initial_balance) { 0 }
  let(:amount) { 50 }
  let(:transaction_history) { double :transaction_history, add_transaction: nil }
  subject(:account) { described_class.new(transaction_history: transaction_history) }

  it 'has an initial balance of 0' do
    expect(account.balance).to eq initial_balance
  end

  describe '#deposit' do
    it 'adds a credit transaction to the transaction_history' do
      expect(transaction_history).to receive(:add_transaction).with(amount, 'credit', amount)
      account.deposit(amount)
    end

    it 'increses the balance' do
      account.deposit(amount)
      expect(account.balance).to eq amount
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(amount)
    end

    it 'adds a debit transaction to the transaction history' do
      expect(transaction_history).to receive(:add_transaction).with(amount, 'debit', initial_balance)
      account.withdraw(amount)
    end

    it 'decreases the balance' do
      account.withdraw(amount)
      expect(account.balance).to eq initial_balance
    end
  end

  describe '#print_statement' do

    it 'prints a dated history of deposits and withdrawals' do
      expect(transaction_history).to receive(:print_transactions)
      account.print_statement
    end
  end
end
