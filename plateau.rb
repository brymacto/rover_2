class Plateau
  def initialize(*rovers)
    @rovers = []
    rovers.each do |rover|
      @rovers << rover  
    end
  end

  def space_available?(space)
    result = true
    @rovers.each do |rover|
      result = false if rover.position == space
    end
    result
  end
end