require './lib/pixel'

class Image

	attr_accessor :grid

	def initialize(width, height)
		raise 'Invalid size' if (height | width) > 250
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

	def horizontal_line(row, start_column, end_column, colour)
		(start_column..end_column).each do |column|
			edit_pixel(column, row, colour)
		end
	end

	def vertical_line(column, start_row, end_row, colour)
		(start_row..end_row).each do |row|
			edit_pixel(column, row, colour)
		end
	end
end