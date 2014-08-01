class Pixel
	attr_accessor :colour

	def initialize
		@colour = '0'
	end

	def status
	  return @colour
	end

	def edit_colour(colour)
		@colour = colour
	end
end