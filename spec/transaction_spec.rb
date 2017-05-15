require 'transaction'

describe Transaction do
  DEPOSIT_AMOUNT = 50
  # let(:Time) { double :Time, now: Time.now}
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

end
