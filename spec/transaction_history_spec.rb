require 'transaction_history'

describe TransactionHistory do
  let(:amount) { 50 }
  let(:date) { double :date, strftime: "15/05/2017"}
  let(:transaction) { double :transaction, amount: amount, type: 'credit', date: date, new_balance: amount}
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:transaction_history) { described_class.new(transaction_class: transaction_class) }

  describe '#add_transaction' do
    it 'creates a new transaction' do
      expect(transaction_class).to receive(:new).with(amount: amount, type: transaction.type, new_balance: amount)
      transaction_history.add_transaction(amount: amount, type: transaction.type, new_balance: amount)
    end

    it 'saves the transaction' do
      transaction_history.add_transaction(amount: amount, type: transaction.type, new_balance: amount)
      expect(transaction_history.transactions).to include(transaction)
    end
  end

  describe '#print' do
    let!(:second_transaction) { double :second_transaction, amount: 1000, type: 'credit', date: date, new_balance: 1050}
    let!(:third_transaction) { double :third_transaction, amount: 500, type: 'debit', date: date, new_balance: 550}

    it 'prints a dated history of deposits and withdrawals' do
      transaction_history.transactions << transaction << second_transaction << third_transaction
      expect(transaction_history.print_transactions).to eq("date || credit || debit || balance\n" +
                                                            "#{third_transaction.date.strftime} || || #{third_transaction.amount} || #{third_transaction.new_balance}\n" +
                                                            "#{second_transaction.date.strftime} || #{second_transaction.amount} || || #{second_transaction.new_balance}\n" +
                                                            "#{transaction.date.strftime} || #{transaction.amount} || || #{transaction.new_balance}\n")
    end

  end

end
