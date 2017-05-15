require 'account'

describe Account do
  let(:transaction_history) { double :transaction_history, add_transaction: nil }
  subject(:account) { described_class.new(transaction_history: transaction_history) }

  it 'has an initial balance of 0' do
    expect(account.balance).to eq(0)
  end


  describe '#deposit' do
    it 'adds a credit transaction to the transaction_history' do
      expect(transaction_history).to receive(:add_transaction).with(50, 'credit', 50)
      account.deposit(50)
    end

    it 'increses the balance' do
      account.deposit(50)
      expect(account.balance).to eq 50
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(50)
    end

    it 'adds a debit transaction to the transaction history' do
      expect(transaction_history).to receive(:add_transaction).with(50, 'debit', 0)
      account.withdraw(50)
    end

    it 'decreases the balance' do
      account.withdraw(50)
      expect(account.balance).to eq 0
    end
  end

  describe '#print_statement' do
    before do
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
    end

    it 'prints a dated history of deposits and withdrawals' do
      expect(transaction_history).to receive(:print_transactions)
      account.print_statement
    end
  end
end
