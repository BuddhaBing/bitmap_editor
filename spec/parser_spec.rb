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

    context 'params' do

      it 'should return an array that contains the parameters, with numbers converted to an array index (-1)' do
        line = "H 3 5 2 Z"
        returned_params = Parser.parse(line)[1]
        expect(returned_params.include?(2)).to be true
        expect(returned_params.include?(4)).to be true
        expect(returned_params.include?(1)).to be true
        expect(returned_params.include?('Z')).to be true
      end

    end

    context 'edge cases' do

      it 'should handle extra white spaces before the command' do
        line = "  H 3 5 2 Z"
        command, params = Parser.parse(line)
        expect(Parser.parse(line).include?('colour_row')).to be true
        expect(Parser.parse(line).include?(Parser::COMMANDS["H"])).to be true
      end

      it 'should handle extra white spaces amongst the params' do
        line = "H  3   5 2    Z "
        command, params = Parser.parse(line)
        expect(params.include?(2)).to be true
        expect(params.include?(4)).to be true
        expect(params.include?(1)).to be true
        expect(params.include?('Z')).to be true
      end

      it 'should handle lower case commands' do
        line = "h 3 5 2 Z"
        command, params = Parser.parse(line)
        expect(command.include?('colour_row')).to be true
        expect(command.include?(Parser::COMMANDS["H"])).to be true
      end

      it 'should handle lower case colour params' do
        line = "H 3 5 2 z"
        command, params = Parser.parse(line)
        expect(params.include?('Z')).to be true
      end

    end

  end

end
