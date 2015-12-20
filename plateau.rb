class Plateau
  attr_reader :max_x, :max_y

  def initialize(x_size, y_size, *rovers)
    @max_x = x_size.to_i - 1
    @max_y = y_size.to_i - 1
    @rovers = []
    @space_being_checked = {}

    rovers.each do |rover|
      @rovers << rover
    end
  end

  def space_available?(space)
    @space_being_checked = space
    space_unoccupied? && space_on_grid?
  end

  private

  def space_unoccupied?
    @rovers.none? { |rover| rover.position == @space_being_checked }
  end

  def space_on_grid?
    space_on_x_axis? && space_on_y_axis?
  end

  def space_on_x_axis?
    @space_being_checked[:x] >= 0 && @space_being_checked[:x] <= @max_x
  end

  def space_on_y_axis?
    @space_being_checked[:y] >= 0 && @space_being_checked[:y] <= @max_y
  end
end
