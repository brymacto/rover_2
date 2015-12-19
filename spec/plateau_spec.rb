require_relative '../plateau'

describe Plateau do 
  subject { Plateau.new }

  describe '#space_available?' do
    xit 'returns false when space occupied by other rover'
    xit 'returns false when space is off the grid'
    xit 'returns true when space is available'
  end
  
end