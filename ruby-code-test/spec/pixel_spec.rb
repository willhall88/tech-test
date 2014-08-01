require 'pixel'

describe Pixel do
	it 'is coloured white when create' do
	  pixel = Pixel.new
	  expect(pixel.status).to eq '0'
	end
end