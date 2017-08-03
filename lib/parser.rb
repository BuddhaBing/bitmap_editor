module Parser

  COMMANDS = {
    'I' => 'create',
    'L' => 'colour_pixel',
    'V' => 'colour_column',
    'H' => 'colour_row',
    'C' => 'clear',
    'S' => 'show'
  }.freeze

  def self.parse(line)
    line = clean(line)
    command = extract_command(line)
    params = extract_params(line)
    [COMMANDS[command], params]
  end

  private

  def self.clean(line)
    line.gsub(/\s{2+}/, '').split(' ')
  end

  def self.extract_command(line)
    line.shift.to_s.upcase
  end

  def self.extract_params(line)
    line.map { |el| el =~ /\A[-+]?\d+\z/ ? el.to_i - 1 : el.upcase }
  end

end
