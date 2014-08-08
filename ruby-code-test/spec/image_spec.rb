require 'image'

describe Image do
	context 'Image sizing' do

		it 'can be 2 pixels by 3 pixels' do
			image = Image.new([2,3])

			expect(image.width).to eq 2
			expect(image.height).to eq 3
		end

		it 'cannot be 0 pixels by 3 pixels' do
			expect{Image.new([0,3])}.to raise_error 'Invalid size'
		end

		it 'cannot be 3 pixels by 251 pixels' do
			expect{Image.new([3,251])}.to raise_error 'Invalid size'
		end
	end

	context 'pixel editing' do
		before(:each) {@image = Image.new([4,4])}

		specify 'the image is created with all pixels coloured "O"' do
			expect(@image.colours).to eq [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		specify 'the image is created with all pixels knowing their position' do
			expect(@image.positions).to eq [[[1, 1], [2, 1], [3, 1], [4, 1]], [[1, 2], [2, 2], [3, 2], [4, 2]], [[1, 3], [2, 3], [3, 3], [4, 3]], [[1, 4], [2, 4], [3, 4], [4, 4]]]
		end

		specify 'a chosen pixel on the image can have its colour changed' do
			@image.edit_pixel([2,2,"C"])
			expect(@image.colours).to eq [['O', 'O', 'O', 'O'], ['O', 'C', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		specify 'a horizontal line of pixels can be edited' do
			@image.horizontal_line([1, 1, 2, "C"])
			
			expect(@image.colours).to eq [['C', 'C', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		specify 'a vertical line of pixels can be edited' do
			@image.vertical_line([1, 1, 2, "C"])
			expect(@image.colours).to eq [['C', 'O', 'O', 'O'], ['C', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end

		context 'filling a region' do

			specify 'all pixels in an area can be coloured' do
				@image.vertical_line([2, 1, 4, 'C'])
				@image.edit_pixel([3, 1, 'D'])
				@image.fill([3, 3, 'C'])

				expect(@image.colours).to eq [['O', 'C', 'D', 'C'], ['O', 'C', 'C', 'C'], ['O', 'C', 'C', 'C'], ['O', 'C', 'C', 'C']]
			end
		end
	end

	context 'clearing an image' do
		it 'should clear the image of colours' do
			image = Image.new([4,4])
			image.fill([3,3,'C'])
			expect(image.colours).to eq [['C', 'C', 'C', 'C'], ['C', 'C', 'C', 'C'], ['C', 'C', 'C', 'C'], ['C', 'C', 'C', 'C']]
			image.clear
			expect(image.colours).to eq [['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O']]
		end
	end
end