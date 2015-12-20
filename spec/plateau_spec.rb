require_relative '../plateau'

describe Plateau do 
  let(:rover_1) { double }
  let(:rover_2) { double }
  subject { Plateau.new(rover_1, rover_2) }
  

  describe '#space_available?' do
    it 'returns false when space occupied by other rover' do
      space = { x: 2, y: 1 }
      allow(rover_1).to receive(:position) { { x: 1, y: 1 } }
      allow(rover_2).to receive(:position) { { x: 2, y: 1 } }
      expect(rover_1).to receive(:position) 
      expect(rover_2).to receive(:position) 
      result = subject.space_available?(space)
      expect(result).to eql(false)
    end
    xit 'returns false when space is off the grid'
    xit 'returns true when space is available'
  end
  
end