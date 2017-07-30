require 'bitmap_editor'

describe BitmapEditor do

  subject { described_class.new }

  before(:each) do
    @file_path = "spec/test_file.txt"
  end

  context '#run' do

    it 'should display an error if the given file does not exist' do
      file = nil
      expect(STDOUT).to receive(:puts).with("Please provide an existing file")
      subject.run(file)
    end

    it 'should display "There is no image" if no image has been created' do
      create_test_file("S")
      expect(STDOUT).to receive(:puts).with("There is no image")
      subject.run(@file_path)
    end

    it 'should display an error if the command is not recognised' do
      create_test_file("X")
      expect(STDOUT).to receive(:puts).with("unrecognised command :(")
      subject.run(@file_path)
    end

    context 'Command: "I"' do
      it 'should create a new M x N image with all pixels coloured white (O)' do
        create_test_file('I 5 6')
        expect(STDOUT).to receive(:puts).with("Creating new image")
        subject.run(@file_path)
      end
    end

  end

end

def create_test_file(contents)
  File.open(@file_path, "w+") { |f| f.write(contents) }
end
