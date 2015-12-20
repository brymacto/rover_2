require './moves'

class Rover
  DIRECTIONS = ['n', 'e', 's', 'w']
  DIRECTION_INDEX_ROTATIONS = { l: -1, r: 1 }
  
  attr_accessor :direction
  attr_reader :plateau

  def initialize(args)
    @x = args.fetch(:x, 1)
    @y = args.fetch(:y, 1)
    @direction = args.fetch(:direction, 'e')
    @plateau = args.fetch(:plateau, Plateau.new(30, 30, self))
    @moves = Moves.new
  end

  def turn(direction)
    raise "Direction must be 'l' or 'r'" if direction != 'l' && direction != 'r'
    direction_index_rotation = DIRECTION_INDEX_ROTATIONS[direction.to_sym]
    @direction = new_direction(direction_index(direction), direction_index_rotation)
  end

  def status
    position.merge({ direction: @direction })
  end

  def position
    { x: @x, y: @y }
  end

  def move
    set_position(next_space) if @plateau.space_available?(next_space)
  end

  private

  def set_position(space)
    @x = space[:x]
    @y = space[:y]
  end

  def next_space
    axis = @moves.axis(@direction)
    x = @x + @moves.distance(@direction, :x)
    y = @y + @moves.distance(@direction, :y)
    {x: x, y: y}
  end

  def new_direction(direction_index, direction_index_rotation)
    DIRECTIONS.rotate(direction_index_rotation)[direction_index]
  end

  def direction_index(direction)
    DIRECTIONS.index(@direction)
  end
end