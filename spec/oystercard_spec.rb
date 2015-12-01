require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it 'sets the initial balance to 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'allows you to top up oystercard' do
    expect{oystercard.top_up(50)}.to change {oystercard.balance}.by(50)
  end

  it 'caps top up so that new balance after top up is max 90' do
    oystercard.top_up(90)
    expect{oystercard.top_up}.to raise error if {oystercard.balance == 90}
  end

end
