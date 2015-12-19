require_relative '../rover'

describe Rover do 
  subject { Rover.new(1, 1, 'e', double()) }

  describe '#turn' do
    xit 'turns right when prompted' do
      subject.turn('r')

      expect(subject.direction).to eql('r')
    end

    xit 'turns left when prompted' do
      subject.turn('l')

      expect(subject.direction).to eql('l')
    end
  end

  describe '#status' do
    xit 'returns the coords' do
      result = subject.coords

      expect(result).to eql({x: 1, y: 1, direction: 'e'})
    end
  end

  describe '#move' do
    xit 'checks for availability before moving' do
      space_x = 1
      space_y = 2

      subject.move

      expect(subject.plateau).to receive(:space_available?).with(space_x, space_y)
    end

    context 'space is available' do
      xit 'moves when prompted' do
        allow(subject.plateau).to receive(:subject_available?) { true }

        subject.move

        expect{ subject.move }.to change{ subject.status[x].from(1).to(2) }
      end
    end

    context 'space is not available' do
      xit 'does not move when prompted' do
        allow(subject.plateau).to receive(:subject_available?) { false }

        subject.move

        expect{ subject.move }.to not_change{ subject.status }
      end
    end
  end
end