require 'pry'

class Rover
  DIRECTIONS = ['n', 'e', 's', 'w']
  DIRECTION_INDEX_ROTATIONS = { l: -1, r: 1 }
  
  attr_accessor :direction

  def initialize(args)
    @x = args.fetch('x', 1)
    @y = args.fetch('y', 1)
    @direction = args.fetch('direction', 'e')
    @plateau = args.fetch('plateau', Plateau.new)
  end

  def turn(direction)
    raise "Direction must be 'l' or 'r'" if direction != 'l' && direction != 'r'
    direction_index_rotation = DIRECTION_INDEX_ROTATIONS[direction.to_sym]
    @direction = new_direction(direction_index(direction), direction_index_rotation)
  end

  private

  def new_direction(direction_index, direction_index_rotation)
    DIRECTIONS.rotate(direction_index_rotation)[direction_index]
  end

  def direction_index(direction)
    DIRECTIONS.index(@direction)
  end
end