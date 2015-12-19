require_relative '../rover'

describe Rover do 
  subject { Rover.new }

  describe '#turn' do
    it 'turns right when prompted' do
      subject.turn('r')

      expect(subject.direction).to eql('r')
    end

    it 'turns left when prompted' do
      subject.turn('l')

      expect(subject.direction).to eql('l')
    end
  end

  describe '#move' do
    context 'path is not blocked by other rover' do
      xit 'moves when prompted'
    end

    context 'path is blocked by other rover' do
      xit 'does not move when prompted'
    end
  end
end