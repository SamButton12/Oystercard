require 'oystercard'

describe Oystercard do
  
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }
  
  it 'checks that new oystercard is not in journey' do
    expect(subject).not_to be_in_journey
  end
  
  describe '#journey_log' do
    it 'shows list of previous journeys' do 
      subject.add_money(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_log).to eq([{entry_station: entry_station, exit_station: exit_station}])
    end

    it 'returns empty list of journey log by default' do
      expect(subject.journey_log).to be_empty
    end
  end

  describe '#add_money' do
    it 'does not allow user to add more than maximum funds' do
      subject.add_money(Oystercard::MAX_BALANCE)
      expect { subject.add_money(1) }.to raise_error("funds cannot be added: maximum balance £#{Oystercard::MAX_BALANCE}")
    end
  end

  it 'stores the entry station' do 
    subject.add_money(Oystercard::MIN_FARE)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  describe '#touch_in' do
    it 'when card touches in, in journey is changed to true' do
      subject.add_money(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it 'it does not let you touch in if balance is less than min fare' do
      expect { subject.touch_in(entry_station) }.to raise_error('Insufficient balance')
    end
  end

  describe '#touch_out' do
    it 'when card touches out, in journey is changed to false' do  
      subject.add_money(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
    
    it 'deducts fare from balance' do
      subject.add_money(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'resets entry station to nil' do
      subject.add_money(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end
  end
end
