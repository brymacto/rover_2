require 'pry'

class Rover
  DIRECTIONS = ['n', 'e', 's', 'w']
  DIRECTION_INDEX_ROTATIONS = { l: -1, r: 1 }
  
  attr_accessor :direction
  attr_reader :plateau

  def initialize(args)
    @x = args.fetch(:x, 1)
    @y = args.fetch(:y, 1)
    @direction = args.fetch(:direction, 'e')
    @plateau = args.fetch(:plateau, Plateau.new)
  end

  def turn(direction)
    raise "Direction must be 'l' or 'r'" if direction != 'l' && direction != 'r'
    direction_index_rotation = DIRECTION_INDEX_ROTATIONS[direction.to_sym]
    @direction = new_direction(direction_index(direction), direction_index_rotation)
  end

  def status
    { x: @x, y: @y, direction: @direction }
  end

  def move
    next_x = next_space[:x]
    next_y = next_space[:y]
    space_available = @plateau.space_available?(next_x, next_y)
    change_position(next_x, next_y) if space_available
  end

  private

  def next_space
    x = @x + 1 if @direction == 'e'
    x = @x - 1 if @direction == 'w'
    y = @y + 1 if @direction == 'n'
    y = @y - 1 if @direction == 's'
    x ||= @x
    y ||= @y
    {x: x, y: y}
  end

  def new_direction(direction_index, direction_index_rotation)
    DIRECTIONS.rotate(direction_index_rotation)[direction_index]
  end

  def direction_index(direction)
    DIRECTIONS.index(@direction)
  end
end