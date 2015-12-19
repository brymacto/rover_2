require_relative '../rover'

describe Rover do 
  it 'exists' do
    r = Rover.new

    expect(r).to_not be_nil
  end
  
end