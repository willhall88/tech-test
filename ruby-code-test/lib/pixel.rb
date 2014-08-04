class Pixel
	attr_accessor :colour, :position

	def initialize
		@colour = 'O'
		@position = []
	end

	def clear
		@colour = 'O'
	end

end