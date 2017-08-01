require 'bitmap'

describe Bitmap do

  subject { described_class.new(5,6) }

  context 'size limits: ' do

    it 'the minimum row/column pixel size should be 1' do
      expect(described_class::MIN_SIZE).to eq 1
    end

    it 'the maximum row/column pixel size should be 250' do
      expect(described_class::MAX_SIZE).to eq 250
    end

  end

  context '#new: ' do

    context 'size is invalid: ' do

      it 'should raise an error if the given row size is less than 1' do
        expected_error = "Bitmap pixel width must be between 1 and 250"
        expect{described_class.new(-1, 1)}.to raise_error expected_error
      end

      it 'should raise an error if the given row size is greater than 250' do
        expected_error = "Bitmap pixel width must be between 1 and 250"
        expect{described_class.new(251, 1)}.to raise_error expected_error
      end

      it 'should raise an error if the given column size is less than 1' do
        expected_error = "Bitmap pixel height must be between 1 and 250"
        expect{described_class.new(1, -1)}.to raise_error expected_error
      end

      it 'should raise an error if the given column size is greater than 250' do
        expected_error = "Bitmap pixel height must be between 1 and 250"
        expect{described_class.new(1, 251)}.to raise_error expected_error
      end

    end

    context 'size is valid: ' do

      it 'should create an M x N Bitmap/Matrix' do
        image = described_class.new(5,6)
        rows = image.pixels.size
        columns = image.pixels[0].size
        expect(rows == 6 && columns == 5).to be true
      end

      it 'should colour each pixel white \'O\'' do
        pixels = subject.pixels.flatten
        expect(pixels.all? { |px| px == "O" }).to be true
      end

    end

    context '#width' do

      it 'should return the pixel width of the image' do
        expect(subject.width).to eq 5
      end

    end

    context '#height' do

      it 'should return the pixel height of the image' do
        expect(subject.height).to eq 6
      end

    end

    context '#[]' do

      it 'should return the colour of a specified pixel' do
        subject[3,3]
        expect(subject[3,3]).to eq 'O'
      end

    end

    context '#[]=' do

      it 'should change the colour of a specified pixel' do
        subject[3,3] = 'A'
        expect(subject[3,3]).to eq 'A'
      end

    end

  end

  context '#clear' do



  end

end
