require 'bitmap'

describe Bitmap do

  subject { described_class.new(5,6) }

  context '#create' do

    it 'should create a M x N matrix' do
      columns = subject.data.length
      rows = subject.data[0].length
      expect(columns).to be 6
      expect(rows).to be 5
    end

    it 'should set all elements set to the value "O"' do
      expect(subject.data.flatten.all? { |px| px == 'O' }).to be true
    end

  end

  context '#clear' do

    it 'should be an alias of create' do
      expect(subject.create).to eq(subject.clear)
    end

  end

end
