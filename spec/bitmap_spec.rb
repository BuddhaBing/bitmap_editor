require 'bitmap'

describe Bitmap do

  context '#clear' do
    it 'should create a 5 x 6 matrix with all elements set to the value "O"' do
      image = Bitmap.new(5,6)
      expected_matrix = [["O", "O", "O", "O", "O"],
                         ["O", "O", "O", "O", "O"],
                         ["O", "O", "O", "O", "O"],
                         ["O", "O", "O", "O", "O"],
                         ["O", "O", "O", "O", "O"],
                         ["O", "O", "O", "O", "O"]]
      expect(image.data).to eq expected_matrix
    end
  end

end
