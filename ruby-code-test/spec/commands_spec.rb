require 'commands'

describe Commands do
	before(:each) { @instance = Commands.new}

	it 'should be able to split an input into a command and arguments' do
		@instance.send(:process_input, 'I22')
		expect(@instance.command).to eq 'I'
		expect(@instance.arguments).to eq [2,2]
	end

end