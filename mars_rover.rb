require_relative 'plateau.rb'

class Rover

	attr_reader :x_coordinate, :y_coordinate

	def initialize(x_coordinate, y_coordinate, direction)
		@compass = ["N", "E", "S", "W"]
		@x_coordinate = x_coordinate.to_i
		@y_coordinate = y_coordinate.to_i
		@compass.rotate!(@compass.index(direction))
		@direction = @compass[0]
	end

	def status
		puts "#{@x_coordinate} #{@y_coordinate} #{@direction}"
	end

	def to_s
		status
	end

	def read_instruction(instructions)
		movements_list = instructions.split("")
		movements_list.each do |movement|
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


puts "Plateau size"
plateau_size = gets.chomp.split(" ") # sample input "5 5"

plateau_size.map!{|x| x.to_i}

mars = Plateau.new(*plateau_size)
mars.status

#Check for valid starting position

	puts "Robo1 starting position"
	robo1_start = gets.chomp.split(" ")

	while mars.still_on?(robo1_start[0].to_i,robo1_start[1].to_i) == false do
		puts "Coordinates are off the plateau, please enter new Coordinates"
		robo1_start = gets.chomp.split(" ")
	end

	puts "the eagle has landed"

# robo1 = Rover.new(1, 2, "N")
# robo2 = Rover.new(3, 3, "E")

# mars.add_object(robo1)
# mars.add_object(robo2)

# puts mars.contents.inspect


# robo1.read_instruction("LMLMLMLMM")
# robo2.read_instruction("MMRMMRMRRM")

# robo1.status
# robo2.status