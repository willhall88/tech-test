module ImageHelper

	def colours
		pixel_colours = @grid.map{|row| row.map{|pixel| pixel.colour}}
	end

	def positions
		pixel_colours = @grid.map{|row| row.map{|pixel| pixel.position}}
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

	def selected_pixel(column, row)
		@grid.flatten.find{|pixel| pixel.position == [column, row]}
	end

	def selected_pixel_colour(column, row)
		selected_pixel(column, row).colour
	end


end