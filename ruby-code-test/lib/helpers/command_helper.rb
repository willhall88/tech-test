module CommandHelpers

	def convert_arguments(arguments)
		arguments.map do |element|
			if /[0-9]/ === element
				element.to_i
			else
				element.upcase
			end
		end
	end

	def command_valid
		@image.nil? && !['I', 'X'].include?(@command)
	end
end