require 'bitmap'

describe Bitmap do

  subject { described_class.new(5,6, 'O') }

  context '#build' do

    context 'size is invalid - ' do

      it 'should raise an error if the given row size is less than 1' do
        expected_error = "Bitmap pixel width must be between 1 and 250"
        expect{described_class.new(-1, 1, 'O')}.to raise_error expected_error
      end

      it 'should raise an error if the given row size is greater than 250' do
        expected_error = "Bitmap pixel width must be between 1 and 250"
        expect{described_class.new(251, 1, 'O')}.to raise_error expected_error
      end

      it 'should raise an error if the given column size is less than 1' do
        expected_error = "Bitmap pixel height must be between 1 and 250"
        expect{described_class.new(1, -1, 'O')}.to raise_error expected_error
      end

      it 'should raise an error if the given column size is greater than 250' do
        expected_error = "Bitmap pixel height must be between 1 and 250"
        expect{described_class.new(1, 251, 'O')}.to raise_error expected_error
      end

    end

    context 'size is valid - ' do



    end

  end

  context '#clear' do



  end

end
