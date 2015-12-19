require_relative '../rover'

describe Rover do 
  subject { Rover.new }

  it 'turns right when prompted' do
    subject.turn('r')

    expect(subject.direction).to eql('r')
  end

  it 'turns left when prompted' do
    subject.turn('l')

    expect(subject.direction).to eql('l')
  end


  
end