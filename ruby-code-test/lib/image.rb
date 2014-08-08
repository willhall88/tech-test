require './lib/pixel'
require './lib/helpers/image_helper'
require './lib/helpers/fill_helper'

class Image
	include ImageHelper
	include FillHelper

	attr_accessor :grid

	def initialize(dimensions)
		width  = dimensions[0]
		height = dimensions[1]

		return puts('Invalid size') if invalid_dimensions(width, height)
		
		@grid = Array.new(height){Array.new(width){Pixel.new}}
		@grid.each_with_index{|row, row_index| row.each_with_index{|pixel, column_index| pixel.position = [column_index+1, row_index+1]}}
	end

	def print_image
		colours.map{|row| row.join}.join("\n")
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

end


