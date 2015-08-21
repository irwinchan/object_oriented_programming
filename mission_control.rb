class Mission_Control

	def initialize
	end

	def get_plateau_size

	end

	def get_start_position(x_coord, y_coord, direction)
		puts "Enter starting position"
		start_position = gets.chomp.split(" ")

		while valid_position?(start_position[0].to_i, start_position[1].to)
			puts "Position is not valid, enter new coordinates"
			start_position = gets.chomp.split(" ")
		end
		start_position
	end

	def get_instructions(instructions)

	end

	def valid_move?

	end

	def valid_position?(x_coord, y_coord)
		@plateau.still_on?(x_coord, y_coord)
	end

end