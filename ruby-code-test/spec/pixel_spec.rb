require 'pixel'

describe Pixel do
	
	before(:each) {@pixel = Pixel.new}

	it 'is coloured O when created' do
	  expect(@pixel.colour).to eq 'O'
	end

	it 'is coloured C when edited' do
		@pixel.colour = 'C'
		expect(@pixel.colour).to eq 'C'
	end

	it 'is coloured O when cleared' do
		@pixel.colour = 'C'
		@pixel.clear
		expect(@pixel.colour).to eq 'O'
	end

	it 'has no position when created' do
		expect(@pixel.position).to eq []
	end
end