require 'oystercard'

describe Oystercard do
  # arrange
  # subject.add_money
  # assert
  # expect(subject.add_money).to eq

  it 'responds to add_money' do
    subject.add_money
    expect(subject).to respond_to :add_money
  end
  
  it 'responds to balance' do
    subject.balance
    expect(subject).to respond_to :balance
  end

end