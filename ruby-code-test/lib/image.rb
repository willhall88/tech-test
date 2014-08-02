require 'pixel'

class Image

	attr_reader :grid

	def initialize(width, height)
		raise 'Invalid size' if (height || width) > 250
		@grid = Array.new(height){Array.new(width){Pixel.new}}
	end

	def width
		@grid[0].length
	end

	def height
		@grid.length
	end

	def colours
		pixel_colours = @grid.map{|row| row.map{|pixel| pixel.colour}}
	end

	def edit_pixel(column, row, colour)
		@grid[row-1][column-1].edit_colour(colour)
		return @grid
	end
end