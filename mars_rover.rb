require_relative 'plateau.rb'

class Rover

	attr_reader :x_coordinate, :y_coordinate

	def initialize(x_coordinate, y_coordinate, direction)
		@compass = ["N", "E", "S", "W"]
		@x_coordinate = x_coordinate.to_i
		@y_coordinate = y_coordinate.to_i
		@compass.rotate!(@compass.index(direction))
		@direction = @compass[0]
		@instructions = []
	end

	def status
		"#{@x_coordinate} #{@y_coordinate} #{@direction}"
	end

	def to_s
		status
	end

	def read_instructions(instructions)
		@instructions = instructions.split("")
	end

	def do_instructions
		@instructions.each do |movement|
			if movement == "L" || movement == "R"
				turn(movement)
			elsif movement == "M"
				move
			end
		end
	end

	def move
		case @direction
		when "N"
			@y_coordinate += 1
		when "S"
			@y_coordinate -= 1
		when "E"
			@x_coordinate += 1
		when "W"
			@x_coordinate -= 1
		end
	end

	def turn(dir)
		if dir == "L"
			@compass.rotate!(-1)
		elsif dir == "R"
			@compass.rotate!(1)
		end
		@direction = @compass[0]
	end

end

puts "Enter plateau size"
		plateau_size = gets.chomp.split(" ") # sample input "5 5"
		plateau_size.map!{|x| x.to_i}
		mars = Plateau.new(*plateau_size)

puts "Enter robot 1 starting position"
robo1_start = gets.chomp.split(" ")
# Check for valid starting position
while mars.still_on?(robo1_start[0].to_i, robo1_start[1].to_i) == false do
	puts "Coordinates are off the plateau, please enter new Coordinates"
	robo_start = gets.chomp.split(" ")
end

robo1 = Rover.new(*robo1_start)

puts "Enter Instructions for Robot 1"
instructions = gets.chomp
robo1.read_instructions(instructions)

puts "Enter robot 2 starting position"
robo_start = gets.chomp.split(" ")
# Check for valid starting position
while mars.still_on?(robo_start[0].to_i, robo_start[1].to_i) == false do
	puts "Coordinates are off the plateau, please enter new Coordinates"
	robo_start = gets.chomp.split(" ")
end
robo2 = Rover.new(*robo_start)

puts "Enter Instructions for Robot 2"
instructions = gets.chomp
robo2.read_instructions(instructions)

puts "Executing Instructions"
robo1.do_instructions
robo2.do_instructions

puts robo1
puts robo2
