require './lib/image'
require './lib/helpers/command_helper'


class Commands
	include CommandHelpers

	attr_accessor :command, :arguments, :image

	def initialize
		@command = 'O'
		@arguments = []
	end

	def process_input(input)
		array = input.split(/ /)
		@command = array.shift.upcase
		@arguments = convert_arguments(array)
		if command_valid
			return puts 'Please create and image'
		else
			execute_command(@command, @arguments)
		end
	end

	private

	def execute_command(command, arguments)
		case command
			when "I"
				@image = Image.new(arguments)
			when "C"
				@image.clear
			when "L"
				@image.edit_pixel(arguments)
			when "V"
				@image.vertical_line(arguments)
			when "H"
				@image.horizontal_line(arguments)
			when "F" 
				@image.fill(arguments)
			when "S" 
				puts @image.print_image
			when "X"
				puts "Goodbye"
			  exit
			else
				puts "Invalid command - press X to quit!"
			end
	end


end