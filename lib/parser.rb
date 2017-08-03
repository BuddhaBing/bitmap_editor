module Parser

    COMMANDS = {
        'I' => 'create',
        'L' => 'colour_pixel',
        'V' => 'colour_column',
        'H' => 'colour_row',
        'C' => 'clear',
        'S' => 'show'
    }

    def self.parse(line)
      line = line.split(/\s+/)
      command = line.shift.to_s.upcase
      params = line.map { |el| el.match(/\A[-+]?\d+\z/) ? el.to_i - 1 : el }
      return COMMANDS[command]
    end

end
