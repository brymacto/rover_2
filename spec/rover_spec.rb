require_relative '../rover'

describe Rover do
  subject { Rover.new(x: 1, y: 1, direction: 'e', plateau: double('plateau_double')) }

  describe '#turn' do
    it 'turns right when prompted' do
      subject.turn('r')

      expect(subject.direction).to eql('s')
    end

    context 'current direction (w) is at end of DIRECTIONS constant' do
      it 'turns right when prompted' do
        subject.direction = 'w'

        subject.turn('r')

        expect(subject.direction).to eql('n')
      end
    end

    it 'turns left when prompted' do
      subject.direction = 's'

      subject.turn('l')

      expect(subject.direction).to eql('e')
    end
    context 'current direction (n) is at beginning of DIRECTIONS constant' do
      it 'turns left when prompted' do
        subject.direction = 'n'

        subject.turn('l')

        expect(subject.direction).to eql('w')
      end
    end

    it 'raises an error when direction is neither l nor r' do
      expect { subject.turn('foo') }.to raise_error("Direction must be 'l' or 'r'")
    end
  end

  describe '#status' do
    it 'returns the coords and direction' do
      result = subject.status

      expect(result).to eql(x: 1, y: 1, direction: 'e')
    end
  end

  describe '#move' do
    it 'checks for availability before moving' do
      new_space_x = 2
      new_space_y = 1

      expect(subject.plateau).to receive(:space_available?).with(x: new_space_x, y: new_space_y)

      subject.move
    end

    context 'space is available' do
      it 'moves when prompted' do
        allow(subject.plateau).to receive(:space_available?) { true }

        expect { subject.move }.to change { subject.status[:x] }.from(1).to(2)
      end
    end

    context 'space is not available' do
      it 'does not move when prompted' do
        allow(subject.plateau).to receive(:space_available?) { false }

        subject.move

        expect { subject.move }.to_not change { subject.status }
      end
    end
  end
end
