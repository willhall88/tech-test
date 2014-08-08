#!/usr/bin/env ruby

require './lib/image'
require './lib/pixel'
require './lib/commands'

instance = Commands.new
input = ""

loop do
	puts "enter command:"
	instance.process_input(STDIN.gets.chomp)
end




