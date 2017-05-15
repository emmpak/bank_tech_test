require 'transaction'

describe Transaction do
  DEPOSIT_AMOUNT = 50
  subject(:transaction) { described_class.new(DEPOSIT_AMOUNT, 'credit') }

  it 'has the specified amount' do
    expect(transaction.amount).to eq(DEPOSIT_AMOUNT)
  end

  it 'has a date' do
    expect(transaction.date).to be_a(Time)
  end

  it 'has a type' do
    expect(transaction.type).to eq 'credit'
  end

  # it 'has a new balance' do
  #   expect(transaction.new_balance).to eq(DEPOSIT_AMOUNT)
  # end

end
