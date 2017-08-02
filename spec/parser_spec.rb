require 'parser'

describe Parser do

    it 'should have a list of all acceptable commands' do
        commands = %w(I L V H C S)
        expect(Parser::COMMANDS.keys).to eq commands
    end

end
