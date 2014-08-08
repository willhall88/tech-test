require './lib/pixel'

class Image

	attr_accessor :grid

	def initialize(dimensions)
		width  = dimensions[0]
		height = dimensions[1]

		raise 'Invalid size' if invalid_dimensions(width, height)
		@grid = Array.new(height){Array.new(width){Pixel.new}}
		@grid.each_with_index{|row, row_index| row.each_with_index{|pixel, column_index| pixel.position = [column_index+1, row_index+1]}}
	end

	def clear
		@grid.flatten.each{|pixel| pixel.colour = 'O'}
	end

	def edit_pixel(params)
		column = params[0]
		row = params[1]
		colour = params[2]

		selected_pixel(column, row).colour= (colour)
		return @grid
	end

	def horizontal_line(params)
		row = params[0]
		start_column = params[1]
		end_column = params[2]
		colour = params[3]

		(start_column..end_column).each do |column|
			edit_pixel([column, row, colour])
		end
	end

	def vertical_line(params)
		column = params[0]
		start_row = params[1]
		end_row = params[2]
		colour = params[3]

		(start_row..end_row).each do |row|
			edit_pixel([column, row, colour])
		end
	end

	def fill(params)
		column = params[0]
		row = params[1]
		new_colour = params[2]

		current_colour = selected_pixel_colour(column, row)
		select_area(column, row, current_colour).each do |pixel|
			pixel.colour = new_colour
		end
	end

	def colours
		pixel_colours = @grid.map{|row| row.map{|pixel| pixel.colour}}
	end


	def invalid_dimensions(width, height)
		width <= 1 || height >= 250
	end

	def width
		@grid[0].length
	end

	def height
		@grid.length
	end

	def positions
		pixel_colours = @grid.map{|row| row.map{|pixel| pixel.position}}
	end

	def select_area(column, row, colour)
		@pixels_to_fill = []
		add_neighbours(column, row, colour)
		area_completed?(@pixels_to_fill, colour)
		@pixels_to_fill
	end

	def add_neighbours(column, row, colour)
		find_neighbours(column, row)
		@neighbours.each do |neighbour|
			@pixels_to_fill << neighbour if !neighbour.nil? && (neighbour.colour == colour)
		end
    @pixels_to_fill.uniq!
	end

	def find_neighbours(column, row)
		pixel_above = selected_pixel(column, row-1)
		pixel_below = selected_pixel(column, row+1)
		pixel_left = selected_pixel(column-1, row)
		pixel_right = selected_pixel(column+1, row)
		@neighbours = [pixel_above, pixel_below, pixel_right, pixel_left]
	end

	def area_completed?(selection, colour)
		selection.each do |pixel|
			pixel_column = pixel.position.first
			pixel_row = pixel.position.last
			add_neighbours(pixel_column, pixel_row, colour)
			if @pixels_to_fill.count == selection.count
				@pixels_to_fill
			else
				area_completed?(@pixels_to_fill, colour)
			end
		end
	end

	def selected_pixel(column, row)
		@grid.flatten.find{|pixel| pixel.position == [column, row]}
	end

	def selected_pixel_colour(column, row)
		selected_pixel(column, row).colour
	end


end


