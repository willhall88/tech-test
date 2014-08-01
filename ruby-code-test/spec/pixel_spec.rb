require 'pixel'

describe Pixel do
	it 'is coloured white when create' do
	  pixel = Pixel.new
	  expect(pixel.status).to eq '0'
	end

	it 'is coloured C when edited' do
		pixel = Pixel.new
		pixel.edit_colour('C')
		expect(pixel.status).to eq 'C'
	end
end