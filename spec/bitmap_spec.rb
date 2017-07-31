require 'bitmap'

describe Bitmap do

  subject { described_class.new(5,6) }

  context '#create' do

    context 'size is invalid - ' do

      it 'should raise an error if the given row size is less than 1' do
        expected_error = "Invalid Request: Row and Column size must be between 1 and 250"
        expect{described_class.new(255,6)}.to raise_error expected_error
      end

    end

    context 'size is valid - ' do

      it 'should create a M x N matrix' do
        columns = subject.pixels.length
        rows = subject.pixels[0].length
        expect(columns).to be 6
        expect(rows).to be 5
      end

      it 'should set all elements set to the value "O"' do
        expect(subject.pixels.flatten.all? { |px| px == 'O' }).to be true
      end

    end

  end

  context '#clear' do

    # context 'there is no spoon - ' do
    #
    #   it 'should raise an error if there is no image to clear' do
    #     expected_error = "Error: There is no image to clear"
    #     expect{subject.clear}.to raise_error expected_error
    #   end
    #
    # end

    it 'should be an alias of create' do
      expect(subject.method(:create)).to eq(subject.method(:clear))
    end

  end

end
