require './plateau'
require './rover'

class Game
  def initialize(x_axis_input, y_axis_input, rover_name_1, rover_name_2)
    @rover_1 = Rover.new({x: 1, y: 1, direction: 'e', name: rover_name_1 })
    @rover_2 = Rover.new({x: 3, y: 3, direction: 'n', name: rover_name_2 })
    @rovers = [@rover_1, @rover_2]
    @plateau = Plateau.new(get_axis(x_axis_input), get_axis(y_axis_input), @rover_1, @rover_2)
    @rover_1.plateau = @plateau
    @rover_2.plateau = @plateau
    @current_rover = @rover_1

    print_game_intro
  end

  def start
    print_game_intro
    instructions_loop
  end

  def instructions_loop
    instructions = ''
    until instructions == 'q' || instructions == 'quit' || instructions == 'exit'
      @rovers.each do |rover|
        puts "Enter your instructions for #{rover.name}:"
        puts "L, R: turn.  M: move forward. P: pass (make no move). Q: quit game. (you may enter more than one character at a time)."
        instructions = gets.chomp
        return if instructions == 'q' || instructions == 'quit' || instructions == 'exit'
        process_instructions(instructions, rover)
        print_line
      end
    end
    puts "Your game is over.  Final positions:"
    print_rover_statuses
  end

  def process_instructions(instruction_string, rover)
    @current_rover = rover
    puts "Processing your instructions for #{@current_rover.name}"
    print_line
    instructions = instruction_string.split(//)
    instructions.each_with_index do |instruction, index|
      execute_instruction(instruction.downcase, index)
    end
    puts "Instructions have been processed"
    print_line
    print_rover_statuses
  end

  private

  def execute_instruction(instruction, instruction_index = 0)
    instruction_number = instruction_index + 1
    puts "Processing instruction #{instruction_number}"
    turn_rover(instruction) if %w(l r).include?(instruction)
    move_rover if instruction == 'm'
    print_line
    return if %w(l r m p).include?(instruction)
    puts "#{instruction} is not a valid instruction"
  end

  def move_rover
    puts "Move: move #{@current_rover.name} forward"
    @current_rover.move
    print_rover_status(@current_rover)
  end

  def turn_rover(direction)
    puts "Move: turn #{@current_rover.name} #{direction_name(direction)}"
    @current_rover.turn(direction)
    print_rover_status(@current_rover)
  end

  def get_axis(axis_input)
    return axis_input if axis_input >= 30
    30
  end

  def print_game_intro
    print_line
    puts "GAME STARTED"
    puts "Plateau X axis: 0 to #{@plateau.max_x}"
    puts "Plateau Y axis: 0 to #{@plateau.max_y}"
    puts "Rovers: #{@rover_1.name} (Rover 1), #{@rover_2.name} (Rover 2)"
    print_rover_statuses
    print_line
  end

  def print_line
    puts "*******************************"
  end

  def print_rover_statuses
    print_rover_status(@rover_1)
    print_rover_status(@rover_2)
  end

  def print_rover_status(rover)
    puts "Rover status: #{rover.name}"
    puts "Coordinates: [#{rover.x}, #{rover.y}]"
    puts "Direction: #{rover.direction.upcase}"
  end

  def direction_name(direction)
    return 'left' if direction == 'l'
    return 'right' if direction == 'r'
    raise 'invalid direction'
  end
end