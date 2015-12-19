class Rover
  DIRECTIONS = ['n', 'e', 's', 'w']
  attr_accessor :direction

  def initialize(args)
    @x = args.fetch('x', 1)
    @y = args.fetch('y', 1)
    @direction = args.fetch('direction', 'e')
    @plateau = args.fetch('plateau', Plateau.new)
  end

  def turn(direction)
    raise "Direction must be 'l' or 'r'" if direction != 'l' && direction != 'r'
    direction_index_change = 1 if direction == 'r'
    direction_index_change = -1 if direction == 'l'
    @direction = new_direction(direction_index_change)
  end

  private

  def new_direction(direction_index_change)
    new_direction_index = direction_index(@direction) + direction_index_change
    new_direction_index = 0 if new_direction_index > 3 
    new_direction_index = 3 if new_direction_index < 0 
    DIRECTIONS[new_direction_index]
  end

  def direction_index(direction)
    current_index = DIRECTIONS.index(@direction)
  end
end