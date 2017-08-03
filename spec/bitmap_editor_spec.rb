require 'bitmap_editor'

describe BitmapEditor do

  subject { described_class.new }

  before(:each) do
    @file_path = "spec/test_file.txt"
  end

  context '#run - ' do

    it 'should display an error if the given file does not exist' do
      file = nil
      expect(STDOUT).to receive(:puts).with("Please provide an existing file")
      subject.run(file)
    end

    it 'should display "There is no image" if no image has been created' do
      create_test_file("S")
      expect(STDOUT).to receive(:puts).with("Displaying image...")
      expect(STDOUT).to receive(:puts).with("There is no image...")
      expect(STDOUT).to receive(:puts).with("Bad command :(\n\n")
      subject.run(@file_path)
    end

    it 'should display an error if the command is not recognised' do
      create_test_file("X")
      expect(STDOUT).to receive(:puts).with("Bad command :(\n\n")
      subject.run(@file_path)
    end

    context 'Command: "I" (Create) - ' do

      before do
        create_test_file('I 5 6')
      end

      it 'should display confirmation of the new image creation to the user' do
        expect(STDOUT).to receive(:puts).with("Creating new image...")
        expect(STDOUT).to receive(:puts).with("Success!\n\n")
        subject.run(@file_path)
      end

    end

    context 'Command: "C" (Clear) - ' do

      context 'image does not exist - '

        it 'should raise an error if there is no image to clear' do
          create_test_file('C')
          expect(STDOUT).to receive(:puts).with("Clearing image...")
          expect(STDOUT).to receive(:puts).with("There is no image...")
          expect(STDOUT).to receive(:puts).with("Bad command :(\n\n")
          subject.run(@file_path)
        end

      end

      context 'image exists - ' do

        before do
          create_test_file('I 5 6')
          subject.run(@file_path)
        end

        it 'should display confirmation that the image has been cleared' do
          create_test_file('C')
          expect(STDOUT).to receive(:puts).with("Clearing image...")
          expect(STDOUT).to receive(:puts).with("Success!\n\n")
          subject.run(@file_path)
        end

      end

    end

    context 'Command: "L" (Colour pixel) - ' do

      before do
        create_test_file('I 5 6')
        subject.run(@file_path)
        create_test_file('L 1 3 A')
      end

      it 'should display confirmation of the pixel being coloured' do
        expect(STDOUT).to receive(:puts).with("Colouring pixel...")
        expect(STDOUT).to receive(:puts).with("Success!\n\n")
        subject.run(@file_path)
      end

    end

    context 'Command: "V" (Colour column) - ' do

      before do
        create_test_file('I 5 6')
        subject.run(@file_path)
        create_test_file('V 2 3 6 W')
      end

      it 'should display confirmation of the column being coloured' do
        expect(STDOUT).to receive(:puts).with("Colouring vertical pixel range...")
        expect(STDOUT).to receive(:puts).with("Success!\n\n")
        subject.run(@file_path)
      end

    end

    context 'Command: "H" (Colour row) - ' do

      before do
        create_test_file('I 5 6')
        subject.run(@file_path)
        create_test_file('H 3 5 2 Z')
      end

      it 'should display confirmation of the row being coloured' do
        expect(STDOUT).to receive(:puts).with("Colouring horizontal pixel range...")
        expect(STDOUT).to receive(:puts).with("Success!\n\n")
        subject.run(@file_path)
      end

    end

    context 'Command: "S" (Show image) - ' do

      before do
        create_test_file('I 5 6')
        subject.run(@file_path)
        create_test_file('S')
      end

      it 'should display the image to the user' do
        expect(STDOUT).to receive(:puts).with("Displaying image...")
        expect(STDOUT).to receive(:puts).with("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n\n")
        expect(STDOUT).to receive(:puts).with("Success!\n\n")
        subject.run(@file_path)
      end

    end

end

def create_test_file(contents)
  File.open(@file_path, "w+") { |f| f.write(contents) }
end
