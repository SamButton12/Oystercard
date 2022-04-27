require 'station'

describe Station do

  subject {described_class.new('station name', 1)}

  it 'returns name of the station' do
    expect(subject.name).to eq('station name')
  end

  it 'returns zone number of the station' do
    expect(subject.zone).to eq 1
  end

end