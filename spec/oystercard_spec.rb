require 'oystercard'

describe Oystercard do
  # arrange
  # subject.add_money
  # assert
  # expect(subject.add_money).to eq

  #plan to remove this test when refactoring once we have respond to money with 1 argument working
  it 'responds to add_money' do
    subject.add_money
    expect(subject).to respond_to :add_money
  end

  # it 'responds to add_money with one argument' do
  #   expect(subject).to respond_to(:add_money).with(1).argument
  # end

  it 'responds to balance' do
    subject.balance
    expect(subject).to respond_to :balance
  end

  it 'returns balance' do
    expect(subject.balance).to eq(0)
  end

  it 'creates an instance of Oystercard' do
    expect(subject).to be_instance_of(Oystercard)
  end

end
