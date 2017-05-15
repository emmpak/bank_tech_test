require 'transaction'

describe Transaction do
  let(:amount) { 50 }
  subject(:transaction) { described_class.new(amount: amount, type: 'credit', new_balance: amount) }

  it 'has the specified amount' do
    expect(transaction.amount).to eq amount
  end

  it 'has a date' do
    expect(transaction.date).to be_a(Time)
  end

  it 'has a type' do
    expect(transaction.type).to eq 'credit'
  end

  it 'has a new balance' do
    expect(transaction.new_balance).to eq(amount)
  end
end
