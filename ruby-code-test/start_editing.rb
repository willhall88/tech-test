#!/usr/bin/env ruby

require './lib/image'
require './lib/pixel'
require './lib/commands'

instance = Commands.new
input = ""

loop do
	begin
	puts "enter command:"
	instance.process_input(STDIN.gets.chomp)
	rescue 
		puts 'Oops, something went wrong. Please try again.'
	end
end




