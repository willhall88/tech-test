require 'image'

describe Image do
	context 'Image sizing' do
		it 'can be 1 pixel by 1 pixel' do
			image = Image.new(1,1)
			expect(image.width).to eq 1
			expect(image.height).to eq 1
		end

		it 'can be 2 pixels by 3 pixels' do
			image = Image.new(2,3)
			expect(image.width).to eq 2
			expect(image.height).to eq 3
		end

		it 'can be 250 pixels by 250 pixels' do
			image = Image.new(250,250)
			expect(image.width).to eq 250
			expect(image.height).to eq 250
		end

		it 'cannot be 251 pixels by 251 pixels' do
			expect{Image.new(251,251)}.to raise_error 'Invalid size'
		end
	end

	context 'pixel editing' do
		before(:each) {@image = Image.new(4,4)}

		specify 'the image is created with all pixels coloured "O"' do
			expect(@image.colours).to eq [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		specify 'a chosen pixel on the image can have its colour changed' do
			expect(@image.colours).to eq [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
			@image.edit_pixel(2,2,"C")
			expect(@image.colours).to eq [['O', 'O', 'O', 'O'], ['O', 'C', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		specify 'a horizontal line of pixels can be edited' do
			@image.horizontal_line(1, 1, 2, "C")
			expect(@image.colours).to eq [['C', 'C', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		specify 'a vertical line of pixels can be edited' do
			@image.vertical_line(1, 1, 2, "C")
			expect(@image.colours).to eq [['C', 'O', 'O', 'O'], ['C', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end
	end
end