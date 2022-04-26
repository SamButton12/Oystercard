require 'oystercard'

describe Oystercard do
  # arrange
  # subject.add_money
  # assert
  # expect(subject.add_money).to eq

  #plan to remove this test when refactoring once we have respond to money with 1 argument working

  # it 'responds to balance' do
  #   subject.balance
  #   expect(subject).to respond_to :balance
  # end

  # it 'responds to add_money with 1 argument' do
  #   expect(subject).to respond_to(:add_money).with(1).argument
  # end

  it 'creates an instance of Oystercard' do
    expect(subject).to be_instance_of(Oystercard)
  end
  
  describe '#add_money' do
    it 'does not allow user to add more than maximum funds' do
      subject.add_money(90)
      expect { subject.add_money(1) }.to raise_error("funds cannot be added: maximum balance £#{Oystercard::MAX_BALANCE}")
    end
  end

  it 'returns balance' do
    expect(subject.balance).to eq(0)
  end

  it 'responds to deduct_money with 1 argument' do
    expect(subject).to respond_to(:deduct_money).with(1).argument
  end
  
  it 'checks that new oystercard is not in journey' do
    expect(subject.in_journey?).to be false
  end

  describe '#touch_in' do
    it 'when card touches in, in journey is changed to true' do
      subject.add_money(Oystercard::MIN_FARE)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'it does not let you touch in if balance is less than min fare' do
      expect { subject.touch_in }.to raise_error('Insufficient balance')
    end

  end

  it 'when card touches out, in journey is changed to false' do  
    subject.add_money(Oystercard::MIN_FARE)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

end





# it 'allows user to touch in' do
#   expect(subject).to respond_to :touch_in
# end

# it 'allows user to touch out' do
# expect(subject).to respond_to :touch_out
# end
