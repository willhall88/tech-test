module FillHelper
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
end