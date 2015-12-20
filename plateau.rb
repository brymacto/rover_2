class Plateau
  def initialize(x_size, y_size, *rovers)
    @rovers = []
    rovers.each do |rover|
      @rovers << rover  
    end
    @max_x = x_size.to_i - 1
    @max_y = y_size.to_i - 1
  end

  def space_available?(space)
    result = true
    @rovers.each do |rover|
      result = false if rover.position == space
    end
    result = false if space[:x] < 0 || space[:y] < 0
    result = false if space[:x] > @max_x || space[:y] > @max_y
    result
  end
end