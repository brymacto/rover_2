require './game'

puts 'Please enter the name of Rover 1'
rover_name_1 = gets.chomp

puts 'Please enter the name of Rover 2'
rover_name_2 = gets.chomp

puts "Please enter the plateau's X axis size (minimum 30)"
x_axis = gets.chomp.to_i

puts "Please enter the plateau's Y axis size (minimum 30)"
y_axis = gets.chomp.to_i

game = Game.new(x_axis, y_axis, rover_name_1, rover_name_2)
game.start
