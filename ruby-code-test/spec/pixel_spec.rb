require 'pixel'

describe Pixel do
	
	before(:each) {@pixel = Pixel.new}

	it 'is coloured O when create' do
	  expect(@pixel.status).to eq 'O'
	end

	it 'is coloured C when edited' do
		@pixel.edit_colour('C')
		expect(@pixel.status).to eq 'C'
	end

	it 'is coloured O when cleared' do
		@pixel.edit_colour('C')
		@pixel.clear
		expect(@pixel.status).to eq 'O'
	end
end