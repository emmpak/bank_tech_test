require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:statement) { double transactions: [] }

  it 'has an initial balance of 0' do
    expect(account.balance).to equal(0)
  end

  it 'initializes with an empty transaction history' do
    expect(account.statement).to statement
  end
end
