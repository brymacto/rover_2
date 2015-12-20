class Moves
  MOVES_BY_DIRECTION = {
    n: { axis: :y, distance: 1 },
    e: { axis: :x, distance: 1 },
    s: { axis: :y, distance: -1 },
    w: { axis: :x, distance: -1 }
  }

  attr_reader :direction

  def initialize(direction = :e)
    @direction = direction.to_sym
    get_axis_by_direction
  end

  def direction=(direction)
    @direction = direction.to_sym
    get_axis_by_direction
  end

  def distance_by_axis(axis)
    return 0 unless direction_on_axis?(@direction, axis)
    MOVES_BY_DIRECTION[@direction][:distance]
  end

  private

  def get_axis_by_direction
    @axis = MOVES_BY_DIRECTION[@direction][:axis]
  end

  def direction_on_axis?(direction, axis)
    return true if [:e, :w].include?(direction.to_sym) && axis == :x
    return true if [:n, :s].include?(direction.to_sym) && axis == :y
    false
  end
end
