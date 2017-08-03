require 'parser'

describe Parser do
  it 'should have a list of all acceptable commands' do
    commands = %w(I L V H C S)
    expect(Parser::COMMANDS.keys).to eq commands
  end

  describe '#parse' do

    context 'I' do

      it 'should return an array that contains the command "create"' do
        line = "I 5 6"
        expect(Parser.parse(line).include?('create')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["I"])).to be true
      end

    end

    context 'L' do

      it 'should return an array that contains the command "colour_pixel"' do
        line = "L 1 3 A"
        expect(Parser.parse(line).include?('colour_pixel')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["L"])).to be true
      end

    end

    context 'V' do

      it 'should return an array that contains the command "colour_column"' do
        line = "V 2 3 6 W"
        expect(Parser.parse(line).include?('colour_column')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["V"])).to be true
      end

    end

    context 'H' do

      it 'should return an array that contains the command "colour_row"' do
        line = "H 3 5 2 Z"
        expect(Parser.parse(line).include?('colour_row')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["H"])).to be true
      end

    end

    context 'C' do

      it 'should return an array that contains the command "clear"' do
        line = "C"
        expect(Parser.parse(line).include?('clear')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["C"])).to be true
      end

    end

    context 'S' do

      it 'should return an array that contains the command "show"' do
        line = "S"
        expect(Parser.parse(line).include?('show')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["S"])).to be true
      end

    end

  end

end
