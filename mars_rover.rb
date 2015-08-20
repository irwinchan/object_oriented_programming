class Rover

	attr_reader :direction

	def initialize(x_coordinate, y_coordinate, direction)
		@x_coordinate = x_coordinate
		@y_coordinate = y_coordinate
		@direction = direction
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
			@x_coordinate += 1
		when "S"
			@x_coordinate -= 1
		when "E"
			@y_coordinate += 1
		when "W"
			@y_coordinate -= 1
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