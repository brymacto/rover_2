class Plateau
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
    result = true
    
    result = false if @space_being_checked[:x] < 0 || @space_being_checked[:y] < 0
    result = false if @space_being_checked[:x] > @max_x || @space_being_checked[:y] > @max_y

    result
  end
end