class Commands
	attr_accessor :command, :arguments

	def initialize
		@command = 'O'
		@arguments = []
	end

	def process_input(input)
		array = input.split(//)
		@command = array.shift
		@arguments = array
	end

end