class Plateau
attr_reader :contents

	def initialize(length, width)
		@length = length
		@width = width
		@contents = []
	end

	#outputs the location of objects on the plateau
	def add_object(obj)
		@contents << obj
	end

	#checks to see if a movement will put a Rover off the board
	def still_on?(x_coord, y_coord)
		if x_coord < 0 || x_coord > @length || y_coord < 0 || y_coord > @width
			false
		end
	end

	def collide?(x_coord, y_coord)
		@contents.each do |obj|
			if x_coord == obj.x_coordinate && y_coord == obj.y_coordinate
				true
			end
		end
	end

	def status
		puts "#{@length} #{@width}"
	end
end