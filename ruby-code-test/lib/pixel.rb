class Pixel
	attr_accessor :colour

	def initialize
		@colour = 'O'
	end

	def edit_colour(colour)
		@colour = colour
	end

	def clear
		@colour = 'O'
	end
end