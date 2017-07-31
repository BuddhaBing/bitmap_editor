require 'bitmap'

describe Bitmap do

  context '#clear' do
    
    it 'should create a M x N matrix' do
      image = Bitmap.new(5,6)
      columns = image.data.length
      rows = image.data[0].length
      expect(columns).to be 6
      expect(rows).to be 5
    end

    it 'should set all elements set to the value "O"' do
      image = Bitmap.new(5,6)
      expect(image.data.flatten.all? { |px| px == 'O' }).to be true
    end

  end

end
