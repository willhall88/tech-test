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
		selected_pixel(column, row).edit_colour(colour)
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

	def fill(column, row, new_colour)
		current_colour = selected_pixel_colour(column, row)
		select_area(column, row, current_colour).each do |pixel|
			pixel.colour = new_colour
		end
	end

	def selected_pixel(column, row)
		@grid[row-1][column-1]
	end

	def selected_pixel_colour(column, row)
		selected_pixel(column, row).colour
	end

	def select_area(column, row, colour)
		@pixels_to_fill = []
		add_neighbours(column, row, colour)
		@pixels_to_fill
	end

	def add_neighbours(column, row, colour)
		@pixels_to_fill << selected_pixel(column, row) if selected_pixel_colour(column, row) == colour
		@pixels_to_fill << selected_pixel(column+1, row) if selected_pixel_colour(column+1, row) == colour
    @pixels_to_fill << selected_pixel(column-1, row) if selected_pixel_colour(column-1, row) == colour
    @pixels_to_fill << selected_pixel(column, row+1) if selected_pixel_colour(column, row+1) == colour
    @pixels_to_fill << selected_pixel(column, row-1) if selected_pixel_colour(column, row-1) == colour
	end
end


