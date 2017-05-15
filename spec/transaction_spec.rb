require 'transaction'

describe Transaction do
  DEPOSIT_AMOUNT = 50
  # let(:Time) { double :Time, now: }
  subject(:transaction) { described_class.new(amount: DEPOSIT_AMOUNT, type: 'debit') }

  it 'has the specified amount' do
    expect(transaction.amount).to eq(DEPOSIT_AMOUNT)
  end

  it 'has a date' do
    expect(transaction.date).to eq(date)
  end

  it 'has a type' do
    expect(transaction.type).to eq 'debit'
  end

end
