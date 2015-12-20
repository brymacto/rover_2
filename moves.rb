class Moves
  MOVES_BY_DIRECTION = {
    n: { axis: :y, distance: 1 },
    e: { axis: :x, distance: 1 },
    s: { axis: :y, distance: -1 },
    w: { axis: :x, distance: -1 }
  }

  def axis(direction)
    MOVES_BY_DIRECTION[direction.to_sym][:axis]
  end

  def distance(direction, axis)
    return 0 unless direction_and_axis_compatible?(direction, axis)
    MOVES_BY_DIRECTION[direction.to_sym][:distance]
  end

  def direction_and_axis_compatible?(direction, axis)
    return true if [:e, :w].include?(direction.to_sym) && axis == :x
    return true if [:n, :s].include?(direction.to_sym) && axis == :y
    false
  end
end
