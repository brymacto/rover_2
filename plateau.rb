class Plateau
  def initialize(x_size, y_size, *rovers)
    @max_x = x_size.to_i - 1
    @max_y = y_size.to_i - 1
    @rovers = []

    rovers.each do |rover|
      @rovers << rover  
    end
  end

  def space_available?(space)
    space_unoccupied?(space) && space_on_grid?(space)
  end

  private

  def space_unoccupied?(space)
    @rovers.none? { |rover| rover.position == space }
  end

  def space_on_grid?(space)
    result = true
    
    result = false if space[:x] < 0 || space[:y] < 0
    result = false if space[:x] > @max_x || space[:y] > @max_y

    result
  end
end