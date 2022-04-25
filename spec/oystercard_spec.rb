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
