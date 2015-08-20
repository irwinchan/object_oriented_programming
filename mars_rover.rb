class Rover

	def initialize(x_coordinate, y_coordinate, direction)
		@x_coordinate = x_coordinate
		@y_coordinate = y_coordinate
		@direction = direction
	end

	def status
		puts "#{@x_coordinate} #{@y_coordinate} #{@direction}"
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
		compass = ["N", "E", "S", "W"]
		compass_pointer = compass.index(@direction)

		if dir == "L"
			compass_pointer -= 1
		elsif dir == "R"
			compass_pointer += 1
		end

		if compass_pointer < 0
			compass_pointer = 3
		elsif compass_pointer > 3
			compass_pointer = 0
		end

		@direction = compass[compass_pointer]
	end
end

class Plateau
	@length
	@width
	@contents

	def initialize(length, width)
		@length = length
		@width = width
	end

	#outputs the location of objects on the plateau
	def contents(x_coord, y_coord)

	end

	#checks to see if a movement will put a Rover off the board
	def still_on?
	end

end

robo1 = Rover.new(1, 2, "N")
robo2 = Rover.new(3, 3, "E")

robo1.read_instruction("LMLMLMLMM")
robo2.read_instruction("MMRMMRMRRM")

robo1.status
robo2.status