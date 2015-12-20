require './move_calculator'

class Rover
  DIRECTIONS = %w(n e s w)
  DIRECTION_INDEX_ROTATIONS = { l: -1, r: 1 }

  attr_accessor :direction, :plateau, :name
  attr_reader :x, :y

  def initialize(args)
    @x = args.fetch(:x, 1)
    @y = args.fetch(:y, 1)
    @direction = args.fetch(:direction, 'e')
    @plateau = args.fetch(:plateau, Plateau.new(30, 30, self))
    @move_calculator = MoveCalculator.new
    @name = args.fetch(:name, 'Anonymous Rover')
  end

  def turn(direction)
    fail "Direction must be 'l' or 'r'" if direction != 'l' && direction != 'r'
    direction_index_rotation = DIRECTION_INDEX_ROTATIONS[direction.to_sym]
    @direction = new_direction(direction_index(direction), direction_index_rotation)
  end

  def status
    position.merge(direction: @direction)
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
    @move_calculator.direction = @direction
    x = @x + @move_calculator.distance_by_axis(:x)
    y = @y + @move_calculator.distance_by_axis(:y)
    { x: x, y: y }
  end

  def new_direction(direction_index, direction_index_rotation)
    DIRECTIONS.rotate(direction_index_rotation)[direction_index]
  end

  def direction_index(_direction)
    DIRECTIONS.index(@direction)
  end
end
